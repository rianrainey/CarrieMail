# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts 'SETTING UP EXAMPLE USERS'
user1 = User.create! :first_name => 'First User', :last_name => 'Johnson', 
                     :email => 'mark@isandlot.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user1.first_name
user1.save

user2 = User.create! :first_name => 'Second User', :last_name => 'Smith', 
                     :email => 'mark.harris1011@gmail.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user2.first_name
user2.save