class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize_user

  protected

    def authorize_user
      @current_user = User.find_by(id: session[:user_id])
      unless @current_user
        redirect_to root_path, alert: 'Please, cheack in'
      end
    end

end
