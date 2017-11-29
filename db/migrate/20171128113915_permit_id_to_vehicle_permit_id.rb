class PermitIdToVehiclePermitId < ActiveRecord::Migration[5.1]
  def change
  	rename_column :vehicle_permits, :permit_id, :vehicle_permit_id
  end
end
