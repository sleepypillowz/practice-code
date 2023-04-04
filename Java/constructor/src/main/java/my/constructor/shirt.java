package my.constructor;

public class shirt {
    
    private static String color;
    private static char size;
    
    shirt(String newColor, char newSize) {
        color = newColor;
        size = newSize;
    }
    
    public static void putOn() {
        System.out.println("Shirt is on!");
    }
    
    public static void takeOff(){
        System.out.println("Shirt is off!");
    }

    public String getColor() {
        return color;
    }

    public int getSize() {
        return size;
    }    
    
}
