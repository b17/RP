class AddValidToField < ActiveRecord::Migration
  def change
    add_column :news, :valid_to, :date, :null => false
  end
end
