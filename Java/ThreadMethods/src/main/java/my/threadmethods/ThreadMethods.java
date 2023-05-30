package my.threadmethods;

public class ThreadMethods extends Thread {

    public static void main(String[] args) {
        
        ThreadMethods t1 = new ThreadMethods();
        ThreadMethods t2 = new ThreadMethods();
        
        t1.start();
        //starts 2nd thread after 2 sec or if it's dead
        try {
            t1.join(2000);
        }
        catch(InterruptedException e) {
            e.printStackTrace();
        }
        t2.start();
        //waits for the threads to terminate
        try {
            t1.join();
            t2.join();
        }
        catch(InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("Thread-0 is alive: " + t1.isAlive());
        System.out.println("Thread-1 is alive: " + t2.isAlive());
     }
    
    public void run() {
        System.out.println(Thread.currentThread().getName() + " is running.");
        try {
            //suspends thread for 3 seconds
            Thread.sleep(3000);
        }
        catch(InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(Thread.currentThread().getName() + " has ended.");
    }
}
