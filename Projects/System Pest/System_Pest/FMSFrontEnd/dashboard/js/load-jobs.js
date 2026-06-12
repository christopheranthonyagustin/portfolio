

var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

var titleAreYouSureClear, titleSuccess, titleCancel;

if (getSessionstorageValueLanguage == "en")
{
    titleAreYouSureClear = "Are you sure you wish to clear a job?";
    titleSuccess = "Successful";
    titleCancel = "Canceled";
}
else if (getSessionstorageValueLanguage == "th")
{
    titleAreYouSureClear = "คุณต้องการยกเลิกงานหรือไม่? ";
    titleSuccess = "ประสบความสำเร็จ";
    titleCancel = "ยกเลิก";
}
else if (getSessionstorageValueLanguage == "vn") {
    titleAreYouSureClear = "Bạn có muốn xóa một công việc? ";
    titleSuccess = "Thành công";
    titleCancel = "Đã hủy";
}
else if (getSessionstorageValueLanguage == "id") {
    titleAreYouSureClear = "Anda ingin menghapus kerja? ";
    titleSuccess = "Berjaya";
    titleCancel = "Dibatalkan";
}

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

        location.reload();


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





//Storage
$(document).ready(function () {


    try {

        var getAsset = $("#load-assets").val();
        var getCompany = $("#load-company").val();
        var getReseller = $("#load-reseller").val();

        localStorage.setItem("setLocalstorageValueAsset", getAsset);
        localStorage.setItem("setLocalstorageValueCompany", getCompany);
        localStorage.setItem("setLocalstorageValueReseller", getReseller);

        var getLocalstorageValueAsset = localStorage.getItem('setLocalstorageValueAsset');
        var getLocalstorageValueCompany = localStorage.getItem('setLocalstorageValueCompany');
        var getLocalstorageValueReseller = localStorage.getItem('setLocalstorageValueReseller');

    }
    catch (e) {

        alert('You got this error: ' + e);
    }



    //Then retrieve
    var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
    var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
    var getSessionstorageValueEmail = sessionStorage.getItem('setSessionstorageValueEmail');
    var getSessionstorageValueName = sessionStorage.getItem('setSessionstorageValueName');
    var getSessionstorageValueRoleDesc = sessionStorage.getItem('setSessionstorageValueRoleDesc');
    var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');

    if (getSessionstorageValueUser == null | getSessionstorageValueUser == undefined | getSessionstorageValueUser == "") {


        localStorage.clear();
        window.location.href = 'http://track-asia.com/systempest/'; //Login URL
        //window.location.href = '/'; //Login URL

    }

    else {


        //Set
        sessionStorage.setItem("setSessionstorageValueCompany", getSessionstorageValueCompany);
        sessionStorage.setItem("setSessionstorageValueCompanyID", getSessionstorageValueCompanyID);
        sessionStorage.setItem("setSessionstorageValueEmail", getSessionstorageValueEmail);
        sessionStorage.setItem("setSessionstorageValueName", getSessionstorageValueName);
        sessionStorage.setItem("setSessionstorageValueRoleDesc", getSessionstorageValueRoleDesc);
        sessionStorage.setItem("setSessionstorageValueUser", getSessionstorageValueUser);


        $('#load-username').append($('<div></div>').val(getSessionstorageValueUser).html(getSessionstorageValueUser));
        $('#load-email').append($('<p></p>').val(getSessionstorageValueEmail).html(getSessionstorageValueEmail));

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
  

$('#clear-job').on('click', function () {

    if (getSessionstorageValueLanguage == "en") {
        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });
    }
    else if (getSessionstorageValueLanguage == "th") {
        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });
    }
    else if (getSessionstorageValueLanguage == "vn") {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "vi",


        });
    }
    else if (getSessionstorageValueLanguage == "id") {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "id",


        });
    }

    bootbox.confirm("<div style='color:black'>" + titleAreYouSureClear + "</div>", function (result) {

        if (result) {

            $.niftyNoty({
                type: 'success',
                icon: 'fa fa-check',
                message: titleSuccess,
                container: 'floating',
                timer: 3000
            });


            clearJobForms();

        }


        else {
            $.niftyNoty({
                type: 'danger',
                icon: 'fa fa-minus',
                message: titleCancel,
                container: 'floating',
                timer: 3000
            });
        };

    });

});

$(document).ready(function () {


    var accessories = [];

    $.each($("input[name='accessories']:checked"), function () {

        accessories.push($(this).val());

    });

    //Set
    sessionStorage.setItem("setSessionstorageValueAccessories", accessories.join(","));

});


$(document).ready(function () {


    var accessoriesOnChange = [];

    $("#accessoriesTable").change(function () {

        accessoriesOnChange = [];

        $.each($("input[name='accessories']:checked"), function () {

            accessoriesOnChange.push($(this).val());

        });

        //Set
        sessionStorage.setItem("setSessionstorageValueAccessories", accessoriesOnChange.join(","));

    });


});



var WebAPIDriver = "";

if (getSessionstorageValueRoleID == 1) {
    WebAPIDriver = 'http://117.120.7.119/spwebapi/api/driverinfoex?ResellerID=' + '1' + '&CompanyID=' + '1';
}

else if (getSessionstorageValueRoleID == 2) {
    WebAPIDriver = 'http://117.120.7.119/spwebapi/api/driverinfoex?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

}
else if (getSessionstorageValueRoleID >= 3) {
    WebAPIDriver = 'http://117.120.7.119/spwebapi/api/driverinfoex?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
}

$.getJSON(WebAPIDriver, function (data) {
    $.each(data, function (index, item) {

        if (item.AssetID != 0) {
            $('#driver').append(
            $('<option data-imagesrc="' + item.Image + '"></option>').val(item.Name).html(item.Name)
            );

        } else {
            $('#driver').append(
            $('<option data-imagesrc="' + item.Image + '"></option>').val(item.Name).html(item.Name)
            );
        }
    });

    $('.selectpicker').selectpicker('refresh');
});


function clearJobForms() {
    $('#jobid').val('');
    $('#case').val('');
    $('#origin').val('');
    $('#destination').val('');
    $('#date').val('');
    $('#amount').val('');
    $('#caller').val('');
    $('#phone').val('');
    $('#patient').val('');
    $('#remarks').val('');

    $("input[name='accessories']:checkbox").prop('checked', false);
    $('#amount').val('$VND ');
}

function sendAlert() {

    var getCaller = $('#caller').val();
    var getPhone = $('#phone').val();
    var getAddress = $('#origin').val();
    var getDestination = $('#destination').val();
    var getDate = $('#date').val();


    var emailAlert = {
        Sender: "Advance Dispatch System",
         Recipients: sessionStorage.getItem('setSessionstorageValueDriverPhone'),
        Message: "Scheduled (From: " + getAddress + "\r\n" + "To: " + getDestination + " " +"Pickup: " + getDate + ")",
        Timestamp: moment().format(),
        RxTime: moment().format(),
        Flag: 1,
        CompanyID: sessionStorage.getItem('setSessionstorageValueCompanyID'),
        AssetID: sessionStorage.getItem('setSessionstorageValueAvailableAmbulance'),
	JobNumber: $('#case').val(),
    };


    $.ajax({
        url: "http://117.120.7.119/spwebapi/api/messageinfo",
        type: "POST",
        data: JSON.stringify(emailAlert),
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
        success: function (emailAlert) {
            console.log(emailAlert);
        }
    });
}

$(document).ready(function () {


    $('#amount').val('$VND ');

});

$(function () {

    generateJobNumber();
    $('#date').val(moment().format('D-MMM-YYYY, HH:mm'));

});


function generateJobNumber() {

    //populate Job Number
    var date = new Date();
    var todaydate = date.getDate();
    var todaymon = date.getMonth() + 1;
    var todayyear = date.getFullYear();
    //pull the last two digits of the year
    todayyear = todayyear.toString().substr(2, 2);

    var q = todayyear;
    if (todaymon <= 9) {
        var y = "0" + todaymon;
    }
    else
        var y = todaymon;

    if (todaydate <= 9) {
        var z = "0" + todaydate;
    }
    else
        var z = todaydate;


    function randomString() {
        var chars = "0123456789";
        var string_length = 3;
        var randomstring = '';
        for (var i = 0; i < string_length; i++) {
            var rnum = Math.floor(Math.random() * chars.length);
            randomstring += chars.substring(rnum, rnum + 1);
        }

        return randomstring;
    }

    var jobNumber = "JN-" + z + y + q + "-" + randomString();

    $('#case').val(jobNumber);

}


$(function () {

    $('#origin').keyup(function () {

        var from = $('#origin').val();

        if ($(this).val().length == 6)
        {
            geocoder = new google.maps.Geocoder();

            geocoder.geocode({
                'address': from

            }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    console.log(results[0].geometry.location);
                    var coords = results[0].geometry.location;

                    sessionStorage.setItem("setSessionstorageValueScheduledJobCoordinatesFrom", coords);
                    var input = sessionStorage.getItem('setSessionstorageValueScheduledJobCoordinatesFrom');
                    var latlngStr = input.split(',', 2);
                    var lat = parseFloat(latlngStr[0].replace(/\(/g, ""));
                    var lng = parseFloat(latlngStr[1].replace(/\)/g, ""));

                    //Reverse Geocode
                    var getAPI = "http://117.120.7.119/spwebapi/api/reversegeocode?PosY=" + lat + "&PosX=" + lng;
                    console.log(getAPI);

                    //$.getJSON(getAPI, function (data) {

                    //    $.each(data, function (index, item) {
                    //        sessionStorage.setItem("setSessionstorageValueScheduledJobLocationFrom", item.Location);
                    //    });

                    //});

                    $.ajax({
                        type: 'GET',
                        url: getAPI,
                        data: { get_param: 'value' },
                        dataType: 'json',
                        success: function (data) {
                            $.each(data, function (index, element) {
                                sessionStorage.setItem("setSessionstorageValueScheduledJobLocationFrom", element.Location);
                            });
                        }
                    });


                }
                else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }

    });


    $('#destination').keyup(function () {

        var to = $('#destination').val();

        if ($(this).val().length == 6)
        {
            geocoder.geocode({
                'address': to

            }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    console.log(results[0].geometry.location);
                    var coords = results[0].geometry.location;

                    sessionStorage.setItem("setSessionstorageValueScheduledJobCoordinatesTo", coords);
                    var input = sessionStorage.getItem('setSessionstorageValueScheduledJobCoordinatesTo');
                    var latlngStr = input.split(',', 2);
                    var lat = parseFloat(latlngStr[0].replace(/\(/g, ""));
                    var lng = parseFloat(latlngStr[1].replace(/\)/g, ""));

                    //Reverse Geocode
                    var getAPI = "http://117.120.7.119/spwebapi/api/reversegeocode?PosY=" + lat + "&PosX=" + lng;
                    console.log(getAPI);


                    $.ajax({
                        type: 'GET',
                        url: getAPI,
                        data: { get_param: 'value' },
                        dataType: 'json',
                        success: function (data) {
                            $.each(data, function (index, element) {
                                sessionStorage.setItem("setSessionstorageValueScheduledJobLocationTo", element.Location);
                            });
                        }
                    });


                }
                else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }

    });



});

//Hide Call Center Remarks
$(function () {

    if (getSessionstorageValueCompanyID == 4) {
        $('.agentRemarks').hide();
    }

});

//Translation of Forms
if (getSessionstorageValueLanguage == "en") {
    $("#jobOverview").text("Jobs Overview");
    $("#headerSchedule").text("Scheduled Jobs");
    $("#scheduleTime").text("Scheduled Time");
    $("#jobNumber").text("Job Number");
    $("#address").text("Address");
    $("#unit2").text("Unit Nos.");
    $("#postal2").text("Postal Code");
    $("#company").text("Company");
    $("#person").text("Person In Charge");
    $("#contactNumber").text("Contact Number");
    $("#remarks2").text("Remarks");
    $("#phoneUser").text("Phone Users");
    $("#amount2").text("Amount");
    $('#date').attr('placeholder', 'Case Date & Time');
    $('#case').attr('placeholder', 'Job Number');
    $('#destination').attr('placeholder', 'Destination');
    $('#unit').attr('placeholder', 'Unit Nos.');
    $('#postal').attr('placeholder', 'Postal Code');
    $('#company-destination').attr('placeholder', 'Company');
    $('#pic').attr('placeholder', 'Person In Charge');
    $('#phone').attr('placeholder', 'Contact Number');
    $('#remarks').attr('placeholder', 'Remarks');
    $("#clear-job").text("Clear");
    $("#submit-jobEN").text("Submit");

}
else if (getSessionstorageValueLanguage == "th") {
    $("#jobOverview").text("ภาพรวมงาน");
    $("#headerSchedule").text("กำหนดการงาน");
    $("#scheduleTime").text("กำหนดเวลา");
    $("#jobNumber").text("หมายเลขงาน");
    $("#address").text("ที่อยู่");
    $("#unit2").text("หน่วย.");
    $("#postal2").text("ไปรษณีย์");
    $("#company").text("บริษัท");
    $("#person").text("ผู้รับผิดชอบในการปฎิบัติหน้าที่");
    $("#contactNumber").text("เบอร์ติดต่อ");
    $("#remarks2").text("หมายเหตุ");
    $("#phoneUser").text("ผู้ใช้โทรศัพท์");
    $("#amount2").text("จำนวนเงิน");
    $('#date').attr('placeholder', 'วันที่และเวลาของคดี');
    $('#case').attr('placeholder', 'หมายเลขงาน');
    $('#destination').attr('placeholder', 'ที่อยู่');
    $('#unit').attr('placeholder', 'หน่วย.');
    $('#postal').attr('placeholder', 'ไปรษณีย์');
    $('#company-destination').attr('placeholder', 'บริษัท');
    $('#pic').attr('placeholder', 'ผู้รับผิดชอบในการปฎิบัติหน้าที่');
    $('#phone').attr('placeholder', 'เบอร์ติดต่อ');
    $('#remarks').attr('placeholder', 'หมายเหตุ');
    $("#clear-job").text("ชัดเจน");
    $("#submit-jobEN").text("ส่ง");
}
else if (getSessionstorageValueLanguage == "vn") {
    $("#jobOverview").text("Liệt kê công việc");
    $("#headerSchedule").text("Công Việc Theo Lịch");
    $("#scheduleTime").text("Lịch Trình");
    $("#jobNumber").text("Công Việc Số");
    $("#address").text("Địa Chỉ");
    $("#unit2").text("Đơn Vị Nos.");
    $("#postal2").text("Mã Postal");
    $("#company").text("Công Ty");
    $("#person").text("Người Phụ Trách");
    $("#contactNumber").text("Số ĐT Liên Hệ");
    $("#remarks2").text("Nhận Xét");
    $("#phoneUser").text("ĐT Người Dùng");
    $("#amount2").text("Số Lượng");
    $('#date').attr('placeholder', 'Ngày giờ');
    $('#case').attr('placeholder', 'Mã Công Việc');
    $('#unit').attr('placeholder', 'Đơn Vị Nos.');
    $('#destination').attr('placeholder', 'Địa Chỉ');
    $('#postal').attr('placeholder', 'Mã Postal');
    $('#company-destination').attr('placeholder', 'Công Ty');
    $('#pic').attr('placeholder', 'Người Phụ Trách');
    $('#phone').attr('placeholder', 'Số ĐT Liên Hệ');
    $('#remarks').attr('placeholder', 'Nhận Xét');
    $("#clear-job").text("Xóa");
    $("#submit-jobEN").text("Lưu");
}
else if (getSessionstorageValueLanguage == "id") {
    $("#jobOverview").text("Ikhtisar Pekerjaan");
    $("#headerSchedule").text("Kerja Dijadual");
    $("#scheduleTime").text("Jadwal Waktu");
    $("#jobNumber").text("Nomor Kerja");
    $("#address").text("Alamat");
    $("#unit2").text("Unit Nos");
    $("#postal2").text("Pos Kode");
    $("#company").text("Perusahaan");
    $("#person").text("Orang In Charge");
    $("#contactNumber").text("Nomor Kontak");
    $("#remarks2").text("Keterangan");
    $("#phoneUser").text("Pengguna Ponsel");
    $("#amount2").text("Jumlah");
    $('#date').attr('placeholder', 'Tanggal Kasus & Waktu');
    $('#case').attr('placeholder', 'Nomor Kerja');
    $('#destination').attr('placeholder', 'Alamat');
    $('#unit').attr('placeholder', 'Unit Nos.');
    $('#postal').attr('placeholder', 'Pos Kode');
    $('#company-destination').attr('placeholder', 'Perusahaan');
    $('#personInChanrge').attr('placeholder', 'Orang In Charge');
    $('#phone').attr('placeholder', 'Nomor Kontak');
    $('#remarks').attr('placeholder', 'Keterangan');
    $("#clear-job").text("Kosongkan");
    $("#submit-jobEN").text("Serah");
}
