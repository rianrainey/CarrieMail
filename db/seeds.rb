# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.delete_all
Catalog.delete_all
Note.delete_all
Recipient.delete_all

puts 'SETTING UP EXAMPLE USERS'
catalog = Catalog.create! 
User.create! :first_name => 'Guest', :last_name => 'User', 
             :email => 'guest@carriemail.com', :password => 'guest2', :password_confirmation => 'guest2', 
             :catalog => catalog
