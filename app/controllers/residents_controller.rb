class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :update, :destroy]

  def index
    @residents = Resident.all
    json_response(@residents)
  end

  def show
    json_response(@resident)
  end

  def create
    @resident = Resident.create!(resident_params)
    json_response(@resident, :created)
  end

  def update
    @resident.update(resident_params)
    head :no_content
  end

  def destroy
    @resident.destroy
    head :no_content
  end

  private

  def resident_params
    params.permit(:first_name, :last_name, :dob, :favourite_food)
  end

  def set_resident
    @resident = Resident.find(params[:id])
  end
end
