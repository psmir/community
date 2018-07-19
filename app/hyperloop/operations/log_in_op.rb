class LogInOp < Hyperloop::Operation
  param :email, type: String
  param :password, type: String

  step { AuthOp.run(email: params.email, password: params.password) }

end
