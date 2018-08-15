class ResidentsController < ApplicationController

  def index
    @residents = Resident.all
    render json: @residents, status: :ok
  end

end
