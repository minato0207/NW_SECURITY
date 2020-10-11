class UsersController < ApplicationController
  
  before_action :set_user, only: :show


  def show
    @user = User.find(params[:id])
    @post = Post.all.order("created_at DESC")
    @favorite_posts = @user.favorite_posts 
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end


  private

  def set_user
    @user = User.find(params[:id])
  end



end
