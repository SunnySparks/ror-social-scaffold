class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: :User, optional: true

  private

  def create_friend
    Friendship.create(user_id: user_id, friend_id: friend_id, status: true)
  end
end
