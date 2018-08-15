class Resident < ApplicationRecord
  has_one :room, dependent: :nullify

  validates_presence_of :first_name, :last_name, :dob, :favourite_food
end
