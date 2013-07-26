class Disabled < ActiveRecord::Migration
  def up
    add_column :announces, :disabled, :boolean, :default => false, :null => false
  end

  def down
    remove_column :announces, :disabled
  end

end
