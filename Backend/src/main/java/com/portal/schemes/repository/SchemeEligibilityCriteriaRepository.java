package com.portal.schemes.repository;

import com.portal.schemes.entity.SchemeEligibilityCriteria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SchemeEligibilityCriteriaRepository extends JpaRepository<SchemeEligibilityCriteria, Integer> {
    List<SchemeEligibilityCriteria> findBySchemeId(Integer schemeId);
    void deleteBySchemeId(Integer schemeId);
}