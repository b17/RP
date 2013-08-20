class AnnounceCounterTable < ActiveRecord::Migration
  def up
    create_table :announce_accounting do |t|
      t.integer :announce_id
      t.integer :watches
      t.integer :detailed
      t.integer :fav


    end
  end

  def down
    drop_table :announce_accounting
  end
end
