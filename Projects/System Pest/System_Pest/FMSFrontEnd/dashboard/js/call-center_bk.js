var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');
var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');
var titleJobNumber, titlePhone, titlePersonInCharge, titleScheduleTime, titleAddressTo, titleContactNumber, titleTo, titleAlertTime, titleCallCenter, titlePhoneUser, titleLocation, titleStart, titleEnd, titleSpeed, titleDeviceStatus, titlePhonePower, titleTimestamp, titleEvent, titleRemarks, titleLastKnown, titleJobStatus, titleCustomerCompany, titleUnit, titlePostal, titleAmount, titleSignature, titleEmail, titlePhoneUserAddress, titlePhoneUserProfile, titleJobType;
var titleEnterAddressPostal, titleEnterAddress, titleGeoCodeFail, titleError, titleSelected ,titleCannotEditSchedule , titleJobCompletedCannotLoad ,titleJobLoaded, titleJobNumberNotFound;
if (getSessionstorageValueLanguage == "en") {

    titleJobNumber = "Job Number";
    titlePhone = "Phone";
    titlePersonInCharge = "Person In Charge";
    titleScheduleTime = "Scheduled Time";
    titleAddressTo = "Address To";
    titleContactNumber = "Contact Number";
    titleCallCenter = "Call Center";
    titlePhoneUser = "Phone Users";
    titleLocation = "Location";
    titleStart = "Start";
    titleEnd = "End";
    titleSpeed = "Speed";
    titleDeviceStatus = "Device Status";
    titlePhonePower = "Phone Power";
    //titleCustomerCompany = "Company";
    titleTimestamp = "Timestamp";
    titleEvent = "Event";
    titleRemarks = "Remarks";
    titleLastKnown = "Last Known Location";
    titleJobStatus = "Job Status";
    titleCustomerCompany = "Customer Company";
    titleUnit = "Unit";
    titlePostal = "Postal";
    titleAmount = "Amount";
    titleSignature = "Signature";
    titleEmail = "Email";
    titlePhoneUserAddress = "Phone User Address";
    titlePhoneUserProfile = "Phone User Profile";
    titleJobType = "Job Type";
    titleAlertTime = "Alert Time";
    titleTo = "To"
    titleEnterAddressPostal = "You must enter Address or Postal code";
    titleEnterAddress = "You must enter Address";
    titleGeoCodeFail = "Geocode was not successful for the following reason: ";
    titleError = "Error was: ";
    titleSelected = "You have selected: ";
    titleCannotEditSchedule = "Cannot edit Scheduled Job here";
    titleJobCompletedCannotLoad = "Job is completed & cannot be loaded here!";
    titleJobLoaded = "Job Loaded";
    titleJobNumberNotFound = "Job Number not Found";

} else if (getSessionstorageValueLanguage == "th") {

    titleJobNumber = "หมายเลขงาน";
    titlePhone = "โทรศัพท์";
    titlePersonInCharge = "ผู้รับผิดชอบในการปฎิบัติหน้าที่";
    titleScheduleTime = "กำหนดเวลา";
    titleAddressTo = "ที่อยู่";
    titleContactNumber = "เบอร์ติดต่อ";
    titleCallCenter = "ศูนย์รับแจ้ง";
    titlePhoneUser = "ผู้ใช้โทรศัพท์";
    titleLocation = "สถานที่ตั้ง";
    titleStart = "เริ่มต้น";
    titleEnd = "สิ้นสุด";
    titleSpeed = "ความเร็ว";
    titleDeviceStatus = "สถานะอุปกรณ์";
    titlePhonePower = "โทรศัพท์มือถือ";
    titleTimestamp = "การประทับเวลา";
    titleEvent = "กรณี";
    titleRemarks = "หมายเหตุ";
    titleLastKnown = "สถานที่ล่าสุดที่ทราบ";
    titleJobStatus = "สถานะงาน";
    titleCustomerCompany = "บริษัท";
    titleUnit = "หน่วย";
    titlePostal = "ไปรษณีย์";
    titleAmount = "จำนวน";
    titleSignature = "ลายเซ็น";
    titleEmail = "อีเมล";
    titlePhoneUserAddress = "ที่อยู่ผู้ใช้โทรศัพท์";
    titlePhoneUserProfile = "โปรไฟล์ผู้ใช้โทรศัพท์";
    titleJobType = "ประเภทงาน";
    titleAlertTime = "เวลาแจ้งเตือน";
    titleTo = "สู่"
    titleEnterAddressPostal = "คุณต้องป้อนที่อยู่หรือรหัสไปรษณีย์";
    titleEnterAddress = "คุณต้องป้อนที่อยู่";
    titleGeoCodeFail = "แผนที่ล้มเหลวเนื่องจาก: ";
    titleError = "เกิดข้อผิดพลาด: "
    titleSelected = "คุณเลือกแล้ว: "
    titleCannotEditSchedule = "ไม่สามารถแก้ไขงานที่กำหนดเวลาได้ที่นี่";
    titleJobCompletedCannotLoad = "งานเสร็จสมบูรณ์และไม่สามารถโหลดได้ที่นี่!";
    titleJobLoaded = "โหลดงานแล้ว";
    titleJobNumberNotFound = "ไม่พบหมายเลขงาน";

} else if (getSessionstorageValueLanguage == "vn") {

    titleJobNumber = "Công Việc Số";
    titlePhone = "Điện Thoại";
    titlePersonInCharge = "Người Phụ Trách";
    titleScheduleTime = "Lịch Trình";
    titleAddressTo = "Giải Quyết Dể";
    titleContactNumber = "Số ĐT Liên Hệ";
    titleCallCenter = "Trung Tâm Cuộc Gọi";
    titlePhoneUser = "ĐT Người Dùng";
    titleLocation = "Vị Trí";
    titleStart = "Khởi Dầu";
    titleEnd = "Kết Thúc";
    titleSpeed = "Tốc Dộ";
    titleDeviceStatus = "Trạng Thái Thiết Bị";
    titlePhonePower = "Điện Thoại";
    titleTimestamp = "Dấu Thời Gian";
    titleEvent = "Biến Sự";
    titleRemarks = "Chú ý";
    titleLastKnown = "Vị Trí Được Biết Lần Cuối";
    titleJobStatus = "Trạng Thái Công Việc";
    titleCustomerCompany = "Công Ty";
    titleUnit = "Đơn Vị";
    titlePostal = "Bưu Diện";
    titleAmount = "Số Tiền";
    titleSignature = "Chữ Ký";
    titleEmail = "Email";
    titlePhoneUserAddress = "Địa Chỉ Người Sử Dụng Điện Thoại";
    titlePhoneUserProfile = "Hồ Sơ Người Dùng Điện Thoại";
    titleJobType = "Loại Công Việc";
    titleAlertTime = "Thời Gian Báo";
    titleTo = "Dến"
    titleEnterAddressPostal = "Bạn Phải Nhập Mã Dịa Chỉ Hoặc Mã Bưu Diện";
    titleEnterAddress = "Bạn Phải Nhập Địa chỉ";
    titleGeoCodeFail = "Bản đồ thất bại vì: ";
    titleError = "Lỗi Là: "
    titleSelected = "Bạn đã chọn: "
    titleCannotEditSchedule = "Không Thể Chỉnh Sửa Lịch Trình Công Việc ở Dây";
    titleJobCompletedCannotLoad = "Công Việc Dã Hoàn Thành Và kKhông Thể Tải ở Dây!";
    titleJobLoaded = "Đã Nạp Công Việc";
    titleJobNumberNotFound = "Không Tìm Thấy Số Việc Làm";

} else if (getSessionstorageValueLanguage == "id") {

    titleJobNumber = "Nomor Kerja";
    titlePhone = "Ponsel";
    titlePersonInCharge = "Orang In Charge";
    titleScheduleTime = "Jadwal Waktu";
    titleAddressTo = "Dialamatkan ke";
    titleContactNumber = "Nomor Kontak";
    titleCallCenter = "Call Center";
    titlePhoneUser = "Pengguna Ponsel";
    titleLocation = "Tempat";
    titleStart = "Mulai";
    titleEnd = "Tamat";
    titleSpeed = "Kecepatan";
    titleDeviceStatus = "Status Perangkat";
    titlePhonePower = "Tenaga Ponsel";
    titleTimestamp = "Masa";
    titleEvent = "Peristiwa";
    titleRemarks = "Keterangan";
    titleLastKnown = "Terakhir Dikenal Lokasi";
    titleJobStatus = "Status Kerja";
    titleCustomerCompany = "Perusahaan";
    titleUnit = "Satuan";
    titlePostal = "Kartu Pos";
    titleAmount = "Jumlah";
    titleSignature = "Tanda Tangan";
    titleEmail = "Email";
    titlePhoneUserAddress = "Alamat Telepon Pengguna";
    titlePhoneUserProfile = "Profil Telepon Pengguna";
    titleJobType = "Jenis Kerja";
    titleAlertTime = "Waktu Peringatan";
    titleTo = "Ke"
    titleEnterAddressPostal = "Anda harus memasukkan Alamat atau Kode Pos";
    titleEnterAddress = "Anda harus memasukkan Alamat";
    titleGeoCodeFail = "Peta gagal karena: ";
    titleError = "Sistem Salah karena: "
    titleSelected = "Anda telah memilih: "
    titleCannotEditSchedule = "Tidak Boleh Mengedit Terjadwal Job sini";
    titleJobCompletedCannotLoad = "Kerja selesai & Tidak dapat dimuat disini!";
    titleJobLoaded = "Kerja Dimuat";
    titleJobNumberNotFound = "Nomor Kerja tidak Ditemukan";

}


var MarkerAPI = "";
var geocoder = null;
var map = null;
var customerMarker = null;
var markers = [];
var closest = [];
var assets = [];
var marker, i;
var url;
var infowindow;
var bounds;

var pulse;
var pulses = new Array();

var circle = {};
var circle1 = {};
var polygon1 = {};
var zones = [];
var polygon;
var pathCoordinates = new google.maps.MVCArray();
var polygonCoordinates = new Array();
var circleCoordinates1 = new Array();
var circleCoordinates = new Array();

var geocodeCircle;
var directionsDisplay = new google.maps.DirectionsRenderer();
var directionsService = new google.maps.DirectionsService();
var styleMakers = [];
var styleMaker;
var infoBoxList = [];
var infoBubble;
var icon = "";
var iconURL = "img/markers/";
var iconURLOnClick = "img/no-bg/";
var markerCategory = "";
var barlight = "";
var pictureLabelURL = "img/categories/marker/";
var infoboxCloseURL = "img/close.gif";
var tipboxURL = "img/tipbox.gif";
var shape = {
    //coords: [1, 1, 1, 20, 18, 20, 18, 1],
    coords: [16, 0, 18, 1, 21, 2, 24, 3, 26, 4, 27, 5, 28, 6, 29, 7, 29, 8, 29, 9, 29, 10, 29, 11, 29, 12, 29, 13, 29, 14, 29, 15, 29, 16, 29, 17, 29, 18, 29, 19, 29, 20, 29, 21, 29, 22, 29, 23, 29, 24, 29, 25, 29, 26, 29, 27, 29, 28, 28, 29, 3, 29, 2, 28, 2, 27, 1, 26, 1, 25, 1, 24, 0, 23, 0, 22, 0, 21, 0, 20, 0, 19, 0, 18, 0, 17, 0, 16, 0, 15, 0, 14, 0, 13, 0, 12, 0, 11, 0, 10, 0, 9, 0, 8, 0, 7, 1, 6, 2, 5, 2, 4, 3, 3, 5, 2, 6, 1, 8, 0, 16, 0],
    type: 'poly'
}

var mySound;
//Sounds Checkbox
var changeCheckbox = document.querySelector('.js-check-change-sounds');

var assetMarkerInterval;
var assetMarkerIntervalFilter;

var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {

            if (item.ResellerID == "1") {
                $('#load-reseller').append(
                     $('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name)

                 );
            } else {

                $('#load-reseller').append(
                    $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)

                );
            }
        });
        var getReseller = $("#load-reseller").val();
        sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
        $('#load-reseller').selectpicker('refresh');

    });

} else if (getSessionstorageValueRoleID == 2) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#load-reseller').append(
                 $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)
             );
        });
        var getReseller = $("#load-reseller").val();
        sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
        $('#load-reseller').selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#load-reseller').remove();
}


//Company Desktop
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {

        $.each(data, function (index, item) {

            $('#load-company').append(
                 $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
             );

        });
        var getCompany = $("#load-company").val();
        sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
        $('#load-company').selectpicker('refresh');
    });

}

else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID) {

                $('#load-company').append(
                     $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                 );
            } else {
                $('#load-company').append(
                    $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                );
            }

        });
        var getCompany = $("#load-company").val();
        sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
        $('#load-company').selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID >= 3) {

    $('#load-company').remove();
}


var selectedReseller = "";

/*** Function to filter reseller and companies*/
$(function () {

    $('.SelectResellerFilter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();


        $('#load-company').empty();

        $(".SelectCompanyFilter").selectpicker('refresh');

        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#load-company').append(
                $('<option></option>').val(0).html("-------")
            );

            $.each(data, function (index, item) {

                $('#load-company').append(
                     $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                 );
            });

            $(".SelectCompanyFilter").selectpicker('refresh');
        });

    });

});


//Dashboard Company
var selectedCompany = "";

/*** Function to filter tables, markers and zones*/
$(function () {

    $('.SelectCompanyFilter').on('change', function () {
        selectedCompany = $(this).find("option:selected").val();
        var getReseller = $('#load-reseller').val();
        var getCompany = $('#load-company').val();

        if (selectedCompany != 0) {
            clearInterval(assetMarkerInterval);
            //assetMarkerIntervalFilter = setInterval(function () { AutoRefreshCompanyFilter(); }, '30000');

            AutoRefreshCompanyFilter();

            $('#getAssets').empty();
            $(".SelectAssetFilter").selectpicker('refresh');

            $.getJSON('http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + selectedCompany, function (data) {

                $('#getAssets').append(
                    $('<option></option>').val(0).html("ALL")
                );

                $.each(data, function (index, item) {
                    $('#getAssets').append(
                         $('<option></option>').val(item.Name).html(item.Name)
                     );
                });
                $(".SelectAssetFilter").selectpicker('refresh');
            });

        }

    });

});

function initialize() {

    geocoder = new google.maps.Geocoder();
    map = new google.maps.Map(document.getElementById('map-canvas'), {
        zoom: 11,
        center: new google.maps.LatLng(1.3521, 103.8198),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        fullscreenControl: true,
        fullscreenControlOptions:
        {
            position: google.maps.ControlPosition.RIGHT_BOTTOM
        }
    });

    var input = document.getElementById('panel');
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    var input = document.getElementById('job-panel');
    map.controls[google.maps.ControlPosition.BOTTOM_CENTER].push(input);

    setZones(map, zones, handleZones);
    setMarkers(map, assets, updateAssets);
    assetMarkerInterval = setInterval(function () {
        setMarkers(map, assets, updateAssets);
        reloadJobsCreated();
    }, '5000');

    SearchPlacesTo();
}

function setMarkers(map, assets, callback) {


    if (getSessionstorageValueRoleID == 1) {

        MarkerAPI = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + '1' + '&CompanyID=' + '1';

    } else if (getSessionstorageValueRoleID == 2) {

        MarkerAPI = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {


        MarkerAPI = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }

    //alert(MarkerAPI);
    $.getJSON(MarkerAPI, function (assets) {

        callback(assets);

    });


}

function setMarkersFilter(map, assets, callback) {

    var getReseller = $('#load-reseller').val();
    var getCompany = $('#load-company').val();

    if (getSessionstorageValueRoleID == 1) {

        if (selectedReseller != "") {
            url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + selectedReseller + '&CompanyID=' + selectedCompany;
        } else {
            url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
        }

    } else if (getSessionstorageValueRoleID == 2) {

        url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + selectedCompany;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }

    //alert(url);

    $.getJSON(url, function (assets) {

        callback(assets);


    });
}

var paramtitle;
var firstData = true;
var openmarker = [];


function updateAssets(assets) {

    var imagePulse = new google.maps.MarkerImage(
    'img/alert.png',
    null, // size
    null, // origin
    new google.maps.Point(8, 8), // anchor (move to center of marker)
    new google.maps.Size(17, 17) // scaled size (required for Retina display icon)
    );

    document.getElementById('info').innerHTML = assets.length;
    infowindow = new google.maps.InfoWindow({
        disableAutoPan: false
    });
    //bounds = new google.maps.LatLngBounds();
    var down = 0;
    var newJob = 0;
    var available = 0;
    var accepted = 0;
    var edited = 0;
    var cancelled = 0;
    var logout = 0;
    var bounds = new google.maps.LatLngBounds();

    for (var i = 0; i < assets.length; i++) {
        var asset = assets[i];
        var vechs = asset.Name;
        var assetTimestamp = asset.LastPos.Timestamp;

        //if (assets.indexOf(i) !== -1) continue;
        //if (asset.LastPos.PosY == 0 && asset.LastPos.PosX == 0) continue;
	    // Check if marker is no Logout
        var timestamp2 = new Date().getDate();
        var timestamp1 = new Date(assetTimestamp).getDate();


        var pt = new google.maps.LatLng(parseFloat(asset.LastPos.PosY), parseFloat(asset.LastPos.PosX));
        //bounds.extend(pt);

        //Convert Timezone
        if (getSessionstorageValueTrackVersion == "sg")
        {
            var timestamp = moment(assetTimestamp).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
        }
        else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id")
        {

            var timestamp = moment(assetTimestamp).add('hours', 7).format('D-MMM-YYYY, hh:mm:ss A');
        }


        if (assets[i].LastPos == null | assets[i].LastPos.Engine == null) {
            continue;
        }

        else {

            // Category image
            switch (asset.Category) {
                case "Phone":
                    markerCategory = "phone";
                    break;
            }

            //Background 
            if (timestamp2 > timestamp1) {
                icon = iconURL + markerCategory + "-logout.png"; //no logout
                down++
            }
            else if (asset.Jobs.Flag == 0 && asset.Flag == 1 || asset.Jobs.Flag == 1 && asset.Jobs.FlagValue == "Scheduled") {
                icon = iconURL + markerCategory + "-available.png"; //Offload or Available or Completed
                available++
            }
            else if (asset.Jobs.Flag == 1 && asset.Flag == 1) {
                icon = iconURL + markerCategory + "-new.png"; //new
                newJob++
            }
            else if (asset.Jobs.Flag == 3 && asset.Flag == 1) {
                icon = iconURL + markerCategory + "-accepted.png"; //accepted
                accepted++
            }
            else if (asset.Jobs.Flag == 6 && asset.Flag == 1) {
                icon = iconURL + markerCategory + "-edited.png"; //edited
                edited++
            }
            else if (asset.Jobs.Flag == 7 && asset.Flag == 1) {
                icon = iconURL + markerCategory + "-cancelled.png"; //cancelled
                cancelled++
            }
            else if (asset.Jobs.Flag >= 0 && asset.Flag == 0) {
                icon = iconURL + markerCategory + "-logout.png"; //logout
                logout++
            }

            document.getElementById('countNew').innerHTML = newJob;
            document.getElementById('available').innerHTML = available;
            document.getElementById('countAvailable').innerHTML = available;
            document.getElementById('countAccepted').innerHTML = accepted;
            document.getElementById('countEdited').innerHTML = edited;
            document.getElementById('countCancelled').innerHTML = cancelled;
            document.getElementById('countLogout').innerHTML = logout;
            document.getElementById('countDown').innerHTML = down;

            var image = {
                url: icon, // url
                scaledSize: new google.maps.Size(28, 28), // scaled size
                origin: new google.maps.Point(0, 0), // origin
                anchor: new google.maps.Point(14, 14) // anchor
            };

            var flagValue;
            if (timestamp2 > timestamp1) flagValue = "Down";
            else if (asset.Jobs.Flag >= 0 && asset.Flag == 0) flagValue = "Logout"
            else if (asset.Jobs.FlagValue === null || asset.Jobs.FlagValue === undefined) flagValue = "Available";
              else flagValue = asset.Jobs.FlagValue;

            //var infowindowcontent = "<div style='color:black;' id='infoWindow'>" + asset.Name + "<br>" + asset.LastPos.Location + "<br>" + timestamp +
              //                      "<br><a data-l11n style='color:#0000EE;' href='javascript:getDirections(customerMarker.getPosition(),&quot;" + asset.LastPos.Location + "&quot;);'>Get Directions</a><a data-l11n='th' style='color:#0000EE;' href='javascript:getDirections(customerMarker.getPosition(),&quot;" + asset.LastPos.Location + "&quot;);'>ขอเส้นทาง</a><a data-l11n='vn' style='color:#0000EE;' href='javascript:getDirections(customerMarker.getPosition(),&quot;" + asset.LastPos.Location + "&quot;);'>Nhận Sự Chỉ Dẫn</a><a data-l11n='id' style='color:#0000EE;' href='javascript:getDirections(customerMarker.getPosition(),&quot;" + asset.LastPos.Location + "&quot;);'>Dapat Petunjuk</a>" + "</div>";
  
            var infowindowcontent = "<div style='color:black;' id='infoWindow'>" + asset.Name + "<br>" + asset.LastPos.Location + "<br>" + timestamp + "<br>" + flagValue +
                                   "<br><a style='color:#0000EE;' href='javascript:getDirections(customerMarker.getPosition(),&quot;" + asset.LastPos.Location + "&quot;);'>Get Directions</a>" + "</div>";

            marker = new setInfoWindow({
                position: pt,
                map: map,
                icon: image,
                shape: shape,
                title: vechs,
                flag: asset.Jobs.Flag,
                assetflag: asset.Flag,
                jobStatus: asset.Jobs.JobStatus,
                address: asset.LastPos.Location,
                id: asset.AssetID,
                timestamp: asset.LastPos.Timestamp,
                driver: asset.Driver.Name,
                html: infowindowcontent
            });

            if (asset.LastPos.BarLight == 1) {
                if (changeCheckbox.checked) {
                    UIAlert();
                }
                else {
                    soundManager.stop('UIAlertStop');
                }
            }

            // infoBoxList.push(infoBubble);
            var barlight = "";
            if (asset.LastPos.BarLight == 1) barlight = "Barlight is on";
            if (asset.LastPos.BarLight == 0) barlight = "Barlight is off";

            //then create the new marker
            pulse = new google.maps.Marker({
                flat: true,
                icon: imagePulse,
                map: map,
                optimized: false,
                position: pt,
                visible: true,
                title: barlight,
                html: infowindowcontent
            });

            //Open Barlight
             if (asset.LastPos.BarLight == 1)
             {
                 pulse.setVisible(true);
             }
             else if (asset.LastPos.BarLight == 0)
             {
                 pulse.setVisible(false);
             }

            //google.maps.event.addListener(pulse, 'click', (function (pulse, i) {
            //    return function () {
            //        infowindow.close(map, marker);
            //        infowindow.setContent(infowindowcontent);
            //        infowindow.open(map, pulse);
            //    }
            //})
            //(pulse, i));


            //google.maps.event.addListener(marker, 'click', (function (marker, i) {
            //    return function () {
            //        infowindow.close(map, marker);
            //        infowindow.setContent(marker.html);
            //        infowindow.open(map, marker);
            //    }
            //})
            //(marker, i));


            /*** Function to Assets*/
            $(function () {

                $('.SelectAssetFilter').on('change', function () {

                    var selected = $(this).find("option:selected").val();

                    for (k = 0; k < markers.length; k++) {
                        marker = markers[k];

                        // If is same assets or assets not picked
                        if (marker.title == selected) {

                            marker.setVisible(true);
                            var position = marker.getPosition();
                            map.setCenter(position);
                            map.setZoom(16);

                            //Open Infowindow
                            //infowindow.setContent(marker.html);
                            //infowindow.open(this, marker);

                        }
                    }

                }); // end of on change

            }); //end of function


            if (markers[i] && markers[i].setPosition) {
                if ($('#to-destination').val() == 0) $("#side_bar").empty();
                // To remove the marker from the map
                //marker.setVisible(false);
                marker.setMap(null);
                pulse.setMap(null);

                markers[i].setPosition(pt);
                pulses[i].setPosition(pt);

                //Open Barlight
                if (asset.LastPos.BarLight == 1)
                {
                    pulses[i].setVisible(true);
                }
                else if (asset.LastPos.BarLight == 0)
                {
                    pulses[i].setVisible(false);
                }

                markers[i].setIcon(/** @type {google.maps.Icon} */({
                    url: icon,
                    scaledSize: new google.maps.Size(28, 28), // scaled size
                    origin: new google.maps.Point(0, 0), // origin
                    anchor: new google.maps.Point(14, 14) // anchor
                }));

                if (paramtitle == vechs) {
                    markers[i].html = infowindowcontent;
                    markers[i].flag = asset.Jobs.Flag;
                    markers[i].assetflag = asset.Flag;
                    markers[i].jobStatus = asset.Jobs.JobStatus;
                    markers[i].address = asset.LastPos.Location;
                    markers[i].id = asset.AssetID;
                    markers[i].timestamp = asset.LastPos.Timestamp;
                    markers[i].driver = asset.Driver.Name;
                    document.getElementById('infoWindow').innerHTML = infowindowcontent;
                    //map.panTo(marker.getPosition());
                }
                else
                {
                    markers[i].flag = asset.Jobs.Flag;
                    markers[i].assetflag = asset.Flag;
                    markers[i].jobStatus = asset.Jobs.JobStatus;
                    markers[i].address = asset.LastPos.Location;
                    markers[i].id = asset.AssetID;
                    markers[i].timestamp = asset.LastPos.Timestamp;
                    markers[i].driver = asset.Driver.Name;
                }

            } else {

                bounds.extend(pt);
                var getHeight;

                // please note, 
                // that IE11 now returns undefined again for window.chrome
                // and new Opera 30 outputs true for window.chrome
                // and new IE Edge outputs to true now for window.chrome
                // so use the below updated condition
                var isChromium = window.chrome,
                    vendorName = window.navigator.vendor,
                    isOpera = window.navigator.userAgent.indexOf("OPR") > -1,
                    isIEedge = window.navigator.userAgent.indexOf("Edge") > -1;
                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    getHeight = 180;
                } else {
                    // not Google chrome 
                    getHeight = 150;
                }


                markers[i] = marker;
                pulses[i] = pulse;

            }//end of else

        } //end of else continue

    }
		if (firstData) {
            bounds.extend(pt);
            map.fitBounds(bounds);
            map.setZoom(8);
            firstData = false;
		}
        
		var getAddress = $('#to-destination').val();

		if (getAddress.length > 0)
		{
		    geocoder.geocode({
		        'address': getAddress

		    }, function (results, status) {
		        if (status == google.maps.GeocoderStatus.OK) {
		            map.setCenter(results[0].geometry.location);
		            console.log(results[0].geometry.location);

		            var coords = results[0].geometry.location;

		            if (customerMarker) customerMarker.setMap(null);
		            customerMarker = new google.maps.Marker({
		                map: map,
		                position: results[0].geometry.location
		            });

		            var numResults = markers.length

		             //get driving distance
		            closest = findClosestN(results[0].geometry.location, numResults);
		            calculateDistances(results[0].geometry.location, closest, numResults);

		            for (var i = 0; i < closest.length; i++) {
		                closest[i].setMap(map);
		            }

		        }
		        else {
		            alert(titleGeoCodeFail + status);
		        }
		    });

		}
		else
		{
		    //Nearest Technician
		    for (k = 0; k < markers.length; k++) {

		        if (markers[k] != undefined || markers[k]) {
		            var outputDiv = document.getElementById('side_bar');

		            outputDiv.innerHTML += "<div style='margin-top:10px;'>"
                                + "<table id='availAmbulance' border='0'  style='width:100%;'>"
                                + "<tbody>"
                                + "<tr>"
                                + "<td>"
                                + "<strong><a href='javascript:google.maps.event.trigger(openmarker[" + k + "],\"click\");' style='color:#458FD2;'>" + markers[k].title + '</a></strong><br>' + markers[k].address + '<br>' + moment(markers[k].timestamp).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A') + '<br>'
                                + "</td>"
                                + "<td class='col-md-2' style='padding:10px;'>"
								+ "<div class='pad-ver'><label class='form-primary'>" + driverFormatter(markers[k].driver) + "</label><div>"
								+ "</td>"
                                + "</tr>"
                                + "</tbody>"
                                + "</table>";
		                        + "</div>"
		                        + "<hr style='border: 1px solid #FFFFFF !important'>";
		        }

		    }
		}
		
		openmarker = findMarker(marker.position);
}

function findjobMarker(id) {

    var getWidth;
    var getHeight;
    var getHeightChart;

    // please note, 
    // that IE11 now returns undefined again for window.chrome
    // and new Opera 30 outputs true for window.chrome
    // and new IE Edge outputs to true now for window.chrome
    // so use the below updated condition
    var isChromium = window.chrome,
        vendorName = window.navigator.vendor,
        isOpera = window.navigator.userAgent.indexOf("OPR") > -1,
        isIEedge = window.navigator.userAgent.indexOf("Edge") > -1;
    if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
        // is Google chrome 
        getWidth = 220;
        getHeight = 120;
        getHeightChart = 220;
    } else {
        // not Google chrome 
        getWidth = 220;
        getHeight = 120;
        getHeightChart = 220;
    }
   

    for (var i = 0; i < infoBoxList.length; i++) {

        infoBoxList[i].close();
    }

    // Reset the markers array
    infoBoxList = [];

    for (var i = 0; i < markers.length; i++) {
        var marker = markers[i];
        
        if (marker.id == id) {
           
            var position = marker.getPosition();
            map.setCenter(position);
            map.setZoom(16);

            //Open Infowindow
            //infowindow.setContent(marker.html);
            //infowindow.open(this, marker);

            //var newInfoWindow = new InfoBubble({
            //    minWidth: getWidth,
            //    minHeight: getHeight,
            //    shadowStyle: 1,
            //    borderRadius: 4,
            //    arrowSize: 15,
            //    borderWidth: 1,
            //    disableAutoPan: false,
            //    hideCloseButton: false,
            //    arrowPosition: 30,
            //    backgroundClassName: 'phoney',
            //    arrowStyle: 2
            //});

            //infoBoxList.push(newInfoWindow);         
            //map.setCenter(marker.position);

            //newInfoWindow.setContent(marker.html);
            //newInfoWindow.open(map, marker);

           
            //paramtitle = marker.title;

   
        }
    
     
    }

}


function findMarker(pt) {


    var openmarker = [];
    for (var i = 0; i < markers.length; i++) {
        openmarker.push(markers[i]);
    }

    return openmarker.splice(0);
}

function setInfoWindow(param) {

    var getWidth;
    var getHeight;
    var getHeightChart;

    // please note, 
    // that IE11 now returns undefined again for window.chrome
    // and new Opera 30 outputs true for window.chrome
    // and new IE Edge outputs to true now for window.chrome
    // so use the below updated condition
    var isChromium = window.chrome,
        vendorName = window.navigator.vendor,
        isOpera = window.navigator.userAgent.indexOf("OPR") > -1,
        isIEedge = window.navigator.userAgent.indexOf("Edge") > -1;
    if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
        // is Google chrome 
        getWidth = 220;
        getHeight = 120;
        getHeightChart = 220;
    } else {
        // not Google chrome 
        getWidth = 220;
        getHeight = 120;
        getHeightChart = 220;
    }

    var newMarker = new google.maps.Marker({
        map: param.map,
        position: param.position,
        title: param.title,
        flag: param.flag,
        assetflag: param.assetflag,
        jobStatus: param.jobStatus,
        address: param.address,
        id: param.id,
        driver: param.driver,
        timestamp: param.timestamp,
        html: param.html,
        icon: param.icon,
        shape: param.shape
    });


    if (param.html) {
        google.maps.event.addListener(newMarker, 'click', function () {

            for (var i = 0; i < infoBoxList.length; i++) {

                infoBoxList[i].close();
            }

            // Reset the markers array
            infoBoxList = [];

            var newInfoWindow;
            // this -> the marker on which the onclick event is being attached
            if (!this.getMap().newMarker) {
                //newInfoWindow = this.getMap().newMarker = new google.maps.InfoWindow({
                //    disableAutoPan: false
                //});

                newInfoWindow = this.getMap().newMarker = new InfoBubble({
                    minWidth: getWidth,
                    minHeight: getHeight,
                    shadowStyle: 1,
                    borderRadius: 4,
                    arrowSize: 15,
                    borderWidth: 1,
                    disableAutoPan: false,
                    hideCloseButton: false,
                    arrowPosition: 30,
                    backgroundClassName: 'phoney',
                    arrowStyle: 2
                });

                infoBoxList.push(newInfoWindow);

            }

            this.getMap().newMarker.close();
            if (newMarker.title == param.title) this.getMap().newMarker.setContent(this.html);

            this.getMap().newMarker.open(this.getMap(), this);
            this.getMap().setCenter(this.position);
            paramtitle = param.title;

        });

    }



    return newMarker;
}

google.maps.event.addDomListener(window, 'load', initialize);


//Search Places AutoComplete
function SearchPlacesTo() {

    var defaultBounds = new google.maps.LatLngBounds(
       new google.maps.LatLng(1.3000, 103.8000),
       new google.maps.LatLng(1.3000, 103.5710));


    var input = document.getElementById('to-destination');

    var options = {
        bounds: defaultBounds,
        types: ['establishment'],
        //componentRestrictions: {
        //    country: 'SG'
        //}
    };

    var autocomplete = new google.maps.places.Autocomplete(input, options);


    autocomplete.setTypes();


}


function findClosestN(pt, numberOfResults) {
    var closest = [];
    for (var i = 0; i < markers.length; i++) {
        if (markers[i] === marker) //Check if marker is undefined
        {
            markers[i].distance = google.maps.geometry.spherical.computeDistanceBetween(pt, markers[i].getPosition());
            markers[i].setMap(null);
        }
       // if (markers[i].assetflag > 0) //Filter if driver is logout
            closest.push(markers[i]);
    }
    closest.sort(sortByDist);

    return closest.splice(0, numberOfResults);
}

function sortByDist(a, b) {
    return (a.distance - b.distance)
}

var requestDestination = [];
function calculateDistances(pt, closest, numberOfResults) {

    var finalClosest = "";
    var regExp = /\(([^)]+)\)/;
    for (var i = 0; i < closest.length; i++) {
        var closestPosition = regExp.exec(closest[i].getPosition());
        requestDestination.push(closestPosition[1]);
    }

    finalClosest = requestDestination.join("|");
    var originPT = regExp.exec(pt);
    var firstClosest = regExp.exec(closest[0].getPosition())

    $.ajax({
        url: 'https://track-asia.com/dmswebapi/api/distancematrix?Origin=' + originPT[1] + '&Destination=' + finalClosest,
        type: 'GET',
        cache: false,
        dataType: 'json',
        success: function (json) {
            console.log(JSON.stringify(json));
            $.each(json, function (index, element) {
                if (element.status != 'OK') {
                    alert(titleError + element.status);
                } else {
                    var origin = element.origin_addresses;
                    var destination = element.destination_addresses;
                    var outputDiv = document.getElementById('side_bar');
                    outputDiv.innerHTML = '';

                    var results = element.rows[0].elements;
                    for (var i = 0; i < numberOfResults; i++) {
                        //alert("Job Status: " + closest[i].jobStatus);
                        //alert("Job Flag: " + closest[i].flag);
                        //alert("Job Asset Flag: " + closest[i].assetflag);
                        closest[i].setMap(map);
                        //if (closest[i].assetflag == 1)
                        // if (closest[i].flag == 0 || closest[i].flag == 1 && closest[i].jobStatus == "Scheduled")
                        var timestamp1 = moment.utc(closest[i].timestamp).local().format("DD MMM YYYY");
                        var d = new Date();
                        var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
                        timestamp2 = Date.parse(timestamp2);
                        timestamp1 = Date.parse(timestamp1);
                        // if (timestamp1 == timestamp2)

                        try {
                            outputDiv.innerHTML += "<div style='margin-top:10px;'>"
								+ "<table id='availAmbulance' border='0' style='width:100%;'>"
								+ "<tbody>"
								+ "<tr>"
								+ "<td>"
								+ "<strong><a href='javascript:google.maps.event.trigger(closest[" + i + "],\"click\");' style='color:#458FD2;'>" + closest[i].title + '</a></strong><br>' + closest[i].address + "<br>"
								+ results[i].distance.text + ' appoximately '
								+ results[i].duration.text + '<br>'
								+ "</td>"
								+ "<td class='col-md-2' style='padding:10px;'>"
								+ "<div class='pad-ver'><label class='form-primary'>" + driverFormatter(closest[i].driver) +"</label><div>"
								+ "</td>"
								+ "</tr>"
								+ "</tbody>"
								+ "</table>"
								+ "</div>"
								+ "<hr>";
                        } catch (e) {
                            console.log(titleError + " : " + e.message);
                        }


                    }
                }
            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

        }
    });

}



function getDirections(origin, destination) {
    var request = {
        origin: destination,
        destination: origin,
        travelMode: google.maps.DirectionsTravelMode.DRIVING
    };
    directionsService.route(request, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setMap(map);
            directionsDisplay.setDirections(response);
            directionsDisplay.setPanel(document.getElementById('ambulanceStatus'));
        } else {
            window.alert('Directions request failed due to ' + status);
        }
    });

}

function AutoRefreshBarlight() {

    // Loop through markers and set map to null for each
    for (var i = 0; i < infoBoxList.length; i++) {

        infoBoxList[i].close();
    }

    // Reset the markers array
    infoBoxList = [];

}

function AutoRefresh() {

    // Loop through markers and set map to null for each
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }

    // Reset the markers array
    markers = [];


    for (var i = 0; i < infoBoxList.length; i++) {

        infoBoxList[i].close();
    }

    // Reset the markers array
    infoBoxList = [];


    // Call set markers to re-add markers
    //setMarkers(map, assets, handleAssets);
    //setMarkers(map, assets, updateAssets);

}

function AutoRefreshCompanyFilter() {

    // Loop through markers and set map to null for each
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }

    // Reset the markers array
    markers = [];


    for (var i = 0; i < infoBoxList.length; i++) {

        infoBoxList[i].close();
    }

    // Reset the markers array
    infoBoxList = [];

    //setMarkersFilter(map, assets, handleAssets);
    setMarkersFilter(map, assets, updateAssets);

}

function searchDriver(id) {

    var getReseller = sessionStorage.getItem('setSessionstorageValueUserResellerID');
    var getCompany = sessionStorage.getItem('setSessionstorageValueCompanyID');
    var apiDriver = 'http://117.120.7.119/spwebapi/api/driverinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&AssetID=' + id;
    var apiDevice = 'http://117.120.7.119/spwebapi/api/deviceinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&AssetID=' + id;
    //alert(apiDriver);

    $.getJSON(apiDriver, function (data) {

        if (data.length == 1) {
            $.each(data, function (index, item) {

                var getDriverPhone = item.Phone;
                sessionStorage.setItem("setSessionstorageValueDriverPhone", getDriverPhone);

                var getDriverName = item.Name;
                sessionStorage.setItem("setSessionstorageValueDriverName", getDriverName);
            });
        }
        else {
            sessionStorage.setItem("setSessionstorageValueDriverPhone", 0);
        }

    });

}

function searchDevice(id) {

    var getReseller = sessionStorage.getItem('setSessionstorageValueUserResellerID');
    var getCompany = sessionStorage.getItem('setSessionstorageValueCompanyID');
    var apiDevice = 'http://117.120.7.119/spwebapi/api/deviceinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&AssetID=' + id;
    //alert(apiDevice);

    $.getJSON(apiDevice, function (data) {

        if (data.length == 1) {
            $.each(data, function (index, item) {

                var getDevicePhone = item.Phone;
                sessionStorage.setItem("setSessionstorageValueDevicePhone", getDevicePhone);

            });
        }
        else {
            sessionStorage.setItem("setSessionstorageValueDevicePhone", 0);
        }

    });

}

function searchJob() {

    var getJobNumber = $('#reference').val();
    var apiJobNumber = 'http://117.120.7.119/spwebapi/api/searchjob?JobNumber=' + getJobNumber;
    //alert(apiJobNumber);

    $.getJSON(apiJobNumber, function (data) {

        if (data.length == 1) {

            $.each(data, function (index, item) {

                if (item.JobType == "Scheduled") {
                    alert(titleCannotEditSchedule);
                }
                else {

                    if (item.JobStatus == "Completed") {
                        alert(titleJobCompletedCannotLoad);
                    }
                    else {
                        var getDriverPhone = item.DriverInfo.Phone;
                        sessionStorage.setItem("setSessionstorageValueDriverPhone", getDriverPhone);

                        //alert(getDriverPhone);

                        var getAssetID = item.AssetID;

                        sessionStorage.setItem("setSessionstorageValuePreviousAsset", getAssetID);


                        //Convert Timezone
                        var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
                        var Singapore = moment.tz(item.Timestamp, Asia);
                        //Format UTC
                        var timestamp = moment.utc(Singapore.format()).add('hours', 7).format('D-MMM-YYYY, hh:mm:ss A');
                        var jobDateTime = $('#date').val(timestamp);

                        var jobID = $('#jobid').val(item.JobID);
                        var jobAmount = $('#amount').val(item.Amount);
                        var jobPIC = $('#pic').val(item.PIC);
                        var jobPhone = $('#phone').val(item.Phone);
                        var jobUnit = $('#unit').val(item.Unit);
                        var jobRemarks = $('#remarks').val(item.Remarks);
                        var jobCompanyDestination = $('#company-destination').val(item.CompanyDestination);
                        var getDestination = $('#to-destination').val(item.Destination);

                        if (getSessionstorageValueCompanyID == 4)
                        {
                            $('.phoneuserRemarks').show();
                        }
                        else
                        {
                            $('.phoneuserRemarks').hide();
                        }
                        $(".jobsCreatedTable").css('height', '295px');
   
                        $('.selectpicker').selectpicker('refresh');
                        alert(titleJobLoaded);
                    }

                }

            });


        }
        else {
            clearJobForms();
            alert(titleJobNumberNotFound);
        }


    });

}

function clearJobForms() {
	$('#jobNumber').val('');   
    $('#jobid').val('');
    $('#companyName').val('');
    $('#jobDestination').val('');
    $('#jobPostal').val('');
    $('#jobUnit').val('');
    $('#jobPIC').val('');
    $('#jobContactNumber').val('');
    $('#jobTime').val('');
    $('#jobCharges').val('');
    $('#customerEmail').val('');
    $('#jobSite').val('');
    $('#jobPest').val('');
    $('#jobReportEmail').val('');
    $('#jobMaintenanceInterval').val('');
    $('#jobRecheckDate').val('');
    $('#jobRemarks').val('');
    $('#phoneremarks').val('');   
    $("#availAmbulance tr").remove();
	
	$('#jobTime').val(moment().format('D-MMM-YYYY, HH:mm'));

}

function snFormatter(value) {

    return value + 1;
}
//  Format for Timestamp Column.
// =================================================================
function timeFormatter(value, row) {


    //Convert Timezone
    //var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    //var Singapore = moment.tz(value, Asia);

    //Format UTC
    var timestamp = moment(value).add('hours', 7).format('HH:mm:ss A');


    return '<div>' + '<span>' + timestamp + '</span>' + '</div>';


}

function timeFunction(value) {


    //Convert Timezone
    //var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    //var Singapore = moment.tz(value, Asia);

    //Format UTC
    var timestamp = moment(value).add('hours', 8).format('HH:mm:ss A');


    return timestamp;


}

function driverFormatter(value) {

    var text;
    
    if (value == null || value == '') text = "No Technician";
    else text = value;


    return text;

}

function jobstatusFormatter(value) {

    var text;

    if (value == null || value == '') text = "Logout/No Assign Job";
    else text = value;


    return text;

}

$(function () {
    if (getSessionstorageValueLanguage == "en"){
          $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("Jobs Created by " + getSessionstorageValueUser + " (" + moment().format('D-MMM-YYYY') + ")"));
    }
    else if (getSessionstorageValueLanguage == "th")
    {
        $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("งานสร้างโดย " + getSessionstorageValueUser + " (" + moment().format('D-MMM-YYYY') + ")"));
    }
    else if (getSessionstorageValueLanguage == "vn")
    {
        $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("Jobs Tạo bởi " + getSessionstorageValueUser + " (" + moment().format('D-MMM-YYYY') + ")"));
    }
    else if (getSessionstorageValueLanguage == "id")
    {
        $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("Kerja Dicipta oleh " + getSessionstorageValueUser + " (" + moment().format('D-MMM-YYYY') + ")"));
    }
  
    generateJobNumber();
    reloadJobsCreated();
	clearJobForms();

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

    $('#jobNumber').val(jobNumber);

}

function reloadJobsCreated()
    {
        var timestamp = moment().format('D-MMM-YYYY');
        var rxtime = moment().add('days', 1).format('D-MMM-YYYY');

        var WebAPIJobs;
        if (getSessionstorageValueRoleID == 1) {

            WebAPIJobs = 'http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=' + getSessionstorageValueUserResellerID + '&AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime;
        }
        else if (getSessionstorageValueRoleID == 2) {

            WebAPIJobs = 'http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=' + getSessionstorageValueUserResellerID + '&AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime;
        }
        else if (getSessionstorageValueRoleID == 3) {

            WebAPIJobs = 'http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=' + getSessionstorageValueUserResellerID + '&AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime;
        }
        else if (getSessionstorageValueRoleID >= 4) {

            WebAPIJobs = 'http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=' + getSessionstorageValueUserResellerID + '&AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&Agent=' + getSessionstorageValueUser;
        }

        //console.log(WebAPIJobs);
        
        $(document).ready(function () {

            $.ajax({
                url: WebAPIJobs,
                type: 'GET',
                success: function(res) {
                    //console.log(res);
                    $("#jobsCreated").empty();

                    document.getElementById('total-jobsCreated').innerHTML = res.length;

                    var outputDiv = document.getElementById('jobsCreated');

                    outputDiv.innerHTML += "<table id='jobsCreated' border='1'>"
                                        + "<thead>"
                                        + "<tr>"
                                        + "<th style='padding: 5px;'>SN</th>"
                                        + "<th style='padding: 5px;'>" + titleJobNumber + "</th>"
                                        + "<th style='padding: 5px;'>" + titleAlertTime + "</th>"
                                        + "<th style='padding: 5px;'>" + titlePhoneUser + "</th>"
                                        + "<th style='padding: 5px;'>Address</th>"
                                        + "<th style='padding: 5px;'>" + titlePersonInCharge + "</th>"
                                        + "<th style='padding: 5px;'>" + titleContactNumber + "</th>"
                                        + "</tr>"
                                        + "</thead>"
                                        + "</table>";

                    for (k = 0; k < res.length; k++) {

                        if (res[k] != undefined || res[k]) {
                                       
                            outputDiv.innerHTML += "<table id='jobsCreated' border='1'>"
                                        + "<tbody>"
                                        + "<tr>"
                                        + "<td style='padding: 5px;'>"
                                        + snFormatter(k)
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + "<strong><a href='javascript:google.maps.event.trigger(findjobMarker(" + res[k].AssetID + "),\"click\");' style='color:#458FD2;'>" + res[k].JobNumber + '</a></strong>'
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + timeFunction(res[k].Timestamp)
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + res[k].DriverName
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + res[k].Destination
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + res[k].PIC
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + res[k].Phone
                                        + "</td>"
                                        + "</tr>"
                                        + "</tbody>";
                                        + "</table>";

                        }
        
                    }

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("error: " + xhr.status);
                    alert("error: " + thrownError);
                }
            });



        });


    }

function loopSound(sound) {
        sound.play({
            onfinish: function () {
                loopSound(sound);
            }
        });
    }

function UIAlert() {



        soundManager.setup({

            // location: path to SWF files, as needed (SWF file name is appended later.)

            url: 'plugins/sound-manager/swf/soundmanager2.swf',

            // optional: version of SM2 flash audio API to use (8 or 9; default is 8 if omitted, OK for most use cases.)
            // flashVersion: 9,

            // use soundmanager2-nodebug-jsmin.js, or disable debug mode (enabled by default) after development/testing
            // debugMode: false,

            // good to go: the onready() callback

            onready: function () {

                // SM2 has started - now you can create and play sounds!

                mySound = soundManager.createSound({
                    id: 'UIAlertStop', // optional: provide your own unique id
                    url: 'sounds/b2_oringz-pack-nine-17.mp3',
                    //onload: function () { console.log('sound loaded!', this); }
                    // other options here..
                });


                //mySound.play();
                loopSound(mySound);

            },

            // optional: ontimeout() callback for handling start-up failure

            ontimeout: function () {

                // Hrmm, SM2 could not start. Missing SWF? Flash blocked? No HTML5 audio support? Show an error, etc.?
                // See the flashblock demo when you want to start getting fancy.

            }

        });


}

function setZones(map, zones, callback) {


    if (getSessionstorageValueRoleID == 1) {

        url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + '1' + '&CompanyID=' + '1';

    } else if (getSessionstorageValueRoleID == 2) {
        url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }


    //alert(url);


    $.getJSON(url, function (zones) {

        callback(zones);

    }


)
}

function handleZones(zones) {

    for (var i = 0; i < zones.length; i++) {

        var zone = zones[i];
        var zoneID = zone.ZoneID;
        var name = zone.Name;
        var type = zone.Type;
        var perimeter = zone.Perimeter;
        var company = zone.Company;
        var color = zone.Color;


        var coords = perimeter.split(" ");
        var recoords;
        var Pos;
        var zoneCircle;
        var zoneCircle1;

        if (coords.length == 1) {

            for (var k = 0; k < coords.length; k++) {
                recoords = coords[k].split(",");

                var circle1 = {};
                circle1['Zones'] = {
                    center: new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])),
                    radius: recoords[2]
                    //radius: 100
                };


            }


            // Construct the circle for each value in citymap.
            // Note: We scale the area of the circle based on the population.
            for (var zone in circle1) {
                var radiusOptions = {
                    strokeColor: color,
                    strokeOpacity: 0.8,
                    strokeWeight: 2,
                    fillColor: color,
                    fillOpacity: 0.35,
                    map: map,
                    Company: company,
                    Name: name,
                    Pos: coords,
                    zoneID: zoneID,
                    center: circle1[zone].center,
                    radius: Math.sqrt(circle1[zone].radius)
                };
                // Add the circle for this city to the map.
                zoneCircle1 = new google.maps.Circle(radiusOptions);

            }
            circleCoordinates1.push(zoneCircle1);


            // Add a listener for the click event.
            google.maps.event.addListener(zoneCircle1, 'click', showArrayCircle);

            infoWindow = new google.maps.InfoWindow();


            // Click Zones
            google.maps.event.addListener(zoneCircle1, 'click', (function (zoneCircle1) {

                return function () {

                    map.panTo(this.position);

                }

            })(zoneCircle1));

        }

            //Circle - 1.042346,99.939392 1.038056,99.937031
        else if (coords.length <= 2) {

            var latlng1 = coords[0];
            var latlng2 = coords[1];
            var getlatlng1 = latlng1.split(",");

            var lat1 = getlatlng1[0];
            var lon1 = getlatlng1[1];

            var getlatlng2 = latlng2.split(",");

            var lat2 = getlatlng2[0];
            var lon2 = getlatlng2[1];

            function deg2rad(deg) {
                return deg * (Math.PI / 180)
            }

            var R = 6371; // Radius of the earth in km
            var dLat = deg2rad(lat2 - lat1);  // deg2rad below
            var dLon = deg2rad(lon2 - lon1);
            var a =
              Math.sin(dLat / 2) * Math.sin(dLat / 2) +
              Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
              Math.sin(dLon / 2) * Math.sin(dLon / 2)
            ;
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            var d = R * c; // Distance in km

            var Radius = d * 100;



            recoords = coords[0].split(",");



            circle['Zones'] = {
                center: new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])),
                //radius: recoords[2]
                //radius: 100
                radius: Radius
            };


            for (var zone in circle) {
                var radiusOptions = {
                    strokeColor: color,
                    strokeOpacity: 0.8,
                    strokeWeight: 2,
                    fillColor: color,
                    fillOpacity: 0.35,
                    map: map,
                    Company: company,
                    Name: name,
                    Pos: coords,
                    zoneID: zoneID,
                    center: circle[zone].center,
                    radius: Math.sqrt(circle[zone].radius) * 100
                };
                // Add the circle for this city to the map.
                zoneCircle = new google.maps.Circle(radiusOptions);
            }

            circleCoordinates.push(zoneCircle);


            // Add a listener for the click event.
            google.maps.event.addListener(zoneCircle, 'click', showArrayCircle);

            infoWindow = new google.maps.InfoWindow();


            // Click Zones
            google.maps.event.addListener(zoneCircle, 'click', (function (zoneCircle) {

                return function () {

                    map.panTo(this.position);

                }

            })(zoneCircle));




        }

        else if (coords.length >= 3) {

            //for (var k = 0; k < coords.length; k++) {
            //    recoords = coords[k].split(",");
            //    pathCoordinates.push(new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])));
            //}

            for (var k = 0; k < coords.length; k++) {
                recoords = coords[k].split(",");
                pathCoordinates.push(new google.maps.LatLng(parseFloat(recoords[0]), parseFloat(recoords[1])));
            }

            // Construct the polygon.
            polygon = new google.maps.Polygon({
                path: pathCoordinates,
                strokeColor: color,
                strokeOpacity: 0.8,
                strokeWeight: 3,
                fillColor: color,
                fillOpacity: 0.35,
                Company: company,
                Name: name,
                Pos: coords,
                zoneID: zoneID,
                map: map
            });



            pathCoordinates = [];
            polygonCoordinates.push(polygon);


            polygon.setMap(map);


            // Add a listener for the click event.
            google.maps.event.addListener(polygon, 'click', showArrays);

            infoWindow = new google.maps.InfoWindow();


            // Click Zones
            google.maps.event.addListener(polygon, 'click', (function (polygon, i) {

                return function () {

                    map.panTo(this.position);

                }

            })(polygon, i));


        } //end of if


        /**
        * Function to Zones
    new algorithm updated by [chi:10may2016]
        */
        $(function () {

            $('.SelectZonesFilter').on('change', function () {

                var selected = $(this).find("option:selected").val();


                for (var b = 0; b < circleCoordinates1.length; b++) {
                    circle1 = circleCoordinates1[b];
                    //alert("trace "+parseInt(circle1.zoneID));
                    if (circle1.zoneID == selected || selected.length === 0) {

                        map.fitBounds(circle1.getBounds());

                    }
                }
                for (var j = 0; j < circleCoordinates.length; j++) {
                    circle = circleCoordinates[j];
                    if (circle.zoneID == selected || selected.length === 0) {

                        map.fitBounds(circle.getBounds());

                    }
                }
                for (var a = 0; a < polygonCoordinates.length; a++) {

                    polygon = polygonCoordinates[a];

                    if (polygon.zoneID == selected || selected.length === 0) {

                        var bounds = new google.maps.LatLngBounds();
                        var point = [];

                        var getPolygon = polygon.Pos;

                        for (var i = 0; i < polygon.getPath().length; i++) {
                            getPolygonEx = getPolygon[i].split(",");
                            point = new google.maps.LatLng(parseFloat(getPolygonEx[0]), parseFloat(getPolygonEx[1]));
                            bounds.extend(point);
                        }


                        map.fitBounds(bounds);
                    }//end if
                }//end for

            }); // end of on change

        }); //end of function

    }
    return zones;
}


/** @this {google.maps.Polygon} */
function showArrays(event) {

    // Since this polygon has only one path, we can call getPath()
    // to return the MVCArray of LatLngs.
    var vertices = this.getPath();

    var contentString = '<div style="color:black;"><strong>Zone: &nbsp;</strong>' + this.Name + '<br>' +
        '<strong>Company: &nbsp;</strong>' + this.Company + '<br>' +
        '<strong>Clicked location:</strong> <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
        '<br></div>';

    // Iterate over the vertices.
    //for (var i = 0; i < vertices.getLength() ; i++) {
    //    var xy = vertices.getAt(i);
    //    contentString += '<br>' + 'Coordinate ' + i + ':<br>' + xy.lat() + ',' +
    //        xy.lng();
    //}

    // Replace the info window's content and position.
    infoWindow.setContent(contentString);
    infoWindow.setPosition(event.latLng);

    infoWindow.open(map);

}

function showArrayCircle(event) {

    var contentString = '<div><strong>Zone:</strong>&nbsp;' + this.Name + '</div>' +
                         '<strong>Company:&nbsp;</strong>' + this.Company + '</strong><br>' +
                         '<strong>Clicked location:</strong> <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
                         '<br>';



    // Replace the info window's content and position.
    infoWindow.setContent(contentString);
    infoWindow.setPosition(event.latLng);

    infoWindow.open(map);
}

    //Enable/Disable alert
    changeCheckbox.onchange = function () {

        if (changeCheckbox.checked) {

            loopSound(mySound);

        } else {

            soundManager.stop('UIAlertStop');

        }

    };


    //On Load assets
    var WebAPIAsset = "";

    if (getSessionstorageValueRoleID == 1) {

        WebAPIAsset = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + '1' + '&CompanyID=' + '1';

        $.getJSON(WebAPIAsset, function (data) {

            $.each(data, function (index, item) {
                $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
            });
            $(".selectpicker").selectpicker('refresh');
        });

    }
    else if (getSessionstorageValueRoleID == 2) {

        WebAPIAsset = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

        $.getJSON(WebAPIAsset, function (data) {
            $.each(data, function (index, item) {
                $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
            });
            $(".selectpicker").selectpicker('refresh');
        });
    }
    else if (getSessionstorageValueRoleID >= 3) {

        WebAPIAsset = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

        $.getJSON(WebAPIAsset, function (data) {
            $.each(data, function (index, item) {
                $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
            });
            $(".selectpicker").selectpicker('refresh');
        });
    }

    //Hide Call Center Remarks
    $(function () {

        if (getSessionstorageValueCompanyID == 4)
        {
            $('.agentRemarks').hide();
            $('.phoneuserRemarks').hide();
            $(".jobsCreatedTable").css('height', '157px');
        }
        else
        {
            $('.phoneuserRemarks').hide();
        }

    });

    //Translation of Forms
    if (getSessionstorageValueLanguage == "en") {
        $("#newjob").text("New Job");
        $("#company").text("Company Name");
        $("#addressTo").text("Address");
        $("#unit2").text("Unit Nos.");
        $("#postal2").text("Postal Code");
        $("#scheduleTime").text("Schedule Time");
        $("#amount").text("Charges");
        $("#person").text("Contact Person");
        $("#contactNumber").text("Contact Number");
        $("#remarks2").text("Remarks");
        $("#phone-remarks").text("Phone User Remarks");
        $('#company-destination').attr('placeholder', 'Company Name');
        $('#to-destination').attr('placeholder', 'Address');
        $('#unit').attr('placeholder', 'Unit Nos.');
        $('#postal').attr('placeholder', 'Postal Code');
        $('#date').attr('placeholder', 'Date & Time');
        $('#amount2').attr('placeholder', 'Charges');
        $('#pic').attr('placeholder', 'Contact Person');
        $('#phone').attr('placeholder', 'Contact Number');
        $('#remarks').attr('placeholder', 'Remarks');
        $('#phoneremarks').attr('placeholder', 'Phone User Remarks');
        $("#viewmap").text("View Map");
        $("#totaljobs").text("Total Jobs: ");
        $("#nearestDevice").text("Technician List");
        $("#total").text("Total");
        $("#available-Device").text("Available");
        $("#submit-call").text("Assign");
        $('#reference').attr('placeholder', 'Search Job Number');
        $("#jobOverview").text("Jobs Overview");
        $("#avaiableFooter").text("Available");
        $("#inProgressFooter").text("In Progress");
        $("#logoutFooter").text("Logout");
        $(".selectPhone").text("Select Phone");

    }
    else if (getSessionstorageValueLanguage == "th") {
        $("#newjob").text("งานใหม่");
        $("#company").text("บริษัท");
        $("#addressTo").text("ที่อยู่");
        $("#unit2").text("หน่วย.");
        $("#postal2").text("ไปรษณีย์");
        $("#scheduleTime").text("ตารางเวลา");
        $("#amount").text("จำนวนเงิน");
        $("#person").text("ผู้รับผิดชอบในการปฎิบัติหน้าที่");
        $("#contactNumber").text("เบอร์ติดต่อ");
        $("#remarks2").text("หมายเหตุ");
        $("#phone-remarks").text("หมายเหตุผู้ใช้โทรศัพท์");
        $('#company-destination').attr('placeholder', 'บริษัท');
        $('#to-destination').attr('placeholder', 'ปลายทาง');
        $('#unit').attr('placeholder', 'หน่วย.');
        $('#postal').attr('placeholder', 'ไปรษณีย์');
        $('#date').attr('placeholder', 'วันเวลา');
        $('#amount2').attr('placeholder', 'จำนวนเงิน');
        $('#pic').attr('placeholder', 'ผู้รับผิดชอบในการปฎิบัติหน้าที่');
        $('#phone').attr('placeholder', 'เบอร์ติดต่อ');
        $('#remarks').attr('placeholder', 'หมายเหตุ');
        $('#phoneremarks').attr('placeholder', 'หมายเหตุผู้ใช้โทรศัพท์');
        $("#viewmap").text("ดูแผนที่");
        $("#totaljobs").text("งานทั้งหมด: ");
        $("#nearestDevice").text("อุปกรณ์ที่ใกล้ที่สุด");
        $("#total").text("ทั้งหมด");
        $("#available-Device").text("มีให้บริการ");
        $("#submit-call").text("กำหนด");
        $('#reference').attr('placeholder', 'หมายเลขงาน');
        $("#jobOverview").text("ภาพรวมงาน");
        $("#avaiableFooter").text("มีให้บริการ");
        $("#inProgressFooter").text("กำลังดำเนินการ");
        $("#logoutFooter").text("ออกจากระบบ");
        $(".selectPhone").text("เลือกโทรศัพท์");

    }
    else if (getSessionstorageValueLanguage == "vn") {
        $("#newjob").text("Công Việc Mới");
        $("#company").text("Công Ty");
        $("#addressTo").text("Địa Chỉ Tới");
        $("#unit2").text("Đơn Vị Nos.");
        $("#postal2").text("Mã Postal");
        $("#scheduleTime").text("Lịch Trình");
        $("#amount").text("Số Lượng");
        $("#person").text("Người Phụ Trách");
        $("#contactNumber").text("Số ĐT Liên Hệ");
        $("#remarks2").text("Nhận Xét");
        $("#phone-remarks").text("Diện Thoại Nhận Xét");
        $('#company-destination').attr('placeholder', 'Công Ty');
        $('#to-destination').attr('placeholder', 'Địa Chỉ');
        $('#unit').attr('placeholder', 'Đơn Vị Nos.');
        $('#postal').attr('placeholder', 'Mã Postal');
        $('#date').attr('placeholder', 'Ngày giờ');
        $('#amount2').attr('placeholder', 'Số Lượng');
        $('#pic').attr('placeholder', 'Người Phụ Trách');
        $('#phone').attr('placeholder', 'Số ĐT Liên Hệ');
        $('#remarks').attr('placeholder', 'Nhận Xét');
        $('#phoneremarks').attr('placeholder', 'Nhận Xét');
        $("#viewmap").text("Xem Bản Đồ");
        $("#totaljobs").text("  ");
        $("#nearestDevice").text("Thiết Bị Gần Nhất");
        $("#total").text("Tổng Cộng");
        $("#available-Device").text("Thực Thi");
        $("#submit-call").text("Phân Công");
        $('#reference').attr('placeholder', 'Công Việc Số');
        $("#jobOverview").text("Liệt kê công việc");
        $("#avaiableFooter").text("Có Sẵn");
        $("#inProgressFooter").text("Trong Tiến Trình");
        $("#logoutFooter").text("Đăng Xuất");
        $(".selectPhone").text("Chọn Điện Thoại");

    }
    else if (getSessionstorageValueLanguage == "id") {
        $("#newjob").text("Kerja Baru");
        $("#company").text("Perusahaan");
        $("#addressTo").text("Dialamatkan ke");
        $("#unit2").text("Unit Nos");
        $("#postal2").text("Pos Kode");
        $("#scheduleTime").text("Jadwal Waktu");
        $("#amount").text("Jumlah");
        $("#person").text("Orang In Charge");
        $("#contactNumber").text("Nomor Kontak");
        $("#remarks2").text("Keterangan");
        $("#phone-remarks").text("Keterangan Pengguna Ponsel");
        $('#company-destination').attr('placeholder', 'Perusahaan');
        $('#to-destination').attr('placeholder', 'Tempat Tujuan');
        $('#unit').attr('placeholder', 'Unit Nos.');
        $('#postal').attr('placeholder', 'Pos Kode');
        $('#date').attr('placeholder', 'Tanggal Waktu');
        $('#amount2').attr('placeholder', 'Jumlah');
        $('#person2').attr('placeholder', 'Orang In Charge');
        $('#phone').attr('placeholder', 'Nomor Kontak');
        $('#remarks').attr('placeholder', 'Keterangan');
        $('#phoneremarks').attr('placeholder', 'Keterangan Pengguna Ponsel');
        $("#viewmap").text("Lihat Peta");
        $("#totaljobs").text("Jumlah Kerja: ");
        $("#nearestDevice").text("Perangkat Terdekat");
        $("#total").text("Jumlah");
        $("#available-Device").text("Sedia");
        $("#submit-call").text("Serah");
        $('#reference').attr('placeholder', 'Cari Nomor Kerja');
        $("#jobOverview").text("Ikhtisar Pekerjaan");
        $("#avaiableFooter").text("Sedia");
        $("#inProgressFooter").text("Sedang Berlangsung");
        $("#logoutFooter").text("Sudah Keluar");
        $(".selectPhone").text("Pilih Telepon");

    }
