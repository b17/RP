class AddDisabledToCategory < ActiveRecord::Migration
  def up
    add_column :categories, :disabled, :boolean,:default => true
  end

  def down
    remove_column :categories, :disabled
  end
end
