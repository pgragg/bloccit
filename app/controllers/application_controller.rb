class ApplicationController < ActionController::Base
  include Pundit 
  #before_action :flash_attack

   protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resource)
     topics_path
   end
 
   protected
 
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :name
   end


    # def paginate(collection, offset) #Because collection is an AR object. 
    #     @items = collection.length
    #     results = collection.offset(offset).limit(PER_PAGE)
    # end

  rescue_from Pundit::NotAuthorizedError do |exception| 
    redirect_to root_url, alert: exception.message 
  end 

    private
 
  # def flash_attack
  #   flash[:error] = "Flash Attack!"
  # end
end