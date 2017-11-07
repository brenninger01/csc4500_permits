class AddStudentsToEmergencyContacts < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :emergency_contacts, :students, column: :student_id, primary_key: :student_id
  end
end