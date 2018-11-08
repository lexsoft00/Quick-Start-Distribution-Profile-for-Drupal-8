Feature: File & Media Management - Assets Management - Image media and their usage list page for site admins
As a user with permission to manage files in the site
I want to be able to see the list of files
So that I will be able to manage files, see where they have been used in contents.

  Background:
    Given I am a logged in user with the "test_site_admin" user

  @local @development @staging @production
  Scenario: Check if we do have a file named "Flag Earth" , if not then upload the file dependently.
      When I go to "/media/add/image"
       And I wait
      Then I should see "Allowed types: png gif jpg jpeg."
      When I attach the file "flag-earth.jpg" to "Image"
       And I wait
       And I press the "Save" button
       And I wait
       And I fill in "Flag Earth" for "name[0][value]"
       And I press the "Save" button
       And I wait
       And I go to "/admin/content/files"
      Then I should see "flag-earth.jpg"
