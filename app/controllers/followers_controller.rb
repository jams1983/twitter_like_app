class FollowersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_follower, only: :destroy

  def create
    current_user.following.create(user: @user)
    redirect_to user_path(@user)
  end

  def destroy
    @follower.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_follower
    @follower = current_user.following.find(params[:id])
  end
end
