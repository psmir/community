class LogOutOp < Hyperloop::ControllerOp
  step { session[:current_user_id] = nil }
  dispatch_to { session_channel }
end
