class CreateResidents < ActiveRecord::Migration[5.1]
  def change
    create_table :residents do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :favourite_food

      t.timestamps
    end
  end
end
