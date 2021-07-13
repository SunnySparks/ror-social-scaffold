class Friendship < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  belongs_to :friend, class_name: 'User', optional: true
=======
>>>>>>> parent of 4a03d6b (Create reverse friendships and display friend requests)

  private

  def create_friend
    Friendship.create(user_id: friend_id, friend_id: user_id, status: true)
  end
end
