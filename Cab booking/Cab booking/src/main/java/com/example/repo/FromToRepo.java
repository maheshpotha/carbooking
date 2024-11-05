package com.example.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.FromTo;

@Repository
public interface FromToRepo extends JpaRepository<FromTo, Integer> {
    List<FromTo> findByEmail(String email);
}
