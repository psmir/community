class SignUp < Hyperloop::Component
  state username: ''
  state email: ''
  state password: ''
  state password_confirmation: ''
  state errors: {}

  render(DIV) do
    DL do
      state.errors.each do |field, errors|
        DT{ field }
        DD{ errors.join('; ') }
      end
    end

    FORM do
      DIV(class: 'form-group') do
        INPUT(placeholder: 'Username', value: state.username).on(:change) do |e|
          mutate.username e.target.value
        end
      end

      DIV(class: 'form-group') do
        INPUT(placeholder: 'Email', value: state.email).on(:change) do |e|
          mutate.email e.target.value
        end
      end

      DIV(class: 'form-group') do
        INPUT(placeholder: 'Password', value: state.password).on(:change) do |e|
          mutate.password e.target.value
        end
      end

      DIV(class: 'form-group') do
        INPUT(placeholder: 'Password Confirmation', value: state.password_confirmation)
        .on(:change) do |e|
          mutate.password_confirmation e.target.value
        end
      end

      BUTTON(class: 'btn btn-primary') { 'SIGN UP' }

    end.on(:submit) do |evt|
      evt.prevent_default
      u = User.new(
        username: state.username,
        email: state.email,
        password: state.password,
        password_confirmation: state.password_confirmation
      )
      u.save.then do
        if u.id.nil?
          puts "!!!! #{u.errors}"
          mutate.errors u.errors
        else
          #LogInOp.run(email: state.email, password: state.password)
        end
      end
      .fail do |r|
        puts "SignUp: #{r.inspect}"
      end
    end
  end
end
