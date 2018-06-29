class User < ApplicationRecord
  has_many :posts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable unless RUBY_ENGINE == 'opal'

  def self.current
    Community::Application.acting_user_id ? find(Community::Application.acting_user_id) : User.new
  end

end
