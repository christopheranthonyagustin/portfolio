$(document).ready(function () {

    //var logoutURL = 'https://track-asia.com/sg/';
    var logoutURL = '/';
    var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');
    var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
    var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');

    //Click Logout

    document.getElementById("clickLogoutEN").onclick = LogoutEN;



    function LogoutEN() {

		var getUsername = sessionStorage.getItem("SetUsername");
        var getPassword = sessionStorage.getItem("SetPassword");
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
            url: "https://app.track-asia.com/tracksgwebapi/api/eventinfo",
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
            permissions: ["https://*.asiacom.co.th"],
            success: function (getUserLogout) {
                console.log(getUserLogout);


            }
            //error: function () { alert('Logout Error'); }

        });

        document.location = logoutURL;


        //sessionStorage.removeItem("setSessionstorageValueUser");
        //sessionStorage.clear();
		
		var username = getUsername;
        var password = getPassword;
        sessionStorage.setItem("SetUsername", username);
        sessionStorage.setItem("SetPassword", password);


        sessionStorage.removeItem("setSessionstorageValueComputer");
        sessionStorage.removeItem("setSessionstorageValueDefaultCompany");
        sessionStorage.removeItem("setSessionstorageValueDefaultReseller");
        sessionStorage.removeItem("setSessionstorageValueEmail");
        sessionStorage.removeItem("setSessionstorageValueName");
        sessionStorage.removeItem("setSessionstorageValuePhone");
        sessionStorage.removeItem("setSessionstorageValueRoleDesc");
        sessionStorage.removeItem("setSessionstorageValueRoleID");
        sessionStorage.removeItem("setSessionstorageValueTrackVersion");
        sessionStorage.removeItem("setSessionstorageValueUser");
        sessionStorage.removeItem("setSessionstorageValueUserAssets");
        sessionStorage.removeItem("setSessionstorageValueUserID");
        sessionStorage.removeItem("setSessionstorageValueUserImage");
        sessionStorage.removeItem("setSessionstorageValueUserImageFill");
        sessionStorage.removeItem("setSessionstorageValueUserLoginCount");
        sessionStorage.removeItem("setSessionstorageValueUserLoginDate");
        sessionStorage.removeItem("setSessionstorageValueUserNotifications");
        sessionStorage.removeItem("setSessionstorageValueUserResellerDesc");
        sessionStorage.removeItem("setSessionstorageValueUserResellerID");
        sessionStorage.removeItem("setSessionstorageValueZoneColor");
		
		
	    sessionStorage.removeItem("setSessionstorageValuePerimeterLength");
        sessionStorage.removeItem("setSessionstorageValueIgnition");
        sessionStorage.removeItem("setSessionstorageValueEngine");
        sessionStorage.removeItem("setSessionstorageValueCompany");
        sessionStorage.removeItem("setSessionstorageValueCompanyID");
        //sessionStorage.removeItem("setSessionstorageValueEmail");
        //sessionStorage.removeItem("setSessionstorageValueName");
        //sessionStorage.removeItem("setSessionstorageValueRoleDesc");
		
		
        //sessionStorage.removeItem("setSessionstorageValueUser");
        //localStorage.clear();
	    //sessionStorage.clear();
        //window.location.reload(true);
        window.location.href = 'https://track-asia.com/sg/';
        //window.location.href = '/';
        

        return false;

    }


    

});


