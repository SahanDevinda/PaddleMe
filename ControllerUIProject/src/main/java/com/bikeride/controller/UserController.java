package com.bikeride.controller;

import com.bikeride.model.User;
import com.bikeride.model.Reservation;
import com.bikeride.service.BikeService;
import com.bikeride.service.ReservationService;
import com.bikeride.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private BikeService bikeService;

    @Autowired
    private ReservationService reservationService;

    @GetMapping("/")      // Home page
    public String home()  { return "home"; }

    @GetMapping("/register")
    public String showRegister(Model model) {
        model.addAttribute("formAction", "/register");
        return "register";
    }

    @PostMapping("/register")
    public String doRegister(@RequestParam String username,
                             @RequestParam String email,
                             @RequestParam String password,
                             @RequestParam(defaultValue="REGULAR") String userType,
                             Model model) {
        boolean ok = userService.registerUser(username, email, password, userType);
        if (ok) { model.addAttribute("message", "Registration successful!"); return "login"; }
        model.addAttribute("error", "Username already taken!"); return "register";
    }

    @GetMapping("/admin/users/add")
    public String showAdminAddUser(HttpSession session, Model model) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null || !u.getUserType().equals("ADMIN")) return "redirect:/login";
        model.addAttribute("formAction", "/admin/users/add");
        model.addAttribute("adminAddUser", true);
        return "register";
    }

    @PostMapping("/admin/users/add")
    public String doAdminAddUser(@RequestParam String username,
                                 @RequestParam String email,
                                 @RequestParam String password,
                                 @RequestParam(defaultValue="REGULAR") String userType,
                                 HttpSession session, Model model) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null || !u.getUserType().equals("ADMIN")) return "redirect:/login";

        boolean ok = userService.registerUser(username, email, password, userType);
        model.addAttribute("formAction", "/admin/users/add");
        model.addAttribute("adminAddUser", true);
        if (ok) {
            model.addAttribute("message", "User added successfully!");
        } else {
            model.addAttribute("error", "Username already taken!");
        }
        return "register";
    }

    @GetMapping("/login")
    public String showLogin() { return "login"; }

    @PostMapping("/login")
    public String doLogin(@RequestParam String username,
                          @RequestParam String password,
                          HttpSession session, Model model) {
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("loggedUser", user);
            return user.getUserType().equals("ADMIN")
                    ? "redirect:/admin" : "redirect:/bikes";
        }
        model.addAttribute("error", "Invalid username or password");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); return "redirect:/login";
    }

    @GetMapping("/admin")
    public String adminHome(HttpSession session, Model model) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null || !u.getUserType().equals("ADMIN")) return "redirect:/login";
        int activeReservations = 0;
        double totalRevenue = 0;
        for (Reservation reservation : reservationService.getAll()) {
            if ("ACTIVE".equals(reservation.getStatus())) {
                activeReservations++;
            }
            if (!"CANCELLED".equals(reservation.getStatus())) {
                totalRevenue += reservation.getTotalCost();
            }
        }
        model.addAttribute("totalUsers", userService.getAllUsers().size());
        model.addAttribute("totalBikes", bikeService.getAllBikes().size());
        model.addAttribute("activeReservations", activeReservations);
        model.addAttribute("totalRevenue", totalRevenue);
        return "adminDashboard";
    }

    @GetMapping("/admin/users")
    public String listUsers(Model model, HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null || !u.getUserType().equals("ADMIN")) return "redirect:/login";
        model.addAttribute("users", userService.getAllUsers());
        return "userList";
    }

    @PostMapping("/admin/users/delete")
    public String deleteUser(@RequestParam String userId, HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null || !u.getUserType().equals("ADMIN")) return "redirect:/login";
        userService.deleteUser(userId);
        return "redirect:/admin/users";
    }

    @GetMapping("/profile/update")
    public String showUpdate(HttpSession session, Model model) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null) return "redirect:/login";
        model.addAttribute("user", u); return "updateUser";
    }

    @PostMapping("/profile/update")
    public String doUpdate(@RequestParam String email, @RequestParam String password,
                           HttpSession session, Model model) {
        User u = (User) session.getAttribute("loggedUser");
        userService.updateUser(u.getUserId(), email, password);
        model.addAttribute("message", "Profile updated!");
        model.addAttribute("user", u); return "updateUser";
    }
}
