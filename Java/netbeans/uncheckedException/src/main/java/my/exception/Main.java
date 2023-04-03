package my.exception;

import java.util.*;

public class Main {

    public static void main(String[] args) {
        
        Scanner s = new Scanner(System.in);  
        int[] values = {5,10,15,20,25};
        int dividend, divisor, quotient;
               
        try{
            
        System.out.print("Enter dividend: ");
        dividend = s.nextInt();
        
        System.out.print("Enter divisor: ");
        divisor = s.nextInt();
                     
        quotient = dividend/divisor;
        System.out.println(dividend + " / " + divisor + " = " + quotient);
        
        quotient = values[5] / 0;
            
        }
        
        catch(ArithmeticException ex) {
            
            System.out.println("Divisor cannot be 0.");
            System.out.println("Try again.");            
            
        }
        
        catch(InputMismatchException ex) {
            
            System.out.println("Invalid data type");
            System.out.println("Please enter an integer");
            
        }
        
        catch(ArrayIndexOutOfBoundsException ex) {
            
            System.out.println("Invalid Index");
            System.out.println("Please try again");
        }
        
        finally {
            System.out.println("Thank you for your time.");
        }
    }
}
