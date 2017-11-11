class CreateEmergencyContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :emergency_contacts, id: false do |t|
      t.bigint :contact_id, primary_key: true, auto_increment: true
      t.string :last_name, :null => false
      t.string :first_name, :null => false
      t.string :address, :null => false
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :zip, :null => false
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
