class SignUp < Hyperloop::Component
  include FormCommon

  before_mount do
    self.store = FormStore.create!(username: '', email: '', password: '', password_confirmation: '')
  end

  render(DIV) do
    BaseErrors(store: store) if store.has_base_errors?

    FORM do
      TextInput(name: 'username', placeholder: 'Username', store: store)
      TextInput(name: 'email', placeholder: 'Email', store: store)
      TextInput(name: 'password', placeholder: 'Password', store: store)
      TextInput(name: 'password_confirmation', placeholder: 'Password Confirmation', store: store)

      BUTTON(class: 'btn btn-primary') { 'SIGN UP' }
    end.on(:submit) do |evt|
      evt.prevent_default
      SignUpOp.run(store.fields).fail { |e| store_errors!(e) }
    end
  end
end
