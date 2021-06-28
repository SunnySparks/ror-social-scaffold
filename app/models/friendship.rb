class Friendship < ApplicationRecord
  belongs_to :user

  private

  def create_friend
    Friendship.create(user_id: friend_id, friend_id: user_id, status: true )
  end
end
