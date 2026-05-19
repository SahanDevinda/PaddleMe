# Service Management Module

This extracted project contains the service layer of the Bike Ride Platform.

## Main Responsibility

The service layer handles the main business logic and file operations for users, bikes, and reservations.

## Main Files

- `src/main/java/com/bikeride/service/UserService.java`
- `src/main/java/com/bikeride/service/BikeService.java`
- `src/main/java/com/bikeride/service/ReservationService.java`

## Included Model Files

The model classes are included because the service classes create, update, search, and save model objects.

- `User.java`
- `RegularUser.java`
- `AdminUser.java`
- `Bike.java`
- `CityBike.java`
- `MountainBike.java`
- `Reservation.java`

## What Each Service Does

- `UserService`: handles registration, login, user update, user deletion, and reading/writing `users.txt`.
- `BikeService`: handles adding, listing, finding, updating, deleting bikes, availability, and reading/writing `bikes.txt`.
- `ReservationService`: handles creating reservations, listing reservations, checking overlapping dates, status updates, deletion, and reading/writing `reservations.txt`.

## Viva Points

- The service layer separates business logic from controllers.
- File handling is done using `BufferedReader`, `BufferedWriter`, and text files.
- CRUD operations are implemented for users, bikes, and reservations.
- Services use model objects instead of passing raw text data around the project.

## Suggested Branch

```bash
git checkout -b feature/service-management
git add .
git commit -m "Add service management module"
git push origin feature/service-management
```
