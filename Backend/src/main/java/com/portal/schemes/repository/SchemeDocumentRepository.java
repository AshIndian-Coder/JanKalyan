package com.portal.schemes.repository;

import com.portal.schemes.entity.SchemeDocument;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SchemeDocumentRepository extends JpaRepository<SchemeDocument, Integer> {
    List<SchemeDocument> findBySchemeId(Integer schemeId);
    void deleteBySchemeId(Integer schemeId);
}