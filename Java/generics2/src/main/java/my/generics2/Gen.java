package my.generics2;

public class Gen<T> {
    private T data;
    
    public void setValue(T dt) {
        data = dt;
    }
    
    public T getValue() {
        return data;
    }
    
    public void showType() {
        System.out.println("Type of T is " + data.getClass().getName());
    }
    
    public static void main(String[] args) {
        
        Gen<Integer> iData = new Gen<Integer>();
        Gen<String> sData = new Gen<String>();
        iData.setValue(1);
        iData.showType();
        sData.setValue("One");
        sData.showType();
        int num = iData.getValue();
        String str = sData.getValue();
        System.out.println("Integer value: " + num);
        System.out.println("String value: " + str);
                
    }
}
