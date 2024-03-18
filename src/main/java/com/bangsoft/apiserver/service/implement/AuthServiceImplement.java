package com.bangsoft.apiserver.service.implement;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bangsoft.apiserver.dto.request.auth.SignInRequestDto;
import com.bangsoft.apiserver.dto.request.auth.SignUpRequestDto;
import com.bangsoft.apiserver.dto.response.ResponseDto;
import com.bangsoft.apiserver.dto.response.auth.SignInResponseDto;
import com.bangsoft.apiserver.dto.response.auth.SignUpResponseDto;
import com.bangsoft.apiserver.entity.UserEntity;
import com.bangsoft.apiserver.provider.JwtProvider;
import com.bangsoft.apiserver.repository.UserRepository;
import com.bangsoft.apiserver.service.AuthService;

import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class AuthServiceImplement implements AuthService{

    private final UserRepository userRepository;    // @RequiredArgsConstructor -> 필수 필드에 대한 생성자 만들어 줌
    private final JwtProvider jwtProvider;

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
            dto.setJoinedDate(encodedPassword);
            
            String now = java.time.LocalDateTime.now().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")).toString();
            dto.setLastestLoginDate(now); 
            dto.setJoinedDate(now);
            
    
            

            UserEntity userEntity = new UserEntity(dto);
            userRepository.save(userEntity);


        } catch (Exception e) {
            e.printStackTrace();
            return ResponseDto.databaseError();
        }
        
        return SignUpResponseDto.success();
    }

    @Override
    public ResponseEntity<? super SignInResponseDto> signIn(SignInRequestDto dto) {
        String token = null;
        try {
            String email = dto.getEmail();
            UserEntity userEntity = userRepository.findByEmail(email);
            if(userEntity == null) return SignInResponseDto.signInFailed();

            String password = dto.getPassword();
            String encodedPassword = userEntity.getPassword();
            boolean isMatched = passwordEncoder.matches(password, encodedPassword);
            if(!isMatched) return SignInResponseDto.signInFailed();
            
            token = jwtProvider.create(email);
            
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseDto.databaseError();
        }

        return SignInResponseDto.success(token);
    }
    
}
