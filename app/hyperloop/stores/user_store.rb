class UserStore < Hyperloop::Store
  state :current, scope: :class, reader: true

  def self.set_current! user
    mutate.current user
  end
end
