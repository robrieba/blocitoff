class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :cleanup_old_tasks

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def require_sign_in
    unless current_user
      flash[:error] = "You must be logged in to do that"
      redirect_to '/users/sign_in'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  private

  def cleanup_old_tasks
    if current_user
      current_user.items.each do |item|
        if (item.created_at + 7.days < Time.now)
          item.destroy
        end
      end
    end
  end


end
