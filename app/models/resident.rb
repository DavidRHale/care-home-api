class Resident < ApplicationRecord
  validates_presence_of :first_name, :last_name, :dob, :favourite_food
end
