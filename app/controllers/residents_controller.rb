class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show]

  def index
    @residents = Resident.all
    json_response(@residents)
  end

  def show
    json_response(@resident)
  end

  private

  def set_resident
    @resident = Resident.find(params[:id])
  end

end
