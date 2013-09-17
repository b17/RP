class ChangeTags < ActiveRecord::Migration
  def up
    remove_column :announces, :tag_1,:tag_2,:tag_3
    remove_column :news, :tag_1,:tag_2,:tag_3
  end

  def down
  end
end
