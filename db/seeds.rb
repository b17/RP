# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create("login" => "admin", 'password' => 'password', 'e_mail' => 'some@e.mail', 'first' => 'andrew')
tags =Tag.create({name: 'sport', img_url: '/img/tag/sport_small.jpg'})
tags =Tag.create({name: 'party', img_url: '/img/tag/party_small.jpg'})
tags =Tag.create({name: 'health', img_url: '/img/tag/health_small.jpg'})
tags =Tag.create({name: 'education', img_url: '/img/tag/education_small.jpg'})
