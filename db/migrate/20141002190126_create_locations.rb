class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :lat
      t.string :lng
      t.string :status
      t.string :username
      t.string :name
      t.string :country
      t.string :city
      t.string :iso2
      t.integer :population

      t.timestamps
    end
  end
end
