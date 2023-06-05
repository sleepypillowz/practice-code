package my.multithreading;

public class MultiThreading implements Runnable {

    private final int threadNumber;
    public MultiThreading (int threadNumber) {
        this.threadNumber  = threadNumber;
    }
    @Override
    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println(i  + " from " + threadNumber);
            
            /*
            if (threadNumber == 3) {
                throw new RuntimeException();
            }
            */

            try {
                Thread.sleep(1000);
            } catch (InterruptedException ex) {
            }
        }
    }

    public static void main(String[] args) {

        for (int i = 0; i <= 3; i++) {
            MultiThreading myThing = new MultiThreading(i);
            
            //Used when implementing runnable
            Thread myThread = new Thread(myThing); //remove if using extend Thread
            myThread.start(); //myThing.start(); //if using extend Thread
            
            /*
            try {
                myThread.join();
            } catch (InterruptedException ex) {
            }
            */
            
            //myThread.isAlive();
        }
    }
}
