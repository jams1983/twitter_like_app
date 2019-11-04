class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followers, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :following, class_name: 'Follower', foreign_key: 'followed_by_id'

  validates :username, presence: true, uniqueness: true


end
