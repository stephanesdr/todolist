class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category
    if @task.save

      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      flash[:notice] = "Task created"
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end





  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])
    if params["task_#{@task.id}"] == "on"
      @task.update(:status => true)
    else
      params["task_#{@task.id}"] == "off"
      @task.update(:status => false)
    end
    if @task.update(task_params)
      respond_to do |format|
        format.html {redirect_to tasks_path}
        format.js
      end
    else
      redirect_to root_path
    end
  end

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      respond_to do |format|
        format.html {redirect_to task_path}
        format.js
      end
      else
    redirect_to root_path
    end
  end


  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

  def category_params
    params.require(:Category)
  end

end
