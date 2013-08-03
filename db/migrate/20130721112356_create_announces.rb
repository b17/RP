class CreateAnnounces < ActiveRecord::Migration
  def change
    create_table :announces do |t|
      t.string :title
      t.string :desc
      t.date :action_date
      t.float :lg
      t.float :lt
      t.string :image
      t.datetime :event_date
      t.integer :user_id


      t.timestamps
    end
  end
end
