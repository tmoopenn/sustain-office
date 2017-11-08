Feature: View an event 
    As an admin
    so that I can see the details and check the participation of an event
    I want to be able to view the details and attendance of each event and class.

    Background: the website already has some existing events and users 
       Given these Events:
            | title     | date_time | location| recurring | description |
            | Class 1   | October 30, 4:30 PM | Persson 108 | yes| Recycling Class|
            | Non-recurring 1 | November 2, 7:00 PM | Love Auditorium | no| Guest Speaker on Global Warming |
    
#    Background: the website already has some exisitng users
        Given these users:
            |first | last | classification   |           
            |John  | Cane | Faculty|
            |Thomas| Smith| Student|


    Scenario: View details of a specific event
     Given I am on the events page
     When I follow "Class 1" 
     Then I should see "October 30, 4:30 PM"
     And I should see "Persson 108"
     And I should see "Recycling Class"
     
    Scenario: View Participants of a specific event
     Given I am on the events page
     When I follow "Non-recurring 1"
     Then I should see "November 2, 7:00 PM"
     And I should see "Love Auditorium"
     And I should see "Guest Speaker on Global Warming"
     When I follow "View Participants"
     Then I should see "John"
     And I should see "Cane"
     And I should see "Faculty"
