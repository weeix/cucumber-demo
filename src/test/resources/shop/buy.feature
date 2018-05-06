Feature: Buy products
    As a customer
    I want to buy products

Scenario: Buy one product
    Given a product "Bread" with price 20.50 exists
    When I buy "Bread" with quantity 2
    Then total should be 41.00