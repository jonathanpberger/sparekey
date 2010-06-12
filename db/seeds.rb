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


us1 = User.create(:username => "Wood", :first_name => "Chuck", :last_name => "Zinper" ,:location => ls1)
us2 = User.create(:username => "Hood", :first_name => "Suck", :last_name => "Winper" ,:location => ls2)
us3 = User.create(:username => "Fam", :first_name => "Sackoo", :last_name => "Zinnan" ,:location => ls3)


social1 = SocialNetworkingSite.create(:site_name => "Linkedin", :site_url => "www.tripit.com")
social2 = SocialNetworkingSite.create(:site_name => "Linkedin", :site_url => "www.linkedin.com")
social3 = SocialNetworkingSite.create(:site_name => "Facebook", :site_url => "www.facebook.com")
social4 = SocialNetworkingSite.create(:site_name => "Foursquare", :site_url => "www.foursquare.com")

# anything w "_id" is wrong and should be 

f1 = Friend.create(:social_network_handle => "James", :first_name => "Wan3", :last_name => "chuck1"  , :location => ls1, :social_networking_site => social1 , :social_network_uri => "www.tripit.com/james", :user => us1 )
f2 = Friend.create(:social_network_handle => "Crane", :first_name => "Wange", :last_name => "chuck2" , :location => ls2, :social_networking_site => social2 , :social_network_uri => "www.tripit.com/crane", :user => us1 )
f3 = Friend.create(:social_network_handle => "Minke", :first_name => "Rane", :last_name => "chuck3"  , :location => ls3, :social_networking_site => social3 , :social_network_uri => "www.tripit.com/minke", :user => us2 )

Artifacts.create(:when_posted => "28-10-2009", :location => ls1 , :start_date => "10-11-2009" , :end_date => "16-11-2009" , :is_an_offer => "Y" , :content =>"Hello friend1" , :origin_uri => "twitter" ,:friend => f1)
Artifacts.create(:when_posted => "28-10-2009", :location => ls1 , :start_date => "11-11-2009" , :end_date => "19-11-2009" , :is_an_offer => "Y" , :content =>"Hello friend2" , :origin_uri => "twitter" ,:friend => f2)
Artifacts.create(:when_posted => "28-10-2009", :location => ls1 , :start_date => "12-11-2009" , :end_date => "17-11-2009" , :is_an_offer => "Y" , :content =>"Hello friend3" , :origin_uri => "twitter" ,:friend => f3)
