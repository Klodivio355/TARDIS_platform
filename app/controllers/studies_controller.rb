class StudiesController < ApplicationController
  before_action :set_study, only: [:hours_management, :show, :edit, :update, :destroy,]
  # GET /studies
  def index
    @studies = Study.all
  end

  def index_tasks
    id = params[:study_id]
    @study_tasks = StudyTask.where(study_id: id)
  end

  def hours_management
  end

  def dm_studies
    @studies = Study.where(lead_manager: current_user.email).or(Study.where(backup_manager: current_user.email))
  end

  def study_hours_timeline
    @studies = Study.all
  end

  def month_timeline
    @studies = Study.all
  end

  # GET /studies/1
  def show
  end

  # GET /studies/new
  def new
    @study = Study.new
  end

  # GET /studies/1/edit
  def edit
  end

  # POST /studies
  def create
    params.permit!
    @study = Study.new(study_params)

    if @study.save
      redirect_to @study, notice: 'Study was successfully created.'
    else
      render :new
    end
  end

  def search
    # {"search" => {"name" => "some entered name"} }
    @studies = Study.where(study_name: params[:search][:study_name])
    render :index
  end

  # PATCH/PUT /studies/1
  def update
    if @study.update(study_params)
      redirect_to @study, notice: 'Study was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /studies/1
  def destroy
    @study.destroy
    redirect_to studies_url, notice: 'Study was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study
      params.permit!
      @study = Study.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def study_params
      params.fetch(:study, {})
    end
end
