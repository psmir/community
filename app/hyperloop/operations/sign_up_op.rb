class SignUpOp < Hyperloop::ControllerOp
  param :username, type: String
  param :email, type: String
  param :password, type: String
  param :password_confirmation, type: String

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
      AuthOp.run(email: params.email, password: params.password)
    else
      @user.errors
    end
  end
end
