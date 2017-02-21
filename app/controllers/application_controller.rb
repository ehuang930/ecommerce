class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_filter :categories, :brands, :line_items
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, :alert => exception.message }
    end
  end
  
  def line_items
    @line_items = LineItem.all
  end
  
  def categories
    @categories = Category.all
  end
  
  def brands
    @brands = Product.pluck(:brand).sort.uniq!
      if @brands == nil
        @brands = Product.pluck(:brand).sort
      end
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end
  
end
