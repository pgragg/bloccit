class CommentsController < ApplicationController

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    authorize @comment 
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @comment.user = current_user 
    authorize @comment 
  end

 def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

 def update
  @comment = Comment.find(params[:id])
  @post = Post.find(params[:post_id])
  authorize @comment 
  if @comment.update_attributes(params.require(:comment).permit(:body))
    flash[:notice] = "Comment was updated."
    redirect_to [@post.topic, @post]
  else
    flash[:error] = "There was an error editing the comment. Please try again."
    render :edit
  end 
 end 

 def destroy
  @post = Post.find(params[:post_id])
  @comment = Comment.find(params[:id])
  authorize @comment

  if @comment.destroy
   flash[:notice] = "\"#{@comment.body}\" was deleted successfully."
   # redirect_to [@post.topic, @post]
  else
   flash[:error] = "There was an error deleting the comment."
   # render :delete
  end
  respond_to do |format|
    format.html
    format.js
  end

 end 
 

 private

  def comment_params
    params.require(:comment).permit(:body)#user is prob unec. here. 
  end

end
