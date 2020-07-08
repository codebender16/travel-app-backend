class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :country
      t.text :description
      t.string :airline
      t.integer :year

      t.timestamps
    end
  end
end
