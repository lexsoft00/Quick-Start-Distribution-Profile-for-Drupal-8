Feature: Reset webmaster password after install.

  @init @tools @local @development @staging
  Scenario: Check if webmaster have to reset the password after install.
    Given I am a logged in user with the "webmaster" user
     When I go to "admin/people"
      And I wait
     Then I should see "webmaster"
     When I click "webmaster"
     Then I should see "webmaster"
     When I click "Edit"
      And I fill in "LetMe.in1234" for "Current password"
      And I fill in "LetMe.in1234" for "Password"
      And I fill in "LetMe.in1234" for "Confirm password"
      And I press "Save"
      And I wait
     Then I should see "The changes have been saved."
