Feature: Use an ATM
  As a bank customer
  I want to make a transaction using an ATM

  Background:
    Given the following accounts exist:
      | id  | pin  | balance |
      | 1   | 111  | 100.00  |
      | 2   | 222  | 200.00  |
      | 3   | 333  | 300.00  |

  Scenario Outline: One person uses ATM
    When customer id <id> login with pin <pin>
    Then the balance should be <balance1>
    When deposit <deposit>
    Then the balance should be <balance2>
    When withdraw <withdraw>
    Then the balance should be <balance3>
    Examples:
      | id  | pin  | balance1 | deposit | balance2 | withdraw | balance3 |
      | 1   | 111  | 100.00   | 20.00   | 120.00   | 50.00    | 70.00    |
      | 2   | 222  | 200.00   | 100.00  | 300.00   | 50.00    | 250.00   |

  Scenario: Two person use ATM
    When customer id 3 login with pin 333
    Then the balance should be 300.00
    When transfer 100.00 to customer 1
    Then the balance should be 200.00
    When customer leaves the ATM
    And customer id 1 login with pin 111
    Then the balance should be 200.00