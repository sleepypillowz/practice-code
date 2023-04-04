//contains the following Unchecked Exceptions: ClassNotFoundException, & IllegalAccessException
//add the following Exceptions: InstantiationException, & NoSuchMethodException
//fix error IllegalAccessException
package my.checkedexceptions;

public class CheckedExceptions {

    public static void main(String[] args) {

        //ClassNotFoundException occurs when an application tries to load a class that does not exist.
        /*
        try {
            Class.forName(" my.checkedexceptions");
            ClassLoader.getSystemClassLoader().loadClass(" my.checkedexceptions");
            ClassLoader.getPlatformClassLoader().loadClass("c my.checkedexceptions");
        } 
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
         */
        //IllegalAccessException occurs when an application tries to reflectively create an instance it does not have access to.
        //error catch isn't being executed.
        /*
        try {
            CheckedExceptions test = CheckedExceptions.class.newInstance();
            System.out.println(test);
        } 
        catch (InstantiationException | IllegalAccessException e) {
            System.out.println("Illegal Access Exception, Check if class is private or non existent.");
        }
         */
    }
}
