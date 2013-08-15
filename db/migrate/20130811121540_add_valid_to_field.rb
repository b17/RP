class AddValidToField < ActiveRecord::Migration
  def change
    add_column :news, :valid_to, :date, :null => true
  end
end
