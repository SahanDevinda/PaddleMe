package com.bikeride.controller;

import com.bikeride.model.*;
import com.bikeride.service.BikeService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class BikeController {

    @Autowired private BikeService bikeService;

    @GetMapping("/bikes")
    public String listBikes(Model model, HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null) return "redirect:/login";
        model.addAttribute("bikes", bikeService.getAllBikes());
        model.addAttribute("user", u);
        return "bikeList";
    }

    @GetMapping("/admin/bikes")
    public String listAdminBikes(Model model, HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null || !u.getUserType().equals("ADMIN")) return "redirect:/login";
        model.addAttribute("bikes", bikeService.getAllBikes());
        model.addAttribute("user", u);
        return "bikeList";
    }

    @GetMapping("/admin/bikes/add")
    public String showAddBike(HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null || !u.getUserType().equals("ADMIN")) return "redirect:/login";
        return "bikeRegister";
    }

    @PostMapping("/admin/bikes/add")
    public String doAddBike(@RequestParam String name, @RequestParam String brand,
                            @RequestParam double price, @RequestParam String type,
                            Model model) {
        bikeService.addBike(name, brand, price, type);
        model.addAttribute("message", "Bike added successfully!");
        return "bikeRegister";
    }

    @PostMapping("/admin/bikes/delete")
    public String deleteBike(@RequestParam String bikeId) {
        bikeService.deleteBike(bikeId);
        return "redirect:/bikes";
    }

    @GetMapping("/admin/bikes/edit")
    public String showEditBike(@RequestParam String bikeId,
                               Model model, HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u == null || !u.getUserType().equals("ADMIN")) return "redirect:/login";
        model.addAttribute("bike", bikeService.findById(bikeId));
        return "bikeRegister";
    }
}
