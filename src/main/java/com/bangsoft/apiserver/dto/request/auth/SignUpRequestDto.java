package com.bangsoft.apiserver.dto.request.auth;

import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SignUpRequestDto {

    // NotBlank : Null, 빈문자열, 공백 불가
    @NotBlank
    @Email
    private String email;
    
    @NotBlank
    @Size(min=8, max=20)
    private String password;

    @NotBlank
    private String nickname;

    @NotBlank
    @Pattern(regexp="[0-9]{11,13}$")
    private String telNumber;

    @NotBlank
    private String address;
    private String addressDetail;
    
    @NotNull // null상태를 검사하기 위해 참조형 Boolean 사용
    @AssertTrue // true가 아니면 받지 않음
    private Boolean agreedPersonal;
}
