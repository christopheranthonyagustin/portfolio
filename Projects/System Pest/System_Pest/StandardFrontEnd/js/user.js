
$(document).ready(function () {

    
    //Pageload

        var getUsername = sessionStorage.getItem("SetUsername");
        var getPassword = sessionStorage.getItem("SetPassword");

    //Populate 

        var user = $('#username').val(getUsername);
        var pass = $('#password').val(getPassword);

        var GetTrackVersion = "sg";
        var GetUserID;
        var GetCompany;
        var GetCompanyID;
        var GetEmail;
	    var GetPhone;
        var GetName;
        var GetRoleID;
        var GetRoleDesc;
        var GetUser;
        var md = new MobileDetect(window.navigator.userAgent);
        var GetComputer = md.ua;
        var GetCurrentDate;
	    var GetNotifications;
        var GetResellerID;
        var GetResellerDesc;
	    var GetImage;
        var GetImageFill;
        var GetUserAssets;
        var GetImageCompany;
        var GetImageFillCompany;

    // Vehicle Submit
    $('#submit-user').on('click', function () {

        var getPassword = "";
        var hash = "";
        //Remember Me Login Form

        try
        {
            if (check.checked)
            {            
               var username = $('#username').val();
               var password = $('#password').val();
               sessionStorage.setItem("SetUsername", username);
               sessionStorage.setItem("SetPassword", password);
            }

            else
            {
              sessionStorage.removeItem("SetPassword");
            }
        }
        catch (e)
        {

              console.log('You got this error: ' + e);
        }


        jQuery.support.cors = true;

        function createCORSRequest(method, url) {
            var xhr = new XMLHttpRequest();
            if ("withCredentials" in xhr) {

                // Check if the XMLHttpRequest object has a "withCredentials" property.
                // "withCredentials" only exists on XMLHTTPRequest2 objects.
                xhr.open(method, url, true);

            } else if (typeof XDomainRequest != "undefined") {

                // Otherwise, check if XDomainRequest.
                // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                xhr = new XDomainRequest();
                xhr.open(method, url);

            } else {

                // Otherwise, CORS is not supported by the browser.
                xhr = null;

            }
            return xhr;
        }

        var url = 'https://app.track-asia.com/spwebapi/api/login';
        var xhr = createCORSRequest('GET', url);
        xhr.send();
        if (!xhr) {
            throw new Error('CORS not supported');
        }


	    getPassword = $('#password').val();
        hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);

        var userlogin = {
            User: $('#username').val(),
            Password: hash        
        };


        $.ajax({
            url: "https://app.track-asia.com/spwebapi/api/login",
            type: "POST",
            data: JSON.stringify(userlogin),
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
            success: function (userlogin) {
                //console.log(userlogin);
                if (userlogin.ErrorMessage == null)
                {
                        function getStorageCount() {
                            var count = 0;
                            if (sessionStorage) {
                                count = sessionStorage.getItem("setSessionstorageValueUserLoginCount");
                                count = !count ? count = 0 : count * 1;
                            }

                            return count;
                        }
                        function setStorageCount(count) {
                            if (sessionStorage)
                                sessionStorage.setItem("setSessionstorageValueUserLoginCount", count);
                        }


                        $(function () {

                            var count = getStorageCount();
                            count++;
                            setStorageCount(count);
                            getStorageCount();


                            $.getJSON('https://api.ipify.org?format=json', function (data) {
                                console.log("Client IP: " + data.ip);
                                sessionStorage.setItem("setSessionstorageValueIP", data.ip);
                            });

                        });

                        GetUserID = userlogin.UserID;
                        GetCompany = userlogin.Company;
                        GetCompanyID = userlogin.CompanyID;
                        GetEmail = userlogin.Email;
                        GetPhone = userlogin.Phone;
                        GetName = userlogin.Name;
                        GetRoleID = userlogin.RoleID;
                        GetRoleDesc = userlogin.RoleDesc;
                        GetUser = userlogin.User;
                        GetNotifications = userlogin.Notifications;
                        GetResellerID = userlogin.ResellerID;
                        GetResellerDesc = userlogin.ResellerDesc;
                        GetImage = userlogin.Image;
                        GetImageFill = userlogin.ImageFill;
                        GetUserAssets = userlogin.Assets;
                        GetImageCompany = userlogin.ImageCompany;
                        GetImageFillCompany = userlogin.ImageFillCompany;
                        GetCurrentDate = moment.utc().add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
                        sessionStorage.setItem("setSessionstorageValueTrackVersion", GetTrackVersion);
                        sessionStorage.setItem("setSessionstorageValueUserID", GetUserID);
                        sessionStorage.setItem("setSessionstorageValueCompany", GetCompany);
                        sessionStorage.setItem("setSessionstorageValueCompanyID", GetCompanyID);
                        sessionStorage.setItem("setSessionstorageValueEmail", GetEmail);
                        sessionStorage.setItem("setSessionstorageValuePhone", GetPhone);
                        sessionStorage.setItem("setSessionstorageValueName", GetName);
                        sessionStorage.setItem("setSessionstorageValueRoleID", GetRoleID);
                        sessionStorage.setItem("setSessionstorageValueRoleDesc", GetRoleDesc);
                        sessionStorage.setItem("setSessionstorageValueUser", GetUser);
                        sessionStorage.setItem("setSessionstorageValueComputer", GetComputer);      
                        sessionStorage.setItem("setSessionstorageValueUserLoginDate", GetCurrentDate);
                        sessionStorage.setItem("setSessionstorageValueUserNotifications", GetNotifications);
                        sessionStorage.setItem("setSessionstorageValueUserResellerID", GetResellerID);
                        sessionStorage.setItem("setSessionstorageValueUserResellerDesc", GetResellerDesc);
                        sessionStorage.setItem("setSessionstorageValueUserImage", GetImage);
                        sessionStorage.setItem("setSessionstorageValueUserImageFill", GetImageFill);
                        sessionStorage.setItem("setSessionstorageValueUserAssets", GetUserAssets);
                        sessionStorage.setItem("setSessionstorageValueUserImageCompany", GetImageCompany);
                        sessionStorage.setItem("setSessionstorageValueUserImageFillCompany", GetImageFillCompany);

                        var getUserLogin = {
                            AssetID: 0,
                            TagID: 0,
                            Timestamp: moment().format(),
                            RxTime: moment().format(),
                            StatusID: 13,
                            Remarks: "Username: " + GetUser + "\n" + "Company:" + GetCompany + "\n" + "IP: " + sessionStorage.getItem("setSessionstorageValueIP") + "\n" + "Computer: " + GetComputer,
                            AlertLevel: 0,
                            AlertLevelEx: 0,
                            Flag: 1,
                            AckUserID: GetRoleID,
                            CompanyID: GetCompanyID
                        };


                        $.ajax({
                            url: "https://app.track-asia.com/spwebapi/api/eventinfo",
                            type: "POST",
                            data: JSON.stringify(getUserLogin),
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
                            success: function (getUserLogin) {
                                console.log(getUserLogin);
                                window.location.href = 'Dashboard/index.html';
                                return false;
                            }
                        });
                     
		
                }

                else
                {
                    var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');
                    if (getSessionstorageValueLanguage == "en") alert('Username or Password invalid');
                    if (getSessionstorageValueLanguage == "th") alert('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง');
                    if (getSessionstorageValueLanguage == "vn") alert('Tên đăng nhập hoặc mật khẩu không hợp lệ');
                    if (getSessionstorageValueLanguage == "id") alert('Username atau Password tidak valid');
                }
               
            }

        });
       
    });

  

})



