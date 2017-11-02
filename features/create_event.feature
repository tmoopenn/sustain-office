Feature: Create a new event
  As an admin
  so that I can notify people of upcoming events
  I want to be able to add new events.

  Background: the website already has some existing events
    Given these Events:
      | title           | date_time           | location        | recurring | description                     |
      | Class 1         | October 30, 4:30 PM | Persson 108     | yes       | Recycling Class                 |
      | Non-recurring 1 | November 2, 7:00 PM | Love Auditorium | no        | Guest Speaker on Global Warming |

  Scenario: Create a new event
    Given I am on the create new event page
    When I fill in the following:
      | Title         | Class 2                |
      | Date and Time | October 31, 5:00 PM    |
      | Location      | 40 Broad St            |
      | Recurring     | yes                    |
      | Description   | Carbon Footprint Class |

    When I check "Is it recurring?"
    When I press "Create event"
    Then I should be on the event page
    And I should see "New event 'Class 2' created"
    And I should see that "Class 2" has a location of "40 Broad St"
    And I should see that "Class 2" has a description of "Carbon Footprint Class"
