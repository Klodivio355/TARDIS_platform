class ManagerHoursController < ApplicationController
  before_action :set_manager_hour, only: [:show, :edit, :update, :destroy]

  # GET /manager_hours
  def index
    @manager_hours = ManagerHour.all
  end

  def index_2019
    @manager_hours = ManagerHour.all
  end

  def index_2021
    @manager_hours = ManagerHour.all
  end

  def index_2022
    @manager_hours = ManagerHour.all
  end

  def index_2023
    @manager_hours = ManagerHour.all
  end

  def index_2024
    @manager_hours = ManagerHour.all
  end

  def index_2025
    @manager_hours = ManagerHour.all
  end

  def index_2026
    @manager_hours = ManagerHour.all
  end

  def index_2027
    @manager_hours = ManagerHour.all
  end

  def index_2028
    @manager_hours = ManagerHour.all
  end

  def index_2029
    @manager_hours = ManagerHour.all
  end

  def index_2030
    @manager_hours = ManagerHour.all
  end
#---------------------------------------------------------------------------------------

  def dm_hours
    @manager_hours = ManagerHour.where(email: current_user.email)
  end

  def dm_hours_2019
    @manager_hours = ManagerHour.where(email: current_user.email)
  end

  def dm_hours_2021
    @manager_hours = ManagerHour.where(email: current_user.email)
  end

  def dm_hours_2022
    @manager_hours = ManagerHour.where(email: current_user.email)
  end

  def dm_hours_2023
    @manager_hours = ManagerHour.where(email: current_user.email)
  end

  def dm_hours_2024
    @manager_hours = ManagerHour.where(email: current_user.email)
  end

  def dm_hours_2025
    @manager_hours = ManagerHour.where(email: current_user.email)
  end

  def dm_hours_2026
    @manager_hours = ManagerHour.where(email: current_user.email)
  end

  def dm_hours_2027
    @manager_hours = ManagerHour.where(email: current_user.email)
  end

  def dm_hours_2028
    @manager_hours = ManagerHour.where(email: current_user.email)
  end

  def dm_hours_2029
    @manager_hours = ManagerHour.where(email: current_user.email)
  end

  def dm_hours_2030
    @manager_hours = ManagerHour.where(email: current_user.email)
  end
  #---------------------------------------------------------------------------------------

  # GET /manager_hours/1
  def show
  end

  # GET /manager_hours/new
  def new
    @manager_hour = ManagerHour.new
  end

  # GET /manager_hours/1/edit
  def edite
    @manager_hour = ManagerHour.new
  end

  def edit
  end

  # POST /manager_hours
  def create
    params.permit!
    @manager_hour = ManagerHour.new(manager_hour_params)
    if @manager_hour.save
      redirect_to show_dm_hours_path, notice: 'Manager hour was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /manager_hours/1
  def update
    if @manager_hour.update(manager_hour_params)
      redirect_to @manager_hour, notice: 'Manager hour was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /manager_hours/1
  def destroy
    @manager_hour.destroy
    redirect_to manager_hours_url, notice: 'Manager hour was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_hour
      @manager_hour = ManagerHour.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def manager_hour_params
      params.fetch(:manager_hour, {})
    end
end
