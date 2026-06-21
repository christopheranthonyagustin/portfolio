console.log(
    "POPUP.JS LOADED"
);

const GOOGLE_APP_API = "https://script.google.com/macros/s/YOUR_API/exec";


//====================================================
// SEND TO GOOGLE SHEET
//====================================================

const btnSend =
    document.getElementById(
        "btnSend"
    );

if (btnSend) {

    btnSend.disabled = false;

    btnSend.addEventListener(
        "click",
        async () => {

            chrome.storage.local.get(
                ["finalApplication"],
                async result => {

                    const data =
                        result.finalApplication;

                    if (
                        !data ||
                        !data.url
                    ) {

                        alert(
                            "No application found."
                        );

                        return;
                    }

                    try {

                        const response =
                            await fetch(
                                GOOGLE_APP_API,
                                {
                                    method:
                                        "POST",

                                    headers: {
                                        "Content-Type":
                                            "application/json"
                                    },

                                    body:
                                        JSON.stringify(
                                            data
                                        )
                                }
                            );

                        const result =
                            await response.json();

                        console.log(
                            result
                        );

                        if (
                            !result.success
                        ) {

                            alert(
                                result.message ||
                                result.error
                            );

                            btnSend.disabled =
                                false;

                            return;
                        }

                        btnSend.disabled =
                            true;

                        alert(
                            "Successfully sent. ID: " +
                            result.id
                        );

                        if (
                            !confirm(
                                "Are you sure you want to clear all tracker data?"
                            )
                        ) {

                            return;
                        }

                        chrome.storage.local.clear(
                            () => {

                                alert(
                                    "Storage cleared."
                                );

                                loadStorage();
                            }
                        );

                    }
                    catch (error) {

                        console.error(
                            error
                        );

                        alert(
                            "Failed to send."
                        );

                        btnSend.disabled =
                            false;
                    }
                }
            );
        }
    );
}

//====================================================
// OPEN TRACKER
//====================================================

const btnOpenTracker =
    document.getElementById(
        "btnOpenTracker"
    );

if (btnOpenTracker) {

    btnOpenTracker.addEventListener(
        "click",
        () => {

            chrome.windows.create({

                url:
                    chrome.runtime.getURL(
                        "tracker.html"
                    ),

                type:
                    "popup",

                width:
                    1200,

                height:
                    900,

                focused:
                    true
            });
        }
    );
}

//====================================================
// ANALYZE WEBSITE
//====================================================

const btnAnalyze =
    document.getElementById(
        "btnAnalyzeWebsite"
    );

if (btnAnalyze) {

    btnAnalyze.addEventListener(
        "click",
        async () => {

            console.log(
                "ANALYZE CLICKED"
            );

            const enableCareerOps =
                document.getElementById(
                    "enableCareerOps"
                )?.checked ?? true;

            console.log(
                "CareerOps Enabled:",
                enableCareerOps
            );

            const [tab] =
                await chrome.tabs.query({
                    active: true,
                    currentWindow: true
                });

            chrome.tabs.sendMessage(
                tab.id,
                {
                    action:
                        "analyzeWebsite",

                    enableCareerOps:
                        enableCareerOps
                },
                response => {

                    console.log(
                        "SEND MESSAGE RESPONSE"
                    );

                    console.log(
                        response
                    );

                    if (
                        chrome.runtime.lastError
                    ) {

                        console.error(
                            "RUNTIME ERROR:"
                        );

                        console.error(
                            chrome.runtime.lastError
                        );

                        return;
                    }

                    if (
                        response?.success
                    ) {

                        console.log(
                            "ANALYSIS SUCCESS"
                        );
                    }
                    else {

                        console.warn(
                            "ANALYSIS FAILED"
                        );

                        console.warn(
                            response
                        );
                    }
                }
            );
        }
    );
}

//====================================================
// DEBUG VIEW
//====================================================

function loadData() {

    const jobPosting =
        document.getElementById(
            "jobPosting"
        );

    const applicationDetails =
        document.getElementById(
            "applicationDetails"
        );

    const finalApplication =
        document.getElementById(
            "finalApplication"
        );

    if (
        !jobPosting &&
        !applicationDetails &&
        !finalApplication
    ) {
        return;
    }

    chrome.storage.local.get(
        null,
        data => {

            //--------------------------------------------------
            // STEP 1
            //--------------------------------------------------

            if (jobPosting) {

                jobPosting.textContent =
                    JSON.stringify(
                        data.jobPosting || {},
                        null,
                        2
                    );
            }

            //--------------------------------------------------
            // STEP 2
            //--------------------------------------------------

            if (applicationDetails) {

                applicationDetails.textContent =
                    JSON.stringify(
                        data.applicationDetails || {},
                        null,
                        2
                    );
            }

            //--------------------------------------------------
            // STEP 3
            //--------------------------------------------------

            if (finalApplication) {

                finalApplication.textContent =
                    JSON.stringify(
                        data.finalApplication || {},
                        null,
                        2
                    );
            }

            //--------------------------------------------------
            // AI ANALYSIS
            //--------------------------------------------------

            const analysis =
                data.analysisResult || {};

            console.log(
                "AI ANALYSIS"
            );

            console.log(
                analysis
            );

            const aiCompanyIndustry =
                document.getElementById(
                    "aiCompanyIndustry"
                );

            if (aiCompanyIndustry) {
                aiCompanyIndustry.textContent =
                    analysis.companyIndustry || "-";
            }

            const aiJobLevel =
                document.getElementById(
                    "aiJobLevel"
                );

            if (aiJobLevel) {
                aiJobLevel.textContent =
                    analysis.jobLevel || "-";
            }

            const aiMarketFit =
                document.getElementById(
                    "aiMarketFit"
                );

            if (aiMarketFit) {
                aiMarketFit.textContent =
                    analysis.marketFit || "-";
            }

            const aiMatchPercentage =
                document.getElementById(
                    "aiMatchPercentage"
                );

            if (aiMatchPercentage) {
                aiMatchPercentage.textContent =
                    analysis.matchPercentage
                        ? `${analysis.matchPercentage}%`
                        : "-";
            }

            const aiSkillsRequired =
                document.getElementById(
                    "aiSkillsRequired"
                );

            if (aiSkillsRequired) {

                aiSkillsRequired.textContent =
                    (analysis.skillsRequired || [])
                        .join(", ");
            }

            const aiMissingSkills =
                document.getElementById(
                    "aiMissingSkills"
                );

            if (aiMissingSkills) {

                aiMissingSkills.textContent =
                    (analysis.missingSkills || [])
                        .join(", ");
            }


            const aiMarketFitReason =
                document.getElementById(
                    "aiMarketFitReason"
                );

            if (aiMarketFitReason) {

                aiMarketFitReason.textContent =
                    analysis.marketFitReason || "-";
            }
        }
    );
}

document.addEventListener(
    "DOMContentLoaded",
    async () => {

        const [tab] =
            await chrome.tabs.query({
                active: true,
                currentWindow: true
            });

        const url =
            tab?.url || "";

        console.log(url);

        if (
            url.includes(
                "jobstreet"
            )
        ) {

            const btnAnalyzeWebsite =
                document.getElementById(
                    "btnAnalyzeWebsite"
                );

            if (
                btnAnalyzeWebsite
            ) {

                btnAnalyzeWebsite.style.display =
                    "none";
            }


            const btnOpenTracker =
                document.getElementById(
                    "btnOpenTracker"
                );

            if (
                btnOpenTracker
            ) {

                btnOpenTracker.style.display =
                    "none";
            }

        }
        else {


            const btnAnalyzeWebsite =
                document.getElementById(
                    "btnAnalyzeWebsite"
                );

            if (
                btnAnalyzeWebsite
            ) {

                btnAnalyzeWebsite.style.display =
                    "block";
            }


            const btnOpenTracker =
                document.getElementById(
                    "btnOpenTracker"
                );

            if (
                btnOpenTracker
            ) {

                btnOpenTracker.style.display =
                    "block";
            }
      
        }
    }
);

loadData();

chrome.storage.onChanged.addListener(
    (
        changes,
        areaName
    ) => {

        if (
            areaName === "local"
        ) {

            loadData();
        }
    }
);


//====================================================
// CLEAR STORAGE
//====================================================


function clearStorage() {

    const confirmed =
        confirm(
            "Are you sure you want to clear all Job Tracker data?"
        );

    if (!confirmed) {
        return;
    }

    chrome.storage.local.clear(
        () => {

            console.log(
                "LOCAL STORAGE CLEARED"
            );

            alert(
                "Storage cleared successfully."
            );

            loadStorage();
        }
    );
}

document
    .getElementById(
        "btnClearStorage"
    )
    ?.addEventListener(
        "click",
        clearStorage
);