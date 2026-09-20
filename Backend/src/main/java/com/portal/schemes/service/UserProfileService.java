package com.portal.schemes.service;

import com.portal.schemes.dto.request.ProfileUpdateRequest;
import com.portal.schemes.dto.response.UserProfileResponse;
import com.portal.schemes.entity.UserProfile;
import com.portal.schemes.exception.ResourceNotFoundException;
import com.portal.schemes.repository.UserProfileRepository;
import com.portal.schemes.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

@Service
public class UserProfileService {

    private final UserProfileRepository userProfileRepository;
    private final UserRepository userRepository;

    public UserProfileService(UserProfileRepository userProfileRepository,
                              UserRepository userRepository) {
        this.userProfileRepository = userProfileRepository;
        this.userRepository = userRepository;
    }

    public UserProfileResponse getProfileByUserId(Integer userId) {
        UserProfile profile = userProfileRepository.findByUserId(userId)
                .orElseThrow(() -> new ResourceNotFoundException("Profile not found for user ID: " + userId));

        return mapToResponse(profile);
    }

    @Transactional
    public UserProfileResponse createOrUpdateProfile(Integer userId, ProfileUpdateRequest request) {
        if (!userRepository.existsById(userId)) {
            throw new ResourceNotFoundException("User not found with ID: " + userId);
        }

        UserProfile profile = userProfileRepository.findByUserId(userId)
                .orElse(UserProfile.builder().userId(userId).build());

        updateProfileFields(profile, request);

        UserProfile savedProfile = userProfileRepository.save(profile);
        return mapToResponse(savedProfile);
    }

    private void updateProfileFields(UserProfile profile, ProfileUpdateRequest request) {
        if (request.getDateOfBirth() != null) {
            profile.setDateOfBirth(request.getDateOfBirth());
        }
        if (request.getGender() != null) {
            profile.setGender(request.getGender());
        }
        if (request.getState() != null) {
            profile.setState(request.getState());
        }
        if (request.getDistrict() != null) {
            profile.setDistrict(request.getDistrict());
        }
        if (request.getAnnualIncome() != null) {
            profile.setAnnualIncome(request.getAnnualIncome());
        }
        if (request.getCasteCategory() != null) {
            profile.setCasteCategory(request.getCasteCategory());
        }
        if (request.getOccupation() != null) {
            profile.setOccupation(request.getOccupation());
        }
        if (request.getEducationLevel() != null) {
            profile.setEducationLevel(request.getEducationLevel());
        }
        if (request.getIsBpl() != null) {
            profile.setIsBpl(request.getIsBpl());
        }
        if (request.getDisabilityStatus() != null) {
            profile.setDisabilityStatus(request.getDisabilityStatus());
        }
        if (request.getMaritalStatus() != null) {
            profile.setMaritalStatus(request.getMaritalStatus());
        }
        if (request.getLandHoldingAcres() != null) {
            profile.setLandHoldingAcres(request.getLandHoldingAcres());
        } else if (profile.getLandHoldingAcres() == null) {
            profile.setLandHoldingAcres(BigDecimal.ZERO);
        }
    }

    private UserProfileResponse mapToResponse(UserProfile profile) {
        return UserProfileResponse.builder()
                .profileId(profile.getProfileId())
                .userId(profile.getUserId())
                .dateOfBirth(profile.getDateOfBirth())
                .gender(profile.getGender())
                .state(profile.getState())
                .district(profile.getDistrict())
                .annualIncome(profile.getAnnualIncome())
                .casteCategory(profile.getCasteCategory())
                .occupation(profile.getOccupation())
                .educationLevel(profile.getEducationLevel())
                .isBpl(profile.getIsBpl())
                .disabilityStatus(profile.getDisabilityStatus())
                .maritalStatus(profile.getMaritalStatus())
                .landHoldingAcres(profile.getLandHoldingAcres())
                .build();
    }
}