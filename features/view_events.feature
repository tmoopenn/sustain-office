Feature: View all events
  As an participant
  so that I can view upcoming events
  I want to be able to view only upcoming events on the homepage

  Background: the website already has some existing events
    Given these Events:
      | title           | date_time                 | location        | recurring | points | description                     |
      | Class 1         | October 30, 2017 04:30 PM | Persson 108     | yes       |    3   | Recycling Class                 |
      | Non-recurring 1 | July 2, 2018 07:00 PM     | Love Auditorium | no        |    1   | Guest Speaker on Global Warming |

  Scenario: View only upcoming events
    Given I am on the events page
    Then I should see "Non-recurring 1"
    And I should see "Love Auditorium"
    And I should not see "Class 1"
