# Controller and UI Module

This extracted project contains the Controller and UI layer of the Bike Ride Platform.

## Main Responsibility

The controller/UI module connects user requests to backend services and displays the result through JSP pages.

## Main Controller Files

- `src/main/java/com/bikeride/controller/UserController.java`
- `src/main/java/com/bikeride/controller/BikeController.java`
- `src/main/java/com/bikeride/controller/ReservationController.java`

## Main UI Files

- `src/main/webapp/WEB-INF/views/home.jsp`
- `src/main/webapp/WEB-INF/views/login.jsp`
- `src/main/webapp/WEB-INF/views/register.jsp`
- `src/main/webapp/WEB-INF/views/updateUser.jsp`
- `src/main/webapp/WEB-INF/views/userList.jsp`
- `src/main/webapp/WEB-INF/views/adminDashboard.jsp`
- `src/main/webapp/WEB-INF/views/bikeList.jsp`
- `src/main/webapp/WEB-INF/views/bikeRegister.jsp`
- `src/main/webapp/WEB-INF/views/reserve.jsp`
- `src/main/webapp/WEB-INF/views/myReservations.jsp`
- `src/main/webapp/WEB-INF/views/contact.jsp`
- `src/main/webapp/WEB-INF/views/navbar.jsp`

## Support Files

Model and service classes are included because controllers need them to compile and run. The main viva responsibility is the MVC controller flow and JSP user interface.

## Viva Points

- Controllers handle HTTP requests using `@GetMapping` and `@PostMapping`.
- Controllers pass data to JSP pages using the `Model` object.
- `HttpSession` is used to track the logged-in user.
- JSP pages display backend data and forms to the user.
- This follows MVC: Model classes store data, Service classes handle logic, Controllers connect backend logic to views, and JSP files display the UI.

## Suggested Branch

```bash
git checkout -b feature/controller-ui
git add .
git commit -m "Add controller and UI module"
git push origin feature/controller-ui
```
