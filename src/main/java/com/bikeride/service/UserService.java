package com.bikeride.service;

import com.bikeride.model.*;
import org.springframework.stereotype.Service;
import java.io.*;
import java.util.*;

@Service
public class UserService {

    private static final String FILE = "data/users.txt";

    // ── READ: Load all users from file ──────────────────────────────────
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        File f = new File(FILE);
        if (!f.exists()) return list;
        try (BufferedReader r = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = r.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] p = line.split("\\|");
                if (p.length < 5) continue;
                User u = p[4].equals("ADMIN")
                        ? new AdminUser(p[0],p[1],p[2],p[3])
                        : new RegularUser(p[0],p[1],p[2],p[3]);
                list.add(u);
            }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    // ── CREATE: Add new user to file ─────────────────────────────────────
    public boolean registerUser(String username, String email,
                                String password, String userType) {
        if (findByUsername(username) != null) return false; // already exists
        new File("data").mkdirs(); // create folder if missing
        String id = ("ADMIN".equals(userType) ? "A" : "U")
                + String.format("%03d", getAllUsers().size() + 1);
        User u = "ADMIN".equals(userType)
                ? new AdminUser(id,username,email,password)
                : new RegularUser(id,username,email,password);
        try (BufferedWriter w = new BufferedWriter(
                new FileWriter(FILE, true))) {  // true = append
            w.write(u.toFileString()); w.newLine(); return true;
        } catch (IOException e) { e.printStackTrace(); return false; }
    }

    // ── READ: Find user by username ──────────────────────────────────────
    public User findByUsername(String username) {
        for (User u : getAllUsers())
            if (u.getUsername().equalsIgnoreCase(username)) return u;
        return null;
    }

    // ── READ: Find user by ID ────────────────────────────────────────────
    public User findById(String userId) {
        for (User u : getAllUsers())
            if (u.getUserId().equals(userId)) return u;
        return null;
    }

    // ── UPDATE: Change email and/or password ─────────────────────────────
    public boolean updateUser(String userId, String newEmail, String newPassword) {
        List<User> list = getAllUsers();
        boolean found = false;
        for (User u : list) {
            if (u.getUserId().equals(userId)) {
                if (newEmail != null && !newEmail.isEmpty()) u.setEmail(newEmail);
                if (newPassword != null && !newPassword.isEmpty()) u.setPassword(newPassword);
                found = true; break;
            }
        }
        if (found) saveAll(list);
        return found;
    }

    // ── DELETE: Remove a user ────────────────────────────────────────────
    public boolean deleteUser(String userId) {
        List<User> list = getAllUsers();
        boolean removed = list.removeIf(u -> u.getUserId().equals(userId));
        if (removed) saveAll(list);
        return removed;
    }

    // ── LOGIN check ──────────────────────────────────────────────────────
    public User login(String username, String password) {
        User u = findByUsername(username);
        return (u != null && u.getPassword().equals(password)) ? u : null;
    }

    // Save entire list back to file (used after update/delete)
    private void saveAll(List<User> list) {
        try (BufferedWriter w = new BufferedWriter(new FileWriter(FILE))) {
            for (User u : list) { w.write(u.toFileString()); w.newLine(); }
        } catch (IOException e) { e.printStackTrace(); }
    }
}
