class AddStudentsToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :vehicles, :students, column: :student_id, primary_key: :student_id
  end
end
