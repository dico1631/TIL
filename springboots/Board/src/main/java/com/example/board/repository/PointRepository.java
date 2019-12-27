package com.example.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.board.model.Point;

public interface PointRepository extends JpaRepository<Point, Long> {
}