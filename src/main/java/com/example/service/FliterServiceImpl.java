package com.example.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.datastax.oss.driver.api.core.config.DriverConfigLoader;

import com.example.entity.Filter;

@Service
public class FliterServiceImpl implements FilterService {
	
	@Autowired
	DBService dbservice;
	
	@Override
	public void insertFilter(String username) {
		// TODO Auto-generated method stub
		DriverConfigLoader loader = dbservice.getConnection();
		
		Filter filter = new Filter();
		List<Integer> list = Arrays.asList(0, 0);
		String gender = "여성";
		int maximum_distance = 500;
		filter.setUsername(username);
		filter.setAge_range(list);
		filter.setGender(gender);
		filter.setMaximum_distance(maximum_distance);
		
		dbservice.save(loader, Filter.class, filter);
		
	}
	@Override
	public void joinFilter(String username) {
		// TODO Auto-generated method stub
		DriverConfigLoader loader = dbservice.getConnection();
		
		Filter filter = new Filter();
		List<Integer> list = Arrays.asList(0, 100);
		String gender = "여성";
		int maximum_distance = 500;
		filter.setUsername(username);
		filter.setAge_range(list);
		filter.setGender(gender);
		filter.setMaximum_distance(maximum_distance);
		
		dbservice.save(loader, Filter.class, filter);
	}
	@Override
	public void updateFilter(Filter filter) {
		// TODO Auto-generated method stub
		DriverConfigLoader loader = dbservice.getConnection();
		
		dbservice.save(loader, Filter.class, filter);
	}
	
	
	
}
