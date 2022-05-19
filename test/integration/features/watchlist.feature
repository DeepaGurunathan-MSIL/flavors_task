Feature: Watchlist
  Check watchlist

  Scenario: Navigate to watchlist screen and test

    When I tap the "To Home" button
    Then I tap the "To Watchlist" button
    And Then I tap the "Group2" button
    And I scroll the list
    Then I expect the text "name 45"
    And  I tap the "Group3" button
    And I scroll the list
    Then I expect the text "name 65"
    And  I tap the "Group4" button
    And I scroll the list
    Then I expect the text "name 85"
    And  I tap the "Group5" button
    And I scroll the list
    Then I expect the text "name 100"
    And  I tap the "Group1" button
    And I scroll the list
    Then I expect the text "name 15"
    And  I tap the "Filter" button
    And  I tap the "AtoZ" button
    Then I expect the text "name 19"
    And  I tap the "Done" button
