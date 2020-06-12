class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :region
      t.integer :offset
      t.string :value
      t.timestamps
    end
  end
end
