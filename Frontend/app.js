/* =========================================================
   GOVERNMENT ELIGIBILITY PORTAL
   Frontend-only JavaScript prototype
   ========================================================= */

"use strict";

/* ---------------------------------------------------------
   MOCK SCHEME DATA
   --------------------------------------------------------- */

const schemes = [
    {
        id: 1,
        name: "PM-KISAN",
        category: "Agriculture",
        description:
            "Income support for eligible farmer families.",
        benefits: [
            "Financial assistance",
            "Direct benefit transfer",
            "Support for eligible farmer families"
        ],
        eligibility: [
            "Applicant should be an eligible farmer",
            "Applicant must satisfy the applicable scheme conditions",
            "Required documents must be available"
        ],
        documents: [
            "Identity proof",
            "Bank account details",
            "Land/farmer records"
        ]
    },

    {
        id: 2,
        name: "Post-Matric Scholarship",
        category: "Education",
        description:
            "Financial support for eligible students pursuing post-matric education.",
        benefits: [
            "Educational financial assistance",
            "Support according to applicable rules",
            "Assistance for eligible students"
        ],
        eligibility: [
            "Applicant should be a student",
            "Applicant must satisfy applicable income/category conditions",
            "Valid educational documents are required"
        ],
        documents: [
            "Identity proof",
            "Income certificate",
            "Student/college documents"
        ]
    },

    {
        id: 3,
        name: "Old Age Pension",
        category: "Social Security",
        description:
            "Social security assistance for eligible senior citizens.",
        benefits: [
            "Financial assistance",
            "Social security support"
        ],
        eligibility: [
            "Applicant must satisfy the applicable age requirement",
            "Applicant must satisfy applicable income/other conditions"
        ],
        documents: [
            "Age proof",
            "Identity proof",
            "Bank account details"
        ]
    },

    {
        id: 4,
        name: "Women Welfare Scheme",
        category: "Women & Child",
        description:
            "Support available to eligible women under applicable welfare programs.",
        benefits: [
            "Financial support",
            "Welfare assistance",
            "Access to applicable services"
        ],
        eligibility: [
            "Applicant must satisfy the applicable conditions",
            "Required documents must be available"
        ],
        documents: [
            "Identity proof",
            "Income certificate",
            "Bank details where applicable"
        ]
    }
];


/* ---------------------------------------------------------
   BASIC PAGE NAVIGATION
   --------------------------------------------------------- */

function showPage(pageId) {

    const pages = document.querySelectorAll(
        ".page, .page-section, [data-page]"
    );

    pages.forEach(page => {
        page.style.display = "none";
    });

    const selectedPage = document.getElementById(pageId);

    if (selectedPage) {
        selectedPage.style.display = "block";
        selectedPage.scrollIntoView({
            behavior: "smooth"
        });
    }
}


/* ---------------------------------------------------------
   SCHEME LIST
   --------------------------------------------------------- */

function displaySchemes(list = schemes) {

    const container =
        document.getElementById("schemeList") ||
        document.querySelector(".scheme-list") ||
        document.querySelector("[data-scheme-list]");

    if (!container) {
        console.warn("Scheme list container not found.");
        return;
    }

    container.innerHTML = "";

    if (list.length === 0) {

        container.innerHTML = `
            <div class="empty-state">
                <h3>No schemes found</h3>
                <p>Try another search or category.</p>
            </div>
        `;

        return;
    }

    list.forEach(scheme => {

        const card = document.createElement("div");

        card.className = "scheme-card";

        card.innerHTML = `
            <div class="scheme-card-content">

                <span class="scheme-category">
                    ${scheme.category}
                </span>

                <h3>
                    ${scheme.name}
                </h3>

                <p>
                    ${scheme.description}
                </p>

                <button
                    class="view-scheme-btn"
                    data-scheme-id="${scheme.id}">
                    View Details
                </button>

                <button
                    class="eligibility-btn"
                    data-scheme-id="${scheme.id}">
                    Check Eligibility
                </button>

            </div>
        `;

        container.appendChild(card);
    });
}


/* ---------------------------------------------------------
   SCHEME DETAILS
   --------------------------------------------------------- */

function showSchemeDetails(schemeId) {

    const scheme = schemes.find(
        item => item.id === Number(schemeId)
    );

    if (!scheme) {
        console.error("Scheme not found:", schemeId);
        return;
    }

    let detailsContainer =
        document.getElementById("schemeDetails");

    if (!detailsContainer) {

        detailsContainer = document.createElement("div");

        detailsContainer.id = "schemeDetails";

        detailsContainer.className = "scheme-details";

        document.body.appendChild(detailsContainer);
    }

    detailsContainer.innerHTML = `

        <div class="scheme-details-box">

            <button
                class="close-details"
                onclick="closeSchemeDetails()">
                ×
            </button>

            <span class="scheme-category">
                ${scheme.category}
            </span>

            <h2>
                ${scheme.name}
            </h2>

            <p>
                ${scheme.description}
            </p>


            <h3>
                Benefits
            </h3>

            <ul>
                ${scheme.benefits
                    .map(item => `<li>${item}</li>`)
                    .join("")}
            </ul>


            <h3>
                Eligibility Criteria
            </h3>

            <ul>
                ${scheme.eligibility
                    .map(item => `<li>${item}</li>`)
                    .join("")}
            </ul>


            <h3>
                Required Documents
            </h3>

            <ul>
                ${scheme.documents
                    .map(item => `<li>${item}</li>`)
                    .join("")}
            </ul>


            <div class="scheme-actions">

                <button
                    class="primary-btn"
                    onclick="startApplication(${scheme.id})">
                    Apply
                </button>

                <button
                    class="secondary-btn"
                    onclick="closeSchemeDetails()">
                    Close
                </button>

            </div>

        </div>
    `;

    detailsContainer.style.display = "block";

    detailsContainer.scrollIntoView({
        behavior: "smooth"
    });
}


function closeSchemeDetails() {

    const details =
        document.getElementById("schemeDetails");

    if (details) {
        details.style.display = "none";
    }
}


/* ---------------------------------------------------------
   ELIGIBILITY CHECKER
   --------------------------------------------------------- */

function openEligibility() {

    const eligibilitySection =
        document.getElementById("eligibility") ||
        document.getElementById("eligibilityChecker") ||
        document.querySelector("[data-eligibility]");

    if (!eligibilitySection) {

        console.warn(
            "Eligibility section not found."
        );

        return;
    }

    eligibilitySection.style.display = "block";

    eligibilitySection.scrollIntoView({
        behavior: "smooth"
    });
}


/* ---------------------------------------------------------
   ELIGIBILITY FORM
   --------------------------------------------------------- */

function checkEligibility() {

    const age =
        Number(
            document.getElementById("age")?.value || 0
        );

    const occupation =
        document.getElementById("occupation")?.value
        ?.toLowerCase() || "";

    const student =
        document.getElementById("student")?.checked ||
        false;

    const results = [];


    schemes.forEach(scheme => {

        let matched = false;

        if (
            scheme.name === "PM-KISAN" &&
            occupation.includes("farmer")
        ) {
            matched = true;
        }

        if (
            scheme.name === "Post-Matric Scholarship" &&
            student
        ) {
            matched = true;
        }

        if (
            scheme.name === "Old Age Pension" &&
            age >= 60
        ) {
            matched = true;
        }

        if (
            scheme.name === "Women Welfare Scheme"
        ) {
            matched = true;
        }

        if (matched) {
            results.push(scheme);
        }
    });


    displayEligibilityResults(results);
}


/* ---------------------------------------------------------
   ELIGIBILITY RESULTS
   --------------------------------------------------------- */

function displayEligibilityResults(results) {

    let resultContainer =
        document.getElementById(
            "eligibilityResults"
        );

    if (!resultContainer) {

        resultContainer = document.createElement("div");

        resultContainer.id =
            "eligibilityResults";

        resultContainer.className =
            "eligibility-results";

        document.body.appendChild(
            resultContainer
        );
    }


    if (results.length === 0) {

        resultContainer.innerHTML = `

            <div class="result-box">

                <h2>
                    Eligibility Results
                </h2>

                <p>
                    No matching schemes were found
                    based on the information entered.
                </p>

            </div>
        `;

    } else {

        resultContainer.innerHTML = `

            <div class="result-box">

                <h2>
                    Eligible Schemes
                </h2>

                <p>
                    We found ${results.length}
                    scheme(s) matching your
                    entered information.
                </p>

                <div class="matched-schemes">

                    ${results.map(scheme => `

                        <div class="matched-scheme">

                            <h3>
                                ${scheme.name}
                            </h3>

                            <p>
                                ${scheme.description}
                            </p>

                            <button
                                onclick="showSchemeDetails(${scheme.id})">
                                View Eligibility Criteria
                            </button>

                        </div>

                    `).join("")}

                </div>

            </div>
        `;
    }


    resultContainer.style.display = "block";

    resultContainer.scrollIntoView({
        behavior: "smooth"
    });
}


/* ---------------------------------------------------------
   SEARCH SCHEMES
   --------------------------------------------------------- */

function searchSchemes() {

    const searchInput =
        document.getElementById(
            "schemeSearch"
        );

    if (!searchInput) return;

    const searchText =
        searchInput.value
            .trim()
            .toLowerCase();


    const filtered =
        schemes.filter(scheme =>

            scheme.name
                .toLowerCase()
                .includes(searchText)

            ||

            scheme.category
                .toLowerCase()
                .includes(searchText)

            ||

            scheme.description
                .toLowerCase()
                .includes(searchText)
        );


    displaySchemes(filtered);
}


/* ---------------------------------------------------------
   CATEGORY FILTER
   --------------------------------------------------------- */

function filterSchemes(category) {

    if (
        !category ||
        category === "all"
    ) {
        displaySchemes(schemes);
        return;
    }


    const filtered =
        schemes.filter(
            scheme =>
                scheme.category === category
        );


    displaySchemes(filtered);
}


/* ---------------------------------------------------------
   SAVE SCHEME
   --------------------------------------------------------- */

function saveScheme(schemeId) {

    let saved =
        JSON.parse(
            localStorage.getItem(
                "savedSchemes"
            )
        ) || [];


    schemeId = Number(schemeId);


    if (!saved.includes(schemeId)) {

        saved.push(schemeId);

        localStorage.setItem(
            "savedSchemes",
            JSON.stringify(saved)
        );

        alert(
            "Scheme saved successfully."
        );

    } else {

        alert(
            "This scheme is already saved."
        );
    }
}


/* ---------------------------------------------------------
   APPLICATION DEMO
   --------------------------------------------------------- */

function startApplication(schemeId) {

    const scheme =
        schemes.find(
            item =>
                item.id === Number(schemeId)
        );

    if (!scheme) return;


    let applications =
        JSON.parse(
            localStorage.getItem(
                "applications"
            )
        ) || [];


    applications.push({

        schemeId: scheme.id,

        schemeName: scheme.name,

        status: "Application Started",

        date:
            new Date()
                .toLocaleDateString()
    });


    localStorage.setItem(
        "applications",
        JSON.stringify(
            applications
        )
    );


    alert(
        `Application started for ${scheme.name}.`
    );
}


/* ---------------------------------------------------------
   LOGIN DEMO
   --------------------------------------------------------- */

function loginUser(event) {

    event.preventDefault();

    const email =
        document.getElementById(
            "loginEmail"
        )?.value || "";

    localStorage.setItem(
        "loggedInUser",
        JSON.stringify({
            email: email
        })
    );


    alert(
        "Login successful in frontend demo."
    );
}


/* ---------------------------------------------------------
   REGISTER DEMO
   --------------------------------------------------------- */

function registerUser(event) {

    event.preventDefault();

    const name =
        document.getElementById(
            "registerName"
        )?.value || "";

    const email =
        document.getElementById(
            "registerEmail"
        )?.value || "";


    localStorage.setItem(
        "registeredUser",
        JSON.stringify({
            name: name,
            email: email
        })
    );


    alert(
        "Registration successful in frontend demo."
    );
}


/* ---------------------------------------------------------
   EVENT LISTENERS
   --------------------------------------------------------- */

document.addEventListener(
    "click",
    function(event) {

        /* View Scheme */

        const viewButton =
            event.target.closest(
                ".view-scheme-btn"
            );

        if (viewButton) {

            showSchemeDetails(
                viewButton.dataset.schemeId
            );

            return;
        }


        /* Check Eligibility */

        const eligibilityButton =
            event.target.closest(
                ".eligibility-btn"
            );

        if (eligibilityButton) {

            openEligibility();

            return;
        }


        /* Close Details */

        const closeButton =
            event.target.closest(
                ".close-details"
            );

        if (closeButton) {

            closeSchemeDetails();

            return;
        }
    }
);


/* ---------------------------------------------------------
   SEARCH EVENT
   --------------------------------------------------------- */

const searchInput =
    document.getElementById(
        "schemeSearch"
    );

if (searchInput) {

    searchInput.addEventListener(
        "input",
        searchSchemes
    );
}


/* ---------------------------------------------------------
   INITIALIZE
   --------------------------------------------------------- */

document.addEventListener(
    "DOMContentLoaded",
    function() {

        displaySchemes();

        console.log(
            "Government Eligibility Portal JavaScript loaded successfully."
        );

    }
);