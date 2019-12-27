package com.example.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.board.model.Point;
import com.example.board.repository.PointRepository;

@Controller
public class MapController {
	@Autowired
	PointRepository pointRepository;

	@GetMapping("/map")
	public String map(Model model) {
		return "map/map";
	}

	@GetMapping("/map/getPoint")
	@ResponseBody
	public List<Point> getPoint(double lat, double lng) {
		List<Point> list = pointRepository.findAll();
		for (int i = list.size() - 1; i >= 0; i--) {
			double dist = distance(lat, lng, list.get(i).getLatitude(), list.get(i).getLongitude());
			if (dist > 10) {
				list.remove(i);
			}
		}
		return list;
	}

	private double distance(double lat1, double lon1, double lat2, double lon2) {
		double theta = lon1 - lon2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;
		dist = dist * 1.609344;
		return dist;
	}

	private double deg2rad(double deg) {
		return deg * Math.PI / 180.0;
	}

	private double rad2deg(double rad) {
		return rad * 180 / Math.PI;
	}

}