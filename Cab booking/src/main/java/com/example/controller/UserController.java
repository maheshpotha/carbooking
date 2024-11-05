package com.example.controller;

import java.util.List;

import java.util.Collections;

import java.util.Comparator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.model.Admin;
import com.example.model.FromTo;
import com.example.model.Login;
import com.example.model.User;
import com.example.service.CabService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private CabService service;

	@RequestMapping({ "/", "/home" })
	public String home() {
		return "home";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}

	@RequestMapping("/customer")
	public String customer() {
		return "customer";
	}

	@RequestMapping("/admin")
	public String admin(Model model) {
		List<FromTo> cabRequests = service.getAllCabRequests();
		// Sort the requests: unaccepted (pending) at the top, then accepted or declined
		Collections.sort(cabRequests, new Comparator<FromTo>() {
			@Override
			public int compare(FromTo o1, FromTo o2) {
				// Sort by status: pending first, then accepted and declined
				if (o1.getStatus().equals("Pending") && !o2.getStatus().equals("Pending")) {
					return -1; // o1 goes first
				} else if (!o1.getStatus().equals("Pending") && o2.getStatus().equals("Pending")) {
					return 1; // o2 goes first
				} else {
					return 0; // If both are the same status, keep the same order
				}
			}
		});
		model.addAttribute("cabRequests", cabRequests);
		return "admin";
	}

	@GetMapping("/cabRequest")
	public String cabRequest(Model model, HttpSession session) {
		String email = (String) session.getAttribute("userEmail");

		// Retrieve user details for display
		User user = service.getUserDetailsByEmail(email);
		model.addAttribute("userFirstName", user.getFirstname());
		model.addAttribute("userLastName", user.getLastname());

		// Retrieve cab requests for the user
		List<FromTo> userCabRequests = service.getCabRequestsByEmail(email);

		// Sort the requests: pending at the top, accepted/declined at the bottom
		Collections.sort(userCabRequests, new Comparator<FromTo>() {
			@Override
			public int compare(FromTo o1, FromTo o2) {
				if (o1.getStatus().equals("Pending") && !o2.getStatus().equals("Pending")) {
					return -1;
				} else if (!o1.getStatus().equals("Pending") && o2.getStatus().equals("Pending")) {
					return 1;
				} else {
					return 0;
				}
			}
		});

		model.addAttribute("cabRequests", userCabRequests);
		return "cabRequest"; // Return the name of your JSP file
	}

	@PostMapping("/registerForm")
	public String handleRegistrationForm(@ModelAttribute User user, Model model) {
		model.addAttribute("login", user);
		boolean emailExists = service.isEmailExists(user.getEmail());
		if (emailExists) {
			// If email exists, set an error message
			model.addAttribute("errorMessage", "User already exists with this email.");
			return "signup"; // Return to the signup page
		}
		// Continue with registration process
		service.registerUser(user);
		return "redirect:/login"; // Redirect to login page or any other page after successful registration
	}

	@PostMapping("/loginForm")
	public String handleLoginForm(@ModelAttribute Login login, Model model, RedirectAttributes redirectAttributes,
			HttpSession session) {
		boolean isValidUser = service.handleLogin(login.getEmail(), login.getPassword());

		if (isValidUser) {
			// If valid, redirect to the home page or dashboard
			session.setAttribute("userEmail", login.getEmail());
			return "redirect:/customer"; // Change this to your desired path for successful login
		} else if (login.getEmail().equals(Admin.INSTANCE.getEmail())
				&& login.getPassword().equals(Admin.INSTANCE.getPassword())) {
			// Fetch cab requests and add them to the model
			List<FromTo> cabRequests = service.getAllCabRequests(); // This should return FromTo objects with User
			Collections.reverse(cabRequests);
			model.addAttribute("cabRequests", cabRequests);
			return "redirect:/admin"; // Redirect to the admin page
		} else {
			// If invalid, set an error message
			redirectAttributes.addFlashAttribute("errorMessage", "Incorrect email or password.");
			return "login"; // Return to the login JSP page with the error message
		}
	}

	// customer booking for cab
	@PostMapping("/cabRequest")
	public String handleCabRequest(@ModelAttribute FromTo areas, HttpSession session,
			RedirectAttributes redirectAttributes) {
		String email = (String) session.getAttribute("userEmail");
		areas.setEmail(email);
		areas.setStatus("Pending"); // Set the initial status as 'Pending'

		// Handle the cab request
		service.handleCabRequest(areas);

		// Get user details to display the name
		User user = service.getUserDetailsByEmail(email);

		// Add user details to redirect attributes
		redirectAttributes.addFlashAttribute("userFirstName", user.getFirstname());
		redirectAttributes.addFlashAttribute("userLastName", user.getLastname());

		// Redirect to the GET method to display the cab requests
		return "redirect:/cabRequest"; // Ensure this matches your mapping for GET
	}

	@PostMapping("/acceptRide")
	public String acceptRide(@RequestParam int id, Model model) {
		// Update the status in the database
		service.acceptRide(id); // Call the service method
		// Redirect back to the admin page or refresh the data
		return "redirect:/admin"; // Adjust the redirect as necessary
	}

	@PostMapping("/declineRide")
	public String declineRide(@RequestParam int id) {
		service.declineRide(id); // Implement this method in your CabService
		return "redirect:/admin"; // Adjust the redirect as necessary
	}

}
