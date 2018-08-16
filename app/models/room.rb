class Room < ApplicationRecord
  belongs_to :resident
  validates_presence_of(:name)

  def as_json(*)
    super.except("created_at", "updated_at").tap do |hash|
      hash["resident"] = resident
    end
  end
end
