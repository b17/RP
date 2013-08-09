class SpecialDocuments < ActiveRecord::Migration
  def up
    create_table :docs do |t|
      t.string :key
      t.text :document

      t.timestamps
    end
  end

  def down
    drop_table :docs
  end
end
