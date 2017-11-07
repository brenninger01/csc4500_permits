class CreateEmergencyContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :emergency_contacts, id: false do |t|
      t.bigint :contact_id, primary_key: true, auto_increment: true
      t.string :last_name
      t.string :first_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :home_phone
      t.string :cell_phone
      t.string :office_phone
      t.string :student_id, foreign_key: true
      t.string :faculty_id, foreign_key: true
      t.bigint :user_id, foreign_key:true

      t.timestamps
    end
  end
end
