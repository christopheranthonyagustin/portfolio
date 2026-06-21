console.log("CONTENT SCRIPT LOADED");
const GOOGLE_SCRIPT_URL = "https://script.google.com/macros/s/YOUR_API/exec";

let workflowBInitialized = false;
let lastSelectedJobId = "";
let lastResumeFile = "";
let lastCoverLetter = "";
let applyPageRecovered = false;

window.addEventListener(
    "error",
    event => {

        console.error(
            "ERROR FILE:",
            event.filename
        );

        console.error(
            "ERROR LINE:",
            event.lineno
        );

        console.error(
            "ERROR:",
            event.error
        );
    }
);

//====================================================
// USER PROFILE
//====================================================

const USER_PROFILE = {

    salary: {
        minimum: 130000,
        target: 150000
    },
    setup: {
        WFH: 3,
        Hybrid: 2,
        Onsite: 0
    },
    positions: {

        Excellent: [
            "project manager",
            "technical project manager",
            "senior project manager",
            "project delivery manager",
            "delivery manager",
            "delivery lead",
            "program manager",
            "technical delivery manager",
            "it project manager"
        ],

        Strong: [
            "product manager",
            "product owner",
            "scrum master",
            "implementation manager",
            "solutions manager",
            "analytics manager",
            "business intelligence manager",
            "bi manager",
            "reporting manager"
        ],

        Good: [
            "operations manager",
            "operations",
            "implementation"
        ],

        Moderate: [
            "technical lead",
            "engineering manager",
            "development manager"
        ]
    }
};


//====================================================
// SOURCE DETECTION
//====================================================

function getSourceFromUrl(url) {


    const hostname =
        new URL(url).hostname.toLowerCase();

    const mappings = [{
        keyword: "jobstreet",
        source: "JobStreet"
    },
    {
        keyword: "linkedin",
        source: "LinkedIn"
    },
    {
        keyword: "indeed",
        source: "Indeed"
    },
    {
        keyword: "kalibrr",
        source: "Kalibrr"
    },
    {
        keyword: "foundit",
        source: "Foundit"
    }
    ];

    const match =
        mappings.find(
            x => hostname.includes(x.keyword)
        );

    return match ?
        match.source :
        hostname;


}

//====================================================
// STEP 1 - JOB POSTING
//====================================================

function extractJobStreetJobPosting() {


    const allSpans =
        Array.from(
            document.querySelectorAll("span")
        );

    const postedDate =
        allSpans.find(
            x =>
                /^Posted\s/i.test(
                    x.innerText
                )
        )?.innerText?.trim() || '';

    const applicationVolume =
        allSpans.find(
            x =>
                x.innerText
                    .toLowerCase()
                    .includes(
                        "application volume"
                    )
        )?.innerText?.trim() || '';

    const applicantStatus =
        document.querySelector(
            '[data-testid="job-status-badge"]'
        )?.innerText?.trim() || '';


    return {

        position: document.querySelector(
            '[data-automation="job-detail-title"]'
        )?.innerText?.trim() || '',

        company: document.querySelector(
            '[data-automation="advertiser-name"]'
        )?.innerText?.trim() || '',

        location: document.querySelector(
            '[data-automation="job-detail-location"]'
        )?.innerText?.trim() || '',

        salary: document.querySelector(
            '[data-automation="job-detail-salary"]'
        )?.innerText?.trim() || '',

        applicantStatus,
        postedDate,
        applicationVolume
    };


}

//====================================================
// STEP 2 - APPLICATION DETAILS
//====================================================

function extractJobStreetResumePage() {

    console.log(
        "CAPTURE RESUME PAGE"
    );

    const resumeSelect =
        document.querySelector(
            'select[data-testid="select-input"]'
        );


    let resumeFile = '';

    if (
        resumeSelect &&
        resumeSelect.selectedIndex >= 0
    ) {

        const selectedOption =
            resumeSelect.options[
            resumeSelect.selectedIndex
            ];

        resumeFile =
            selectedOption?.textContent?.trim() || '';

        if (
            resumeFile
                .toLowerCase()
                .includes("please upload")
        ) {

            resumeFile = "";
        }
    }

    console.log(
        "Selected Resume:",
        resumeFile
    );

    let cvVersion = "";

    if (resumeFile) {

        const versionMatch =
            resumeFile.match(
                /(PM_v\d+|TPM_v\d+|OMS_v\d+)/i
            );

        cvVersion =
            versionMatch
                ? versionMatch[1].toUpperCase()
                : "";
    }




    //--------------------------------------------------
    // COVER LETTER
    //--------------------------------------------------

    let coverLetter = "No";

    const writeCoverLetter =
        document.querySelector(
            '[data-testid="coverLetter-method-change"]'
        );

    const uploadCoverLetter =
        document.querySelector(
            '[data-testid="coverLetter-method-upload"]'
        );

    const noCoverLetter =
        document.querySelector(
            '[data-testid="coverLetter-method-none"]'
        );

    if (
        writeCoverLetter?.checked ||
        uploadCoverLetter?.checked
    ) {
        coverLetter = "Yes";
    }

    if (
        noCoverLetter?.checked
    ) {
        coverLetter = "No";
    }

    return {

        resumeFile,
        cvVersion,
        coverLetter
    };

}

//====================================================
// STORAGE
//====================================================

function saveJobPosting(data) {

    console.log("SAVING JOB POSTING");
    console.log(data);

    chrome.storage.local.set(
        {
            jobPosting: data,
            jobId: getJobId()
        }
    );
}

function saveApplicationDetails(data) {


    chrome.storage.local.set({
        applicationDetails: data
    },
        () => {

            console.log(
                "STEP 2 SAVED"
            );

            console.log(data);
        }
    );


}

function buildFinalApplication() {

    if (!chrome?.storage?.local) {
        return;
    }

    const currentJobId =
        getJobId();

    chrome.storage.local.get(
        [
            "jobPosting",
            "applicationDetails",
            "analysisResult"
        ],
        result => {

            const jobPosting =
                result.jobPosting || {};

            const applicationDetails =
                result.applicationDetails || {};

            const analysis =
                result.analysisResult || {};

            const finalApplication = {

                //--------------------------------------------------
                // JOB INFO
                //--------------------------------------------------

                jobId:
                    jobPosting.jobId ||
                    currentJobId,

                position:
                    jobPosting.position || "",

                company:
                    jobPosting.company || "",

                location:
                    jobPosting.location || "",

                salary:
                    jobPosting.salary || "",

                setup:
                    jobPosting.setup || "",

                employmentType:
                    jobPosting.employmentType || "",

                priority:
                    jobPosting.priority || "",

                source:
                    jobPosting.source || "",

                status:
                    jobPosting.status || "",

                url:
                    jobPosting.url || "",

                postedDate:
                    jobPosting.postedDate || "",

                applicantStatus:
                    jobPosting.applicantStatus || "",

                applicationVolume:
                    jobPosting.applicationVolume || "",

                //--------------------------------------------------
                // APPLICATION INFO
                //--------------------------------------------------

                resumeFile:
                    applicationDetails.resumeFile || "",

                cvVersion:
                    applicationDetails.cvVersion || "",

                coverLetter:
                    applicationDetails.coverLetter || "No",

                //--------------------------------------------------
                // AI ANALYSIS
                //--------------------------------------------------

                companyIndustry:
                    analysis.companyIndustry || "",

                jobLevel:
                    analysis.jobLevel || "",

                skillsRequired:
                    (analysis.skillsRequired || [])
                        .join(", "),

                marketFit:
                    analysis.marketFit ||
                    getMarketFit(
                        jobPosting.position,
                        jobPosting.salary,
                        jobPosting.setup
                    ),

                marketFitReason:
                    analysis.marketFitReason || "",

                missingSkills:
                    (analysis.missingSkills || [])
                        .join(", "),

                matchPercentage:
                    analysis.matchPercentage || "",

                aiProcessedDate:
                    analysis.processedDate || "",

                //--------------------------------------------------
                // NOTES
                //--------------------------------------------------

                notes:
                    jobPosting.employmentType || ""
            };

            //--------------------------------------------------
            // DATES
            //--------------------------------------------------

            const now =
                new Date();

            finalApplication.appliedDate =
                now.toISOString()
                    .split("T")[0];

            finalApplication.appliedDateTime =
                now.toISOString();

            //--------------------------------------------------
            // SAVE
            //--------------------------------------------------

            chrome.storage.local.set(
                {
                    finalApplication
                },
                () => {

                    console.log(
                        "FINAL APPLICATION SAVED",
                        {
                            jobId:
                                finalApplication.jobId,

                            position:
                                finalApplication.position,

                            company:
                                finalApplication.company
                        }
                    );
                }
            );
        }
    );
}


//====================================================
// AUTO CAPTURE - STEP 1
//====================================================

function captureJobPosting() {

    const titleElement =
        document.querySelector(
            '[data-automation="job-detail-title"]'
        );

    if (!titleElement) {
        return;
    }

    const job =
        extractJobStreetJobPosting();

    const parsed =
        parseLocation(job.location);

    const priority =
        getPriority(parsed.setup);

    const source =
        getSourceFromUrl(
            location.href
        );

    const employmentType =
        getEmploymentType(
            job.position
        );

    saveJobPosting({

        ...job,

        jobId:
            getJobId(),

        location:
            parsed.location,

        setup:
            parsed.setup,

        employmentType,

        priority,

        source,

        status:
            "Applied",

        url:
            location.href
                .split("?")[0]
                .split("#")[0]
    });

    buildFinalApplication();
}

function parseLocation(locationText) {

    const text =
        (locationText || "").trim();

    let setup = "Onsite";

    if (/hybrid/i.test(text)) {

        setup = "Hybrid";
    }
    else if (
        /remote|work from home|wfh/i.test(text)
    ) {

        setup = "WFH";
    }

    const location =
        text
            .replace(/\(Hybrid\)/gi, "")
            .replace(/\(Remote\)/gi, "")
            .replace(/\(WFH\)/gi, "")
            .trim();

    return {
        location,
        setup
    };
}

function getPriority(setup) {

    switch (setup) {

        case "WFH":
            return "A";

        case "Hybrid":
            return "B";

        case "Onsite":
            return "C";

        default:
            return "C";
    }
}

function parseSalary(salaryText) {

    if (!salaryText) {
        return 0;
    }

    const text =
        salaryText
            .toLowerCase()
            .replace(/,/g, "");

    const kMatches =
        text.match(/\d+\s*k/g);

    if (
        kMatches &&
        kMatches.length > 0
    ) {

        return Math.max(
            ...kMatches.map(
                x => parseInt(x) * 1000
            )
        );
    }

    const matches =
        text.match(/\d+/g);

    if (!matches) {
        return 0;
    }

    return Math.max(
        ...matches.map(Number)
    );
}

function getMarketFit(
    position,
    salary,
    setup
) {

    const title =
        (position || "")
            .toLowerCase()
            .trim();

    let score = 0;

    //--------------------------------------------------
    // POSITION SCORE
    //--------------------------------------------------

    let positionScore = 0;

    for (
        const [level, keywords]
        of Object.entries(
            USER_PROFILE.positions
        )
    ) {

        if (
            keywords.some(
                keyword =>
                    title.includes(
                        keyword
                    )
            )
        ) {

            switch (level) {

                case "Excellent":
                    positionScore =
                        Math.max(
                            positionScore,
                            5
                        );
                    break;

                case "Strong":
                    positionScore =
                        Math.max(
                            positionScore,
                            4
                        );
                    break;

                case "Good":
                    positionScore =
                        Math.max(
                            positionScore,
                            3
                        );
                    break;

                case "Moderate":
                    positionScore =
                        Math.max(
                            positionScore,
                            2
                        );
                    break;
            }
        }
    }

    score += positionScore;

    //--------------------------------------------------
    // SETUP SCORE
    //--------------------------------------------------

    const setupScore =
        USER_PROFILE.setup[
        setup
        ] || 0;

    score += setupScore;

    //--------------------------------------------------
    // SALARY SCORE
    //--------------------------------------------------

    const maxSalary =
        parseSalary(
            salary
        );

    let salaryScore = 0;

    if (
        maxSalary >=
        USER_PROFILE.salary.target
    ) {

        salaryScore = 3;
    }
    else if (
        maxSalary >=
        USER_PROFILE.salary.minimum
    ) {

        salaryScore = 2;
    }

    score += salaryScore;


    //--------------------------------------------------
    // FINAL RESULT
    //--------------------------------------------------

    if (score >= 8) {
        return "Excellent";
    }

    if (score >= 6) {
        return "Strong";
    }

    if (score >= 4) {
        return "Good";
    }

    if (score >= 2) {
        return "Moderate";
    }

    return "Weak";
}


function getEmploymentType(position = "") {

    const title =
        position.toLowerCase();

    if (
        title.includes("part time") ||
        title.includes("part-time")
    ) {
        return "Part time";
    }

    if (
        title.includes("full time") ||
        title.includes("full-time")
    ) {
        return "Full time";
    }

    if (
        title.includes("contract")
    ) {
        return "Contract";
    }

    if (
        title.includes("freelance")
    ) {
        return "Freelance";
    }

    return "";
}


//====================================================
// AUTO CAPTURE - STEP 2
//====================================================

function captureResumePage() {

    const resumeSelect =
        document.querySelector(
            'select[data-testid="select-input"]'
        );

    if (!resumeSelect) {

        captureReviewPage();

        const bodyText =
            document.body.innerText;


        if (
            bodyText.includes("Resume") ||
            bodyText.includes("Cover Letter")
        ) {

            console.log(
                "Resume page detected via text"
            );

            recoverJobInfoFromApplyPage();

            extractReviewPageResume();
        }

        return;
    }

    recoverJobInfoFromApplyPage();

    const applicationData =
        extractJobStreetResumePage();

    if (!applicationData.resumeFile) {
        return;
    }

    if (
        applicationData.resumeFile === lastResumeFile &&
        applicationData.coverLetter === lastCoverLetter
    ) {
        return;
    }

    lastResumeFile =
        applicationData.resumeFile;

    lastCoverLetter =
        applicationData.coverLetter;

    saveApplicationDetails(
        applicationData
    );

    buildFinalApplication();
}

//====================================================
// RESUME / COVER LETTER LISTENERS
//====================================================

function attachResumePageListeners() {


    const resumeSelect =
        document.querySelector(
            'select[data-testid="select-input"]'
        );

    if (
        resumeSelect &&
        !resumeSelect.dataset.jobtracker
    ) {

        resumeSelect.dataset.jobtracker =
            "attached";

        resumeSelect.addEventListener(
            "change",
            () => {

                console.log(
                    "Resume changed"
                );

                captureResumePage();
            }
        );
    }

    const coverLetterRadios =
        document.querySelectorAll(
            'input[name="coverLetter-method"]'
        );

    coverLetterRadios.forEach(
        radio => {

            if (
                radio.dataset.jobtracker
            ) {
                return;
            }

            radio.dataset.jobtracker =
                "attached";

            radio.addEventListener(
                "change",
                () => {

                    console.log(
                        "Cover Letter changed"
                    );

                    captureResumePage();
                }
            );
        }
    );


}

//====================================================
// REVIEW PAGE
//====================================================

function captureReviewPage() {

    const submitButton =
        document.querySelector(
            '[data-testid="review-submit-application"]'
        );

    if (!submitButton) {

        const bodyText =
            document.body.innerText;

        if (
            bodyText.includes("Resume") ||
            bodyText.includes("Cover Letter")
        ) {

            console.log(
                "Resume/Review page detected"
            );

            extractReviewPageResume();
        }

        return;
    }

    buildFinalApplication();

    if (
        submitButton.dataset.jobtracker
    ) {
        return;
    }

    submitButton.dataset.jobtracker =
        "attached";

    submitButton.addEventListener(
        "click",
        async () => {

            console.log(
                "SUBMIT CLICKED"
            );        
        }
    );


}

function extractReviewPageResume() {

    const bodyText =
        document.body.innerText;

    const versionMatch =
        bodyText.match(
            /(PM_v\d+|TPM_v\d+|OMS_v\d+)/i
        );

    let cvVersion = "";

    if (versionMatch) {
        cvVersion =
            versionMatch[1].toUpperCase();
    }

    let coverLetter = "No";

    if (
        /cover letter/i.test(bodyText)
    ) {
        coverLetter = "Yes";
    }

    chrome.storage.local.set(
        {
            applicationDetails: {

                resumeFile:
                    cvVersion,

                cvVersion,

                coverLetter
            }
        },
        () => {

            console.log(
                "REVIEW PAGE RESUME DATA"
            );

            buildFinalApplication();
        }
    );
}

//====================================================
// DEBUG HELPERS
//====================================================

function debugStorage() {


    chrome.storage.local.get(
        null,
        data => {

            console.log(
                "========== STORAGE =========="
            );

            console.log(data);

            console.log(
                "============================="
            );
        }
    );


}

//====================================================
// PAGE DETECTION
//====================================================
function runCapture() {

    //--------------------------------------------------
    // WORKFLOW B (JOBSTREET SEARCH PAGE)
    //--------------------------------------------------

    if (
        isWorkflowBPage()
    ) {

        initializeWorkflowB();

        return;
    }

    const source =
        getSourceFromUrl(
            location.href
        );

    if (
        source !== "JobStreet"
    ) {
        return;
    }

    setTimeout(() => {

        captureJobPosting();

        captureResumePage();

        captureReviewPage();

        attachResumePageListeners();

        detectSuccessPage();

    }, 1000);
}

//====================================================
// URL WATCHER
//====================================================

let lastUrl =
    location.href;

setInterval(() => {


    if (
        location.href !== lastUrl
    ) {

        applyPageRecovered = false;

        lastResumeFile = "";
        lastCoverLetter = "";

        lastUrl =
            location.href;

        runCapture();
        detectSuccessPage();
    }


}, 1000);

//====================================================
// DOM WATCHER
//====================================================

const observer =
    new MutationObserver(() => {

        if (
            getSourceFromUrl(location.href)
            !== "JobStreet"
        ) {
            return;
        }

        if (!isApplyPage()) {
            return;
        }

        attachResumePageListeners();

        if (!lastResumeFile) {
            captureResumePage();
        }

        captureReviewPage();

    });

observer.observe(
    document.documentElement,
    {
        childList: true,
        subtree: true
    }
);

function isApplyPage() {

    return location.pathname.includes(
        "/apply"
    );
}

//====================================================
// INITIAL LOAD
//====================================================

window.addEventListener("load", () => {

    console.log(
        "WINDOW LOADED"
    );

    runCapture();
 
});

//====================================================
// MANUAL DEBUG MESSAGES
//====================================================

chrome.runtime?.onMessage?.addListener(
    (
        request,
        sender,
        sendResponse
    ) => {


        if (
            request.action ===
            "debugStorage"
        ) {

            chrome.storage.local.get(
                null,
                data => {

                    sendResponse(
                        data
                    );
                }
            );

            return true;
        }

        if (
            request.action ===
            "clearStorage"
        ) {

            chrome.storage.local.clear(
                () => {

                    sendResponse({
                        success: true
                    });
                }
            );

            return true;
        }

        if (
            request.action ===
            "getFinalApplication"
        ) {

            chrome.storage.local.get(
                ["finalApplication"],
                result => {

                    sendResponse(
                        result.finalApplication || {}
                    );
                }
            );

            return true;
        }
    }


);

console.log(
    "JOB TRACKER READY"
);



function detectSuccessPage() {

    if (
        !location.href.includes(
            "/apply/success"
        )
    ) {
        return;
    }

    if (
        sessionStorage.getItem(
            "jobTrackerSent"
        )
    ) {
        return;
    }

    sessionStorage.setItem(
        "jobTrackerSent",
        "true"
    );

    setTimeout(
        () => {
            sendToGoogleSheet();
        },
        2000
    );
}


let sendRetryCount = 0;

function sendToGoogleSheet() {

    chrome.storage.local.get(
        ["finalApplication"],
        result => {

            const app =
                result.finalApplication;

            if (
                !app ||
                !app.url
            ) {

                console.error(
                    "No finalApplication found"
                );

                return;
            }

            //--------------------------------------------------
            // RECOVERY
            //--------------------------------------------------

            if (
                (!app.resumeFile ||
                    !app.cvVersion) &&
                sendRetryCount < 3
            ) {

                sendRetryCount++;

                console.warn(
                    `Resume data missing. Retry ${sendRetryCount}/3`
                );

                extractReviewPageResume();

                buildFinalApplication();

                setTimeout(
                    sendToGoogleSheet,
                    1000
                );

                return;
            }

            console.log(
                "SENDING TO GOOGLE"
            );

            console.log(app);

            chrome.runtime.sendMessage(
                {
                    action:
                        "sendToGoogleSheet",

                    url:
                        GOOGLE_SCRIPT_URL,

                    data:
                        app
                },
                response => {

                    if (
                        chrome.runtime.lastError
                    ) {

                        console.error(
                            "RUNTIME ERROR"
                        );

                        console.error(
                            chrome.runtime.lastError
                        );

                        return;
                    }

                    console.log(
                        "GOOGLE RESPONSE"
                    );

                    console.log(
                        response
                    );
                }
            );
        }
    );
}

function recoverJobInfoFromApplyPage() {

    if (applyPageRecovered) {
        return;
    }

    applyPageRecovered = true;

    const container =
        document.getElementById(
            "start-of-content"
        );

    if (!container) {
        return;
    }

    const position =
        container
            .querySelector("h1")
            ?.innerText
            ?.trim() || "";

    const company =
        container
            .querySelector("h1")
            ?.nextElementSibling
            ?.innerText
            ?.trim() || "";

    if (!position) {
        return;
    }

    const employmentType =
        getEmploymentType(position);

    chrome.storage.local.get(
        ["jobPosting"],
        result => {

            const jobPosting =
                result.jobPosting || {};

            jobPosting.jobId =
                getJobId();

            jobPosting.position =
                position;

            if (company) {

                jobPosting.company =
                    company;
            }

            jobPosting.employmentType =
                employmentType;

            jobPosting.source =
                "JobStreet";

            jobPosting.status =
                "Applied";

            jobPosting.url =
                `https://ph.jobstreet.com/job/${getJobId()}`;

            chrome.storage.local.set(
                {
                    jobPosting
                },
                () => {

                    console.log(
                        "APPLY PAGE JOB INFO UPDATED"
                    );

                    console.log({
                        jobId:
                            jobPosting.jobId,
                        position,
                        company,
                        employmentType
                    });
                }
            );
        }
    );
}

function getJobId() {

    const match =
        location.pathname.match(
            /\/job\/(\d+)/
        );

    return match
        ? match[1]
        : "";
}

function isWorkflowBPage() {

    return !!document.querySelector(
        '[data-testid="job-card"]'
    );
}

//let workflowBInitialized = false;
function initializeWorkflowB() {

    if (
        workflowBInitialized
    ) {
        return;
    }

    workflowBInitialized =
        true;

    console.log(
        "WORKFLOW B INITIALIZED"
    );

    chrome.storage.local.remove(
        [
            "jobPosting",
            "applicationDetails",
            "finalApplication"
        ],
        () => {

            console.log(
                "WORKFLOW B RESET COMPLETE"
            );
        }
    );

    watchWorkflowBSelection();
}

function getSelectedJobCard() {

    return document.querySelector(
        '[data-testid="job-card"][aria-selected="true"]'
    );
}

function watchWorkflowBSelection() {

    setInterval(() => {

        const card =
            getSelectedJobCard();

        if (!card) {
            return;
        }

        const jobId =
            card.dataset.jobId;

        if (
            !jobId ||
            jobId === lastSelectedJobId
        ) {
            return;
        }

        lastSelectedJobId =
            jobId;

        console.log(
            "NEW JOB SELECTED:",
            jobId
        );

        saveWorkflowBJobCard(
            card
        );

    }, 500);

}

function saveWorkflowBJobCard(card) {

    const position =
        card.querySelector(
            '[data-testid="job-card-title"]'
        )?.innerText?.trim() || "";

    const company =
        card.querySelector(
            '[data-automation="jobCompany"]'
        )?.innerText?.trim() || "";

    const location =
        card.querySelector(
            '[data-automation="jobLocation"]'
        )?.innerText?.trim() || "";

    const salary =
        card.querySelector(
            '[data-automation="jobSalary"]'
        )?.innerText?.trim() || "";

    const workArrangement =
        card.querySelector(
            '[data-testid="work-arrangement"]'
        )?.innerText?.trim() || "";

    const postedDate =
        card.querySelector(
            '[data-automation="jobListingDate"]'
        )?.innerText?.trim() || "";

    const details =
        extractWorkflowBJobDetails();

    const parsed =
        parseLocation(
            `${location} ${workArrangement}`
        );

    const employmentType =
        getEmploymentType(
            position
        );

    const priority =
        getPriority(
            parsed.setup
        );

    saveJobPosting({

        jobId:
            card.dataset.jobId,

        position,

        company,

        location:
            parsed.location,

        setup:
            parsed.setup,

        salary,

        applicationVolume:
            details.applicationVolume || "",

        employmentType:
            details.employmentType ||
            employmentType, 

        priority,

        source:
            "JobStreet",

        postedDate,

        status:
            "Initial Selection",

        url:
            `https://ph.jobstreet.com/job/${card.dataset.jobId}`
    });

    chrome.storage.local.remove(
        [
            "applicationDetails",
            "finalApplication"
        ],
        () => {

        }
    );

}


function extractWorkflowBJobDetails() {

    const details =
        document.querySelector(
            '[data-automation="jobDetailsPage"]'
        );

    if (!details) {
        return {};
    }

    const employmentType =
        details.querySelector(
            '[data-automation="job-detail-work-type"]'
        )?.innerText?.trim() || "";

    const allSpans =
        Array.from(
            details.querySelectorAll("span")
        );

    const applicationVolume =
        allSpans.find(
            x =>
                /application volume/i.test(
                    x.innerText
                )
        )?.innerText?.trim() || "";

    return {
        employmentType,
        applicationVolume
    };
}


function analyzeWebsite() {

    const source =
        getSourceFromUrl(
            location.href
        );

    if (
        source === "JobStreet"
    ) {

        console.log(
            "JOBSTREET DETECTED - USING EXISTING CAPTURE"
        );

        buildFinalApplication();

        return;
    }

    analyzeGenericWebsite();
}

function analyzeGenericWebsite() {

    const setup =
        detectSetup();

    const priority =
        getPriority(setup);

    const employmentType =
        detectEmploymentType();


    const result = {

        jobId: "",

        company:
            detectCompany(),

        position:
            detectPosition(),

        location:
            detectLocation(),

        salary: "",

        setup,

        employmentType,

        priority,

        source:
            location.hostname,

        status:
            "Analyzed",

        url:
            location.href
    };

    console.log("Result:");
    console.log(result);

    saveJobPosting(
        result
    );

    buildFinalApplication();
}

function detectPosition() {

    return (
        document.querySelector("h1")
            ?.innerText
            ?.trim()
        ||
        document.title
    );
}

function detectCompany() {

    return (
        document.querySelector(
            'meta[property="og:site_name"]'
        )?.content
        ||
        location.hostname
    );
}

function detectLocation() {

    //--------------------------------------------------
    // ATLASSIAN STYLE
    // Sales | Manila, Philippines | Remote, Remote | Full-Time
    //--------------------------------------------------

    const pageText =
        document.body.innerText;

    const locationMatch =
        pageText.match(
            /\|\s*([^|]+?)\s*\|\s*(Remote|Hybrid|Onsite)/i
        );

    if (locationMatch) {

        return locationMatch[1].trim();
    }

    //--------------------------------------------------
    // FALLBACK
    //--------------------------------------------------

    const metaLocation =
        document.querySelector(
            '[data-testid*="location"]'
        )?.innerText?.trim();

    if (metaLocation) {

        return metaLocation;
    }

    return "";
}

function detectSetup() {

    const text =
        document.body.innerText.toLowerCase();

    if (
        text.includes("remote")
    ) {

        return "WFH";
    }

    if (
        text.includes("hybrid")
    ) {

        return "Hybrid";
    }

    return "Onsite";
}

function detectEmploymentType() {

    const text =
        document.body.innerText;

    const match =
        text.match(
            /\b(Full[- ]Time|Part[- ]Time|Contract|Freelance)\b/i
        );

    return match
        ? match[1]
            .replace("-", " ")
        : "";
}



chrome.runtime.onMessage.addListener(
    (request, sender, sendResponse) => {

        if (
            request.action !==
            "analyzeWebsite"
        ) {
            return;
        }

        console.log(
            "ANALYZE WEBSITE RECEIVED"
        );

        (async () => {

            try {

                analyzeWebsite();

                setTimeout(() => {

                    buildFinalApplication();

                    setTimeout(() => {

                        chrome.storage.local.get(
                            ["finalApplication"],
                            result => {

                }
                        );

                    }, 200);

                }, 200);

                //--------------------------------------------------
                // WAIT A MOMENT FOR STORAGE TO UPDATE
                //--------------------------------------------------

                setTimeout(() => {

                    chrome.storage.local.get(
                        ["finalApplication"],
                        result => {

                            const app =
                                result.finalApplication;

                            if (!app) {

                                sendResponse({
                                    success: false,
                                    error:
                                        "No finalApplication found"
                                });

                                return;
                            }

                            console.log(
                                "CALLING CAREEROPS API"
                            );

                            console.log(app);

                            if (
                                request.enableCareerOps === false
                            ) {

                                console.log(
                                    "CAREEROPS DISABLED"
                                );

                                sendResponse({
                                    success: true,
                                    skipped: true
                                });

                                return true;
                            }

                            chrome.runtime.sendMessage(
                                {
                                    action:
                                        "careerOpsAnalyze",

                                    data: {

                                        company:
                                            app.company,

                                        position:
                                            app.position,

                                        url:
                                            app.url,

                                        jobDescription:
                                            document.body.innerText
                                    }
                                },
                                result => {

                                    console.log(
                                        "CAREEROPS RESULT"
                                    );

                                    console.log(
                                        result
                                    );

                                    if (
                                        result?.success
                                    ) {

                                        chrome.storage.local.set(
                                            {
                                                analysisResult: {
                                                    ...result.data,
                                                    processedDate:
                                                        new Date().toISOString()
                                                }
                                            },
                                            () => {

                                                buildFinalApplication();
                                            }
                                        );
                                    }

                                    sendResponse(
                                        result
                                    );
                                }
                            );
                        }
                    );

                }, 500);

            }
            catch (error) {

                console.error(
                    error
                );

                sendResponse({
                    success: false,
                    error:
                        error.message
                });
            }

        })();

        return true;
    }
);


chrome.storage.onChanged.addListener(
    (
        changes,
        areaName
    ) => {

        if (
            areaName !== "local"
        ) {
            return;
        }

        if (
            changes.jobPosting ||
            changes.applicationDetails ||
            changes.finalApplication
        ) {


        }
    }
);