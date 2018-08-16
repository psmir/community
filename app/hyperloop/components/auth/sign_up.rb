class SignUp < Hyperloop::Router::Component
  include FormCommon

  collect_other_params_as :attributes

  before_mount do
    self.store = FormStore.create!(username: '', email: '', password: '', password_confirmation: '')
  end

  render(DIV, class: 'container') do
    DIV(class: 'row viewport-80 align-items-center') do
      DIV(class: 'col col-md-6 mx-auto') do
        FORM do
          BaseErrors(store: store) if store.has_base_errors?

          TextInput(name: 'username', placeholder: 'Username', store: store)
          TextInput(name: 'email', placeholder: 'Email', store: store)
          PasswordInput(name: 'password', placeholder: 'Password', store: store)
          PasswordInput(name: 'password_confirmation', placeholder: 'Password Confirmation', store: store)

          BUTTON(class: 'btn btn-primary') { 'SIGN UP' }
        end.on(:submit) do |evt|
          evt.prevent_default
          SignUpOp.run(store.fields)
          .then { |r| r[:success] ? params.history.push('/') : store_errors!(r[:errors]) }
          .fail { |e| puts e.message }
        end
      end
    end
  end
end
