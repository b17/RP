class CounterTagTable < ActiveRecord::Migration
  def up
    create_table :accounting_tag do |t|
      t.integer :tag_id
      t.integer :watches
      t.integer :detailed
      t.integer :fav


    end
  end

  def down
    drop_table :announce_accounting
  end
end
