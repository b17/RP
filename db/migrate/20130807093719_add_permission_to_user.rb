class AddPermissionToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :default => :subscriber
  end
end
