class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :create]

  respond_to :html, :json

  # GET /tasks
  # GET /tasks.json
  # GET /users/:id/tasks
  # GET /users/:id/tasks.json
  def index
    if @user
      @tasks = Task.where(user_id: @user.id).includes(:user)
    else
      @tasks = Task.includes(:user)
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    flash[:notice] = 'Task was successfully created.' if @task.save
    respond_with @task
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    flash[:notice] = 'Task was successfully updated.' if @task.update(task_params)
    respond_with @task
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    flash[:notice] = 'Task was successfully destroyed.'
    respond_with @task
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.includes(:user).find(params[:id])
    end

    def set_user
      @user = User.find_by_id(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :user_id)
    end
end
