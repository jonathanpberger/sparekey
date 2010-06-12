Given /^user "([^"]*)" is registered on the site with first name "([^"]*)" and last name "([^"]*)" and password "([^"]*)"$/ do |arg1, arg2, arg3, arg4|
  user = User.create(:login => arg1, :first_name => arg2, :last_name => arg3, 
                      :password => arg4, :password_confirmation => arg4)
  user.save
end
