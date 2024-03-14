package com.bangsoft.apiserver.entity;

import com.bangsoft.apiserver.dto.request.auth.SignUpRequestDto;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity(name="user")
@Table(name="user") //db의 테이블과 매핑
public class UserEntity {
    
    @Id
    private String email;
    private String password;
    private String nickname;
    private String telNumber; // db에서는 _로 구분한 것을 camel case로 작성
    private String address;
    private String addressDetail;
    private String profileImage;
    private boolean agreedPersonal;
    private String joinedDate; // 가입 날짜(current time)

    public UserEntity(SignUpRequestDto dto){
        this.email = dto.getEmail();
        this.password = dto.getPassword();
        this.nickname = dto.getNickname();
        this.telNumber = dto.getTelNumber();
        this.address = dto.getAddress();
        this.addressDetail = dto.getAddressDetail();
        this.agreedPersonal = dto.getAgreedPersonal();
    }

}
