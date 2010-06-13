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

Scenario: Application loads a friend from Facebook data
	Given I have a Facebook post with user handle "thomasjefferson345"
	And the database does not contain a friend with user handle "thomasjefferson345"
	When I verify the friend for the post
	Then the database contains a friend with user handle "thomasjefferson345"

Scenario: If the friend has a location that is not already in the database, the application creates the location in the database
	Given I have a Facebook post with user handle "thomasjefferson345" 
	And I have a Facebook user with user handle "thomasjefferson345" and location "Leesburg, VA"
	And the database does not contain a friend with user handle "thomasjefferson345"
	And the database does not contain a location with name "Leesburg, VA"
	When I verify the friend for the post
	Then the database contains a location with name "Leesburg, VA"

Scenario: Application creates an artifact from a post
	Given I have a Facebook post with user handle "thomasjefferson345" 
	And I have a Facebook user with user handle "thomasjefferson345" and location "Leesburg, VA"
	And the database does not contain a friend with user handle "thomasjefferson345"
	And the database does not contain a location with name "Leesburg, VA"
	When I verify the friend for the post
	And I create an artifact for the post by "thomasjefferson345"
	Then the database contains an artifact corresponding to the post
	