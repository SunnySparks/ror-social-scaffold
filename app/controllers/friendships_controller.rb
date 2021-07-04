class FriendshipsController < ApplicationController
  def index
    @user = User.find_by(params[:user_id])
    @friendships = @user.friendships
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
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:user_id], confirmed: false)
    @friendship.save!
    if @friendship.save
      redirect_to root_path, notice: 'Friend Request Sent'
    else
      redirect_to root_path, alert: 'Request Already sent'
    end
  end

  def accept
    @friendship = Friendship.find_by(user_id: params[:id], friend_id: current_user.id)
    @friendship.status = 'accepted'

    if @friendship.save
      redirect_to root_path, notice: 'Friend Request Sent'
    else
      redirect_to root_path, alert: 'Request Already sent'
    end
  end
end
