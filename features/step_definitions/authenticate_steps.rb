Given /^user "([^"]*)" is registered on the site with first name "([^"]*)" and last name "([^"]*)"$/ do |arg1, arg2, arg3|
  User.create(:username => "Wood1", :first_name => "chuck7", :last_name => "Winper2")
end

Then /^user "([^"]*)" should be in the session\.$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end