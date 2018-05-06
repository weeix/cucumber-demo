package atm;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 A bank contains customers with bank accounts.
 */
public class Bank
{
    /**
     Constructs a bank with no customers.
     */
    public Bank()
    {
        customers = new HashMap<>();
    }

    /**
     Adds a customer to the bank.
     @param c the customer to add
     */
    public void addCustomer(Customer c)
    {
        customers.put(c.getCustomerNumber(), c);
    }

    /**
     Finds a customer in the bank.
     @param aNumber a customer number
     @return the matching customer, or null if no customer
     matches
     */
    public Customer findCustomer(int aNumber)
    {
        return customers.get(aNumber);
    }

    private Map<Integer,Customer> customers;
}


