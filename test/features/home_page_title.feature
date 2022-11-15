@smoke
Feature: Home Page Title

  @epam
  # npm test -- --tags "@epam"
  Scenario: Page title epam
    Given I open "https://www.epam.com/" url
    Then Page title should be "EPAM | Enterprise Software Development, Design & Consulting"
    And Page title should not be "EPAM | Enterprise Software Development, Design & Consultings"
    When I wait "3" seconds

  @mobile
  @bash
  Scenario: Page title bash
    Given I open "http://bashorg.org/" url
    Then Page title should be "Bashorg.org - Лучший Цитатник Рунета - Башорг.орг"
    When I wait "3" seconds

  @mobile
  @medium
  Scenario: Page title medium
    Given I open "https://medium.com/" url
    Then Page title should be "Medium – Where good ideas find you."
    When I wait "3" seconds

  # npm test -- --tags "@epam or @medium" for epam and medium
  # npm test -- --tags "@smoke and not @epam" for all excluding epam
  # npm test -- --tags "(@smoke and @mobile)" and not @mobile  for only bash

  @so
  Scenario Outline: Page titles <URL>
    Given I open "<URL>" url
    Then Page title should be "<Title>"
    When I wait "3" seconds

    Examples:
      | URL                 | Title                                             |
      | http://bashorg.org/ | Bashorg.org - Лучший Цитатник Рунета - Башорг.орг |
      | https://medium.com/ | Medium – Where good ideas find you.               |
