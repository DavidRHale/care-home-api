class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show]

  def index
    @residents = Resident.all
    render json: @residents, status: :ok
  end

  def show
    render json: @resident, status: :ok
  end

  private

  def set_resident
    @resident = Resident.find(params[:id])
  end

end
