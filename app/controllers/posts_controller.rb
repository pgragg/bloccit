class PostsController < ApplicationController
   def index
     @topics = Topic.visible_to(current_user)
     @posts = Post.where("posts.created_at > ?", 5.days.ago).paginate(page: params[:page], per_page: 10)
   end
 end
