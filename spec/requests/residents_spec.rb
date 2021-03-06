require 'rails_helper'

RSpec.describe 'Residents API', type: :request do
  
  let!(:resident1) { create(:resident) }
  let!(:resident2) { create(:resident) }
  let!(:resident3) { create(:resident) }

  let!(:room1) { create(:room, resident_id: resident1.id) }
  let!(:room2) { create(:room, resident_id: resident2.id) }
  let!(:room3) { create(:room, resident_id: resident3.id) }

  let(:resident_id) { resident1.id }

  describe 'GET /residents' do
    before { get '/residents' }

    it 'returns all residents' do
      expect(json.size).to eq(3)
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

  describe 'POST /residents' do
    let(:valid_attributes) { { first_name: 'David', last_name: 'Hale', dob: '17-06-1903', favourite_food: 'Pizza' } }

    context 'when the request is valid' do
      before { post '/residents', params: valid_attributes }

      it 'creates a resident' do
        expect(json['first_name']).to eq('David')
        expect(json['last_name']).to eq('Hale')
        expect(json['dob']).to eq('1903-06-17')
        expect(json['favourite_food']).to eq('Pizza')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/residents', params: { } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: First name can't be blank/)
      end
    end
  end  

  describe 'PUT /residents/:id' do
    let(:valid_attributes) { { first_name: 'Molly' } }

    context 'when the record exists' do
      before { put "/residents/#{resident_id}", params: valid_attributes }

      it 'does not send a body' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the record does not exists' do
      let(:resident_id) { 100 }
      before { put "/residents/#{resident_id}", params: valid_attributes }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end

    context 'when the request is invalid' do
      before { post '/residents', params: { first_name: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: First name can't be blank/)
      end
    end
  end


  describe 'DELETE /residents/:id' do
    before { delete "/residents/#{resident_id}" }

    context 'when the record exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the record does not exists' do
      let(:resident_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end