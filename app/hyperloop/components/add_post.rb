class AddPost < Hyperloop::Router::Component
  include FormCommon

  collect_other_params_as :attributes

  before_mount do
    self.store = FormStore.create!(title: '', body: '')
  end

  render(DIV, class: 'container') do

    DIV(class: 'row') do
      DIV(class: 'col col-md-8 mx-auto') do
        FORM do
          BaseErrors(store: store) if store.has_base_errors?

          TextInput(name: 'title', placeholder: 'Title', store: store)
          TextareaInput(name: 'body', placeholder: 'Body', store: store)
          BUTTON(class: 'btn btn-primary') { 'Add' }
          Link('/my_blog', class: 'btn btn-secondary') { 'Cancel' }
        end.on(:submit) do |evt|
          evt.prevent_default
          AddPostOp.run(store.fields)
          .then { params.history.push('/my_blog') }
          .fail do |e|
            store_errors!(e)
          end
        end
      end
    end
  end
end
