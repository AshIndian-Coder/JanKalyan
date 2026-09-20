package com.portal.schemes.service;

import com.portal.schemes.dto.request.SchemeCreateRequest;
import com.portal.schemes.dto.response.CriteriaResponse;
import com.portal.schemes.dto.response.SchemeResponse;
import com.portal.schemes.entity.*;
import com.portal.schemes.entity.enums.SourceType;
import com.portal.schemes.exception.ResourceNotFoundException;
import com.portal.schemes.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class SchemeService {

    private final SchemeRepository schemeRepository;
    private final SchemeEligibilityCriteriaRepository criteriaRepository;
    private final SchemeDocumentRepository documentRepository;
    private final SchemeBenefitRepository benefitRepository;

    public SchemeService(SchemeRepository schemeRepository,
                         SchemeEligibilityCriteriaRepository criteriaRepository,
                         SchemeDocumentRepository documentRepository,
                         SchemeBenefitRepository benefitRepository) {
        this.schemeRepository = schemeRepository;
        this.criteriaRepository = criteriaRepository;
        this.documentRepository = documentRepository;
        this.benefitRepository = benefitRepository;
    }

    public List<SchemeResponse> getAllActiveSchemes() {
        return schemeRepository.findByIsActiveTrue().stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    public List<SchemeResponse> getSchemesByCategory(String category) {
        return schemeRepository.findByCategoryAndIsActiveTrue(category).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    public SchemeResponse getSchemeById(Integer schemeId) {
        Scheme scheme = schemeRepository.findById(schemeId)
                .orElseThrow(() -> new ResourceNotFoundException("Scheme not found with ID: " + schemeId));
        return mapToResponseDetailed(scheme);
    }

    @Transactional
    public SchemeResponse createScheme(SchemeCreateRequest request) {
        Scheme scheme = Scheme.builder()
                .schemeName(request.getSchemeName())
                .description(request.getDescription())
                .department(request.getDepartment())
                .level(request.getLevel())
                .state(request.getState())
                .category(request.getCategory())
                .officialApplyUrl(request.getOfficialApplyUrl())
                .officialStatusCheckUrl(request.getOfficialStatusCheckUrl())
                .source(SourceType.MANUAL)
                .isActive(true)
                .build();

        Scheme savedScheme = schemeRepository.save(scheme);

        if (request.getCriteriaList() != null) {
            request.getCriteriaList().forEach(c -> {
                SchemeEligibilityCriteria criteria = SchemeEligibilityCriteria.builder()
                        .schemeId(savedScheme.getSchemeId())
                        .fieldName(c.getFieldName())
                        .operator(c.getOperator())
                        .value(c.getValue())
                        .value2(c.getValue2())
                        .build();
                criteriaRepository.save(criteria);
            });
        }

        if (request.getDocumentList() != null) {
            request.getDocumentList().forEach(d -> {
                SchemeDocument doc = SchemeDocument.builder()
                        .schemeId(savedScheme.getSchemeId())
                        .documentName(d.getDocumentName())
                        .build();
                documentRepository.save(doc);
            });
        }

        if (request.getBenefitList() != null) {
            request.getBenefitList().forEach(b -> {
                SchemeBenefit benefit = SchemeBenefit.builder()
                        .schemeId(savedScheme.getSchemeId())
                        .benefitDescription(b.getBenefitDescription())
                        .build();
                benefitRepository.save(benefit);
            });
        }

        return mapToResponseDetailed(savedScheme);
    }

    @Transactional
    public SchemeResponse updateScheme(Integer schemeId, SchemeCreateRequest request) {
        Scheme scheme = schemeRepository.findById(schemeId)
                .orElseThrow(() -> new ResourceNotFoundException("Scheme not found with ID: " + schemeId));

        scheme.setSchemeName(request.getSchemeName());
        scheme.setDescription(request.getDescription());
        scheme.setDepartment(request.getDepartment());
        scheme.setLevel(request.getLevel());
        scheme.setState(request.getState());
        scheme.setCategory(request.getCategory());
        scheme.setOfficialApplyUrl(request.getOfficialApplyUrl());
        scheme.setOfficialStatusCheckUrl(request.getOfficialStatusCheckUrl());

        criteriaRepository.deleteBySchemeId(schemeId);
        documentRepository.deleteBySchemeId(schemeId);
        benefitRepository.deleteBySchemeId(schemeId);

        if (request.getCriteriaList() != null) {
            request.getCriteriaList().forEach(c -> {
                SchemeEligibilityCriteria criteria = SchemeEligibilityCriteria.builder()
                        .schemeId(schemeId)
                        .fieldName(c.getFieldName())
                        .operator(c.getOperator())
                        .value(c.getValue())
                        .value2(c.getValue2())
                        .build();
                criteriaRepository.save(criteria);
            });
        }

        if (request.getDocumentList() != null) {
            request.getDocumentList().forEach(d -> {
                SchemeDocument doc = SchemeDocument.builder()
                        .schemeId(schemeId)
                        .documentName(d.getDocumentName())
                        .build();
                documentRepository.save(doc);
            });
        }

        if (request.getBenefitList() != null) {
            request.getBenefitList().forEach(b -> {
                SchemeBenefit benefit = SchemeBenefit.builder()
                        .schemeId(schemeId)
                        .benefitDescription(b.getBenefitDescription())
                        .build();
                benefitRepository.save(benefit);
            });
        }

        Scheme updatedScheme = schemeRepository.save(scheme);
        return mapToResponseDetailed(updatedScheme);
    }

    @Transactional
    public void deleteScheme(Integer schemeId) {
        Scheme scheme = schemeRepository.findById(schemeId)
                .orElseThrow(() -> new ResourceNotFoundException("Scheme not found with ID: " + schemeId));
        scheme.setIsActive(false);
        schemeRepository.save(scheme);
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

    private SchemeResponse mapToResponseDetailed(Scheme scheme) {
        List<String> documents = documentRepository.findBySchemeId(scheme.getSchemeId())
                .stream()
                .map(SchemeDocument::getDocumentName)
                .collect(Collectors.toList());

        List<String> benefits = benefitRepository.findBySchemeId(scheme.getSchemeId())
                .stream()
                .map(SchemeBenefit::getBenefitDescription)
                .collect(Collectors.toList());

        List<CriteriaResponse> criteria = criteriaRepository.findBySchemeId(scheme.getSchemeId())
                .stream()
                .map(c -> CriteriaResponse.builder()
                        .fieldName(c.getFieldName())
                        .operator(c.getOperator())
                        .value(c.getValue())
                        .value2(c.getValue2())
                        .build())
                .collect(Collectors.toList());

        return SchemeResponse.builder()
                .schemeId(scheme.getSchemeId())
                .schemeName(scheme.getSchemeName())
                .description(scheme.getDescription())
                .department(scheme.getDepartment())
                .level(scheme.getLevel())
                .state(scheme.getState())
                .category(scheme.getCategory())
                .officialApplyUrl(scheme.getOfficialApplyUrl())
                .officialStatusCheckUrl(scheme.getOfficialStatusCheckUrl())
                .documents(documents)
                .benefits(benefits)
                .criteria(criteria)
                .build();
    }
}