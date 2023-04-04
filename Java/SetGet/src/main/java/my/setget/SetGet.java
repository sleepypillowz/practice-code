package my.setget;

public class SetGet {
    
    String name;
    int age;

    public static void main(String[] args) {
        
        SetGet a = new SetGet();
        
        a.setName("Pablo");
        a.setAge(34);
                
        a.printDetails();
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getAge() {
        return age;
    }
      
    public void printDetails() {
        System.out.println(getName() + ", " + getAge());
    }
}
