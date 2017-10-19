class CreateEmergencyContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :emergency_contacts do |t|
      t.string :last_name
      t.string :first_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :home_phone
      t.string :cell_phone
      t.string :office_phone
      t.string :faculty_auID
      t.string :students_auID

      t.timestamps
    end
  end
end
