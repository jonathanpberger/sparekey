Given /^I have a Facebook newsfeed$/ do
  @newsfeed = []
end

Given /^the Facebook newsfeed contains a non\-travel related post$/ do
  @non_travel_related = {"from"=>{"name"=>"Lee Jones", "id"=>"671290026"}, "id"=>"671290026_131088470242747", "created_time"=>"2010-06-13T12:20:56+0000", "type"=>"status", "updated_time"=>"2010-06-13T12:20:56+0000", "message"=>"Day 2: Exhausted.", "likes"=>3}
  @newsfeed.push (@non_travel_related)
end

Given /^the Facebook newsfeed contains a travel\-related post$/ do
  @travel_related = {"from"=>{"name"=>"Sam Smith", "id"=>"671290024"}, "id"=>"671290026_131043270242747", "created_time"=>"2010-06-12T13:20:56+0000", "type"=>"status", "updated_time"=>"2010-06-12T13:20:56+0000", "message"=>"Going to Paris", "likes"=>5}
  @newsfeed.push (@travel_related)
end

When /^I filter the feed$/ do
  @result = MainHelper::filter_facebook_feed(@newsfeed)
end

Then /^the non\-travel related post is not in the result$/ do
  !@result.include? @non_travel_related
end

Then /^the travel\-related post is in the result$/ do
  @result.include? @travel_related
end

Given /^I have a Facebook post with user handle "([^"]*)"$/ do |arg1|
   @post = {"from"=>{"name"=> arg1, "id"=>"671290026"}, "id"=>"671290026_131088470242747", "created_time"=>"2010-06-13T12:20:56+0000", "type"=>"status", "updated_time"=>"2010-06-13T12:20:56+0000", "message"=>"Day 2: Exhausted.", "likes"=>3}
end

Given /^the database contains a friend with user handle "([^"]*)"$/ do |arg1|
  friend = Friend.create(:social_network_handle => arg1, :first_name => "Thomas", :last_name => "Jefferson")
  friend.save
end

Given /^the database does not contain a friend with user handle "([^"]*)"$/ do |arg1|
  friend = Friend.find_by_social_network_handle(arg1)
  friend.nil?
end

Given /^I have a Facebook user with user handle "([^"]*)" and location "([^"]*)"$/ do |arg1, arg2|
  @user_obj = {"name"=>arg1, "location"=>{"name"=>arg2, "id"=>109650795719651}, "gender"=>"male", "id"=>"220439", "last_name"=>"Taylor", "updated_time"=>"2010-06-02T23:56:56+0000", "hometown"=>{"name"=>"Oakland, California", "id"=>108363292521622}, "link"=>"http://www.facebook.com/btaylor", "education"=>[{"school"=>{"name"=>"Acalanes High", "id"=>112075895485567}, "year"=>{"name"=>"1998", "id"=>116065551754246}}, {"school"=>{"name"=>"Stanford University", "id"=>6192688417}, "concentration"=>[{"name"=>"Computer Science", "id"=>111986405495645}], "year"=>{"name"=>"2002", "id"=>115277555160546}}, {"school"=>{"name"=>"Stanford University", "id"=>6192688417}, "degree"=>{"name"=>"MS", "id"=>113118705373612}, "concentration"=>[{"name"=>"Computer Science", "id"=>111986405495645}], "year"=>{"name"=>"2003", "id"=>116452021707539}}], "work"=>[{"start_date"=>"2009-08", "position"=>{"name"=>"CTO", "id"=>128221557197084}, "employer"=>{"name"=>"Facebook", "id"=>20531316728}, "end_date"=>"0000-00"}, {"start_date"=>"2007-10", "position"=>{"name"=>"Founder & CEO", "id"=>115097051838153}, "employer"=>{"name"=>"FriendFeed", "id"=>107618122602757}, "end_date"=>"2009-08"}, {"start_date"=>"2007-06", "position"=>{"name"=>"Entrepreneur in Residence", "id"=>108219395878755}, "employer"=>{"name"=>"Benchmark Capital", "id"=>111122355573466}, "end_date"=>"2007-09"}, {"start_date"=>"2003-03", "position"=>{"name"=>"Group Product Manager", "id"=>110433382317858}, "employer"=>{"name"=>"Google", "id"=>104958162837}, "end_date"=>"2007-06"}], "first_name"=>"Bret"}
end

Given /^the database does not contain a location with name "([^"]*)"$/ do |arg1|
  location = Location.find_by_location_name(arg1)
  location.nil?
end

When /^I verify the friend for the post$/ do
  def MainHelper::get_friend_from_facebook id
    return {"name"=>"arg1", "location"=>{"name"=>"Leesburg, VA", "id"=>109650795719651}, "gender"=>"male", "id"=>"220439", "last_name"=>"Taylor", "updated_time"=>"2010-06-02T23:56:56+0000", "hometown"=>{"name"=>"Oakland, California", "id"=>108363292521622}, "link"=>"http://www.facebook.com/btaylor", "education"=>[{"school"=>{"name"=>"Acalanes High", "id"=>112075895485567}, "year"=>{"name"=>"1998", "id"=>116065551754246}}, {"school"=>{"name"=>"Stanford University", "id"=>6192688417}, "concentration"=>[{"name"=>"Computer Science", "id"=>111986405495645}], "year"=>{"name"=>"2002", "id"=>115277555160546}}, {"school"=>{"name"=>"Stanford University", "id"=>6192688417}, "degree"=>{"name"=>"MS", "id"=>113118705373612}, "concentration"=>[{"name"=>"Computer Science", "id"=>111986405495645}], "year"=>{"name"=>"2003", "id"=>116452021707539}}], "work"=>[{"start_date"=>"2009-08", "position"=>{"name"=>"CTO", "id"=>128221557197084}, "employer"=>{"name"=>"Facebook", "id"=>20531316728}, "end_date"=>"0000-00"}, {"start_date"=>"2007-10", "position"=>{"name"=>"Founder & CEO", "id"=>115097051838153}, "employer"=>{"name"=>"FriendFeed", "id"=>107618122602757}, "end_date"=>"2009-08"}, {"start_date"=>"2007-06", "position"=>{"name"=>"Entrepreneur in Residence", "id"=>108219395878755}, "employer"=>{"name"=>"Benchmark Capital", "id"=>111122355573466}, "end_date"=>"2007-09"}, {"start_date"=>"2003-03", "position"=>{"name"=>"Group Product Manager", "id"=>110433382317858}, "employer"=>{"name"=>"Google", "id"=>104958162837}, "end_date"=>"2007-06"}], "first_name"=>"Bret"}
  end
  @result = MainHelper::verify_friend(@post)
end

Then /^I get back a true result$/ do
  @result = true
end

Then /^I get back a false result$/ do
  @result = false
end

Then /^the database contains a location with name "([^"]*)"$/ do |arg1|
  location = Location.find_by_location_name(arg1)
  ! location.nil?
end

When /^I create an artifact for the post$/ do

end

Then /^the database contains an artifact corresponding to the post$/ do
  pending # express the regexp above with the code you wish you had
end
