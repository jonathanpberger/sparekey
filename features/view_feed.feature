 Feature: View feed
	In order to know who I might be able to housesit for
	As a guest
	I want to see a feed of my friends' trip plans

Scenario: User sees unfiltered feed
	Given I am logged in as user "benfranklin123"
	And user "benfranklin123" has friend "thomasjefferson345" on Facebook
	And thomasjefferson345 posted "I am going to Paris on July 14" on 2010-06-09
	When I go to the home page
	Then I should see "I am going to Paris on July 14"
	And I should see "thomasjefferson345"
	And I should see "Posted on June 09, 2010"