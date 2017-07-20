class UsersController < ApplicationController
  def show_user
    redirect_to users_show_admin_path(session[:user_id]) if @current_user.role == 'admin'
  end

  def show_admin
    @tasks = Task.all
  end
end
