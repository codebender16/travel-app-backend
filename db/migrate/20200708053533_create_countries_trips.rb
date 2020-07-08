class CreateCountriesTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :countries_trips do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
