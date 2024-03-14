package com.bangsoft.apiserver.service.implement;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bangsoft.apiserver.dto.request.auth.SignUpRequestDto;
import com.bangsoft.apiserver.dto.response.ResponseDto;
import com.bangsoft.apiserver.dto.response.auth.SignUpResponseDto;
import com.bangsoft.apiserver.entity.UserEntity;
import com.bangsoft.apiserver.repository.UserRepository;
import com.bangsoft.apiserver.service.AuthService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthServiceImplement implements AuthService{

    private final UserRepository userRepository;    // @RequiredArgsConstructor -> 필수 필드에 대한 생성자 만들어 줌
    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public ResponseEntity<? super SignUpResponseDto> signUp(SignUpRequestDto dto) {

        try {
            // 이메일, 닉네임, 전화번호 중복 검사
            String email = dto.getEmail();
            boolean hasEmail = userRepository.existsByEmail(email);
            if(hasEmail) return SignUpResponseDto.duplicateEmail();

            String nickname = dto.getNickname();
            boolean hasNickname = userRepository.existsByNickname(nickname);
            if(hasNickname) return SignUpResponseDto.duplicateNicnname();
            
            String telNumber = dto.getTelNumber();
            boolean hasTelNumber = userRepository.existsByTelNumber(telNumber);
            if(hasTelNumber) return SignUpResponseDto.duplicateTelNumber();

            // 패스워드 암호화
            String password = dto.getPassword();
            String encodedPassword = passwordEncoder.encode(password);
            dto.setPassword(encodedPassword);

            UserEntity userEntity = new UserEntity(dto);
            userRepository.save(userEntity);


        } catch (Exception e) {
            e.printStackTrace();
            return ResponseDto.databaseError();
        }
        
        return SignUpResponseDto.success();
    }
    
}
