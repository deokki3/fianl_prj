package com.jhta.neocom.repository;

import java.util.Optional;

import com.jhta.neocom.model.MemberVo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberRepository extends JpaRepository<MemberVo, Integer> {
    public Optional<MemberVo> findById(String id);

}
