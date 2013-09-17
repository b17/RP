class AddOwnerForPlace < ActiveRecord::Migration
  def up
    add_column :place,:user_id,:integer, :null => false
  end

  def down
    remove_column :place,:user_id
  end
end
