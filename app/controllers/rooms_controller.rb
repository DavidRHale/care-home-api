class RoomsController < ApplicationController
  before_action :set_room, only: [:show]

  def index
    @room = Room.all
    json_response(@room)
  end

  def show
    json_response(@room)
  end

  def create
    @room = Room.create!(room_params)
    json_response(@room, :created)
  end

  private

  def room_params
    params.permit(:name, :resident_id)
  end

  def set_room
    @room = Room.find(params[:id])
  end

end
