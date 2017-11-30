class CreateVehiclePermits < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_permits, id: false do |t|
      t.string :vehicle_permit_id, primary_key: true
      t.datetime :date_issued, :null => false
      t.string :issued_by, :null => false
      t.date :date_entered, :null => false
      t.string :entered_by, :null => false
      t.bigint :user_id, foreign_key: true

      t.timestamps
    end
  end
end
