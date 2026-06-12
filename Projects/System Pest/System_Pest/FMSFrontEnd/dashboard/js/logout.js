$(document).ready(function () {

    var logoutURL = '/';
    var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');
    var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
    var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
    var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');
    var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

    var baseAddress = "http://track-asia.com/systempest/";

    //Translate Footer
    if (getSessionstorageValueLanguage == "en") {
        $('#clickLogoutEN').html('Ok');
        $('#clickLogoutEN').attr('title', 'Submit');
    }
    else if (getSessionstorageValueLanguage == "th") {
        $('#clickLogoutEN').html('ตกลง');
        $('#clickLogoutEN').attr('title', 'เสนอ');
    }
    else if (getSessionstorageValueLanguage == "vn") {
        $('#clickLogoutEN').html('Được');
        $('#clickLogoutEN').attr('title', 'Đệ trình');
    }
    else if (getSessionstorageValueLanguage == "id") {

        $('#clickLogoutEN').html('Baik');
        $('#clickLogoutEN').attr('title', 'Menyerahkan');

    }
    //Click Logout
    document.getElementById("clickLogoutEN").onclick = LogoutEN;

    function LogoutEN() {

        var getLocalstorageValueIP = sessionStorage.getItem('setSessionstorageValueIP');
        var getLocalstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
        var md = new MobileDetect(window.navigator.userAgent);
        var GetComputer = md.ua;

        var getUserLogout = {
            AssetID: 0,
            TagID: 0,
            Timestamp: moment().format(),
            RxTime: moment().format(),
            StatusID: 12,
            Remarks: getLocalstorageValueIP + " " + GetComputer,
            AlertLevel: 0,
            AlertLevelEx: 0,
            Flag: 1,
            AckUserID: getLocalstorageValueRoleID,
            CompanyID: getSessionstorageValueCompanyID
        };


        $.ajax({
            url: "http://117.120.7.119/spwebapi/api/eventinfo",
            type: "POST",
            data: JSON.stringify(getUserLogout),
            crossDomain: true,
            contentType: 'application/json; charset=utf-8',
            xhrFields: {
                // The 'xhrFields' property sets additional fields on the XMLHttpRequest.
                // This can be used to set the 'withCredentials' property.
                // Set the value to 'true' if you'd like to pass cookies to the server.
                // If this is enabled, your server must respond with the header
                // 'Access-Control-Allow-Credentials: true'.
                withCredentials: false
            },
            permissions: ["http://*.asiacom.co.th"],
            success: function (getUserLogout) {
                console.log(getUserLogout);



            }

        });

        document.location = logoutURL;

        sessionStorage.clear();
        sessionStorage.removeItem("setSessionstorageValuePerimeterLength");
        sessionStorage.removeItem("setSessionstorageValueIgnition");
        sessionStorage.removeItem("setSessionstorageValueEngine");
        sessionStorage.removeItem("setSessionstorageValueCompany");
        sessionStorage.removeItem("setSessionstorageValueCompanyID");
        sessionStorage.removeItem("setSessionstorageValueEmail");
        sessionStorage.removeItem("setSessionstorageValueName");
        sessionStorage.removeItem("setSessionstorageValueRoleDesc");
        sessionStorage.removeItem("setSessionstorageValueUser");
        localStorage.clear();
        //window.location.href = baseAddress + getSessionstorageValueTrackVersion;
        window.location.href = baseAddress;
        return false;

    }




});


