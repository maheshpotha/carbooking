package com.example.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@Entity
public class FromTo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String email;
    private String source;
    private String destination;
    private String vehicle;
    private String fareAmount;
    private String status;

    @ManyToOne // Establishing relationship with User entity
    @JoinColumn(name = "email", referencedColumnName = "email", insertable = false, updatable = false)
    private User user; // Assuming email is the unique identifier in User entity
}
