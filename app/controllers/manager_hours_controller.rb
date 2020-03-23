class ManagerHoursController < ApplicationController
  before_action :set_manager_hour, only: [:show, :edit, :update, :destroy]

  # GET /manager_hours
  def index
    @manager_hours = ManagerHour.all
  end

  # GET /manager_hours/1
  def show
  end

  # GET /manager_hours/new
  def new
    @manager_hour = ManagerHour.new
  end

  # GET /manager_hours/1/edit
  def edit
  end

  # POST /manager_hours
  def create
    @manager_hour = ManagerHour.new(manager_hour_params)

    if @manager_hour.save
      redirect_to @manager_hour, notice: 'Manager hour was successfully created.'
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
