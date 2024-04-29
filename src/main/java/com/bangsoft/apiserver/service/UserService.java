package com.bangsoft.apiserver.service;

import org.springframework.http.ResponseEntity;

import com.bangsoft.apiserver.dto.response.user.GetSignInUserResponseDto;

public interface UserService {
    ResponseEntity<? super GetSignInUserResponseDto> getSignInUser(String email);
}
