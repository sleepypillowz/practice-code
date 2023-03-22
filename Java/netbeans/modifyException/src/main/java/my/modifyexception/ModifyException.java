package my.modifyexception;

import java.util.*;

public class ModifyException {

    private final Scanner s = new Scanner(System.in);
    private int acctNum;
    private double bal;
    private static final double HIGH_CREDIT_LIMIT = 3000.00;

    public void input() {
        try {
            System.out.print("Enter account number: ");
            acctNum = s.nextInt();
            System.out.print("Enter balance due: ");
            bal = s.nextDouble();
            
            if (bal > HIGH_CREDIT_LIMIT) {
            throw new Exception("Customer Balance is higher than the credit limit.");
            }
            else{
                 System.out.println("account number: " + acctNum);
                 System.out.println("credit left: " + (HIGH_CREDIT_LIMIT - bal));
                }
            } 
        catch (Exception e) 
        {
            System.out.println(e.getMessage());
            
        }
    }

    public static void main(String[] args) {

        ModifyException c = new ModifyException();
        c.input();

    }
}
