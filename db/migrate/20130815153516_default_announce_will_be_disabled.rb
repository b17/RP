class DefaultAnnounceWillBeDisabled < ActiveRecord::Migration
  def up
    change_column :announces, :disabled, :boolean, default: true
  end

  def down
    change_column :announces, :disabled, :boolean, default: false
  end
end
