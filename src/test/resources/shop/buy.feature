Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the following products exist:
#       |  name  |  price  |
        | Bread  |  20.50  |
        | Jam    |  80.50  |

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00