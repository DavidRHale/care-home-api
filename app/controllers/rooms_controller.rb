class RoomsController < ApplicationController
  before_action :set_room, only: [:show]

  def index
    @room = Room.all
    json_response(@room)
  end

  def show
    json_response(@room)
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

end
