require 'date'

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
    task_name = params[:task_name]
    study_id = params[:study_id]
    year = params[:year]
    month = params[:month]
    @study_tasks = StudyTask.where(study_id: study_id, year: year, month: month, task_name: task_name)
  end

  def dm_studies
    @studies = Study.where(lead_manager: current_user.email).or(Study.where(backup_manager: current_user.email))
  end

  ##############################################################

  def study_hours_timeline
    @studies = Study.all
  end

  def study_hours_timeline_2019
    @studies = Study.all
  end

  def study_hours_timeline_2021
    @studies = Study.all
  end

  def study_hours_timeline_2022
    @studies = Study.all
  end

  def study_hours_timeline_2023
    @studies = Study.all
  end

  def study_hours_timeline_2024
    @studies = Study.all
  end

  def study_hours_timeline_2025
    @studies = Study.all
  end

  def study_hours_timeline_2026
    @studies = Study.all
  end

  def study_hours_timeline_2027
    @studies = Study.all
  end

  def study_hours_timeline_2028
    @studies = Study.all
  end

  def study_hours_timeline_2029
    @studies = Study.all
  end

  def study_hours_timeline_2030
    @studies = Study.all
  end

##############################################################
  def month_timeline
    @studies = Study.all
  end

  def month_timeline_2019
    @studies = Study.all
  end

  def month_timeline_2021
    @studies = Study.all
  end

  def month_timeline_2022
    @studies = Study.all
  end

  def month_timeline_2023
    @studies = Study.all
  end

  def month_timeline_2024
    @studies = Study.all
  end

  def month_timeline_2025
    @studies = Study.all
  end

  def month_timeline_2026
    @studies = Study.all
  end

  def month_timeline_2027
    @studies = Study.all
  end

  def month_timeline_2028
    @studies = Study.all
  end

  def month_timeline_2029
    @studies = Study.all
  end

  def month_timeline_2030
    @studies = Study.all
  end

  ##############################################################

  # GET /studies/1
  def show
  end

  #generate the timelines based on the type and task using the paramaters provided
  def generate_mt
    id = params[:study_id]
    type = params[:type_of]
    dater = params[:start_date]
    lplv = params[:lplv]

    @studies = Study.where(study_id: id, type_of: type, start_date: dater, lplv: lplv).update(generated: true)

    #different types require different tasks to be projected after a certain time
    if type == 'Routine data'
      for i in (6).downto(0)
        if dater.to_time.to_date.strftime('%m').to_i - i < 1
          previous_year = dater.to_time.to_date.year.to_i - 1
          previous_year_month = (dater.to_time.to_date.strftime('%m').to_i + 12) - i
          @study_tasks = StudyTask.create(study_id: id, task_name: :"Routine data", year: previous_year, month: previous_year_month, complete: false)
        else
          @study_tasks = StudyTask.create(study_id: id, task_name: :"Routine data", year: dater.to_time.to_date.year.to_i, month: dater.to_time.to_date.strftime('%m').to_i - i, complete: false)
        end
      end
    elsif type == 'late phase CTIMP' || type == 'early phase CTIMP'|| type == 'complex intervention' || type == 'REDCAP observational'
      for i in (6).downto(3)
        if dater.to_time.to_date.strftime('%m').to_i - i < 1
          previous_year = dater.to_time.to_date.year.to_i - 1
          previous_year_month = (dater.to_time.to_date.strftime('%m').to_i + 12) - i
          @study_tasks = StudyTask.create(study_id: id, task_name: :"CRFs", year: previous_year, month: previous_year_month, complete: false)
        else
          @study_tasks = StudyTask.create(study_id: id, task_name: :"CRFs", year: dater.to_time.to_date.year.to_i, month: dater.to_time.to_date.strftime('%m').to_i - i, complete: false)
        end
      end

      #once types are checked, the dates are checked and tasks are projected accordingly
      if dater.to_time.to_date.strftime('%m').to_i - 2 < 1
        @study_tasks = StudyTask.create(study_id: id, task_name: :"Spec", year: previous_year, month: (dater.to_time.to_date.strftime('%m').to_i + 12) - 2, complete: false)
      else
        @study_tasks = StudyTask.create(study_id: id, task_name: :"Spec", year: dater.to_time.to_date.year.to_i, month: dater.to_time.to_date.strftime('%m').to_i - 2, complete: false)
      end
      if dater.to_time.to_date.strftime('%m').to_i - 1 < 1
        @study_tasks = StudyTask.create(study_id: id, task_name: :"Functional QC", year: previous_year, month: (dater.to_time.to_date.strftime('%m').to_i + 12) - 1, complete: false)
      else
        @study_tasks = StudyTask.create(study_id: id, task_name: :"Functional QC", year: dater.to_time.to_date.year.to_i, month: dater.to_time.to_date.strftime('%m').to_i - 1, complete: false)
      end

      for y in 0..1 do
        if dater.to_time.to_date.strftime('%m').to_i + y > 12
          next_year = dater.to_time.to_date.year.to_i + 1
          next_year_month = (dater.to_time.to_date.strftime('%m').to_i - 12) + y
          @study_tasks = StudyTask.create(study_id: id, task_name: :"Reports and DVS", year: next_year, month: next_year_month + y, complete: false)
        else
          @study_tasks = StudyTask.create(study_id: id, task_name: :"Reports and DVS", year: dater.to_time.to_date.year.to_i, month: dater.to_time.to_date.strftime('%m').to_i + y, complete: false)
        end
      end

      month_count = (lplv.to_time.to_date.year.to_i * 12 + lplv.to_time.to_date.strftime('%m').to_i) - (dater.to_time.to_date.year.to_i * 12 - dater.to_time.to_date.strftime('%m').to_i)
      year_count = lplv.to_time.to_date.year.to_i -  dater.to_time.to_date.year.to_i
      z = 2
      for b in 1..year_count do
        while z < month_count - 1
          if dater.to_time.to_date.strftime('%m').to_i + z > 12 * (b+1) # or that dater month + z > lplv
            break
          elsif dater.to_time.to_date.strftime('%m').to_i + z > 12 * b && dater.to_time.to_date.strftime('%m').to_i + z <= 12 * (b+1)
              next_year = dater.to_time.to_date.year.to_i + b
              next_year_month = (dater.to_time.to_date.strftime('%m').to_i - 12*b) + z
              @study_tasks = StudyTask.create(study_id: id, task_name: :"Follow up", year: next_year, month: next_year_month, complete: false)
              z += 1
          else
              @study_tasks = StudyTask.create(study_id: id, task_name: :"Follow up", year: dater.to_time.to_date.year.to_i , month: dater.to_time.to_date.strftime('%m').to_i + z, complete: false)
              z += 1
          end
        end
      end
    else
      render 'errors/error_404'
      @studies = Study.where(study_id: id, type_of: type, start_date: dater, lplv: lplv).update(generated: false)
    end

    #shows the actual generated timeline
    for p in (12).downto(lplv.to_time.to_date.strftime('%m').to_i + 1)
      @study_tasks = StudyTask.where(:study_id => id).where(:task_name => "Follow up").where(:year => lplv.to_time.to_date.year.to_i).where(:month => p).where(:complete => false).delete_all
    end

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
#  def destroy
#    @study.destroy
#    redirect_to studies_url, notice: 'Study was successfully destroyed.'
#  end

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
