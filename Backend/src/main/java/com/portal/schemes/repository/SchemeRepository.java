package com.portal.schemes.repository;

import com.portal.schemes.entity.Scheme;
import com.portal.schemes.entity.enums.SchemeLevel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SchemeRepository extends JpaRepository<Scheme, Integer> {
    List<Scheme> findByIsActiveTrue();
    List<Scheme> findByCategory(String category);
    List<Scheme> findByLevel(SchemeLevel level);
    List<Scheme> findByStateAndIsActiveTrue(String state);
    List<Scheme> findByCategoryAndIsActiveTrue(String category);
}