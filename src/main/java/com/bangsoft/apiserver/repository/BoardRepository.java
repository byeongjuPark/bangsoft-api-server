package com.bangsoft.apiserver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bangsoft.apiserver.entity.BoardEntiy;

@Repository
public interface BoardRepository extends JpaRepository<BoardEntiy, Integer>{
    
}
