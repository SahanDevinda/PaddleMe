package com.bikeride.model;

public abstract class Bike {

    private String bikeId;
    private String bikeName;
    private String brand;
    private double pricePerHour;
    private boolean available; // true = can be booked
    private String bikeType;   // 'CITY' or 'MOUNTAIN'

    public Bike(String bikeId, String bikeName, String brand,
                double pricePerHour, String bikeType) {
        this.bikeId       = bikeId;
        this.bikeName     = bikeName;
        this.brand        = brand;
        this.pricePerHour = pricePerHour;
        this.available    = true;
        this.bikeType     = bikeType;
    }

    // Getters and Setters
    public String getBikeId()   { return bikeId; }
    public void setBikeId(String bikeId)         { this.bikeId = bikeId; }
    public String getBikeName() { return bikeName; }
    public void setBikeName(String bikeName)     { this.bikeName = bikeName; }
    public String getBrand()    { return brand; }
    public void setBrand(String brand)           { this.brand = brand; }
    public double getPricePerHour()              { return pricePerHour; }
    public void setPricePerHour(double p)        { this.pricePerHour = p; }
    public boolean isAvailable()                 { return available; }
    public void setAvailable(boolean available)  { this.available = available; }
    public String getBikeType() { return bikeType; }
    public void setBikeType(String bikeType)     { this.bikeType = bikeType; }

    // ABSTRACTION: subclasses must provide their own description
    public abstract String getBikeDescription();

    // Save to file format
    public String toFileString() {
        return bikeId+"|"+bikeName+"|"+brand+"|"
                +pricePerHour+"|"+available+"|"+bikeType;
    }
}
