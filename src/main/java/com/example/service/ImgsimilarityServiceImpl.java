package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.datastax.oss.driver.api.core.config.DriverConfigLoader;
import com.example.entity.Imgsimilarity;

@Service
public class ImgsimilarityServiceImpl implements ImgsimilarityService{
	
	@Autowired
	DBService dbservice;
	
	@Override
	public List<Imgsimilarity> selectSimilarity(String username) {
		// TODO Auto-generated method stub
		
		DriverConfigLoader loader = dbservice.getConnection();
		List<Imgsimilarity> imgsimilarityList = dbservice.findAllByColumnValue(loader, Imgsimilarity.class, "username", username);

		return imgsimilarityList;
	}

}
