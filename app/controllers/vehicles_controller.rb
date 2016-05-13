class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show; end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.create(vehicle_params)
    if @vehicle.save
      redirect_to root_path
    else

      render 'new'
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])

    if @vehicle.update(vehicle_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    redirect_to root_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :gos_num, :pts, :pts_date, vehicle_attachments_attributes: [:id, :vehicle_id, :image, :_destroy])
  end

end