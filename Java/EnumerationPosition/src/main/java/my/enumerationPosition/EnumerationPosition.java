package my.enumerationPosition;

import java.util.Scanner;

public class EnumerationPosition {

    enum Period {
        PRELIM, MIDTERM, PREFINAL, FINAL
    };

    public static void main(String[] args) {
        Period pd;
        String input;
        int position;
        Scanner sc = new Scanner(System.in);
        
        System.out.println("The grading periods are:");        
        for (Period p : Period.values()) {
            System.out.print(p + " ");
        }
        
        System.out.print("\nSelect a grading period: ");
        input = sc.nextLine().toUpperCase();
        pd = Period.valueOf(input);
        
        System.out.println("You entered " + pd);
        position = pd.ordinal();
        System.out.println(pd + " is in position " + position);
        System.out.println("So its period number is " + (position + 1));
    }
}
