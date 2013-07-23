class CreateAnnounces < ActiveRecord::Migration
  def change
    create_table :announces do |t|
      t.string :title
      t.string :desc
      t.date :action_date
      t.float :lg
      t.float :lt
      t.string :main_img_url
      t.datetime :event_date

      t.timestamps
    end
  end
end
