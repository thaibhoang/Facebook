class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many_attached :images
  has_rich_text :rich_body

  validates :title, presence: true, length: {minimum: 1, maximum: 200}
  validates :body, presence: true, length: {minimum: 1}

  def resize_500(image)
    image.variant(resize_to_limit: [500, 500]).processed
  end
end
