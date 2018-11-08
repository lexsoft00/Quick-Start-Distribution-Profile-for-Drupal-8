Feature: Content Management - Add hero slider to entityqueue using entityqueue form widget.
As a logged in user with a permission to mange entityqueues
I want to be able to add and remove entities to any allowed entityqueue.

@local @development @staging @production
  Scenario: Upload the "Flag Earth" file.
    Given I am a logged in user with the "test_site_admin" user
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
  #-----------------------------------------------------------------------------

  @javascript @local @development @staging @production
  Scenario: Check that we can open the hero slider media browser.
    Given I am a logged in user with the "test_super_admin" user
     When I go to "node/add/quick_v_heroslider_media"
      And I wait max of 2s for the page to be ready and loaded
     Then I should see "Create Hero slider"
     When I press "Select Media"
      And I wait for AJAX to finish
     Then the image media browser should be open

  @javascript @local @development @staging @production
  Scenario: Add a "Test hero slider number 1" to the heroslider entity queue.
    Given I am a logged in user with the "test_super_admin" user
     When I go to "node/add/quick_v_heroslider_media"
      And I wait max of 2s for the page to be ready and loaded
     Then I should see "Create Hero slider"
     When I fill in "Test hero slider #1" for "Slide title"
      And I fill in "Test hero slider slide text #1" for "Slide text"
      And I press "Select Media"
      And I wait for AJAX to finish
     Then the image media browser should be open
     When I switch to iframe "entity_browser_iframe_heroslider_media_browser"
      And I fill in "Flag Earth" for "edit-name"
      And I press the "Search" button
      And wait max of 5s
