class RewriteFields < ActiveRecord::Migration
  def up
    add_column :announces, :rewrite, :string

    add_column :news, :rewrite, :string

    add_column :tags, :rewrite, :string
    add_index :tags, :rewrite, :unique => true
  end

  def down
    remove_column :announces, :rewrite
    remove_column :news, :rewrite
    remove_column :tags, :rewrite
  end
end
