package com.vincent.coderoom.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vincent.coderoom.model.Snippet;
import com.vincent.coderoom.repos.SnpRepo;

@Service
public class SnpServ {
	
	@Autowired
	SnpRepo snpRepo;
	
	public Snippet createSnp(Snippet s) {
		return snpRepo.save(s);
	}
	
	public Snippet updateSnp(Snippet s) {
		return snpRepo.save(s);
	}
	
	public Snippet findOne(Long id) {
		Optional<Snippet> optionalSnp = snpRepo.findById(id);
		return optionalSnp.isPresent()? optionalSnp.get():null;
	}
	
	public List<Snippet> findAll(){
		return snpRepo.findAll();
	}
	
	public void deleteById(Long id) {
		snpRepo.deleteById(id);
	}	
	
}
