package com.example.service;

import java.util.List;

import com.example.entity.Imgsimilarity;

public interface ImgsimilarityService {
	
	List<Imgsimilarity> selectSimilarity(String username);


	
}
