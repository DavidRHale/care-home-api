class RoomsController < ApplicationController

  def index
    @room = Room.all
    json_response(@room)
  end

end
