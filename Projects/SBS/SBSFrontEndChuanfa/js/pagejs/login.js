$(document).ready(function () {

    $('#submit-user').on('click', function () {
        var getPassword = $('#password').val();
        var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
        var userlogin = {
            User: $('#username').val(),
            Password: hash
        };

        $.ajax({
            url: "http://66.96.208.81/sbswebapi/api/login",
            type: "POST",
            data: JSON.stringify(userlogin),
            crossDomain: true,
            contentType: 'application/json; charset=utf-8',
            xhrFields: {
                withCredentials: false
            },
            permissions: ["http://*.asiacom.co.th"],
            success: function (userlogin) {
                console.log(userlogin);
                if (userlogin.ErrorMessage == null) {
                    var GetUserID = userlogin.UserID;
                    var GetCompany = userlogin.Company;
                    var GetCompanyID = userlogin.CompanyID;
                    var GetEmail = userlogin.Email;
                    var GetName = userlogin.Name;
                    var GetRoleID = userlogin.RoleID;
                    var GetRoleDesc = userlogin.RoleDesc;
                    var GetUser = userlogin.User;
                    var GetNotifications = userlogin.Notifications;
                    var GetResellerID = userlogin.ResellerID;
                    var GetReports = userlogin.Reports;
                    sessionStorage.setItem("setSessionstorageValueUserID", GetUserID);
                    sessionStorage.setItem("setSessionstorageValueCompany", GetCompany);
                    sessionStorage.setItem("setSessionstorageValueCompanyID", GetCompanyID);
                    sessionStorage.setItem("setSessionstorageValueEmail", GetEmail);
                    sessionStorage.setItem("setSessionstorageValueName", GetName);
                    sessionStorage.setItem("setSessionstorageValueRoleID", GetRoleID);
                    sessionStorage.setItem("setSessionstorageValueRoleDesc", GetRoleDesc);
                    sessionStorage.setItem("setSessionstorageValueUser", GetUser);
                    sessionStorage.setItem("setSessionstorageValueUserNotifications", GetNotifications);
                    sessionStorage.setItem("setSessionstorageValueResellerID", GetResellerID);
                    sessionStorage.setItem("setSessionstorageValueReports", GetReports);
                    window.location.href = 'Dashboard/dashboard.html';
                    return false;
                } else {
                    alert('Username or Password invalid');
                }
            }
        });
    });
});