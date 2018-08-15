require 'rails_helper'

RSpec.describe 'Rooms API' do

  let!(:resident1) { create(:resident) }
  let!(:resident2) { create(:resident) }
  let!(:resident3) { create(:resident) }

  let!(:room1) { create(:room, resident_id: resident1.id) }
  let!(:room2) { create(:room, resident_id: resident2.id) }
  let!(:room3) { create(:room, resident_id: resident3.id) }

  let(:room_id) { room1.id }

  describe 'GET /rooms' do
    before { get '/rooms' }

    it 'returns all rooms' do
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'GET /rooms/:id' do
    before { get "/rooms/#{room_id}" }

    context 'when the record exists' do
      it 'returns the room' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(room_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:room_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Room/)
      end
    end
  end

  describe 'POST /rooms' do
    let(:valid_attributes) { { name: 'David', resident_id: resident1.id } }

    context 'when the request is valid' do
      before { post '/rooms', params: valid_attributes }

      it 'creates a room' do
        expect(json['name']).to eq('David')
        expect(json['resident_id']).to eq(resident1.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/rooms', params: { } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Resident must exist, Name can't be blank/)
      end
    end
  end

  describe 'PUT /rooms/:room_id' do
    let(:valid_attributes) { { name: 'Dave' } }

    before { put "/rooms/#{room_id}", params: valid_attributes }

    context 'when room exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_room = Room.find(room_id)
        expect(updated_room.name).to match(/Dave/)
      end
    end

    context 'when the room does not exist' do
      let(:room_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Room/)
      end
    end
  end

end