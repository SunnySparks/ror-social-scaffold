class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all.where.not(id: current_user.id)
  end

  def show
    @user = User.find_by(params[:user_id])
    @posts = @user.posts.ordered_by_most_recent
  end
end
