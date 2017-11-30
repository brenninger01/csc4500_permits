class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles, id: false do |t|
      t.bigint :vehicle_id, primary_key: true, auto_increment: true
      t.string :year, :null => false
      t.string :color, :null => false
      t.string :make, :null => false
      t.string :model, :null => false
      t.string :license_number, :null => false
      t.string :state_licensed, :null => false
      t.string :experation_year, :null => false
      t.string :vehicle_permit_id, foreign_key: true
      t.string :student_id, foreign_key: true
      t.string :faculty_id, foreign_key: true
      t.bigint :user_id, foreign_key: true

      t.timestamps
    end
  end
end
