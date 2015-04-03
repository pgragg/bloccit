class PostsController < ApplicationController
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  #skip_before_action :flash_attack, only: [:new, :index]
  # def index
  #   @posts = policy_scope(Post)
  # end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id]) #Why do we find the Post by :id and the Topic by :topic_id? That's what our rake routes output says it's expecting: /topics/:topic_id/posts/:id/edit. Rails conventions make the params hash consistent with these expectations.
  end

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    authorize @post #authorize method comes from Pundit in the ApplicationController. 
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
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end 
  end 

 def create
   @topic = Topic.find(params[:topic_id])
   #@post = Post.new(params.require(:post).permit(:title, :body))
   @post = current_user.posts.build(params.require(:post).permit(:title, :body))
   authorize @post 
   if @post.save
     flash[:notice] = "Post was saved."
     redirect_to [@topic, @post]
   else
     flash[:error] = "There was an error saving the post. Please try again."
     render :new
   end
 end


end
