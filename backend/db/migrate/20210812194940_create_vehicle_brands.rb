class CreateVehicleBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicle_brands do |t|
      t.string :name

      t.timestamps
    end
  end
end
