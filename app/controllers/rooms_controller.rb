class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]

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

  def update
    @room.update(room_params)
    head :no_content
  end

  def destroy
    @room.destroy
    head :no_content
  end

  private

  def room_params
    params.permit(:name, :resident_id)
  end

  def set_room
    @room = Room.find(params[:id])
  end

end
