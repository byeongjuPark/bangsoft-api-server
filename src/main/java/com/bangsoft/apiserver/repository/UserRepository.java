package com.bangsoft.apiserver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bangsoft.apiserver.entity.UserEntity;


// JpaRepository<Entity, Entity PK Type>
@Repository
public interface UserRepository extends JpaRepository<UserEntity, String>{
    // query method
    boolean existsByEmail(String email);
    boolean existsByNickname(String nickname);
    boolean existsByTelNumber(String telNumber);
    
    UserEntity findByEmail(String email);
    

}
