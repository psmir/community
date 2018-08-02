class LogIn < Hyperloop::Component
  include FormCommon

  collect_other_params_as :attributes

  before_mount do
    self.store = FormStore.create!
  end

  render(DIV, class: 'container') do
    DIV(class: 'row viewport-80 align-items-center') do
      DIV(class: 'col col-md-6 mx-auto') do
        FORM do
          BaseErrors(store: store) if store.has_base_errors?

          TextInput(name: 'email', placeholder: 'Email', store: store)
          TextInput(name: 'password', placeholder: 'Password', store: store)

          BUTTON(class: 'btn btn-primary') { 'Sign In' }
        end.on(:submit) do |evt|
          evt.prevent_default
          LogInOp.run(store.fields).fail { |e| store_errors! e }
        end
      end
    end
  end
end
