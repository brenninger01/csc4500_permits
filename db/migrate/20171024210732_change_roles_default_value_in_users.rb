class ChangeRolesDefaultValueInUsers < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :roles, :string, :default => "standard"
  end
end
