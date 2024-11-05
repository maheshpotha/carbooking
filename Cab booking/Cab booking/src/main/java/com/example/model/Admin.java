package com.example.model;

public enum Admin {
    INSTANCE("Admin@gmail.com", "Admin@123");

    private final String email;
    private final String password;

    Admin(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
}
