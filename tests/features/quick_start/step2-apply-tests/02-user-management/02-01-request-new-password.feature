Feature: User Management - Standard User Management - Request new password
As a user with a ready user account
I will want to be able to Request new password
So that I can reset my password for the account

  Background:
    Given I am not logged in

  @local @development @staging @production
  Scenario: Check that an anonymous user can reset his/her password.
     When I go to "/user/login"
      And I wait
     Then I should see "Forgot Password?"

  @javascript @local @development @staging @production
  Scenario: Verify that the system cannot send an email to non-existing users/emails.
     When I go to "/user/password"
      And I wait
     Then I should see "Username or email address"
     When I fill in "not.existing.email@drupalcoders.com" for "Username or email address"
      And I press the "Submit" button
      And I wait
     Then I should see "not.existing.email@drupalcoders.com is not recognized as a username or an email address."
     When I fill in "webmaster@drupalcoders.org" for "Username or email address"
      And I wait 7s
      And I press the "Submit" button
      And I wait
     Then I should see "Further instructions have been sent to your email address."
