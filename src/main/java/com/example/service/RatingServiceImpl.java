package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.datastax.oss.driver.api.core.config.DriverConfigLoader;
import com.example.entity.Rating;

@Service
public class RatingServiceImpl implements RatingService{
	
	@Autowired
	DBService dbservice;
	
	@Override
	public void addRating(Rating rating) {
		// TODO Auto-generated method stub
		DriverConfigLoader loader = dbservice.getConnection();
		
		dbservice.save(loader, Rating.class, rating);
	}

	@Override
	public List<Rating> selectRating(String username) {
		// TODO Auto-generated method stub
		DriverConfigLoader loader = dbservice.getConnection();

		List<Rating> ratingList = dbservice.findAllByColumnValue(loader, Rating.class, "username", username);

		return ratingList;
	}
}
