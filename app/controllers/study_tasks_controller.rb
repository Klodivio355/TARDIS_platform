class StudyTasksController < ApplicationController
  before_action :set_study_task, only: [:show, :edit, :update, :destroy, :edite]

  # GET /study_tasks
  def index
    @study_tasks = StudyTask.all
  end


  # GET /study_tasks/1
  def show
  end

  def edite
    task_name = params[:task_name]
    study_id = params[:study_id]
    year = params[:year]
    month = params[:month]
    @study_tasks = StudyTask.where(study_id: study_id, year: year, month: month, task_name: task_name)
  end


  # GET /study_tasks/new
  def new
    id = params[:study_id]
    @study_task = StudyTask.new(study_id: id)
  end


  def guest
    id = params[:study_id]
    @study_task = StudyTask.new(study_id: id)
  end

  # GET /study_tasks/1/edit
  def edit
  end

  # POST /study_tasks
  def create
    params.permit!
    @study_task = StudyTask.new(study_task_params)

    if @study_task.save
      redirect_to @study_task, notice: 'Study task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /study_tasks/1
  def update
    if @study_task.update(study_task_params)
      redirect_to @study_task, notice: 'Study task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /study_tasks/1
#  def destroy
#    @study_task.destroy
#    redirect_to study_tasks_url, notice: 'Study task was successfully destroyed.'
#  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_task
      params.permit!
      @study_task = StudyTask.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def study_task_params
      params.fetch(:study_task, {})
    end
end
