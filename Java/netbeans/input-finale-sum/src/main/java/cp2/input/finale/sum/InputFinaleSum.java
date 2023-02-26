package cp2.input.finale.sum;
import java.util.Scanner;  // Import the Scanner class

public class InputFinaleSum {
    
    static int showNumberPlus10() {
      final int a = 10;
      return a;
    }
    
    static int showNumberPlus100() {
      final int b = 100;
      return b;
    }    

    static int showNumberPlus1000() {
      final int c = 1000;
      return c;
    }    
    
    public static void main(String[] args) {
        Scanner myObj = new Scanner(System.in);  // Create a Scanner object
        System.out.print("Enter an integer: ");
        final int num = myObj.nextInt();  // Read user input
        
        int ten = num + showNumberPlus10();
        int hd = num + showNumberPlus100(); //hundred
        int ts = num + showNumberPlus1000(); //thousand
        
        System.out.println(num + " plus " + showNumberPlus10() + " is " + ten);
        System.out.println(num + " plus " + showNumberPlus100() + " is " + hd);
        System.out.println(num + " plus " + showNumberPlus1000() + " is " + ts);
    }
}
