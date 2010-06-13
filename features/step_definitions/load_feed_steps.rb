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
  friend = Friend.find_by_social_network_handle
end

When /^I verify the friend for the post$/ do
  @result = verify_friend(@post)
end

Then /^I get back a true result$/ do
  @result = true
end

Then /^I get back a false result$/ do
  @result = false
end
