package my.generics;

public class Printer<T> {

    T thingtoPrint;

    public Printer(T thingtoPrint) {
        this.thingtoPrint = thingtoPrint;
    }

    public void print() {
        System.out.println(thingtoPrint);
    }

    private static <T, V> T shout(T thingToShout, V otherThingToShout) {
        System.out.println(thingToShout + "!!!!!");
        System.out.println(otherThingToShout + "!!!!!");

        return thingToShout;
    }

    public static void main(String[] args) {

        Printer<Integer> printer = new Printer<>(23);
        printer.print();

        Printer<Double> doublePrinter = new Printer<>(33.5);
        doublePrinter.print();

        shout("John", 74);

    }

}
