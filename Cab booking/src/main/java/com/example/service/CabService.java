package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.FromTo;
import com.example.model.User;
import com.example.repo.FromToRepo;
import com.example.repo.UserRepo;

@Service
public class CabService {

    @Autowired
    public UserRepo userRepo;

    @Autowired
    public FromToRepo fromToRepo;

    public boolean isEmailExists(String email) {
        // Logic to check if email exists in the database
        return userRepo.findByEmail(email) != null; // Assuming this method returns null if not found
    }

    public void registerUser(User user) {
        // Logic to save the new user in the database
        userRepo.save(user);
    }

    public boolean handleLogin(String email, String password) {
        User user = userRepo.findByEmail(email);
        return user != null && user.getPassword().equals(password);

    }

    public String handleCabRequest(FromTo areas) {
        fromToRepo.save(areas);
        return "cabRequest";
    }

    public List<FromTo> getAllCabRequests() {
        return fromToRepo.findAll();
    }

    public List<FromTo> getCabRequestsByEmail(String email) {
        return fromToRepo.findByEmail(email);
    }

    public User getUserDetailsByEmail(String email) {
        return userRepo.findByEmail(email); // Fetch user by email
    }

    public void acceptRide(int id) {
        FromTo cabRequest = fromToRepo.findById(id).orElse(null);
        if (cabRequest != null) {
            cabRequest.setStatus("Accepted"); // Set the status to accepted
            fromToRepo.save(cabRequest); // Save the changes
        }
    }

    public void declineRide(int id) {
        // Find the ride by ID
        FromTo cabRequest = fromToRepo.findById(id).orElse(null);
        if (cabRequest != null) {
            // Update the status to "Declined"
            cabRequest.setStatus("Declined");
            fromToRepo.save(cabRequest); // Save the updated ride back to the database
        }
    }

}
