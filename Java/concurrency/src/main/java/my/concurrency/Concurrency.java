package my.concurrency;

public class Concurrency extends Thread {

    public static void main(String[] args) {

        Concurrency thread = new Concurrency();
        thread.start();
        System.out.println("Outside of a thread");

    }

    public void run() {
        System.out.println("Running in a thread");
    }
}
