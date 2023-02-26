package my.main;

public class Pokemon {
    
    String name;
    int lvl;
    int hp;
    int atk;
    
    Pokemon(){ //default
        lvl = 5;
        hp = 10;
        atk = 5;
    }
     
    Pokemon(String name, int lvl, int hp, int atk){
        this.name = name;
        this.lvl = lvl;
        this.hp = hp+lvl*2;
        this.atk = atk+lvl;
    }
    
    void attack(){
        System.out.print(name + " attack!");
    }
}