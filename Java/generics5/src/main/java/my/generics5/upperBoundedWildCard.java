package my.generics5;

import java.util.Arrays;
import java.util.List;

public class upperBoundedWildCard {
    
    public double sumOfList(List<? extends Number> list) {
        double s = 0.0;
        for (Number n : list)
            s += n.doubleValue();
        return s;
    }

    public static void main(String[] args) {
        
        upperBoundedWildCard obj = new upperBoundedWildCard();
        
        List<Integer> li = Arrays.asList(1, 2, 3);
        System.out.println("sum = " + obj.sumOfList(li));
        
        List<Double> ld = Arrays.asList(1.2, 2.3, 3.5);
        System.out.println("sum = " + obj.sumOfList(ld));
    }
}
