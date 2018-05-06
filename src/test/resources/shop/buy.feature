Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the following products exist:
#       |  name  |  price  |
        | Bread  |  20.50  |
        | Jam    |  80.50  |

Scenario Outline: Buy one product
    When I buy "<product>" with quantity <quantity>
    Then total should be <total>
    Examples:
        | product  | quantity |  total  |
        | Bread    |   1      |   20.50 |
        | Jam      |   2      |  161.00 |

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.50