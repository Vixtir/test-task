class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:edit, :update, :destroy]

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.create(vehicle_params)
    if @vehicle.save
      flash[:success] = "Автомобиль успешно создан"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @vehicle.update(vehicle_params)
      flash[:success] = "Автомобиль успешно отредактирован"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @vehicle.destroy
    flash[:success] = "Автомобиль успешно удален"
    redirect_to root_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :gos_num, :pts, :pts_date, vehicle_attachments_attributes: [:id, :vehicle_id, :image, :_destroy])
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

end