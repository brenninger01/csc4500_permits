class ChangePermitsToVehiclePermits < ActiveRecord::Migration[5.1]
  def change
  	rename_table :permits, :vehicle_permits
  end
end
