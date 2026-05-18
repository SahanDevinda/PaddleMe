package com.bikeride.model;

// INHERITANCE: RegularUser EXTENDS User (gets all of User's methods)
public class RegularUser extends User {

    private int totalRides;

    public RegularUser(String userId, String username,
                       String email, String password) {
        // Call parent constructor using super()
        super(userId, username, email, password, "REGULAR");
        this.totalRides = 0;
    }

    // Add this getter for JSP compatibility
    public String getName() {
        return this.getUsername(); // or just return username if you have it
    }

    public int getTotalRides() { return totalRides; }
    public void setTotalRides(int totalRides) { this.totalRides = totalRides; }

    // POLYMORPHISM: implementing the abstract method from User
    @Override
    public String getRole() { return "Regular Member"; }

    // POLYMORPHISM: overriding parent method with different output
    @Override
    public String getDisplayInfo() {
        return "Member: " + getUsername() + " | Rides: " + totalRides;
    }
}
