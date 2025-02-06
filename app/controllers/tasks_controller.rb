class TasksController < ApplicationController
  def index
    @tasks = Task.includes(:category).all
    @overall_progress = calculate_progress(@tasks)
    @category_progress = Category.all.map { |category| [category.name, calculate_progress(category.tasks)] }.to_h
  end

  def new
    @task = Task.new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'タスクが作成されました。'
    else
      @categories = Category.all
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'タスクが更新されました。'
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'タスクが削除されました。'
  end  

  def univ
    @tasks = Task.includes(:category).all
    @overall_progress = calculate_progress(@tasks)
    @category_progress = Category.all.map { |category| [category.name, calculate_progress(category.tasks)] }.to_h
  end

  def club
    @tasks = Task.includes(:category).all
    @overall_progress = calculate_progress(@tasks)
    @category_progress = Category.all.map { |category| [category.name, calculate_progress(category.tasks)] }.to_h
  end

  def job
    @tasks = Task.includes(:category).all
    @overall_progress = calculate_progress(@tasks)
    @category_progress = Category.all.map { |category| [category.name, calculate_progress(category.tasks)] }.to_h
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :due_date, :completed, :category_id, :progress)
  end

end
