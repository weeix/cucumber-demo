package shop;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import cucumber.api.java.en.Then;

import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class BuyStepdefs {
    private ProductCatalog catalog;
    private Order order;

    @Before
    public void setup() {
        catalog = new ProductCatalog();
        order = new Order();
    }

    @Given("^a product \"([^\"]*)\" with price (.+) exists$")
    public void a_product_with_price_exists(String name, double price) {
        catalog.addProduct(name, price);
    }

    @Given("^the following products exist:$")
    public void the_following_products_exist(DataTable table) {
        Map<String,Double> data = table.asMap(String.class, Double.class);

        for (String name : data.keySet()) {
            double price = data.get(name);
            catalog.addProduct(name, price);
        }
    }

    @When("^I buy \"([^\"]*)\" with quantity (\\d+)$")
    public void i_buy_with_quantity(String name, int quant) {
        Product prod = catalog.getProduct(name);
        order.addItem(prod, quant);
    }

    @Then("^total should be (.+)$")
    public void total_should_be(double total) {
        assertEquals(total, order.getTotal());
    }
}

