class AddUserIdToFaculty < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :faculties, :users
  end
end
