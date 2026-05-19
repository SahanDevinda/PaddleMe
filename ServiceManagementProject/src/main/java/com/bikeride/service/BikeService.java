package com.bikeride.service;

import com.bikeride.model.*;
import org.springframework.stereotype.Service;  // <--- MUST HAVE THIS
import java.io.*;
import java.util.*;

@Service
public class BikeService {

    private static final String FILE = "data/bikes.txt";

    public List<Bike> getAllBikes() {
        List<Bike> list = new ArrayList<>();
        File f = new File(FILE);
        if (!f.exists()) return list;
        try (BufferedReader r = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = r.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] p = line.split("\\|");
                if (p.length < 6) continue;
                Bike b = p[5].equals("MOUNTAIN")
                        ? new MountainBike(p[0],p[1],p[2],Double.parseDouble(p[3]),"Full")
                        : new CityBike(p[0],p[1],p[2],Double.parseDouble(p[3]),7);
                b.setAvailable(Boolean.parseBoolean(p[4]));
                list.add(b);
            }
        } catch (IOException e) { e.printStackTrace(); }
        return list;
    }

    public boolean addBike(String name, String brand, double price, String type) {
        new File("data").mkdirs();
        String id = "B" + String.format("%03d", getAllBikes().size() + 1);
        Bike b = "MOUNTAIN".equals(type)
                ? new MountainBike(id,name,brand,price,"Full")
                : new CityBike(id,name,brand,price,7);
        try (BufferedWriter w = new BufferedWriter(new FileWriter(FILE, true))) {
            w.write(b.toFileString()); w.newLine(); return true;
        } catch (IOException e) { e.printStackTrace(); return false; }
    }

    public Bike findById(String bikeId) {
        for (Bike b : getAllBikes())
            if (b.getBikeId().equals(bikeId)) return b;
        return null;
    }

    public boolean updateBike(String bikeId, String newName, double newPrice) {
        List<Bike> list = getAllBikes();
        boolean found = false;
        for (Bike b : list) {
            if (b.getBikeId().equals(bikeId)) {
                b.setBikeName(newName); b.setPricePerHour(newPrice);
                found = true; break;
            }
        }
        if (found) saveAll(list);
        return found;
    }

    public boolean deleteBike(String bikeId) {
        List<Bike> list = getAllBikes();
        boolean removed = list.removeIf(b -> b.getBikeId().equals(bikeId));
        if (removed) saveAll(list);
        return removed;
    }

    public void setAvailability(String bikeId, boolean available) {
        List<Bike> list = getAllBikes();
        for (Bike b : list)
            if (b.getBikeId().equals(bikeId)) { b.setAvailable(available); break; }
        saveAll(list);
    }

    public List<Bike> getAvailableBikes() {
        List<Bike> result = new ArrayList<>();
        for (Bike b : getAllBikes()) if (b.isAvailable()) result.add(b);
        return result;
    }

    private void saveAll(List<Bike> list) {
        try (BufferedWriter w = new BufferedWriter(new FileWriter(FILE))) {
            for (Bike b : list) { w.write(b.toFileString()); w.newLine(); }
        } catch (IOException e) { e.printStackTrace(); }
    }
}
