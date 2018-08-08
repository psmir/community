class Post < ApplicationRecord
  belongs_to :user

  scope :recent, -> () { order(created_at: :desc) }

  validates :title, :body, presence: true
end
