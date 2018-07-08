class SignUpOp < Hyperloop::Operation
  param :username
  param :email
  param :password
  param :password_confirmation

  step do
    user = User.new(
      username: params.username,
      email: params.email,
      password: params.password,
      password_confirmation: params.password_confirmation
    )

    user.save.then do |r|

    end
  end

  #step { LogInOp.run(email: params.email, password: params.password) }

end
