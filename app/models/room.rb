class Room < ApplicationRecord
  belongs_to :resident
  validates_presence_of(:name)
end
