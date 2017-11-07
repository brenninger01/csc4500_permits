class AddUserIdToStudents < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :students, :users
  end
end
