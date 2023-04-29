package my.enumeration;

public class Enumeration {
    
    public enum Period {
        PRELIM, MIDTERM, PREFINAL, FINAL;

    }

    public static void main(String[] args) {
        Period p;
        p = Period.MIDTERM;
        
        System.out.println("The name of the enum is " + p.toString());
        System.out.println("The position of the enum is " + p.ordinal());
        System.out.println("Is the Enum equal to Period.PRELIM? " + p.equals(Period.PRELIM));
        System.out.println("negative if position value is less than enum, 0 if they are the same, positive if the position value is greater than the enum");
        System.out.println("Compares the position Value to Period.FINAL " + p.compareTo(Period.FINAL));
        System.out.println("Compares the position Value to Period.PRELIM " + p.compareTo(Period.PRELIM));
        System.out.println("Compares the position Value to Period.MIDTERM " + p.compareTo(Period.MIDTERM));
      
    }
}
