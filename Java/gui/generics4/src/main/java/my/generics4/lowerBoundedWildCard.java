package my.generics4;

import java.util.ArrayList;
import java.util.List;

public class lowerBoundedWildCard {

    public void addNumbers(List<? super Integer> list) {
        for (int i = 1; i <= 10; i++) {
            list.add(i);
        }
    }

    public static void main(String[] args) {
        lowerBoundedWildCard obj = new lowerBoundedWildCard();
        List<Object> myList = new ArrayList<>();
        obj.addNumbers(myList);
        System.out.println(myList);
    }
}
