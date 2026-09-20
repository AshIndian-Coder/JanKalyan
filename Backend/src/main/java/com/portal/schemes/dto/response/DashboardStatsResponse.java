package com.portal.schemes.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DashboardStatsResponse {

    private long totalUsers;
    private long totalSchemes;
    private long activeSchemes;
    private long totalApplications;
    private long approvedApplications;
}