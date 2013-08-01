class AddDisableAndDateToNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title, :null => false
      t.string :short_info, :null => false
      t.boolean :disabled, :default => true
      t.text :content, :null => false
      t.string :image, :null => false
      t.integer :user_id, :null => false

      t.float :lt
      t.float :lg

      t.string :tag_1
      t.string :tag_2
      t.string :tag_3

      t.timestamps

    end
  end
end
