class AddRepeatingToAnnounce < ActiveRecord::Migration
  def up
    add_column :announces,:is_repeated, :boolean, :default => false
  end

  def dow
    remove_column :announces, :is_repeated
  end
end
