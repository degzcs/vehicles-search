class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.integer :model_id
      t.string :year
      t.string :mileage
      t.float :price

      t.timestamps
    end
  end
end
