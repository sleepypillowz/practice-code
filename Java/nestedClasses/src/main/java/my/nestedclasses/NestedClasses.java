package my.nestedclasses;

public class NestedClasses {

    private final int listingNumber;
    private final double price;
    private final HouseData hData;

    public NestedClasses(int num, double price, String address, int sqFt) {
        listingNumber = num;
        this.price = price;
        hData = new HouseData(address, sqFt);
    }

    public void display() {
        System.out.println("Listing number is #" + listingNumber + " Selling for Php" + price);
        System.out.println("Address: " + hData.streetAddress);
        System.out.println(hData.squareFeet + " square feet");
    }

    private class HouseData {

        private String streetAddress;
        private int squareFeet;

        public HouseData(String address, int sqFt) {
            streetAddress = address;
            squareFeet = sqFt;

        }

    }

    public static void main(String[] args) {
        NestedClasses nestedClasses = new NestedClasses(1, 50000.0, "123 Main St.", 1000);
        nestedClasses.display();
    }
}
