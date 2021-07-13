class FriendshipsController < ApplicationController
  def index
    @user = User.find_by(params[current_user.id])
<<<<<<< HEAD
    @friendships = Friendship.includes(:user, :friend)
=======
    @friendships = @user.friendships
    @users = User.all
>>>>>>> parent of 4a03d6b (Create reverse friendships and display friend requests)
  end

  def update
    @user = User.find_by(params[:user_id])
    @friendship = @user.friendships.find params[:id]
    @friendship.accept
  end

  def destroy
    @user = User.find_by(params[:user_id])
    @friendship = @user.friendships.find params[:id]
    @friendship.decline
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @user = User.find_by(params[:user_id])
    @friendship = Friendship.new(user_id: current_user.id, friend_id: @user.id, confirmed: false)
    @friendship.save!
    if @friendship.save
      redirect_to root_path, notice: 'Friend Request Sent'
    else
      redirect_to root_path, alert: 'Request Already sent'
    end
  end

  def accept
<<<<<<< HEAD
    @friendship = Friendship.find_by(user_id: user_id, friend_id: friend_id, confirmed: false)
=======
    @friendship = Friendship.find_by(user_id: params[:id], friend_id: current_user.id)
>>>>>>> parent of 4a03d6b (Create reverse friendships and display friend requests)
    @friendship.confirmed = true

    if @friendship.save
      redirect_to root_path, notice: 'Friend Request Sent'
    else
      redirect_to root_path, alert: 'Request Already sent'
    end
  end
end
