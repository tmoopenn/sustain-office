Feature: Logging/Registering Participation in an Event
    As a user of the website
    so that I can points for attending events in the passport program
    I want to be able to click on an event select that I will attend this event     to gain points

     Background: the website already has some existing events and users
            Given these Events:
                | id | title| date_time | location| recurring | points | description|
                | 1  | Class 1| October 30, 2017 4:30 PM | Persson 108| yes | 3| Recycling Class|
                | 2  | Non-recurring 1 | November 2, 2017 7:00 PM | Love Auditorium | no| 1 | Guest Speaker on Global Warming |

            Given these users:
                | name          | classification |
                | John Cane     | Faculty|
                | Thomas Smith  | Student|
            
            Given these participants:
                |eventDate                 |user_id | event_id  |
                |November 2, 2017 07:00 PM | 1      | 2         |

        Scenario: Logging participation in an event
            Given I am signed in with provider Google
            Given I am on the events page
            When I follow "Non-recurring 1"
            When I follow "ATTEND THIS EVENT!"
            Then I should see "You are now registered for the event Non-recurring 1"
            And I should see "Non-recurring 1"
            And I should see "November 2, 2017 07:00 PM"
            And I should see "Love Auditorium"
            And I should see "Guest Speaker on Global Warming"

        Scenario: Already registered/participating in an event
            Given I am signed in with provider Google 
            Given I am on the events page
            When I follow "Non-recurring 1"
            When I follow "ATTEND THIS EVENT!"
            When I follow "ATTEND THIS EVENT!"
            Then I should see "You are already registered for this event"

      #  Scenario: Failing to register for an event
      #      Given I am signed in with provider Google
      #      Given I am on the events page
      #      When I follow "Class 1"
      #      When I follow "ATTEND THIS EVENT!" and registration fails
      #      Then I should see "Failed to register for Class 1"
