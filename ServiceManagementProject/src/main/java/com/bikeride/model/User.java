package com.bikeride.model;

// ABSTRACTION: abstract class — cannot create 'new User()' directly
public abstract class User {

    // ENCAPSULATION: private fields — nobody outside can touch these directly
    private String userId;
    private String username;
    private String email;
    private String password;
    private String userType;  // 'REGULAR' or 'ADMIN'

    // Constructor — sets all fields when object is created
    public User(String userId, String username, String email,
                String password, String userType) {
        this.userId   = userId;
        this.username = username;
        this.email    = email;
        this.password = password;
        this.userType = userType;
    }

    // ENCAPSULATION: Getters (read) and Setters (write)
    public String getUserId()   { return userId; }
    public void setUserId(String userId)     { this.userId = userId; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getEmail()    { return email; }
    public void setEmail(String email)       { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getUserType() { return userType; }
    public void setUserType(String userType) { this.userType = userType; }

    // ABSTRACTION: abstract method — every subclass MUST implement this
    public abstract String getRole();

    // POLYMORPHISM: this will behave differently in each subclass
    public String getDisplayInfo() {
        return "User: " + username;
    }

    // Convert user to a single text line for saving in users.txt
    public String toFileString() {
        return userId+"|"+username+"|"+email+"|"+password+"|"+userType;
    }
}
