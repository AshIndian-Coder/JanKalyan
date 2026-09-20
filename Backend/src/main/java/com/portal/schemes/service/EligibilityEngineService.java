package com.portal.schemes.service;

import com.portal.schemes.dto.response.EligibilityResultResponse;
import com.portal.schemes.entity.Scheme;
import com.portal.schemes.entity.SchemeBenefit;
import com.portal.schemes.entity.SchemeDocument;
import com.portal.schemes.entity.SchemeEligibilityCriteria;
import com.portal.schemes.entity.UserProfile;
import com.portal.schemes.exception.ResourceNotFoundException;
import com.portal.schemes.repository.*;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class EligibilityEngineService {

    private final SchemeRepository schemeRepository;
    private final SchemeEligibilityCriteriaRepository criteriaRepository;
    private final UserProfileRepository userProfileRepository;
    private final SchemeDocumentRepository documentRepository;
    private final SchemeBenefitRepository benefitRepository;

    public EligibilityEngineService(SchemeRepository schemeRepository,
                                    SchemeEligibilityCriteriaRepository criteriaRepository,
                                    UserProfileRepository userProfileRepository,
                                    SchemeDocumentRepository documentRepository,
                                    SchemeBenefitRepository benefitRepository) {
        this.schemeRepository = schemeRepository;
        this.criteriaRepository = criteriaRepository;
        this.userProfileRepository = userProfileRepository;
        this.documentRepository = documentRepository;
        this.benefitRepository = benefitRepository;
    }

    public List<EligibilityResultResponse> checkEligibility(Integer userId) {
        UserProfile profile = userProfileRepository.findByUserId(userId)
                .orElseThrow(() -> new ResourceNotFoundException("Complete your profile first"));

        List<Scheme> allSchemes = schemeRepository.findByIsActiveTrue();
        List<EligibilityResultResponse> results = new ArrayList<>();

        for (Scheme scheme : allSchemes) {
            List<SchemeEligibilityCriteria> rules = criteriaRepository.findBySchemeId(scheme.getSchemeId());

            if (rules.isEmpty()) {
                continue;
            }

            boolean allRulesPassed = true;
            for (SchemeEligibilityCriteria rule : rules) {
                if (!evaluateRule(profile, rule)) {
                    allRulesPassed = false;
                    break;
                }
            }

            if (allRulesPassed) {
                results.add(mapToEligibilityResult(scheme));
            }
        }

        return results;
    }

    private boolean evaluateRule(UserProfile profile, SchemeEligibilityCriteria rule) {
        Object profileValue = getProfileFieldValue(profile, rule.getFieldName());
        if (profileValue == null) {
            return false;
        }

        String operator = rule.getOperator();
        String ruleValue = rule.getValue();

        try {
            if (profileValue instanceof BigDecimal) {
                BigDecimal actual = (BigDecimal) profileValue;
                BigDecimal expected = new BigDecimal(ruleValue);

                return switch (operator) {
                    case "=" -> actual.compareTo(expected) == 0;
                    case "!=" -> actual.compareTo(expected) != 0;
                    case "<" -> actual.compareTo(expected) < 0;
                    case "<=" -> actual.compareTo(expected) <= 0;
                    case ">" -> actual.compareTo(expected) > 0;
                    case ">=" -> actual.compareTo(expected) >= 0;
                    case "BETWEEN" -> {
                        BigDecimal upper = new BigDecimal(rule.getValue2());
                        yield actual.compareTo(expected) >= 0 && actual.compareTo(upper) <= 0;
                    }
                    default -> false;
                };
            }

            if (profileValue instanceof Integer) {
                int actual = (Integer) profileValue;
                int expected = Integer.parseInt(ruleValue);

                return switch (operator) {
                    case "=" -> actual == expected;
                    case "!=" -> actual != expected;
                    case "<" -> actual < expected;
                    case "<=" -> actual <= expected;
                    case ">" -> actual > expected;
                    case ">=" -> actual >= expected;
                    case "BETWEEN" -> {
                        int upper = Integer.parseInt(rule.getValue2());
                        yield actual >= expected && actual <= upper;
                    }
                    default -> false;
                };
            }

            if (profileValue instanceof Boolean) {
                boolean actual = (Boolean) profileValue;
                boolean expected = Boolean.parseBoolean(ruleValue);
                return operator.equals("=") ? actual == expected : actual != expected;
            }

            String actualStr = profileValue.toString();
            return switch (operator) {
                case "=" -> actualStr.equalsIgnoreCase(ruleValue);
                case "!=" -> !actualStr.equalsIgnoreCase(ruleValue);
                case "IN" -> Arrays.stream(ruleValue.split(","))
                        .map(String::trim)
                        .anyMatch(v -> v.equalsIgnoreCase(actualStr));
                default -> false;
            };

        } catch (Exception e) {
            return false;
        }
    }

    private Object getProfileFieldValue(UserProfile profile, String fieldName) {
        return switch (fieldName) {
            case "annual_income" -> profile.getAnnualIncome();
            case "caste_category" -> profile.getCasteCategory() != null ? profile.getCasteCategory().name() : null;
            case "gender" -> profile.getGender() != null ? profile.getGender().name() : null;
            case "state" -> profile.getState();
            case "district" -> profile.getDistrict();
            case "occupation" -> profile.getOccupation();
            case "education_level" -> profile.getEducationLevel();
            case "is_bpl" -> profile.getIsBpl();
            case "disability_status" -> profile.getDisabilityStatus();
            case "marital_status" -> profile.getMaritalStatus() != null ? profile.getMaritalStatus().name() : null;
            case "land_holding_acres" -> profile.getLandHoldingAcres();
            case "age" -> calculateAge(profile.getDateOfBirth());
            default -> null;
        };
    }

    private Integer calculateAge(LocalDate dob) {
        if (dob == null) {
            return null;
        }
        return Period.between(dob, LocalDate.now()).getYears();
    }

    private EligibilityResultResponse mapToEligibilityResult(Scheme scheme) {
        List<String> documents = documentRepository.findBySchemeId(scheme.getSchemeId())
                .stream()
                .map(SchemeDocument::getDocumentName)
                .collect(Collectors.toList());

        List<String> benefits = benefitRepository.findBySchemeId(scheme.getSchemeId())
                .stream()
                .map(SchemeBenefit::getBenefitDescription)
                .collect(Collectors.toList());

        return EligibilityResultResponse.builder()
                .schemeId(scheme.getSchemeId())
                .schemeName(scheme.getSchemeName())
                .department(scheme.getDepartment())
                .category(scheme.getCategory())
                .description(scheme.getDescription())
                .matchPercentage(100)
                .officialApplyUrl(scheme.getOfficialApplyUrl())
                .benefits(benefits)
                .requiredDocuments(documents)
                .build();
    }
}