 Feature: View feed
	In order to know who I might be able to housesit for
	As a guest
	I want to see a feed of my friends' trip plans

Scenario: User sees unfiltered feed
	Given	I am on the home page
	And		I am user "benfranklin123"
	And		I have friend "thomasjefferson345" on Facebook
	And		thomasjefferson345 posted "I am going to Paris on July 14" on 2010-06-09
	Then	I should see "I am going to Paris on July 14"
	And		I should see "thomasjefferson345"
	And		I should see "Posted on June 6, 2010"