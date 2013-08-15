class AddCounting < ActiveRecord::Migration
  def up
    add_column :tags, :active_count, :integer, :default => 0, :null => false
  end

  def down
    remove_column :tags, :active_count
  end
end
