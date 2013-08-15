# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user 'admin', password '2105'
users = User.create("login" => "admin", 'password' => '24f0d2c90473b2bc949ad962e61d9bcb', 'e_mail' => 'some@e.mail', 'first' => 'andrew')

