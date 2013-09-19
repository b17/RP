class AddTablePlace < ActiveRecord::Migration
  def up
    create_table :place do |t|
    t.string  :name
    t.string  :image
    t.text    :description
    t.float   :longitude
    t.float   :latitude

    t.timestamps

    end
  end



end
