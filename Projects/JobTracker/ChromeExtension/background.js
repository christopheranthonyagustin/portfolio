console.log(
    "BACKGROUND.JS LOADED"
);

const API_BASE_URL_JOBS = "YOUR_API";


chrome.runtime.onMessage.addListener(
    (
        request,
        sender,
        sendResponse
    ) => {

        console.log(
            "BACKGROUND RECEIVED MESSAGE"
        );

        console.log(
            request
        );

        if (
            request.action ===
            "sendToGoogleSheet"
        ) {

            handleGoogleSheet(
                request,
                sendResponse
            );

            return true;
        }

        if (
            request.action ===
            "careerOpsAnalyze"
        ) {

            handleCareerOps(
                request,
                sendResponse
            );

            return true;
        }

        console.log(
            "UNKNOWN ACTION"
        );

        console.log(
            "SENDING TO GOOGLE SHEET..."
        );

        console.log(
            request.url
        );

        console.log(
            request.data
        );

        fetch(
            request.url,
            {
                method: "POST",
                headers: {
                    "Content-Type":
                        "application/json"
                },
                body:
                    JSON.stringify(
                        request.data
                    )
            }
        )
            .then(
                async response => {

                    console.log(
                        "FETCH STATUS:"
                    );

                    console.log(
                        response.status
                    );

                    const text =
                        await response.text();

                    console.log(
                        "RAW RESPONSE:"
                    );

                    console.log(
                        text
                    );

                    try {

                        const data =
                            JSON.parse(
                                text
                            );

                        console.log(
                            "PARSED RESPONSE:"
                        );

                        console.log(
                            data
                        );

                        sendResponse(
                            data
                        );
                    }
                    catch (error) {

                        console.error(
                            "JSON PARSE ERROR"
                        );

                        console.error(
                            error
                        );

                        sendResponse({
                            success: false,
                            error:
                                "Invalid JSON response",
                            raw:
                                text
                        });
                    }
                }
            )
            .catch(
                error => {

                    console.error(
                        "FETCH ERROR"
                    );

                    console.error(
                        error
                    );

                    sendResponse({
                        success: false,
                        error:
                            error.toString()
                    });
                }
            );

        return true;
    }
);

async function handleCareerOps(
    request,
    sendResponse
) {

    try {

        console.log(
            "CALLING CAREEROPS API"
        );

        console.log(
            request.data
        );

        const response =
            await fetch(
                API_BASE_URL_JOBS,
                {
                    method: "POST",

                    headers: {
                        "Content-Type":
                            "application/json"
                    },

                    body:
                        JSON.stringify(
                            request.data
                        )
                }
            );

        const data =
            await response.json();

        console.log(
            "CAREEROPS RESPONSE"
        );

        console.log(
            data
        );

        sendResponse({
            success: true,
            data
        });
    }
    catch (error) {

        console.error(
            "CAREEROPS ERROR"
        );

        console.error(
            error
        );

        sendResponse({
            success: false,
            error:
                error.message
        });
    }
}