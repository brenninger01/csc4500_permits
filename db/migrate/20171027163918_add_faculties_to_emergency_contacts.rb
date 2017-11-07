class AddFacultiesToEmergencyContacts < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :emergency_contacts, :faculties, column: :faculty_id, primary_key: :faculty_id
  end
end
