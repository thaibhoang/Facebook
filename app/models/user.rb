class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_follow_requests, foreign_key: "sender_id", class_name: "FollowRequest", dependent: :destroy
  has_many :received_follow_requests, foreign_key: "receiver_id", class_name: "FollowRequest", dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile
end
