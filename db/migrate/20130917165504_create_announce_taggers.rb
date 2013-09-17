class CreateAnnounceTaggers < ActiveRecord::Migration
  def change
    create_table :announce_taggers, :id=> false do |t|
      t.integer :tag_id
      t.integer :announce_id
    end
  end
end
