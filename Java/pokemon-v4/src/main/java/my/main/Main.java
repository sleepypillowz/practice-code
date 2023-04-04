package my.main;

public class Main { 
   
    public static void main(String[] args) {
        //(Name, LVL, HP, ATK)
        Pokemon p1 = new Pokemon("mudkip",10,10,5);
        Pokemon p2 = new Pokemon("zigzagoon",5,10,5);
        
        //menu -> pokemon
        System.out.print(p1.name + " ");
        System.out.print("lvl " + p1.lvl + " ");
        System.out.print(p1.hp + "HP ");
        System.out.println(p1.atk + "ATK");
        
        
        System.out.print(p2.name + " ");
        System.out.print("lvl " + p2.lvl + " ");
        System.out.print(p2.hp + "HP ");
        System.out.println(p2.atk + "ATK");
        
        //p1.attack();
    }
}
