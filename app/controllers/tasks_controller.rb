class TasksController < ApplicationController
  skip_before_action :authorize_user, only: [:index]
  before_action :set_task, only: [:edit, :update, :destroy]
  def new
    @task = Task.new
    redirect_to admin_new_path if @current_user.role == 'admin'
  end

  def admin_new
    @users = User.all.collect(&:email)
    @task = Task.new
  end

  def create
    @task = @current_user.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to users_show_user_path(@current_user) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to users_show_user_path(@current_user) }
      else
        format.html { render :edit }
      end
    end
  end

  def edit
    redirect_to admit_edit_path if @current_user.role == 'admin'
  end

  def admin_edit
    @users = User.all.collect(&:email)
    @task = Task.find(params[:format])
  end

  def show
  end

  def destroy
    @task.destroy
    return render partial: 'destroy'
  end

  def index
    @tasks = Task.all
  end

    private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :name, :avatar)
    end
end
