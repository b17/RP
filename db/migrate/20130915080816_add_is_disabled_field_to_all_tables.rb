class AddIsDisabledFieldToAllTables < ActiveRecord::Migration
  def up
    add_column :docs,:disabled, :boolean, :default => false
    add_column :users,:disabled, :boolean, :default => false
  end

 def down
   remove_column :docs,:disabled,
   remove_column :users,:disabled
 end


end
