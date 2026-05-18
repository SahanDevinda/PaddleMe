package com.bikeride.service;

import com.bikeride.model.Reservation;
import org.springframework.stereotype.Service;
import java.io.*;
import java.time.LocalDate;
import java.util.*;

@Service
public class ReservationService {

    private static final String FILE = "data/reservations.txt";

    public List<Reservation> getAll() {
        List<Reservation> list = new ArrayList<>();
        File f = new File(FILE);
        if (!f.exists()) return list;
        try (BufferedReader r = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = r.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] p = line.split("\\|");
                if (p.length < 8) continue;
                Reservation res = new Reservation(
                        p[0],p[1],p[2],p[3],p[4],p[5],Double.parseDouble(p[6]));
                res.setStatus(p[7]);
                list.add(res);
            }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    public boolean create(String userId, String bikeId, String bikeName,
                          String startDate, String endDate, double cost) {
        new File("data").mkdirs();
        String id = "R" + String.format("%03d", getAll().size() + 1);
        Reservation r = new Reservation(id,userId,bikeId,bikeName,startDate,endDate,cost);
        try (BufferedWriter w = new BufferedWriter(new FileWriter(FILE, true))) {
            w.write(r.toFileString()); w.newLine(); return true;
        } catch (IOException e) { e.printStackTrace(); return false; }
    }

    public List<Reservation> getByUser(String userId) {
        List<Reservation> result = new ArrayList<>();
        for (Reservation r : getAll())
            if (r.getUserId().equals(userId)) result.add(r);
        return result;
    }

    public boolean hasOverlappingReservation(String bikeId, String startDate, String endDate) {
        LocalDate requestedStart = LocalDate.parse(startDate);
        LocalDate requestedEnd = LocalDate.parse(endDate);
        for (Reservation r : getAll()) {
            if (!r.getBikeId().equals(bikeId) || !"ACTIVE".equals(r.getStatus())) continue;
            LocalDate existingStart = LocalDate.parse(r.getStartDate());
            LocalDate existingEnd = LocalDate.parse(r.getEndDate());
            boolean overlaps = !requestedEnd.isBefore(existingStart) && !requestedStart.isAfter(existingEnd);
            if (overlaps) return true;
        }
        return false;
    }

    public boolean updateStatus(String reservationId, String status) {
        List<Reservation> list = getAll();
        for (Reservation r : list)
            if (r.getReservationId().equals(reservationId)) { r.setStatus(status); break; }
        return saveAll(list);
    }

    public boolean delete(String reservationId) {
        List<Reservation> list = getAll();
        boolean removed = list.removeIf(r -> r.getReservationId().equals(reservationId));
        if (removed) saveAll(list);
        return removed;
    }

    private boolean saveAll(List<Reservation> list) {
        try (BufferedWriter w = new BufferedWriter(new FileWriter(FILE))) {
            for (Reservation r : list) { w.write(r.toFileString()); w.newLine(); }
            return true;
        } catch (IOException e) { e.printStackTrace(); return false; }
    }
}
