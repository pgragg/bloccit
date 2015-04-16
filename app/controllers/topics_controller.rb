class TopicsController < ApplicationController

  def index
    @topics = Topic.paginate(page: params[:page], per_page: 6)
    authorize @topics 
    # @current_page = (params[:offset].to_i/PER_PAGE).to_i 
  end

  def new
    @topic = Topic.new
    authorize @topic 
  end

  def show

    @topic = Topic.find(params[:id])
    authorize @topic 
    @posts = @topic.posts.paginate(page: params[:page], per_page: 6)
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic 
  end

   def create
   @topic = Topic.new(topic_params)
   authorize @topic
   if @topic.save
     redirect_to @topic, notice: "Topic was saved successfully."
   else
     flash[:error] = "Error creating topic. Please try again."
     render :new
   end
  end 
 
   def update
     @topic = Topic.find(params[:id])
     authorize @topic
     if @topic.update_attributes(topic_params)
       redirect_to @topic
     else
       flash[:error] = "Error saving topic. Please try again."
       render :edit
     end
   end

   private 

    def topic_params
      params.require(:topic).permit(:name, :description, :public, :image)
    end

end
