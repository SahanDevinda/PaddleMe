# Reservation Management Module

This extracted project contains the Reservation Management part of the Bike Ride Platform.
The reservation module allows a logged-in user to reserve a bike, view their reservations, cancel a reservation, and allows an admin to view all reservations.

## Support Files

`Bike`, `CityBike`, `MountainBike`, `BikeService`, and `User` are included only because reservations need bike price/details and logged-in user session data.

## OOP Concepts

- Encapsulation: reservation fields are private and accessed through getters and setters.
- Object composition: each reservation stores user and bike identifiers.
- Business logic: date validation, overlapping reservation checking, cost calculation, and status updates.
- File handling: reservations are saved and loaded from `data/reservations.txt`.
