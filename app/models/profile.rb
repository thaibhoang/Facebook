class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar do |pic|
    pic.variant :thumb, resize_to_limit: [150, 150]
    pic.variant :thumb_300, resize_to_limit: [300, 300]
  end

  def pic_200(picture)
    picture.variant(resize_to_limit: [200, 200]).processed
  end
end
