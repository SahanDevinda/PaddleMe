package com.bikeride.controller;

import com.bikeride.model.*;
import com.bikeride.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Controller
public class ReservationController {

    @Autowired private ReservationService reservationService;
    @Autowired private BikeService bikeService;

    @GetMapping("/reserve/{bikeId}")
    public String showReserve(@PathVariable String bikeId,
                              Model model, HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null) return "redirect:/login";
        model.addAttribute("bike", bikeService.findById(bikeId));
        return "reserve";
    }

    @PostMapping("/reserve")
    public String doReserve(@RequestParam String bikeId,
                            @RequestParam String startDate,
                            @RequestParam String endDate,
                            HttpSession session, Model model) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null) return "redirect:/login";
        Bike bike = bikeService.findById(bikeId);
        if (bike == null) return "redirect:/bikes";

        LocalDate start = LocalDate.parse(startDate);
        LocalDate end = LocalDate.parse(endDate);
        if (end.isBefore(start)) {
            model.addAttribute("bike", bike);
            model.addAttribute("error", "End date must be the same as or after the start date.");
            return "reserve";
        }
        if (reservationService.hasOverlappingReservation(bikeId, startDate, endDate)) {
            model.addAttribute("bike", bike);
            model.addAttribute("error", "This bike is already reserved for those dates. Please choose another date range.");
            return "reserve";
        }

        long days = ChronoUnit.DAYS.between(start, end) + 1;
        double cost = bike.getPricePerHour() * 24 * days;
        reservationService.create(u.getUserId(), bikeId,
                bike.getBikeName(), startDate, endDate, cost);
        return "redirect:/my-reservations";
    }

    @GetMapping({"/my-reservations", "/my_reservations"})
    public String myReservations(Model model, HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null) return "redirect:/login";
        List<Reservation> reservations = reservationService.getByUser(u.getUserId());
        model.addAttribute("reservations", reservations);
        model.addAttribute("user", u);
        addReservationSummary(model, reservations);
        return "myReservations";
    }

    @PostMapping("/reservations/cancel")
    public String cancel(@RequestParam String reservationId,
                         @RequestParam String bikeId) {
        reservationService.updateStatus(reservationId, "CANCELLED");
        return "redirect:/my-reservations";
    }

    @GetMapping("/admin/reservations")
    public String allReservations(Model model, HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null || !u.getUserType().equals("ADMIN")) return "redirect:/login";
        List<Reservation> reservations = reservationService.getAll();
        model.addAttribute("reservations", reservations);
        addReservationSummary(model, reservations);
        return "myReservations";
    }

    private void addReservationSummary(Model model, List<Reservation> reservations) {
        int activeCount = 0;
        double totalCost = 0;
        for (Reservation reservation : reservations) {
            if ("ACTIVE".equals(reservation.getStatus())) activeCount++;
            if (!"CANCELLED".equals(reservation.getStatus())) {
                totalCost += reservation.getTotalCost();
            }
        }
        model.addAttribute("totalReservations", reservations.size());
        model.addAttribute("activeReservations", activeCount);
        model.addAttribute("reservationTotalCost", totalCost);
    }
}

