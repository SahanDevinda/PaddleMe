package com.bikeride.model;

// INHERITANCE: AdminUser also extends User
public class AdminUser extends User {

    private String adminLevel; // 'SUPER' or 'NORMAL'

    public AdminUser(String userId, String username,
                     String email, String password) {
        super(userId, username, email, password, "ADMIN");
        this.adminLevel = "NORMAL";
    }

    public String getAdminLevel() { return adminLevel; }
    public void setAdminLevel(String adminLevel) { this.adminLevel = adminLevel; }

    // POLYMORPHISM: different role for admin
    @Override
    public String getRole() { return "Administrator"; }

    // POLYMORPHISM: different display for admin
    @Override
    public String getDisplayInfo() {
        return "ADMIN: " + getUsername() + " [" + adminLevel + "]";
    }

    // Admin-only method (ABSTRACTION — hidden from regular users)
    public boolean canDeleteUsers() { return true; }
}
