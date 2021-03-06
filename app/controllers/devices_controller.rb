class DevicesController < ApplicationController

  def index
    devices = Device.all
    render json: devices
  end

  def show
    device = Device.find_by_id(params[:id])
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

  def roomMotion
    device = Device.find_by_id(2)
    if device
      device.state += 1
      device.save
      render json: device
    end
  end

  def room
    device = Device.find_by_id(2)
    if device
      render json: device
    else
      render json: { error: 'Cannot read device state' }, status: 400
    end
  end

  def frontMotion
    device = Device.find_by_id(1)
      device.state += 1
      device.save
  end

  def frontdoor
    device = Device.find_by_id(1)
    if device
      render json: device
    else
      render json: { error: 'Cannot read device state' }, status: 400
    end
  end

  def update
    device = Device.find_by_id(params[:id])
    if device
      device.state += 1
      device.save
      render json: device, status: 200
    else
      render json: { error: 'Unable to change state' }, status: 400
    end
  end

  def destroy
    device = Device.find_by_id(params[:id])
    if device
      device.destroy
      render json: device, status: 200
    else
      render json: { error: 'Could not delete' }, status: 400
    end
  end

end
