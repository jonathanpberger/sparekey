require 'test_helper'

class MainControllerUnitTest < Test::Unit::TestCase
  def testTheTruth
    true
  end
end

=begin
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
=end