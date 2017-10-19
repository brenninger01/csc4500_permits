class CreateFaculties < ActiveRecord::Migration[5.1]
  def change
    create_table :faculties do |t|
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

      t.timestamps
    end
  end
end
