class AddDisabledToTags < ActiveRecord::Migration
  def change
    add_column :tags, :disabled, :boolean, :default => false
  end
end
