 Feature: Load friends' travel
	In order to know who I might be able to housesit for
	As a guest
	I want to see a feed of my friends' trip plans loaded from my social networking sites

Scenario: Application filters Facebook newsfeed for travel-related posts
	Given I have a Facebook newsfeed
	And the Facebook newsfeed contains a non-travel related post
	And the Facebook newsfeed contains a travel-related post
	When I filter the feed
	Then the non-travel related post is not in the result
	And the travel-related post is in the result


#Scenario: Application verifies existence of friend for a post

#Scenario: Application loads a friend from Facebook data

#Scenario: Application verifies existence of a location for the friend if the Facebook data contains a location

#Scenario: If the friend has a location that is not already in the database, the application creates the location in the database

#Scenario: Application creates an artifact from a post

#Scenario: Application loads Facebook user
#	Given I have a Facebook friend with handle "thomasjefferson345" and hometown "Leesburg, VA"
#	When I load the Facebook object
#	Then I should have a location in the database "Leesburg, VA"
#	And I should have a friend in the database "thomasjefferson345" and location "Leesburg, VA"

	
#Scenario: Application parses Facebook newsfeed into artifacts and friends
	