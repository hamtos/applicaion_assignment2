class RelationshipsController < ApplicationController
  def following_index
    @user = User.find(params[:user_id])
  end

  def followers_index
    @user = User.find(params[:user_id])
  end

  def create
    followers = current_user.follower_relationship.new(followed_id: params[:user_id])
    followers.save
    redirect_to request.referer
  end

  def destroy
    current_user.follower_relationship.find_by(followed_id: params[:user_id]).destroy
    redirect_to request.referer
  end
end
