Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the following products exist:
        | name   |  price  | quantity |
        | Bread  |  20.50  |    20    |
        | Jam    |  80.50  |    20    |

Scenario Outline: Buy one product
    When I buy "<product>" with quantity <quantity>
    Then total should be <total>
    And "<product>" should have <stock> left
    Examples:
        | product  | quantity |  total  | stock |
        | Bread    |   1      |   20.50 |  19   |
        | Jam      |   2      |  161.00 |  18   |

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.50
    And "Bread" should have 18 left
    And "Jam" should have 19 left