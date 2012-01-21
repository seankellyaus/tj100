Feature:
  In order to Manage my selections of songs
  As a user
  I want to manage the song selection process

  Background:
    Given I have song names Song 1, Song 2, Song 3

  Scenario: Listing songs
#    Given I am logged in
    Given I am on the home page
    And I follow "List Songs"
    Then I should see Song 1, Song 2, Song 3

