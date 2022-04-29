package com.vincent.coderoom.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.vincent.coderoom.model.Snippet;

@Repository
public interface SnpRepo extends CrudRepository<Snippet, Long> {
	List<Snippet> findAll();
}
