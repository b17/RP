class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :rewrite
      t.string :name

      t.timestamps
    end
  end
end
