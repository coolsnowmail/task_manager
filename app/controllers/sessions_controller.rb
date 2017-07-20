class SessionsController < ApplicationController
  skip_before_action :authorize_user

  def new
    redirect_to users_show_user_path(session[:user_id]) if session[:user_id]
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      return redirect_to users_show_user_path(session[:user_id]) if user.role == 'user'
      return redirect_to users_show_admin_path(session[:user_id]) if user.role == 'admin'
    else
      redirect_to login_url, alert: 'Wrong login or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
