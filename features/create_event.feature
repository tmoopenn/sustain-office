Feature: Create a new event
  As an admin
  so that I can notify people of upcoming events
  I want to be able to add new events.

  Background: the website already has some existing events
    Given these Events:
      | title           | date_time                 | location        | recurring | description                     |
      | Class 1         | October 30, 2017 04:30 PM | Persson 108     | yes       | Recycling Class                 |
      | Non-recurring 1 | November 2, 2017 07:00 PM | Love Auditorium | no        | Guest Speaker on Global Warming |

  Scenario: Create a new event
    Given I am on the create new event page
    When I fill in the following:
      | Title         | Class 2                         |
      | Location      | 40 Broad St                     |
      | Description   | Carbon Footprint Class          |

    When I check "Is this a recurring event?"
    When I select datetime "December 4, 2017 05:00 PM" as the "date_time"
    When I press "Add New Event"
    Then I should be on the events page
    And I should see "New event 'Class 2' created"
    And I should see that "Class 2" has a location of "40 Broad St"
    And I should see that "Class 2" has a description of "Carbon Footprint Class"
    And I should see that "Class 2" has a date_time of "December 4, 2017 05:00 PM"

  Scenario: Create a new event with out a field
  Given I am on the create new event page
  Given I am on the create new event page
    When I fill in the following:
      | Title         | Class 2                    |
      | Location      | 40 Broad St                |
      | Description   | Carbon Footprint Class     |

    When I select datetime "November 10, 2017 05:30 PM" as the "date_time"
    When I check "Is this a recurring event?"
    When I press "Add New Event"
    Then I should be on the events page
    And I should see "New event 'Class 2' created"
    And I should see that "Class 2" has a location of "40 Broad St"
    And I should see that "Class 2" has a date_time of "November 10, 2017 05:30 PM"
    And I should see that "Class 2" has a description of "Carbon Footprint Class"
