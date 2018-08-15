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

  describe 'GET /residents/:id' do
    before { get "/residents/#{resident_id}" }

    context 'when the record exists' do
      it 'returns the resident' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(resident_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:resident_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Resident/)
      end
    end
  end


end