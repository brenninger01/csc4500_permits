class CreatePermitTrigger < ActiveRecord::Migration[5.1]
  def change
    execute <<-SQL
		CREATE TRIGGER `vehicle_permits_BEFORE_INSERT` 
		BEFORE INSERT ON `vehicle_permits` FOR EACH ROW
		BEGIN
			SET NEW.vehicle_permit_id = UPPER(NEW.vehicle_permit_id);
		END
	SQL
  end
end
