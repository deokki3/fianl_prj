package com.jhta.neocom.model;

import java.util.*;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class CustomUserDetails implements UserDetails {

    private MemberVo memberVo;

    public CustomUserDetails(MemberVo memberVo) {
        this.memberVo = memberVo;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Set<MemberRole> roles = memberVo.getRoles();
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();

        for (MemberRole role : roles) {
            authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
        }

        return authorities;
    }

    @Override
    public String getPassword() {
        return memberVo.getPassword();
    }

    @Override
    public String getUsername() {
        return memberVo.getId();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}