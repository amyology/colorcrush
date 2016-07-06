class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def authenticate_admin!
      unless user_signed_in? && current_user.admin
        redirect_to '/'
      end
    end

    def authenticate_user!
      unless user_signed_in?
        redirect_to '/users/sign_up'
      end
    end

end