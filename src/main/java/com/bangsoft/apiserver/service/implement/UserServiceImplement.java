package com.bangsoft.apiserver.service.implement;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.bangsoft.apiserver.dto.response.ResponseDto;
import com.bangsoft.apiserver.dto.response.user.GetSignInUserResponseDto;
import com.bangsoft.apiserver.entity.UserEntity;
import com.bangsoft.apiserver.repository.UserRepository;
import com.bangsoft.apiserver.service.UserService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImplement implements UserService{

    private final UserRepository userRepository;

    @Override
    public ResponseEntity<? super GetSignInUserResponseDto> getSignInUser(String email) {
        
        UserEntity userEntity = null;

        try {
            userEntity = userRepository.findByEmail(email);
            if(userEntity == null) return GetSignInUserResponseDto.notExistUser();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseDto.databaseError();
        }

        return GetSignInUserResponseDto.success(userEntity);
    }
    
}
