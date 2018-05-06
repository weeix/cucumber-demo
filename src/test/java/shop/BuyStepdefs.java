package shop;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import cucumber.api.java.en.Then;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class BuyStepdefs {
    private ProductCatalog catalog;
    private Order order;

    @Given("^a product \"([^\"]*)\" with price (.+) exists$")
    public void a_product_with_price_exists(String name, double price) {
        catalog = new ProductCatalog();
        catalog.addProduct(name, price);
    }

    @When("^I buy \"([^\"]*)\" with quantity (\\d+)$")
    public void i_buy_with_quantity(String name, int quant) {
        Product prod = catalog.getProduct(name);
        order = new Order();
        order.addItem(prod, quant);
    }

    @Then("^total should be (.+)$")
    public void total_should_be(double total) {
        assertEquals(total, order.getTotal());
    }
}

