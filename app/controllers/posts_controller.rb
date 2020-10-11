class PostsController < ApplicationController
  
  def index 
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = PostsTag.new
  end


  def create
    @post = PostsTag.new(post_params)
    if @post.valid?
      @post.save
       return redirect_to root_path
    else
      render :new
    end
  end

  def search
    @posts = Post.search(params[:id])
    
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

    
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
  end




 private
 def post_params
   params.require(:posts_tag).permit(:text, :title, :name, :security_id).merge(user_id: current_user.id)
 end





end
