class UserPolicy
  regulate_class_connection { true }

  regulate_all_broadcasts do |policy|
    policy.send_all_but(:password_digest)
  end
end
