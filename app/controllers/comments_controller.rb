class CommentsController < ApplicationController
 

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.save
    render :index
  end

 
  
  

  def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      render :index
  end

  



  private

  

  def comment_params
    params.permit(:post_id).merge(user_id: current_user.id, text: params[:comment][:text])
  end
end
