class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :img_url

      #foreign key
      t.integer :announce_id

      t.timestamps
    end
  end
end
