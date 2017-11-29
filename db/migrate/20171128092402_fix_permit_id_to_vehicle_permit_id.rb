class FixPermitIdToVehiclePermitId < ActiveRecord::Migration[5.1]
  def change
  	rename_column :vehicles, :permit_id, :vehicle_permit_id
  end
end
