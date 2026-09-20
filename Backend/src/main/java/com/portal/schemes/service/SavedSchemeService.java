package com.portal.schemes.service;

import com.portal.schemes.dto.response.SchemeResponse;
import com.portal.schemes.entity.SavedScheme;
import com.portal.schemes.entity.Scheme;
import com.portal.schemes.exception.ResourceNotFoundException;
import com.portal.schemes.repository.SavedSchemeRepository;
import com.portal.schemes.repository.SchemeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class SavedSchemeService {

    private final SavedSchemeRepository savedSchemeRepository;
    private final SchemeRepository schemeRepository;

    public SavedSchemeService(SavedSchemeRepository savedSchemeRepository,
                              SchemeRepository schemeRepository) {
        this.savedSchemeRepository = savedSchemeRepository;
        this.schemeRepository = schemeRepository;
    }

    @Transactional
    public SavedScheme saveScheme(Integer userId, Integer schemeId) {
        if (savedSchemeRepository.existsByUserIdAndSchemeId(userId, schemeId)) {
            throw new RuntimeException("Scheme already saved");
        }

        if (!schemeRepository.existsById(schemeId)) {
            throw new ResourceNotFoundException("Scheme not found with ID: " + schemeId);
        }

        SavedScheme saved = SavedScheme.builder()
                .userId(userId)
                .schemeId(schemeId)
                .build();

        return savedSchemeRepository.save(saved);
    }

    @Transactional
    public void unsaveScheme(Integer userId, Integer schemeId) {
        savedSchemeRepository.deleteByUserIdAndSchemeId(userId, schemeId);
    }

    public List<SchemeResponse> getSavedSchemesByUser(Integer userId) {
        List<Integer> schemeIds = savedSchemeRepository.findByUserId(userId)
                .stream()
                .map(SavedScheme::getSchemeId)
                .collect(Collectors.toList());

        return schemeRepository.findAllById(schemeIds)
                .stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    public boolean isSaved(Integer userId, Integer schemeId) {
        return savedSchemeRepository.existsByUserIdAndSchemeId(userId, schemeId);
    }

    private SchemeResponse mapToResponse(Scheme scheme) {
        return SchemeResponse.builder()
                .schemeId(scheme.getSchemeId())
                .schemeName(scheme.getSchemeName())
                .description(scheme.getDescription())
                .department(scheme.getDepartment())
                .level(scheme.getLevel())
                .state(scheme.getState())
                .category(scheme.getCategory())
                .officialApplyUrl(scheme.getOfficialApplyUrl())
                .build();
    }
}
