package my.exceptions;

import java.util.ArrayList;

public class Exceptions {

    public static void main(String[] args) {

        //Null Pointer Exception
        ArrayList<String> list = null;
        list.get(0);
    }
}
