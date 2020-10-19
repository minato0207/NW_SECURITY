class PostsController < ApplicationController
  
  def index 
    @posts = Post.order("created_at DESC")
    if params[:search].present?
      posts = Post.posts_serach(params[:search])
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      posts = @tag.posts.order(created_at: :desc)
    else
      posts = Post.all.order(created_at: :desc)
    end
    @tag_lists = Tag.all
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(10)
    
  end

  def new
    @post = PostsTag.new
  end

  def top
    @post = Post.search(params[:search])
    @posts = Post.order("created_at DESC")
    
  end
  



  def create
    @post = PostsTag.new(post_params)
    if @post.valid?
      @post.save
       return redirect_to root_path
    else
      render :new
    end

    tag_list = params[:post][:name].split(nil)
    @item.image.attach(params[:post])
    @item.user_id = current_user.id
    if @item.save
       @item.save_items(tag_list)
      redirect_to posts_path
    else
      flash.now[:alert] = '投稿に失敗しました'
      render 'new'
    end
  end

  def search
    @posts = Post.search(params[:id])
    @post = Post.search(params[:search])
    @posty = Post.where(params[:id]) 
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

  def tag_search
    @posts = Post.joins(:tags).where(tags:{id: params[:tag_id]})
  end

  def edit
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end
  
  



    





 private
 def post_params
   params.require(:posts_tag).permit(:text, :title, :name, :security_id).merge(user_id: current_user.id)
 end





end
