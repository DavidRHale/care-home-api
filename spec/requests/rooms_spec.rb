require 'rails_helper'

RSpec.describe 'Rooms API' do

  let!(:resident1) { create(:resident) }
  let!(:resident2) { create(:resident) }
  let!(:resident3) { create(:resident) }

  let!(:room1) { create(:room, resident_id: resident1.id) }
  let!(:room2) { create(:room, resident_id: resident2.id) }
  let!(:room3) { create(:room, resident_id: resident3.id) }

  describe 'GET /rooms' do
    before { get '/rooms' }

    it 'returns all rooms' do
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end