package com.bikeride.model;

public class CityBike extends Bike {
    private int gears;

    public CityBike(String bikeId, String bikeName,
                    String brand, double price, int gears) {
        super(bikeId, bikeName, brand, price, "CITY");
        this.gears = gears;
    }
    public int getGears() { return gears; }
    public void setGears(int gears) { this.gears = gears; }

    @Override
    public String getBikeDescription() {
        return "City Bike with " + gears + " gears — perfect for city roads";
    }
}
