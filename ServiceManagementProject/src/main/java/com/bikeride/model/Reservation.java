package com.bikeride.model;

public class Reservation {
    private String reservationId;
    private String userId;
    private String bikeId;
    private String bikeName;
    private String startDate;
    private String endDate;
    private double totalCost;
    private String status; // 'ACTIVE', 'COMPLETED', 'CANCELLED'

    public Reservation(String reservationId, String userId, String bikeId,
                       String bikeName, String startDate, String endDate, double cost) {
        this.reservationId = reservationId;
        this.userId   = userId;
        this.bikeId   = bikeId;
        this.bikeName = bikeName;
        this.startDate = startDate;
        this.endDate   = endDate;
        this.totalCost = cost;
        this.status    = "ACTIVE";
    }

    public String getReservationId() { return reservationId; }
    public void setReservationId(String id) { this.reservationId = id; }
    public String getUserId()  { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public String getBikeId()  { return bikeId; }
    public void setBikeId(String bikeId) { this.bikeId = bikeId; }
    public String getBikeName() { return bikeName; }
    public void setBikeName(String bikeName) { this.bikeName = bikeName; }
    public String getStartDate() { return startDate; }
    public void setStartDate(String d) { this.startDate = d; }
    public String getEndDate()   { return endDate; }
    public void setEndDate(String d) { this.endDate = d; }
    public double getTotalCost() { return totalCost; }
    public void setTotalCost(double c) { this.totalCost = c; }
    public String getStatus()    { return status; }
    public void setStatus(String status) { this.status = status; }

    public String toFileString() {
        return reservationId+"|"+userId+"|"+bikeId+"|"+bikeName
                +"|"+startDate+"|"+endDate+"|"+totalCost+"|"+status;
    }
}
