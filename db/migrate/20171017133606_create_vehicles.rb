class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles, id: false do |t|
      t.bigint :vehicle_id, primary_key: true, auto_increment: true
      t.string :year
      t.string :color
      t.string :make
      t.string :model
      t.string :license_number
      t.string :state_licensed
      t.string :experation_year
      t.string :permit_id, foreign_key: true
      t.string :student_id, foreign_key: true
      t.string :faculty_id, foreign_key: true
      t.bigint :user_id, foreign_key: true

      t.timestamps
    end
  end
end
