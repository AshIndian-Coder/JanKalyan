package com.portal.schemes.dto.response;

import com.portal.schemes.entity.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AuthResponse {

    private String token;
    private Integer userId;
    private String fullName;
    private String email;
    private Role role;
    private boolean profileComplete;
}
