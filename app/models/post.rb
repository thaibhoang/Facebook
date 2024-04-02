class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :title, presence: true, length: {minimum: 1, maximum: 200}
  validates :body, presence: true, length: {minimum: 1}
end
