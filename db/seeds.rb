# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "gordev",
             email: "zaynyatyi@gmail.com",
             password:              "ordkrb",
             password_confirmation: "ordkrb",
             admin: true,
             activated: true,
             activated_at: Time.zone.now.to_datetime)
             
City.new(name: "TestoZavodsk", created_at: Time.zone.now.to_datetime, updated_at: Time.zone.now.to_datetime)
