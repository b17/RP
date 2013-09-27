class AddIndexToAnnounceCategoryAndTag < ActiveRecord::Migration
  def change
    add_index :announce_categories, :category_id
    add_index :announce_categories, :announce_id

    add_index :announce_taggers, :tag_id
    add_index :announce_taggers, :announce_id
  end
end
