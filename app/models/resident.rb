class Resident < ApplicationRecord
  has_one :room, dependent: :nullify

  validates_presence_of :first_name, :last_name, :dob, :favourite_food

  def as_json(*)
    super.except("created_at", "updated_at").tap do |hash|
      hash["room"] = room ? room.name : 'None'
    end
  end
end
