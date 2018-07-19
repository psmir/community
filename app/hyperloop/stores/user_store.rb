class UserStore < Hyperloop::Store
  state :current, scope: :class, reader: true

  def self.set_current! user
    mutate.current user
  end

  def self.set_current_by_id!(id)
    user = User.find_by(id: id)
    set_current! user if user.present?
  end


  receives AuthOp do
    set_current_by_id! params.user_id
  end

  receives LogOutOp do
    set_current! nil
  end
end
