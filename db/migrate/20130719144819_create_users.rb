class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :e_mail
      t.string :password
      t.string :login

      t.timestamps
    end
  end
end
