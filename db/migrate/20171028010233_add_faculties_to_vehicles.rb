class AddFacultiesToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :vehicles, :faculties, column: :faculty_id, primary_key: :faculty_id
  end
end
