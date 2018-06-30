class LogOut < Hyperloop::ControllerOp
  #puts "!!!!!!!!!!!!!! #{User.first}"
  step do
    begin
      r = sign_out
      puts "!!!!!!!!!!!!!!!!! Result of Sign Out: #{r}"
    rescue Exception => e
      puts "!!!!!!!!!! #{e.message}"
    end
  end
  #step { puts 'log out' }
end
