class PostForm < Hyperloop::Component
  include FormCommon

  param :post
  param :on_finish, type: Proc

  before_mount do
    self.store = FormStore.create!(title: params.post.title, body: params.post.body)
  end

  render do
    FORM(class: 'p-3') do
      TextInput(name: 'title', placeholder: 'Title', store: store)
      TextareaInput(name: 'body', placeholder: 'Body', store: store)
      DIV(class: 'text-right') do
        BUTTON(class: 'btn btn-primary') { 'Save' }
        A(class: 'btn btn-light'){ 'Cancel' }.on(:click) do |evt|
          evt.prevent_default
          params.on_finish
        end
      end
    end.on(:submit) do |evt|
      evt.prevent_default
      params.post.update(store.fields)
      .then do |r|
        r[:success] ? params.on_finish : store_errors!(params.post)
      end
    end

  end
end
