package my.threadpriorities;

public class ThreadPriorities extends Thread {

    public static void main(String[] args) {

        ThreadPriorities t1 = new ThreadPriorities();
        ThreadPriorities t2 = new ThreadPriorities();
        ThreadPriorities t3 = new ThreadPriorities();

        t1.setName("One");
        t2.setName("Two");
        t3.setName("Three");

        t1.setPriority(4);
        t2.setPriority(Thread.MAX_PRIORITY);
        t3.setPriority(8);

        //Thread Priorities
        t1.start();
        t2.start();
        t3.start();
    }

    public void run() {
        System.out.println(Thread.currentThread().getName() + " is running.");
    }

}
