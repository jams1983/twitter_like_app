class Follower < ApplicationRecord
  belongs_to :user
  belongs_to :followed_by, class_name: 'User'

  validates :followed_by_id, uniqueness: { scope: :user_id, message: 'Already following'}
end
