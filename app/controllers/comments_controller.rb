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
   
   @comment = @post.comments.build(comment_params)
   @comment.user = current_user
   # @comment.topic = @topic  
   # @comment.post = @post 
   if @comment.save
     flash[:notice] = "Thanks for your comment, #{@comment.user.name}!"
     redirect_to [@topic, @post]
   else
     raise
     flash[:error] = "There was an error saving the comment. Please try again."
     render :new
   end
 end 

 def update
  @topic = Topic.find(params[:topic_id])
  @comment = Comment.find(params[:id])
  @post = Post.find(params[:post_id])
  if @comment.update_attributes(params.require(:comment).permit(:body))
    flash[:notice] = "Comment was updated."
    redirect_to [@topic, @post]
  else
    flash[:error] = "There was an error editing the comment. Please try again."
    render :edit
  end 
 end 

 private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
