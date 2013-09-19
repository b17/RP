class CreateNewsTaggers < ActiveRecord::Migration
  def up
    create_table :news_tagger, :id=>false do |t|
      t.integer :tag_id
      t.integer :news_id
    end
  end

  def down
    drop_table :news_tagger
  end
end
