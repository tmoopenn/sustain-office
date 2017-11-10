Feature: Edit an event
    As an admin
    so that I can keep the details of an event up to date
    I want to be able to update event information.

    Background: the website already has some existing events and users
       Given these Events:
            | title           | date_time           | location        | recurring | description                     |
            | Class 1         | October 30, 4:30 PM | Persson 108     | yes       | Recycling Class                 |
            | Non-recurring 1 | November 2, 7:00 PM | Love Auditorium | no        | Guest Speaker on Global Warming |

      Given these users:
            | name         | classification |
            | John Cane    | Faculty        |
            | Thomas Smith | Student        |

#    Background: Non-recurring 1 already has some participants
#        Given these participants
#            | user_id | event_id |

    Scenario: Update the details of a specific event
     Given I am on the events page
     When I follow "Class 1"
     Then I should see "October 30, 4:30 PM"
     And I should see "Persson 108"
     And I should see "Recycling Class"
     When I follow "Edit event details"
     And I fill in "Description" with "Learning about the third R: Recycling"
     And I fill in "Location" with "Ho 101"
     And I press "Update event details"
     Then I should see "Learning about the third R: Recycling"
     And I should see "Ho 101"