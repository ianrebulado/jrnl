class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_task, only: %i[edit update destroy]

  def show
    redirect_to category_path(@category)
  end

  def new
    @task = @category.tasks.new
  end

  def create
    @task = @category.tasks.new(task_params)
    if @task.save
      redirect_to category_path(@category), notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to category_path(@category), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to category_path(@task.category), notice: 'Task was successfully deleted.'
    else
      render :index
    end
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :due_date)
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to '/'
  end
end
