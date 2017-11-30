class AddUserIdToVehiclePermits < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :vehicle_permits, :users
  end
end
