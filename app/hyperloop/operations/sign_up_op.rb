class SignUpOp < Hyperloop::ControllerOp
  param :username
  param :email
  param :password
  param :password_confirmation

  step do
    @user = User.create(
      username: params.username,
      email: params.email,
      password: params.password,
      password_confirmation: params.password_confirmation
    )
  end

  step do
    if @user.persisted?
      AuthOp.run(controller: params.controller, email: params.email, password: params.password)
    end
  end

  step do
    { success: @user.persisted?, errors: @user.errors }
  end

end
