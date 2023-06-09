package my.generics3;

public class Gen<T, T2>{
    
    private T data1;
    private T2 data2;
    
    public void setValue(T dt1, T2 dt2) {
        
        data1 = dt1;
        data2 = dt2;
        
    }
    
    public T getT1Value() {
        return data1;
    }
    
    public T2 getT2Value() {
        return data2;
    }

    public static void main(String[] args) {
        
        Gen<Integer, String> mixData = new Gen<>();
        Gen<Integer, Integer> iData = new Gen<>();
        mixData.setValue(1, "One");
        iData.setValue(7, 25);     
        int mdType1 = mixData.getT1Value();
        String mdType2 = mixData.getT2Value();
        int idType1 = iData.getT1Value();
        int idType2 = iData.getT2Value();
        System.out.println("First pair: " + mdType1 + " and ");
        System.out.println("First pair: " + mdType1 + " and ");
        
    }
}
