class SignUpOp < Hyperloop::Operation
  param :username, type: String
  param :email, type: String
  param :password, type: String
  param :password_confirmation, type: String

  step do
    user = User.new(
      username: params.username,
      email: params.email,
      password: params.password,
      password_confirmation: params.password_confirmation
    )
    user.save.then do |r|
      abort! user unless r[:success]
    end
  end

  step do
    AuthOp.run(email: params.email, password: params.password)
  end
end
