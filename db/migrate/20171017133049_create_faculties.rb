class CreateFaculties < ActiveRecord::Migration[5.1]
  def change
    create_table :faculties, id: false do |t|
      t.string :faculty_id, primary_key: true
      t.string :last_name, :null => false
      t.string :first_name, :null => false
      t.string :home_address, :null => false
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :zip, :null => false
      t.string :home_phone
      t.string :cell_phone
      t.string :office_phone
      t.boolean :new_faculty
      t.string :department, :null => false
      t.string :office, :null => false
      t.bigint :user_id, foreign_key: true

      t.timestamps
    end
  end
end
