class TasksController < ApplicationController
  skip_before_action :authorize_user, only: [:index]
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def index
    @tasks = Task.all
  end
end
