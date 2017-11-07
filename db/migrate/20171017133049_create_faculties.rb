class CreateFaculties < ActiveRecord::Migration[5.1]
  def change
    create_table :faculties, id: false do |t|
      t.string :faculty_id, primary_key: true
      t.string :last_name
      t.string :first_name
      t.string :home_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :home_phone
      t.string :cell_phone
      t.string :office_phone
      t.boolean :new_faculty
      t.string :department
      t.string :office
      t.bigint :user_id, foreign_key: true

      t.timestamps
    end
  end
end
