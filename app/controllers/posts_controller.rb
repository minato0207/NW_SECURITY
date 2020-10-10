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
    # return nil if params[:input] == ""
    # tag = Tag.where(['name LIKE ?', "%#{params[:input]}%"] )
    # render json:{ keyword: tag }
  end

  def show
    @post = Post.find(params[:id])
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
