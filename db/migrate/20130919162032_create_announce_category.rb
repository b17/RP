class CreateAnnounceCategory < ActiveRecord::Migration
  def up
    create_table :announce_categories, :id => false do |t|
      t.integer :announce_id
      t.integer :category_id

    end
  end

  def down
    drop_table :announce_category
  end
end
