class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students, id: false do |t|
      t.string :student_id, primary_key: true
      t.string :last_name, :null => false
      t.string :first_name, :null => false
      t.string :home_address, :null => false
      t.string :home_city, :null => false
      t.string :home_state, :null => false
      t.string :home_zip, :null => false
      t.string :school_year_address, :null => false
      t.string :school_year_city, :null => false
      t.string :school_year_zip, :null => false
      t.string :room_number
      t.string :home_phone
      t.string :cell_phone
      t.boolean :new_student
      t.boolean :returning_student
      t.string :athletic_team
      t.bigint :user_id, foreign_key: true

      t.timestamps
    end
  end
end
