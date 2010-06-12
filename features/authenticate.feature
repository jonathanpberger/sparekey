 Feature: Authenticate
	In order to be able to use the sparekey site
	As a user
	I want to be recognized as a user of the site
	
Scenario: User session
	Given user "benfranklin123" is registered on the site with first name "Ben" and last name "Franklin"
# [Add this part when we get authentication in]
#	And I have logged in as user "benfranklin123"
	When  I go to the home page
	Then  I should see "Ben"
	And user "benfranklin123" should be in the session.
