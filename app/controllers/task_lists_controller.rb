class TaskListsController < ApplicationController
  before_action :set_task_list, only: [:show, :edit, :update, :destroy]

  # GET /task_lists
  def index
    @task_lists = TaskList.all
  end

  # GET /task_lists/1
  def show
  end

  # GET /task_lists/new
  def new
    @task_list = TaskList.new
  end

  # GET /task_lists/1/edit
  def edit
  end

  # POST /task_lists
  def create
    @task_list = TaskList.new(task_list_params)

    if @task_list.save
      redirect_to @task_list, notice: 'Task list was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /task_lists/1
  def update
    if @task_list.update(task_list_params)
      redirect_to @task_list, notice: 'Task list was successfully updated.'
    else
      render :edit
    end
  end

  def get_rel_task(arg)
    @task_list = TaskList.find(arg.id)
    render :'task_lists/show'
  end

  # DELETE /task_lists/1
  def destroy
    @task_list.destroy
    redirect_to task_lists_url, notice: 'Task list was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_list
      @task_list = TaskList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_list_params
      params.fetch(:task_list, {})
    end
end
