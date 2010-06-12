 Feature: Authenticate
	In order to be able to use the sparekey site
	As a user
	I want to be recognized as a user of the site
	
Scenario: User session
	Given user "benfranklin123" is registered on the site with first name "Ben" and last name "Franklin" and password "foobar"
	When  I go to the home page
	And   I fill in "benfranklin123" for "user_session_login"
	And   I fill in "foobar" for "user_session_password"
	And   I press "Login"
	Then  I should see "Ben"
	And user "benfranklin123" should be in the session.
