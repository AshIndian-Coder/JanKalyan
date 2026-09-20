package com.portal.schemes.repository;

import com.portal.schemes.entity.SavedScheme;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SavedSchemeRepository extends JpaRepository<SavedScheme, Integer> {
    List<SavedScheme> findByUserId(Integer userId);
    Optional<SavedScheme> findByUserIdAndSchemeId(Integer userId, Integer schemeId);
    boolean existsByUserIdAndSchemeId(Integer userId, Integer schemeId);
    void deleteByUserIdAndSchemeId(Integer userId, Integer schemeId);
}