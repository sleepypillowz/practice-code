
package my.arraylistt;

import java.util.ArrayList;

public class Arraylistt {

    public static void main(String[] args) {

        //Array
        String[] fruits = new String[3];
        fruits[0] = "Mango";
        fruits[1] = "Apple";
        fruits[2] = "Strawberry";
        System.out.println(fruits[1]);

        //ArrayList
        ArrayList fruitList = new ArrayList();
        fruitList.add("Mango");
        fruitList.add("Apple");
        fruitList.add("Strawberry");
        fruitList.add("Watermelon");
        
        fruitList.remove("Strawberry");
        //fruitList.clear();
        System.out.println(fruitList.contains("Raspberry"));
        System.out.println(fruitList);
    }
}
