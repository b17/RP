class AddThreeTags < ActiveRecord::Migration
  def up
    add_column :announces, :tag_1, :integer, :default => -1
    add_column :announces, :tag_2, :integer, :default => -1
    add_column :announces, :tag_3, :integer, :default => -1
  end

  def down
    remove_columns :announces, :tag_1, :tag_2, :tag_3
  end
end
