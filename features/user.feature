Feature:
    As a User
    So that I can join different events
    I want to be able to manage my profile

    Scenario: Sign in with Google
        Given I have a profile
        Given I am on the home page
        When I follow "Sign in with Google"
        Then I should see "Successfully authenticated from Google account"

    Scenario: Create a profile with Google
        Given I do not have a profile
        Given I am on the home page
        When I follow "Sign in with Google"
