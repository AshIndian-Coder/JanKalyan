package com.portal.schemes.repository;

import com.portal.schemes.entity.SchemeBenefit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SchemeBenefitRepository extends JpaRepository<SchemeBenefit, Integer> {
    List<SchemeBenefit> findBySchemeId(Integer schemeId);
    void deleteBySchemeId(Integer schemeId);
}