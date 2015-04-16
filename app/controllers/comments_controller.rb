class CommentsController < ApplicationController
  def edit
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
   @topic = Topic.find(params[:topic_id])
   @post = Post.find(params[:post_id]) 
   @comment = @post.comments.build(params.require(:comment).permit(:body))
   #@post = current_user.posts.build(params.require(:post).permit(:title, :body))
   if @comment.save
     flash[:notice] = "Comment was saved."
     redirect_to [@topic, @post]
   else
     flash[:error] = "There was an error saving the comment. Please try again."
     render :new
   end
 end 

 def update
  @topic = Topic.find(params[:topic_id])
  @comment = Comment.find(params[:id])
  @post = Post.find(params[:post_id])
  if @comment.update_attributes(params.require(:comment).permit(:title))
    flash[:notice] = "Comment was updated."
    redirect_to [@topic, @post]
  else
    flash[:error] = "There was an error saving the comment. Please try again."
    render :edit
  end 
 end 
end
