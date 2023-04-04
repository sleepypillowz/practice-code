package my.classes;

public class Classes {

    public static void main(String[] args) {
        Cat kuya = new Cat();
        Cat mittens = new Cat();
        System.out.println(kuya.tail);
        System.out.println(mittens.tail);
        kuya.printHi();
        mittens.printHi();
        
        Dog missy = new Dog();
        System.out.println(missy.eyes);
    }
}
