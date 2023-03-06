package my.hashmap;

import java.util.HashMap;

public class Hashmap {

    public static void main(String[] args) {
        
        HashMap<String, String> fun = new HashMap<String, String>();
        fun.put("bobbyJoe1996","fluffyP0nies!");
        fun.put("HelloKittyFan21", "AloeVera?");
        fun.put("coolguyswag", "password123");
        
        System.out.println(fun.keySet());
    }
}
