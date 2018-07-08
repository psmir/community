class LogInOp < Hyperloop::ControllerOp
  param :email, type: String
  param :password, type: String
  outbound :user_id

  step { @user = User.find_by(email: params.email) }
  step do
    if @user.present? && @user.authenticate(params.password)
      session[:current_user_id] = @user.id
      params.user_id = @user.id
    end
  end

  # The example from the docs doesn't work
  # dispatch_to { current_session }
  dispatch_to { session_channel }
end
