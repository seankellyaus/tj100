# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#Song.delete_all
User.delete_all
Selection.delete_all

songs = Song.create([{  :name => "Song 1", :artist => "Artist 1"},
                     {  :name => "Song 2", :artist => "Artist 2"},
                     {  :name => "Song 3", :artist => "Artist 3"}])

users = User.create([{  :email => "aa@test.com", :password => "secret"},
                     {  :email => "bb@test.com", :password => "secret"},
                     {  :email => "cc@test.com", :password => "secret"}])

@user1 = User.first
#

@song1 = Song.first
@song2 = Song.find_by_name("Song 2")

Selection.create(:user => @user1,  :song => @song1, :number1 => false )
Selection.create(:user => @user1,  :song => @song2, :number1 => true )
