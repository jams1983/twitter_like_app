class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @followers = @user.followers
    @following = @user.following
    @follower = @followers.find_by(followed_by_id: current_user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
