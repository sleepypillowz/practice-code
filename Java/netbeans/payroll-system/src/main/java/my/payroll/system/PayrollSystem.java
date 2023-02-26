package my.payroll.system;

import java.util.Scanner; //Import the Scanner class

import java.text.DecimalFormat; //Importing for the Two Decimal Places
 
public class PayrollSystem {
    
    private static final DecimalFormat df = new DecimalFormat("0.00");
    
    public static void main(String[] args) {
        
        //General Variables
        String hline = "___________________________"; //horizontal line       
        Scanner myObj = new Scanner(System.in); //Create a new Scanner object
        
        System.out.print("Enter employee name: ");
        String empName = myObj.nextLine(); //Read user input
        
        System.out.print("Press F for Full Time or P for Part Time: ");
        String choice = myObj.nextLine();
        
        if (choice == null) {
            System.out.print("--- Invalid Key Entered ---");
        }
        else switch (choice) {
            
            case "F":
            case "f":
                
                //input
                System.out.println("--- Full Time Employee ---");
                System.out.print("Enter Basic Pay: ");
                float fbpay = myObj.nextFloat(); //fulltime basic pay
                
                //output
                System.out.println(hline);
                System.out.println("Employee Name: " + empName);
                System.out.println("Basic Pay: " + fbpay);
                System.out.println(hline);
                System.out.println("Gross Pay: " + fbpay);
                break;
                
            case "P":
            case "p":
                
                //input
                System.out.println("--- Part Time Employee ---");
                
                System.out.print("Enter rate per hour: ");
                float rph = myObj.nextFloat(); //Rate per Hour
                
                System.out.print("Enter no. of hours worked: ");
                float hrs = myObj.nextFloat(); //no. of Hours Worked
                
                System.out.print("Enter no. of overtime: ");    
                float ovt = myObj.nextFloat(); //no. of overtime
                
                float pbpay = rph*hrs; //part time basic pay
                float ovtPay = rph*ovt; //Overtime Pay
                float gpay =  pbpay+ovtPay; //Gross Pay
                
                //output
                System.out.println(hline);
                System.out.println("Employee Name: " + empName);
                System.out.println("Basic Pay: " + pbpay);
                System.out.println("Overtime Pay: " + df.format(ovtPay));
                System.out.println(hline);
                System.out.println("Gross Pay: " + df.format(gpay));
                break;
                               
            default:
                System.out.print("--- Invalid Key Entered ---");
                break;
        }
    }
}