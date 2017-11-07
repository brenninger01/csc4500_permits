class AddUserIdToEmergencyContacts < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :emergency_contacts, :users
  end
end
