package my.encapsulation;

public class Encapsulation {

    public static void main(String[] args) {
        student s = new student();
        s.setName("Sleepy");
        s.setAge(20);
        
        System.out.println(s.getName());
        System.out.println(s.getAge());
    }
}
