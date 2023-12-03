package com.example.service;

import java.util.List;

import com.example.entity.Rating;

public interface RatingService {
	
	void addRating(Rating rating);

	List<Rating> selectRating(String username);
	
}
