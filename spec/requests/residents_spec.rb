require 'rails_helper'

RSpec.describe 'Residents API', type: :request do
  let!(:residents) { create_list(:resident, 10) }
  let(:resident_id) { residents.first.id }

  describe 'GET /residents' do
    before { get '/residents' }

    it 'returns all residents' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end