package com.bangsoft.apiserver.entity;

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
    private String emial;
    private String password;
    private String nickname;
    private String telNumber; // db에서는 _로 구분한 것을 camel case로 작성
    private String address;
    private String addressDetail;
    private String profileImage;

}
