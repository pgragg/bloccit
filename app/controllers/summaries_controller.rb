class SummariesController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
  end
  
  def update 
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
    if @summary.update_attributes(params.require(:summary).permit(:title))
      flash[:notice] = "Summary was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :edit
    end 
  end 

  
 def create
   @topic = Topic.find(params[:topic_id])
   @post = Post.find(params[:post_id]) 
   @summary = @post.build_summary(params.require(:summary).permit(:title))
   #@post = current_user.posts.build(params.require(:post).permit(:title, :body))
   if @summary.save
     flash[:notice] = "Summary was saved."
     redirect_to [@topic, @post]
   else
     flash[:error] = "There was an error saving the summary. Please try again."
     render :new
   end
 end
end
