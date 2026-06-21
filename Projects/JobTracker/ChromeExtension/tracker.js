console.log(
    "TRACKER.JS LOADED"
);

//====================================================
// HELPER
//====================================================


document
    .getElementById(
        "rememberResume"
    )
    ?.addEventListener(
        "change",
        saveDefaultResume
);

function saveDefaultResume() {

    const rememberResume =
        document.getElementById(
            "rememberResume"
        ).checked;

    if (!rememberResume) {

        chrome.storage.local.remove(
            "defaultResume"
        );

        console.log(
            "DEFAULT RESUME REMOVED"
        );

        return;
    }

    const resumeFile =
        document.getElementById(
            "resumeFile"
        )?.files?.[0]?.name || "";

    const cvVersion =
        document.getElementById(
            "cvVersion"
        ).value || "";

    chrome.storage.local.set(
        {
            defaultResume: {
                resumeFile,
                cvVersion
            }
        },
        () => {

            console.log(
                "DEFAULT RESUME SAVED"
            );

            console.log({
                resumeFile,
                cvVersion
            });
        }
    );
}

function setValue(
    id,
    value
) {

    const element =
        document.getElementById(
            id
        );

    if (
        element
    ) {

        element.value =
            value || "";
    }
}

//====================================================
// LOAD STORAGE
//====================================================

function loadStorage() {

    chrome.storage.local.get(
        null,
        data => {

            //--------------------------------------------------
            // DEBUG
            //--------------------------------------------------

            console.log(
                "DEFAULT RESUME",
                data.defaultResume
            );

            //--------------------------------------------------
            // STEP 1
            //--------------------------------------------------

            const jobPosting =
                document.getElementById(
                    "jobPosting"
                );

            if (
                jobPosting
            ) {

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

            const applicationDetails =
                document.getElementById(
                    "applicationDetails"
                );

            if (
                applicationDetails
            ) {

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

            const finalApplication =
                document.getElementById(
                    "finalApplication"
                );

            if (
                finalApplication
            ) {

                finalApplication.textContent =
                    JSON.stringify(
                        data.finalApplication || {},
                        null,
                        2
                    );
            }

            //--------------------------------------------------
            // DATA
            //--------------------------------------------------

            const job =
                data.jobPosting || {};

            const defaultResume =
                data.defaultResume || {};

            console.log(
                "DEFAULT RESUME OBJECT:",
                defaultResume
            );

            //--------------------------------------------------
            // REMEMBER RESUME
            //--------------------------------------------------

            setValue(
                "lastResumeFile",
                defaultResume.resumeFile || ""
            );

            setValue(
                "cvVersion",
                job.cvVersion ||
                defaultResume.cvVersion ||
                ""
            );

            const rememberResumeCheckbox =
                document.getElementById(
                    "rememberResume"
                );

            if (
                rememberResumeCheckbox
            ) {

                rememberResumeCheckbox.checked =
                    !!defaultResume.resumeFile;
            }

            //--------------------------------------------------
            // MANUAL ENTRY
            //--------------------------------------------------

            setValue(
                "company",
                job.company
            );

            setValue(
                "position",
                job.position
            );

            setValue(
                "location",
                job.location
            );

            setValue(
                "salary",
                job.salary
            );

            setValue(
                "setup",
                job.setup
            );

            setValue(
                "employmentType",
                job.employmentType
            );

            setValue(
                "jobId",
                job.jobId
            );

            setValue(
                "postedDate",
                job.postedDate
            );

            setValue(
                "applicationVolume",
                job.applicationVolume
            );

            setValue(
                "applicantStatus",
                job.applicantStatus
            );

            setValue(
                "priority",
                job.priority
            );

            setValue(
                "source",
                job.source
            );

            setValue(
                "status",
                job.status
            );

            setValue(
                "coverLetter",
                job.coverLetter
            );

            setValue(
                "notes",
                job.notes
            );

            setValue(
                "url",
                job.url
            );

            console.log(
                "LAST RESUME FIELD:",
                document.getElementById(
                    "lastResumeFile"
                )?.value
            );
        }
    );
}

//====================================================
// REFRESH
//====================================================

function refreshTracker() {

    console.log(
        "TRACKER REFRESH"
    );

    loadStorage();
}


//====================================================
// AUTO REFRESH
//====================================================

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

            console.log(
                "STORAGE UPDATED"
            );

            loadStorage();
        }
    }
);


function saveManualEntry() {

    if (
        !validateManualEntry()
    ) {

        return;
    }

    const resumeFileInput =
        document.getElementById(
            "resumeFile"
        );

    const jobPosting = {

        company:
            document.getElementById(
                "company"
            ).value,

        position:
            document.getElementById(
                "position"
            ).value,

        location:
            document.getElementById(
                "location"
            ).value,

        salary:
            document.getElementById(
                "salary"
            ).value,

        setup:
            document.getElementById(
                "setup"
            ).value,

        employmentType:
            document.getElementById(
                "employmentType"
            ).value,

        jobId:
            document.getElementById(
                "jobId"
            ).value,

        postedDate:
            document.getElementById(
                "postedDate"
            ).value,

        applicationVolume:
            document.getElementById(
                "applicationVolume"
            ).value,

        applicantStatus:
            document.getElementById(
                "applicantStatus"
            ).value,

        priority:
            document.getElementById(
                "priority"
            ).value,

        source:
            document.getElementById(
                "source"
            ).value,

        status:
            document.getElementById(
                "status"
            ).value,

        cvVersion:
            document.getElementById(
                "cvVersion"
            ).value,

        resumeFile:
            resumeFileInput?.files?.[0]?.name
            || "",

        coverLetter:
            document.getElementById(
                "coverLetter"
            ).value,

        notes:
            document.getElementById(
                "notes"
            ).value,

        url:
            document.getElementById(
                "url"
            ).value
    };

    jobPosting.lastUpdated =
        new Date().toISOString();

    chrome.storage.local.set(
        {
            jobPosting
        },
        () => {

            console.log(
                "MANUAL ENTRY SAVED"
            );

            console.log(
                jobPosting
            );

            buildFinalApplication();

            alert(
                "Manual Entry Updated"
            );
        }
    );
}

function validateManualEntry() {

    const company =
        document.getElementById(
            "company"
        ).value.trim();

    const position =
        document.getElementById(
            "position"
        ).value.trim();

    if (!company) {

        alert(
            "Company is required."
        );

        return false;
    }

    if (!position) {

        alert(
            "Position is required."
        );

        return false;
    }

    return true;
}

function buildFinalApplication() {

    chrome.storage.local.get(
        [
            "jobPosting",
            "applicationDetails"
        ],
        result => {

            const job =
                result.jobPosting || {};

            const app =
                result.applicationDetails || {};

            const finalApplication = {

                ...job,

                resumeFile:
                    app.resumeFile ||
                    job.resumeFile ||
                    "",

                cvVersion:
                    app.cvVersion ||
                    job.cvVersion ||
                    "",

                coverLetter:
                    app.coverLetter ||
                    job.coverLetter ||
                    "No",

                appliedDate:
                    new Date()
                        .toISOString()
                        .split("T")[0],

                appliedDateTime:
                    new Date()
                        .toISOString()
            };

            chrome.storage.local.set(
                {
                    finalApplication
                },
                () => {

                    console.log(
                        "FINAL APPLICATION UPDATED"
                    );
                }
            );
        }
    );
}

//====================================================
// INITIAL LOAD
//====================================================

document.addEventListener(
    "DOMContentLoaded",
    () => {

        console.log(
            "TRACKER READY"
        );

        loadStorage();

        //--------------------------------------------------
        // BUILD FINAL BUTTON
        //--------------------------------------------------

        document
            .getElementById(
                "btnBuildFinal"
            )
            ?.addEventListener(
                "click",
                saveManualEntry
            );

        //--------------------------------------------------
        // RESUME FILE PICKER
        //--------------------------------------------------

        document
            .getElementById(
                "resumeFile"
            )
            ?.addEventListener(
                "change",
                handleResumeFileChange
            );
    }
);


//====================================================
// RESUME FILE PICKER
//====================================================

function handleResumeFileChange(
    event
) {

    const file =
        event.target.files?.[0];

    if (!file) {
        return;
    }

    const match =
        file.name.match(
            /([A-Z]{2,10}_v\d+)/i
        );

    const cvVersion =
        match
            ? match[1].toUpperCase()
            : "";

    document.getElementById(
        "cvVersion"
    ).value =
        cvVersion;

    const rememberResume =
        document.getElementById(
            "rememberResume"
        )?.checked;

    if (
        rememberResume
    ) {

        chrome.storage.local.set({

            defaultResume: {

                resumeFile:
                    file.name,

                cvVersion
            }
        });
    }

    chrome.storage.local.get(
        ["jobPosting"],
        result => {

            const jobPosting =
                result.jobPosting || {};

            jobPosting.resumeFile =
                file.name;

            jobPosting.cvVersion =
                cvVersion;

            chrome.storage.local.set(
                {
                    jobPosting
                }
            );
        }
    );
}