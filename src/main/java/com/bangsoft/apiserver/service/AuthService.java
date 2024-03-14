package com.bangsoft.apiserver.service;

import org.springframework.http.ResponseEntity;

import com.bangsoft.apiserver.dto.request.auth.SignUpRequestDto;
import com.bangsoft.apiserver.dto.response.auth.SignUpResponseDto;

public interface AuthService {
    // 부모도 같이 반환 가능
    ResponseEntity<? super SignUpResponseDto> signUp(SignUpRequestDto dto);
}
