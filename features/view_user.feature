Feature: View a user
  As an admin
  so that I can see basic info and what events a participant has attended
  I want to be able to view a user's profile page

  Background: the website already has some existing events and users
    Given these Events:
       | id | title           | date_time                | location        | recurring | points | description                     |
       | 1  | Class 1         | October 30, 2017 4:30 PM | Persson 108     | yes       | 3      | Recycling Class                 |
       | 2  | Non-recurring 1 | November 2, 2017 7:00 PM | Love Auditorium | no        | 1      | Guest Speaker on Global Warming |

   Given these users:
       | name         | classification |
       | John Cane    | Faculty        |
       | Thomas Smith | Student        |

  Given these participants:
       | eventDate                 | user_id | event_id |
       | November 2, 2017 07:00 PM |   1     | 2        |
       | November 6, 2017 05:00 PM |   1     | 1        |

  Scenario: View details of an event's participant
    Given I am signed in with provider Google
    Given I am on the events page
    When I follow "Class 1"
    When I follow "View Participants"
    When I follow "John Cane"
    Then I should see "Email Address:"
    And I should see "Events Participated In:"
    And I should see "Class 1"
    And I should see "Non-recurring 1"