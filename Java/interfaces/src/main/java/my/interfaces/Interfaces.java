package my.interfaces;

interface WaterBottleInterface {
    
    String color = "Water Bottle is Blue";
    
    
    void fillUp();
    void pourOut();
    
}

public class Interfaces implements WaterBottleInterface {

    public static void main(String[] args) {
        System.out.println(color);
        
        Interfaces ex = new Interfaces();
        ex.fillUp();
        ex.pourOut();
    }
    
    @Override
    public void fillUp() {
        System.out.println("It is filled");
    }

    @Override
    public void pourOut() {
        System.out.println("It is empty");
    }
}
