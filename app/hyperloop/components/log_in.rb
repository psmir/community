class LogIn < Hyperloop::Component
  state email: ''
  state password: ''
  state errors: []

  render(DIV) do
    UL do
      state.errors.each do |err|
        LI{ err }
      end
    end

    FORM do
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

      BUTTON(class: 'btn btn-primary') { 'Log In!!!' }

    end.on(:submit) do |evt|
      evt.prevent_default
      LogInOp.run(email: state.email, password: state.password)
      .fail do |e|
        mutate.errors e.message.split('; ')
      end
    end
  end
end
