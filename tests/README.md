# quick_start Automated Functional Testing

 A set of Gherkin Features and custom quick_start Context with custom
 step definitions, and assets, which help with the automatic testing for
 quick_start project websites.


 This page can help  you to have the list all steps, which you need to run the
 Behat Gherkin Features to test a quick_start website in your localhost machine.

To test quick_start 8.x-5.x in the right way you will need to build quick_start using
the composer.

## Create a quick_start project with [Composer](https://getcomposer.org/download/):

```
composer create-project drupalcoders/quick_start:8.5.x-dev PROJECT_DIR_NAME --stability dev --no-interaction
```

--------------------------------------------------------------------------------
1. Change the base url value in behat.quick_start.yml file, to the domain or the
   local virtual domain.

  base_url:  'http://localhost/testing/docroot'

--------------------------------------------------------------------------------
2. Open a new terminal window then start selenium2 at the port 4445. You can
   change the worker selenium robot server and the port number by changing the parameter.

```
    "wd_host: 127.0.0.1:4445/wd/hub"
```

  in the behat.quick_start.yml file.
  or you can get the selenium stand alone server from
  http://www.seleniumhq.org/download/
  then you could run this command in the same location in the terminal

```
$ java -jar selenium-*.jar -port 4445
```

You can Install and configure selenium server to run on the selenium worker
server  by using our command.

```
$ sh ./tools/install-selenium-server/install-selenium-server-2.53.1.sh
```

--------------------------------------------------------------------------------
3. Automated testing config.

To run the automated testing with behat you will need to change the [ wd_host and base_url ] settings in the [ behat.quick_start.yml ] file to go with your project configuration and the selenium server.

```
    Behat\MinkExtension:
      files_path: "%paths.base%/tests/assets/"
      goutte: ~
      selenium2:
        wd_host: 127.0.0.1:4445/wd/hub
        capabilities:
          browser: 'firefox'
          # browser: 'chrome'
          # browser: 'phantomjs'
          nativeEvents: true
      base_url: 'http://127.0.0.1:8080'
      browser_name: 'firefox'
      # browser_name: 'chrome'
      # browser_name: 'phantomjs'
      javascript_session: selenium2
```

Then go to [ PROJECT_DIR_NAME/docroot/profiles/quick_start ] in the
terminal then you could run the following command:

```
$ ../../../bin/behat tests/features/quick_start
```
4. Run the behat command at PROJECT_DIR_NAME/docroot/profiles/quick_start/tests

$ ../../../bin/behat tests/features/quick_start/step2-apply-tests/01-website-base-requirements/01-01-user-registration_only-admins-login.feature

================================================================================

```
Feature: Website Base Requirements - User Registration - Only admins login
As an anonymous user
I will not be able to register as a user in the website
So that I will need a site admin or super admin to add me to the website

  Background: 
    Given I am an anonymous user
  
  @local @development @staging @production 
  Scenario: Check that create new account options does not appear for anonymous users.
     When I go to "/user"
      And I wait
     Then I should not see "Create new account"
  
  @local @development @staging @production
  Scenario: Check that only admin can create an account.
     When I go to "/user/register"
      And I wait
     Then I should see "Access denied"
  
  @local @development @staging @production
  Scenario: Verify that anonymous users cannot access admin pages.
     When I go to "/admin"
      And I wait
     Then I should see "Access denied"

3 scenarios (3 passed)
9 steps (9 passed)
0m2.21s (59.89Mb)

```
================================================================================

--------------------------------------------------------------------------------
5. Run this command with the .feature file to run the Gherkin Script in it to the installed site.

$ ../../../bin/behat tests/features/quick_start/your-gherkin-feature.feature
$ ../../../bin/behat tests/features/project-name/your-gherkin-feature.feature

--------------------------------------------------------------------------------
8. Run this command to print all available step definitions

$ ../../../bin/behat -di

    - use -dl to just list definition expressions.
    - use -di to show definitions with extended info.
    - use -d 'needle' to find specific definitions.

 All quick_start custom step definitions are tagged with #quick_start tag.

  Example : after a run for  bin/behat -di command.
================================================================================
``` 
  default | Then /^I should see image with the "([^"]*)" title text$/
          | #quick_start : To Find an image with the title text attribute.
          | Example 1: Then I should see image with the "Flag Earth" title text
          | at `quick_startContext::iShouldSeeImageWithTheTitleText()`

  default | Then /^I should see image with the "([^"]*)" alt text$/
          | #quick_start : To Find an image with the alt text attribute.
          | Example 1: Then I should see image with the "Flag Earth" alt text
          | at `quick_startContext::iShouldSeeImageWithTheAltText()`
```
================================================================================

 Scenarios are tagged with the Behat tags of:

* **@local = Local**
* **@development = Development server.**
* **@staging = Staging and testing server.**
* **@production = Production live server.**

   So that we only run bin/behat --tags with the right tag for the environment.

   Example:
================================================================================
```
    $ ../../../bin/behat --tags '@development' tests/features/quick_start/
```
    Which it will run Scenarios which has got the @development tag.

================================================================================
```
    $ ../../../bin/behat --tags '@staging' ftests/eatures/quick_start/

    Which it will run Scenarios which has got the @staging tag.
```
================================================================================

    $ ../../../bin/behat --tags '@production' tests/features/quick_start/

    Which it will run Scenarios which has got the @production tag.

================================================================================

6. To see the report in HTML. Go and open this file in a browser.
    PROJECT_DIR_NAME/docroot/profiles/quick_start/tests/reports/index.html
    You will see the latest report for latest run.

    if you want to custom a report you can add
    --format pretty --out std
    --format html  --out reports/report-$( date '+%Y-%m-%d_%H-%M-%S' )

    to format and select your output.

    Example:

    $ ../../../bin/behat tests/features/example.feature --format pretty --out std --format html --out reports/report-$( date '+%Y-%m-%d_%H-%M-%S' )

7. If you want to run all Gherkin Features over a new quick_start site.
    You will need to create the list of Testing users, and Add French, and Arabic
    languages to the site.

    # --------------------------------------------------------------------------
    # You can run the following command:
    # --------------------------------------------------------------------------
```
    $ ../../../bin/behat tests/features/quick_start/ --format pretty --out std  --format html  --out reports/report-$( date '+%Y-%m-%d_%H-%M-%S' )
```
    After that you can see the report in the PROJECT_DIR_NAME/docroot/profiles/quick_start/tests/reports folder.

    If you want to run the test in steps, if you are not interested in the
    initialization and cleaning up after the test.

```
    $ ../../../bin/behat tests/features/quick_start/step1-init-tests
    $ ../../../bin/behat tests/features/quick_start/step2-apply-tests
    $ ../../../bin/behat tests/features/quick_start/step3-cleanup-tests
```

8. If you want to test the installation process, you will need to use the
 quick_start Install config file, as you can see in the following command.

   $ ../../../bin/behat --config=behat.quick_start-install.yml tools/install-quick_start/default-installation.feature



# Advanced customized automated testing
To run the automated testing with behat you will need to change the [ wd_host and base_url ] settings in the
[ behat.quick_start.yml ] file to go with your project configuration and the selenium server.

```
    Behat\MinkExtension:
      files_path: "%paths.base%/tests/assets/"
      goutte: ~
      selenium2:
        wd_host: 127.0.0.1:4445/wd/hub
        capabilities:
          browser: 'firefox'
          # browser: 'chrome'
          # browser: 'phantomjs'
          nativeEvents: true
      base_url: 'http://127.0.0.1:8080'
      browser_name: 'firefox'
      # browser_name: 'chrome'
      # browser_name: 'phantomjs'
      javascript_session: selenium2
```
      
Testing scenarios are tagged with the Behat tags of:

* **@local = Local**
* **@development = Development server.**
* **@staging = Staging and testing server.**
* **@production = Production live server.**

So that we only run bin/behat --tags with the right tag for the environment.

Run the quick_start check tests. Only to check, without any changes to the website.
```
cd docroot/profiles/quick_start;
../../../bin/behat tests/features/quick_start --tags '@check' --format pretty --out std  --format html  --out tests/reports/quick_start-check-tests-report-$( date '+%Y-%m-%d_%H-%M-%S' );
```

Run the quick_start full local tests. which developers could test all scenarios in their local machine environment.
```
cd docroot/profiles/quick_start;
../../../bin/behat tests/features/quick_start --tags '@local' --format pretty --out std  --format html  --out tests/reports/quick_start-full-local-tests-report-$( date '+%Y-%m-%d_%H-%M-%S' );
```

Run the quick_start full development tests. which developers could test scenarios on the website at the development environment.
```
cd docroot/profiles/quick_start;
../../../bin/behat tests/features/quick_start --tags '@development' --format pretty --out std  --format html  --out tests/reports/quick_start-full-development-tests-report-$( date '+%Y-%m-%d_%H-%M-%S' );
```

Run the quick_start full staging tests. which developers could test scenarios on the website at the staging environment.
```
cd docroot/profiles/quick_start;
../../../bin/behat tests/features/quick_start --tags '@staging' --format pretty --out std  --format html  --out tests/reports/quick_start-full-staging-tests-report-$( date '+%Y-%m-%d_%H-%M-%S' );
```

Run the quick_start full production only tests. not to change anything with test scenarios on the production environment.
```
cd docroot/profiles/quick_start;
../../../bin/behat tests/features/quick_start --tags '@production' --format pretty --out std  --format html  --out tests/reports/quick_start-full-production-tests-report-$( date '+%Y-%m-%d_%H-%M-%S' );
```

Run the quick_start full tests. init, apply, then cleanup.
```
cd docroot/profiles/quick_start;
../../../bin/behat tests/features/quick_start/step1-init-tests --format pretty --out std  --format html  --out tests/reports/quick_start-init-tests-report-$( date '+%Y-%m-%d_%H-%M-%S' );
../../../bin/behat tests/features/quick_start/step2-apply-tests --format pretty --out std  --format html  --out tests/reports/quick_start-apply-tests-report-$( date '+%Y-%m-%d_%H-%M-%S' );
../../../bin/behat tests/features/quick_start/step3-cleanup-tests --format pretty --out std  --format html  --out tests/reports/quick_start-cleanup-tests-report-$( date '+%Y-%m-%d_%H-%M-%S' );
```

Run the quick_start full tests. Which equivalent to quick_start-init-tests, quick_start-apply-tests, quick_start-cleanup-tests
```
cd docroot/profiles/quick_start;
../../../bin/behat tests/features/quick_start --format pretty --out std  --format html  --out tests/reports/quick_start-full-tests-report-$( date '+%Y-%m-%d_%H-%M-%S' );
```

We could run behat tests with this set
Go to [ PROJECT_DIR_NAME/docroot/profiles/quick_start ] in the terminal then you could run the following command:
```
$ ../../../bin/behat tests/features/quick_start

```

Then you will be able to open the full report for the automated test in a web browser at the following path:
[ PROJECT_DIR_NAME/docroot/profiles/quick_start/tests/reports ]
