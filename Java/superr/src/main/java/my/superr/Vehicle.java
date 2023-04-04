package my.superr;

public class Vehicle {
    
    int noDoors = 4;
    
    Vehicle() {
        System.out.println("Vehicle constructor");
    } 
}

class Car extends Vehicle{    
    
    Car() {
        System.out.println(super.noDoors + " Doors Generated");
        System.out.println("Car made");
    }  
}

