Feature: View all events
  As a participant
  so that I can view all events
  I want to be able to view all past and future events on the view all events page

  Background: the website already has some existing events
    Given these Events:
      | title           | id | location        | recurring | points | description                     |
      | Class 1         | 1  | Persson 108     | yes       |    3   | Recycling Class                 |
      | Non-recurring 1 | 2  | Love Auditorium | no        |    1   | Guest Speaker on Global Warming |

    Given these Occurrences:
      | event_id | date_time                 |
      | 1        | October 30, 2017 04:30 PM |
      | 2        | July 2, 2018 07:00 PM     |

  Scenario: View past and future events
    Given I am on the events page
    When I follow "All Events"
    Then I should see "Class 1"
    And I should see "Non-recurring 1"
