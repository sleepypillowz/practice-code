package my.constructor;

public class Constructor {

    public static void main(String[] args) {
        shirt sh;
        sh = new shirt("White", 'M');
        
        System.out.println(sh.getColor());
        System.out.println(sh.getSize());
        
    }
}
