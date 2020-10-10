class UsersController < ApplicationController
  
  before_action :set_user, only: :show


  def show
    @post = Post.all.order("created_at DESC")
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
