class DevicesController < ApplicationController

  def index
    devices = Device.all
    render json: devices
  end

  def show
    device = Device.find_by_name(params[:name])
    render json: device
  end

  def create
    device = Device.new(params[:name], params[:state])
    if device.save
      render json: device
    else
      render json: { error: 'Unable to create device' }, status: 400
    end
  end

  def update
    device = Device.find_by_name(params[:name])
    if device
      device.update(:state += 1)
      render json: device, status: 200
    else
      render json: { error: 'Unable to change state' }, status: 400
    end
  end

  def destroy
    device = Device.find_by_name(params[:name])
    if device
      device.destroy
      render json: device, status: 200
    else
      render json: { error: 'Could not delete' }, status: 400
    end
  end

end
