class User < ApplicationRecord
  has_secure_password
  has_many :posts
  # TODO: restrict the access to posts when the documentation gets updated
  regulate_relationship :posts

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :username


  def self.current
    Hyperloop::Application.acting_user_id ? find(Hyperloop::Application.acting_user_id) : nil
  end

end
