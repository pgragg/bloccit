class PostsController < ApplicationController
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  #skip_before_action :flash_attack, only: [:new, :index]
  # def index
  #   @posts = policy_scope(Post)
  # end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id]) #Why do we find the Post by :id and the Topic by :topic_id? That's what our rake routes output says it's expecting: /topics/:topic_id/posts/:id/edit. Rails conventions make the params hash consistent with these expectations.
    @summary = @post.summary
    @comments = @post.comments
    authorize @comments

  end

  def new
    @topic = Topic.find(params[:topic_id])
     #authorize method comes from Pundit in the ApplicationController. 
    @post = Post.new
    authorize @post
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post 
  end

  def update 
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end 
  end 

 def create
   @topic = Topic.find(params[:topic_id])
   @post = current_user.posts.build(post_params)
   @post.topic = @topic 
   authorize @post 
   if @post.save_with_initial_vote
       flash[:notice] = "Post was saved with an upboat."
       redirect_to [@topic, @post]
   else
     flash[:error] = "There was an error saving the post. Please try again."
     render :new
   end
 end

 def destroy
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
 
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to @topic
     else
       flash[:error] = "There was an error deleting the post."
       render :show
     end
   end


 private

  

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end


end
