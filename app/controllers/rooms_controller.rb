class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    json_response(@rooms)
  end

  def create
    @room = Room.create(room_params)
    json_response(@room, :created)
  end

  def show
    @room = Room.find(params[:id])
    json_response(@room)
  end

  def room_params
    params.permit(:name)
  end

end
