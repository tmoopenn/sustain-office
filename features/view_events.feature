Feature: View all events
  As a user
  so that I can view upcoming events
  I want to be able to view only upcoming events on the homepage

  Background: the website already has some existing events
    Given these Events:
      | title           | id | location        | recurring | points | description                     |
      | Class 1         | 1  | Persson 108     | yes       |    3   | Recycling Class                 |
      | Non-recurring 1 | 2  | Love Auditorium | no        |    1   | Guest Speaker on Global Warming |

    Given these Occurrences:
      | event_id | date_time                 |
      | 1        | October 30, 2017 04:30 PM |
      | 2        | July 2, 2018 07:00 PM     |

  Scenario: View only upcoming events
    Given I am on the events page
    Then I should see "Non-recurring 1"
    And I should see "Love Auditorium"
    And I should not see "Class 1"
