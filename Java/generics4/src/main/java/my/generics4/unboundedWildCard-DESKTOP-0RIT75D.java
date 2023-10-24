package my.generics4;

import java.util.Arrays;
import java.util.List;

public class unboundedWildCard {

    public void printList(List<?> list) {
        for (Object elem : list) {
            System.out.println(elem + " ");
        }
        System.out.println();
    }
    
    public void runExample() {
        List<Integer> li = Arrays.asList(1, 2, 3);
        List<String> ls = Arrays.asList("one", "two", "three");
        printList(li);
        printList(ls);
    }
    
    public static void main(String[] args) {
        unboundedWildCard example = new unboundedWildCard();
        example.runExample();
    }
}
