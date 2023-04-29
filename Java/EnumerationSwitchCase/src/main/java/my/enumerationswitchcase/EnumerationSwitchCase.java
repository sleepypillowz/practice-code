package my.enumerationswitchcase;

public class EnumerationSwitchCase {

    enum Size {REGULAR, LARGE, PARTY};
    
    public static void main(String[] args) {
        Size s = Size.LARGE;
        System.out.print("Price of ");
        switch(s) {
            case REGULAR:
            System.out.println("Regular pizza is 381.00");
            break;
            case LARGE:
            System.out.println("Large pizza is 602.00");
            break;
            case PARTY:
            System.out.println("Party pizza is 799.00");
            break;
        }
    }
}
