class ApplicationController < ActionController::Base
  before_action :flash_attack


  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?
 
   protected
 
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :name
   end

    private
 
  def flash_attack
    flash[:error] = "Flash Attack!"
  end
end