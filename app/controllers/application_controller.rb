class ApplicationController < ActionController::Base
  before_filter :store_current_location, :unless => :devise_controller?
  
  protect_from_forgery with: :exception
  
  # Authorization part config
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized # Manage errors

  # Application Layout
  layout :layout_by_resource

  protected

  def layout_by_resource
  	if devise_controller? && resource_name == :admin
  		"backoffice_devise"
    elsif devise_controller? && resource_name == :member
      "site_devise"        
  	else
  		"application"
  	end
  end

  private 
  
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def store_current_location
    store_location_for(:member, request.url)
  end
end
