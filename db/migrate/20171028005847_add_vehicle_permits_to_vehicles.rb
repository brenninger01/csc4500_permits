class AddVehiclePermitsToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :vehicles, :vehicle_permits, column: :vehicle_permit_id, primary_key: :vehicle_permit_id
  end
end
