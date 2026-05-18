package com.bikeride.model;

public class MountainBike extends Bike {
    private String suspensionType;

    public MountainBike(String bikeId, String bikeName, String brand,
                        double price, String suspensionType) {
        super(bikeId, bikeName, brand, price, "MOUNTAIN");
        this.suspensionType = suspensionType;
    }
    public String getSuspensionType() { return suspensionType; }
    public void setSuspensionType(String t) { this.suspensionType = t; }

    @Override
    public String getBikeDescription() {
        return "Mountain Bike — " + suspensionType + " suspension, off-road ready";
    }
}
