class FriendshipsController < ApplicationController
  def index
    @user = User.find_by(params[current_user.id])
    @friendships = Friendship.includes(:user, :friend)
  end

  def update
    @user = User.find_by(params[:user_id])
    @friendship = @user.friendships.find params[:id]
    @friendship.accept
  end

  def destroy
    @user = User.find_by(params[:user_id])
    @friendship = @user.friendships.find params[:id]
    @friendship.destroy
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @user = User.find_by(params[:id])
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], confirmed: false)
    @friendship.save!
    if @friendship.save
      redirect_to root_path, notice: 'Friend Request Sent'
    else
      redirect_to root_path, alert: 'Request Already sent'
    end
  end

  def accept
    @friendship = Friendship.find_by(user_id: user_id, friend_id: friend_id, confirmed: false)
    @friendship.confirmed = true

    if @friendship.save
      redirect_to root_path, notice: 'Friend Request Sent'
    else
      redirect_to root_path, alert: 'Request Already sent'
    end
  end
end
