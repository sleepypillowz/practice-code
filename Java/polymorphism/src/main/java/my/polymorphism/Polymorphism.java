package my.polymorphism;

class Bird {
    public void sing() {
        System.out.println("tweet tweet tweet");
    }
}

class Robin extends Bird {
    public void sing() {
        System.out.println("twiddledeedee");
    }
}

class Pelican extends Bird {
    public void sing() {
        System.out.println("KWAAH KWAHAH KWAHA");
    }
}

public class Polymorphism {

    public static void main(String[] args) {
        
        Robin b = new Robin();
        b.sing();
        
    }
}

//source
//https://www.youtube.com/watch?v=Ft88V_rDO4I&ab_channel=AlexLee