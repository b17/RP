class AddAuthorToNews < ActiveRecord::Migration
  def up
    add_column :news, :user_id, :integer, :null => false
  end

  def down
    remove_column :news, :user_id
  end
end
