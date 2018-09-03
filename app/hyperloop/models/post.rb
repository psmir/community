class Post < ApplicationRecord
  belongs_to :user

  scope :recent, -> () { order(created_at: :desc) }
  scope :paginated, -> (page, page_size) { limit(page_size).offset((page-1) * page_size) }

  validates :title, :body, presence: true


end
