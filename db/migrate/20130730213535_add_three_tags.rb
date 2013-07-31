class AddThreeTags < ActiveRecord::Migration
  def up
    add_column :announces, :tag_1, :string
    add_column :announces, :tag_2, :string
    add_column :announces, :tag_3, :string
  end

  def down
    remove_columns :announces, :tag_1, :tag_2, :tag_3
  end
end
