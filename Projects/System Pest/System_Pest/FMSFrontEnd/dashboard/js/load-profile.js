var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

$(document).ready(function () {

    //Then retrieve
    var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
    var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
    var getSessionstorageValueEmail = sessionStorage.getItem('setSessionstorageValueEmail');
    var getSessionstorageValueName = sessionStorage.getItem('setSessionstorageValueName');
    var getSessionstorageValueRoleDesc = sessionStorage.getItem('setSessionstorageValueRoleDesc');
    var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');
    var getSessionstorageValueComputer = sessionStorage.getItem('setSessionstorageValueComputer');
    var getSessionstorageValueIP = sessionStorage.getItem('setSessionstorageValueIP');
    var getSessionstorageValueUserLoginCount = sessionStorage.getItem('setSessionstorageValueUserLoginCount');
    var getSessionstorageValueUserLoginDate = sessionStorage.getItem('setSessionstorageValueUserLoginDate');
    var getSessionstorageValueUserPassword = sessionStorage.getItem('SetPassword');
    var getSessionstorageValuePhone = sessionStorage.getItem('setSessionstorageValuePhone');



    if (getSessionstorageValueUser == null | getSessionstorageValueUser == undefined | getSessionstorageValueUser == "") {

        window.location.href = 'http://117.120.7.119/pro/sg/'; //Login URL

    }

    else {

        //Set
        sessionStorage.setItem("setSessionstorageValueCompany", getSessionstorageValueCompany);
        sessionStorage.setItem("setSessionstorageValueCompanyID", getSessionstorageValueCompanyID);
        sessionStorage.setItem("setSessionstorageValueEmail", getSessionstorageValueEmail);
        sessionStorage.setItem("setSessionstorageValueName", getSessionstorageValueName);
        sessionStorage.setItem("setSessionstorageValueRoleDesc", getSessionstorageValueRoleDesc);
        sessionStorage.setItem("setSessionstorageValueUser", getSessionstorageValueUser);
        sessionStorage.setItem("setSessionstorageValueComputer", getSessionstorageValueComputer);
        sessionStorage.setItem("setSessionstorageValueIP", getSessionstorageValueIP);
        sessionStorage.setItem("setSessionstorageValueUserLoginCount", getSessionstorageValueUserLoginCount);
        sessionStorage.setItem("setSessionstorageValueUserLoginDate", getSessionstorageValueUserLoginDate);


        $('#load-username').append($('<div></div>').val(getSessionstorageValueUser).html(getSessionstorageValueUser));
        $('#load-email').append($('<p></p>').val(getSessionstorageValueEmail).html(getSessionstorageValueEmail));

        $('#load-userFullName').append($('<div></div>').val(getSessionstorageValueName).html(getSessionstorageValueName));
        $('#load-computer').append($('<div></div>').val(getSessionstorageValueComputer).html(getSessionstorageValueComputer));
        $('#load-usercount').append($('<p></p>').val(getSessionstorageValueUserLoginCount).html(getSessionstorageValueUserLoginCount));
        $('#load-lastlogin').append($('<p></p>').val(getSessionstorageValueUserLoginDate).html(getSessionstorageValueUserLoginDate));
        
        $('#profileUsername').val(getSessionstorageValueUser);
        $('#profileName').val(getSessionstorageValueName);
        $('#profileNameEN').val(getSessionstorageValueName);
        $('#profileEmail').val(getSessionstorageValueEmail);
        $('#profileEmailEN').val(getSessionstorageValueEmail);
        $('#profilePhoneNumber').val(getSessionstorageValuePhone);
        $('#profilePhoneNumberEN').val(getSessionstorageValuePhone);
        $('#profilePassword').val(getSessionstorageValueUserPassword);
        $('#profilePasswordEN').val(getSessionstorageValueUserPassword);
        $('#profileRePassword').val(getSessionstorageValueUserPassword);
        $('#profileRePasswordEN').val(getSessionstorageValueUserPassword);


        function loadjscssfile(filename, filetype) {
            if (filetype == "js") { //if filename is a external JavaScript file
                var fileref = document.createElement('script')
                fileref.setAttribute("type", "text/javascript")
                fileref.setAttribute("src", filename)
            }
            else if (filetype == "css") { //if filename is an external CSS file
                var fileref = document.createElement("link")
                fileref.setAttribute("rel", "stylesheet")
                fileref.setAttribute("type", "text/css")
                fileref.setAttribute("href", filename)
            }
            if (typeof fileref != "undefined")
                document.getElementsByTagName("head")[0].appendChild(fileref)
        }

        //loadjscssfile("myscript.js", "js") //dynamically load and add this .js file
        //loadjscssfile("javascript.php", "js") //dynamically load "javascript.php" as a JavaScript file

        //load css
        var css = "";
        switch (getSessionstorageValueRoleDesc) {
            case "Super User":
                css = "super";
                break;
            case "Reseller":
                css = "reseller";
                break;
            case "Master User":
                css = "master";
                break;
            case "Company Administrator":
                css = "companyadmin";
                break;
            case "Administrator":
                css = "administrator";
                break;
            case "User Report":
                css = "viewer";
                break;
            case "User w/o Report":
                css = "viewernoreport";
                break;
        }


        loadjscssfile("css/" + css + ".css", "css") ////dynamically load and add this .css file


    }

});


//Session Storage
$(document).ready(function () {

    //Then retrieve
    var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');


    //Set
    sessionStorage.setItem("setSessionstorageValueLanguage", getSessionstorageValueLanguage);


    document.documentElement.lang = getSessionstorageValueLanguage;


    $("#load-lang").val(getSessionstorageValueLanguage);


});


//OnChange Session Storage
$(document).ready(function () {

    $('#load-lang').change(function () {

        //sessionStorage.clear();
        sessionStorage.removeItem("setSessionstorageValueLanguage");

        var lang = $("#load-lang").val();

        //Set
        sessionStorage.setItem("setSessionstorageValueLanguage", lang);


    });


});


$(document).ready(function () {

    $.ajax({
        type: "GET",
        url: "data/version.txt",
        async: false,
        dataType: "text",
        success: function (data) {


            //Set
            localStorage.setItem("setLocalstorageValueVersion", data);


        },
        error: function () { alert('error'); }
    });

    var version;
    //Then retrieve
    version = localStorage.getItem('setLocalstorageValueVersion');

    document.getElementById("verNum").innerHTML = version;

    document.getElementById("verNumEN").innerHTML = version;

});


var getSessionstorageValueUserImage = sessionStorage.getItem('setSessionstorageValueUserImage');
var getSessionstorageValueUserImageFill = sessionStorage.getItem('setSessionstorageValueUserImageFill');

$(document).ready(function () {

    if (getSessionstorageValueUserImageFill == "Uniform") {
        $("#showProfilePic").attr("src", getSessionstorageValueUserImage);
        //document["showProfilePic"].src = getSessionstorageValueUserImage;
    }


});

$(document).ready(function () {

    $.ajax({
        type: "GET",
        url: "data/software.txt",
        async: false,
        dataType: "text",
        success: function (data) {


            //Set
            localStorage.setItem("setLocalstorageValueSoftware", data);


        },
        error: function () { alert('error'); }
    });


    //Then retrieve
    var version = localStorage.getItem('setLocalstorageValueSoftware');

    document.getElementById("software").innerHTML = version;
    document.getElementById("softwareEN").innerHTML = version;


});

//Translation of Forms
if (getSessionstorageValueLanguage == "en") {
    $("#jobOverview").text("Jobs Overview");
    $("#email").text("Email");
    $("#lastlogin").text("Last Login:");


}
else if (getSessionstorageValueLanguage == "th") {
    $("#jobOverview").text("ภาพรวมงาน");
    $("#email").text("อีเมล");
    $("#lastlogin").text("เข้าสู่ระบบครั้งล่าสุด:");

}
else if (getSessionstorageValueLanguage == "vn") {
    $("#jobOverview").text("Liệt kê công việc");
    $("#email").text("Email");
    $("#lastlogin").text("Lân đăng nhập cuôi:");

}
else if (getSessionstorageValueLanguage == "id") {
    $("#jobOverview").text("Ikhtisar Pekerjaan");
    $("#email").text("Alamat Email");
    $("#lastlogin").text("Login terakhir:");


}
