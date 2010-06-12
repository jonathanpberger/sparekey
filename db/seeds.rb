# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


ls1 = Location.create(:location_name => "New York")
ls2 = Location.create(:location_name => "Vancover")
ls3 = Location.create(:location_name => "Windosr")


User.create(:username => "Wood1", :first_name => "chuck7", :last_name => "Winper2" ,:location => ls1)
User.create(:username => "Wood2", :first_name => "chuck6", :last_name => "Winper3" ,:location => ls1)
User.create(:username => "Wood3", :first_name => "chuck5", :last_name => "Winper4" ,:location => ls1)
User.create(:username => "Wood4", :first_name => "chuck4", :last_name => "Winper6" ,:location => ls1)
User.create(:username => "Wood5", :first_name => "chuck3", :last_name => "Winper7" ,:location => ls2)
User.create(:username => "Wood6", :first_name => "chuck2", :last_name => "Winper8" ,:location => ls2)
User.create(:username => "Wood7", :first_name => "chuck1", :last_name => "Winper9" ,:location => ls3)


social1= SocialNetworkingSite.create(:site_name => "Linkedin", :site_url => "www.tripit.com")
social2= SocialNetworkingSite.create(:site_name => "Linkedin", :site_url => "www.linkedin.com")
social3= SocialNetworkingSite.create(:site_name => "Facebook", :site_url => "www.facebook.com")
social4= SocialNetworkingSite.create(:site_name => "Foursquare", :site_url => "www.foursquare.com")

Friend.create(:social_network_handle => "James", :first_name => "Wan3", :last_name => "chuck1"  , :location => ls1, :social => social1 , :social_network_uri => "www.tripit.com/james" )
Friend.create(:social_network_handle => "Crane", :first_name => "Wange", :last_name => "chuck2" , :location => ls2, :social => social2 , :social_network_uri => "www.tripit.com/crane")
Friend.create(:social_network_handle => "Minke", :first_name => "Rane", :last_name => "chuck3"  , :location => ls3, :social => social3 , :social_network_uri => "www.tripit.com/minke")