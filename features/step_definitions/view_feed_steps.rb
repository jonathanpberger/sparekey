require "authlogic/test_case"
Before do
  activate_authlogic
end

def login
  visit path_to("the home page")
  fill_in "user_session_login", :with => "benfranklin123" 
  fill_in "user_session_password", :with =>"foobar" 
  click_button "Login"
end

Given /^I am logged in as user "([^"]*)"$/ do |arg1|
  @user = User.create(:login => arg1, :first_name => "Ben", :last_name => "Franklin", 
                      :password => "foobar", :password_confirmation => "foobar")
  @user.save!
  login
end

Given /^user "([^"]*)" has friend "([^"]*)" on Facebook$/ do |arg1, arg2|
  user = User.find_by_login(arg1)
  friend = Friend.create(:social_network_handle => arg2, :first_name => "Thomas", :last_name => "Jefferson", 
          :user => user )
  friend.save
end

Given /^([^\s]*) posted "([^"]*)" on ([^\s]*) to "([^"]*)"$/ do |arg1, arg2, arg3, arg4|
  friend = Friend.find_by_social_network_handle(arg1)
  location = Location.create(:location_name => arg4)
  location.save!
  posting = Artifact.create(:when_posted => arg3, :content =>arg2 ,:friend => friend, :location => location)
  posting.save
end
