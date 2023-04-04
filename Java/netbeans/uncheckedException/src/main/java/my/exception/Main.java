//contains the following Unchecked Exceptions: 
// ArithmeticException, ArrayIndexOutOfBoundsException, InputMismatchException, 
// NullPointerException, NumberFormatException, StringIndexOutofBoundsException

package my.exception;

import java.util.*;

public class Main {
    
    public static void foo(String s) {
        System.out.println(s.toLowerCase());
    }

    public static void main(String[] args) {
        
        
        
        Scanner s = new Scanner(System.in);  
        int[] values = {5,10,15,20,25};
        int dividend, divisor, quotient;
               
        try{
        //InputMismatchException if user entered String instead of int
        //ArithmeticException if user divded by 0
        System.out.print("Enter dividend: ");
        dividend = s.nextInt();
        
        System.out.print("Enter divisor: ");
        divisor = s.nextInt();
                     
        quotient = dividend/divisor;
        System.out.println(dividend + " / " + divisor + " = " + quotient);
        
        //ArrayIndexOutOfBoundsException if index is higher than declared.
        //quotient = values[5] / 5;
        
        //NullPointerException if referenced object is null        
        //foo(null);
        
        //NumberFormatException if the format is wrong ex. whitespace
        //Integer.parseInt("123 ");
        
        //StringIndexOutofBoundsException if the index string is higher than declared.
        //String str = "My String";
        //System.out.println(str.charAt(9));  
        }
        
        catch(ArithmeticException ex) {
            
            System.out.println("Divisor cannot be 0.");
            System.out.println("Try again.");            
            
        }
        
        catch(ArrayIndexOutOfBoundsException ex) {
            
            System.out.println("Invalid Index for Array");
            System.out.println("Please fix the code");
        }
        
        catch(InputMismatchException ex) {
            
            System.out.println("Invalid data type");
            System.out.println("Please enter an integer");
            
                    
        }
              
        catch(NullPointerException ex) {
            
            System.out.println("referenced object is null");
            System.out.println("Please fix the code");
            
        }
        
        catch(NumberFormatException ex) {

            System.out.println("number format is invalid");
            System.out.println("Please fix the code");
            
        }
        
        catch(StringIndexOutOfBoundsException ex) {

            System.out.println("Invalid Index for String");
            System.out.println("Please fix the code");
            
        }
        
        finally {
            System.out.println("Thank you for your time.");
        }
    }
}
