class PostPolicy
  regulate_broadcast do |policy|
    policy.send_all.to(User)
  end

  allow_create { acting_user.id == self.user_id }
  allow_update { acting_user.id == self.user_id }
  allow_destroy { acting_user.id == self.user_id }

end
