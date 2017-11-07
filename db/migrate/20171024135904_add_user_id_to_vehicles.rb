class AddUserIdToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :vehicles, :users
  end
end
