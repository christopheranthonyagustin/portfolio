var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');
var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');
var titleJobNumber, titlePhone, titlePersonInCharge, titleScheduleTime, titleAddressTo, titleContactNumber, titleTo, titleAlertTime, titleCallCenter, titlePhoneUser, titleLocation, titleStart, titleEnd, titleSpeed, titleDeviceStatus, titlePhonePower, titleTimestamp, titleEvent, titleRemarks, titleLastKnown, titleJobStatus, titleCustomerCompany, titleUnit, titlePostal, titleAmount, titleSignature, titleEmail, titlePhoneUserAddress, titlePhoneUserProfile, titleJobType;
var titleItemNo, titleWeight, titleWidth, titleHeight, titleLength, titleUOM, titlePrice;
var titleEnterAddressPostal, titleEnterAddress, titleGeoCodeFail, titleError, titleSelected, titleCannotEditSchedule, titleJobCompletedCannotLoad, titleJobLoaded, titleJobNumberNotFound, titleCannotTransfer;
var titleFullName, titleMobileNumber, titleOfficeNumber;
var titleAddressFrom, titleUnit;
var titleScheduledTo, titleTransportType;
var titleAddItem, titleClearItem, titleComputeItem;
var titleServiceAmount, titleTransportAmount, titleTotalAmount;
var titleTotalJob;
var titleImportJob, titleStep1, titleStep2, titleStep3;
var titleBrowse, titleNofile, titlePreview, titleSubmit;
var titleAccepted ,titlePickup, titleEdited, titleTransferred;
var titleQuantity, titleOrderNo;
var checkbox;
    

if (getSessionstorageValueRoleID < 6) {
    checkbox = true;
} else {
    checkbox = false;
}

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
    titleItemNo = "Item No.";
    titleWeight = "Weight";
    titleWidth = "Width";
    titleHeight = "Height";
    titleLength = "Length";
    titleUOM = "UOM";
    titlePrice = "Price";
    titleCannotTransfer = "Job Cannot be Transfer or edit";

    titleFullName = "Full Name";
    titleMobileNumber = "Mobile Number";
    titleOfficeNumber = "Office Number";
    titleAddressFrom = "Address From";
    titleUnit = "Unit";
    titleScheduledTo = "Schedule Time To";
    titleTransportType = "Transport Type";
    titleAddItem = "Add Item";
    titleClearItem = "Clear Item";
    titleComputeItem = "Compute Item";
    titleServiceAmount = "Other Charges";
    titleTransportAmount = "Transport Amount";
    titleTotalAmount = "Total Amount";
    titleTotalJob = "Total Jobs";
    titleImportJob = "Import New Jobs";
    titleStep1 = "1. Step one: Upload";
    titleStep2 = "2. Step two: Export to Table";
    titleStep3 = "3. Step three: Submit";
    titleBrowse = "Browse...";
    titleNofile = "No file selected.";
    titlePreview = "Preview";
    titleSubmit = "Submit";
    titleAccepted = "Accepted";
    titlePickup = "Pick Up";
    titleEdited = "Edited";
    titleTransferred = "Transferred";
    titleQuantity = "Quantity";
    titleOrderNo = "Order No";


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
    titleItemNo = "หมายเลขสินค้า";
    titleWeight = "น้ำหนัก";
    titleWidth = "ความกว้าง";
    titleHeight = "ความสูง";
    titleLength = "ความยาว";
    titleUOM = "น้ำหนักปริมาตร";
    titlePrice = "ราคา";
    titleCannotTransfer = "งานไม่สามารถถ่ายโอนหรือแก้ไขได้";
    titleQuantity = "ปริมาณ";
    titleOrderNo = "เลขที่ใบสั่ง";

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
    titleEvent = "Biến Sự";
    titleRemarks = "Chú ý";
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
    titleTo = "Dến"
    titleEnterAddressPostal = "Bạn Phải Nhập Mã Dịa Chỉ Hoặc Mã Bưu Diện";
    titleEnterAddress = "Bạn Phải Nhập Địa chỉ";
    titleGeoCodeFail = "Bản đồ thất bại vì: ";
    titleError = "Lỗi Là: "
    titleSelected = "Bạn đã chọn: "
    titleCannotEditSchedule = "Không Thể Chỉnh Sửa Lịch Trình Công Việc ở Dây";
    titleJobCompletedCannotLoad = "Công Việc Dã Hoàn Thành Và kKhông Thể Tải ở Dây!";
    titleJobLoaded = "Đã Nạp Công Việc";
    titleJobNumberNotFound = "Không Tìm Thấy Số Việc Làm";
    titleItemNo = "Mã số";
    titleWeight = "Cân nặng";
    titleWidth = "Chiều rộng";
    titleHeight = "Chiều cao";
    titleLength = "Chiều dài";
    titleUOM = "Trọng lượng thể tích";
    titlePrice = "Giá bán";
    titleCannotTransfer = "Không thể chuyển công việc hoặc chỉnh sửa";
    titleQuantity = "Số lượng";
    titleOrderNo = "số thứ tự";

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
    titleItemNo = "Nomor barang";
    titleWeight = "Berat";
    titleWidth = "Lebar";
    titleHeight = "Tinggi";
    titleLength = "Panjangnya";
    titleUOM = "Berat Volumetrik";
    titlePrice = "Harga";
    titleCannotTransfer = "Pekerjaan Tidak Bisa Transfer atau Edit";
    titleQuantity = "Jumlah";
    titleOrderNo = "Nomor Pesanan";
}


var rows = [];
var data = [];

var $table = $('#cusSvcAmount'),
    $button = $('#addItem');
    $buttonClear = $('#clearItem');


var geocoder;
var map;
var markers = new Array();
var marker;
var direction;
var directions = new Array();
var styleMaker;
var styleMakers = new Array();

var assets = [];
var infoBoxList = [];
var k;
var zones = [];
var polygon;
var pathCoordinates = new google.maps.MVCArray();
var polygonCoordinates = new Array();
var circleCoordinates = new Array();
var circleCoordinates1 = new Array();

var paramtitle;
var firstData = true;
var openmarker = [];
var assetContent;
var assetJobInfo;
var assetVideo;

//=====================================//
var drawingManager;
var all_overlays = [];
var selectedShape;
var colors = ['#1E90FF', '#FF1493', '#32CD32', '#FF8C00', '#4B0082', '#8560a8', '#005e20', '#CBCC29', '#495f75', '#a00000', '#1B1B1B'];
var selectedColor;
var colorButtons = {};
var polygon;
var polygons = [];
var circle;
var circles = [];
var poi;
var pois = [];
var poiContent;
var markerLabel;
var markerLabels = [];

var all_overlays = [];
var selectedShape;
var infoWindowList = [];
var infoWindowListLabel = [];
var contentString;
var finalString;
var poiContent;
var rectangle;
var arrRectangle = [];
var marker1;
var marker2;
var recmarkers = new Array();
//=====================================//


var icon;
var iconURL = "img/markers/";
var iconURLOnClick = "img/no-bg/";
var markerCategory = "";
var pictureLabelURL = "img/categories/marker/";
var infoboxCloseURL = "img/close.gif";
var tipboxURL = "img/tipbox.gif";


// Shapes define the clickable region of the icon.
// The type defines an HTML &lt;area&gt; element 'poly' which
// traces out a polygon as a series of X,Y points. The final
// coordinate closes the poly by connecting to the first
// coordinate.
var shape = {
    //coords: [1, 1, 1, 20, 18, 20, 18, 1],
    coord: [16, 0, 18, 1, 21, 2, 24, 3, 26, 4, 27, 5, 28, 6, 29, 7, 29, 8, 29, 9, 29, 10, 29, 11, 29, 12, 29, 13, 29, 14, 29, 15, 29, 16, 29, 17, 29, 18, 29, 19, 29, 20, 29, 21, 29, 22, 29, 23, 29, 24, 29, 25, 29, 26, 29, 27, 29, 28, 28, 29, 3, 29, 2, 28, 2, 27, 1, 26, 1, 25, 1, 24, 0, 23, 0, 22, 0, 21, 0, 20, 0, 19, 0, 18, 0, 17, 0, 16, 0, 15, 0, 14, 0, 13, 0, 12, 0, 11, 0, 10, 0, 9, 0, 8, 0, 7, 1, 6, 2, 5, 2, 4, 3, 3, 5, 2, 6, 1, 8, 0, 16, 0],
    type: 'poly'
};



var arrNotif;
var mySound;
//Sounds Checkbox
var changeCheckbox = document.querySelector('.js-check-change-sounds');

var assetMarkerInterval, jobsCreatedInterval, jobsCreatedScheduledInterval;
var assetMarkerIntervalFilter;

var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'https://app.track-asia.com/tracksgwebapi/api/resellerinfo';

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

    WebAPIReseller = 'https://app.track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

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

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {

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

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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

        $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

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

            $.getJSON('https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + selectedCompany, function (data) {

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


var speed = 0.000005,
    wait = 1;
var timerHandle = null;
var polyline = null;
var poly2 = null;
var directionDisplay;
var directionsService;
var car_marker = null;

function initialize() {

    var latitude = 1.3000;
    var longitude = 103.8000;
    
    geocoder = new google.maps.Geocoder();
    map = new google.maps.Map(document.getElementById('map-canvas'), {
        zoom: 12,
        center: new google.maps.LatLng(latitude, longitude),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        fullscreenControl: true,
        fullscreenControlOptions:
        {
            position: google.maps.ControlPosition.RIGHT_BOTTOM
        }
    });

    var input = document.getElementById('asset-panel');
    map.controls[google.maps.ControlPosition.RIGHT_TOP].push(input);

    //setZones(map, zones, handleZones);
    setMarkers(map, assets, updateAssets);

    // Instantiate a directions service.
    directionsService = new google.maps.DirectionsService();

    // Create a renderer for directions and bind it to the map.
    var rendererOptions = {
        map: map
    };
    directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);

    polyline = new google.maps.Polyline({
        path: [],
        strokeColor: '#FF0000',
        strokeWeight: 3
    });
    poly2 = new google.maps.Polyline({
        path: [],
        strokeColor: '#FF0000',
        strokeWeight: 3
    });

    //document.getElementById('submit').addEventListener('click', function () {
    //    calculateAndDisplayRoute(directionsService, directionsDisplay);      
    //});

    //directionsDisplay.addListener('directions_changed', function () {
    //    calculateAndDisplayRoute(directionsService, directionsDisplay);      
    //});


    assetMarkerInterval = setInterval(function () {
        setMarkers(map, assets, updateAssets);

    }, '10000');


    SearchPlacesFrom();
    SearchPlacesTo();
    SearchWaypoints();
}

function calculateAndDisplayRoute(directionsService, directionsDisplay) {

    var waypts = [];
    //var svc_time = [];
    var $tds, itemNo, location, svc;
    var table = $("#cusSvcAmount tbody");
    table.find('tr').each(function (i) {
        $tds = $(this).find('td'),
            itemNo = $tds.eq(1).text(),
            location = $tds.eq(2).text()
       
        waypts.push({
            location: location,
            stopover: true
        });

        //svc_time.push(svc);

    });

    directionsService.route({
        origin: document.getElementById('start').value,
        destination: document.getElementById('end').value,
        waypoints: waypts,
        optimizeWaypoints: true,
        avoidTolls: true,
        travelMode: 'DRIVING',
    }, function (response, status) {
        if (status === 'OK') {
            directionsDisplay.setDirections(response);
            driveSim(response);
             
            //Direction Panel
            var route = response.routes[0];
            var summaryPanel = document.getElementById('directions-panel');
            summaryPanel.innerHTML = '';

            var genSvcDuration = $("#gen_svc_duration").val();
            var dateFormat = 'HH:mm';
            var getTimestamp = $("#start_time").val();
            var convertTmestamp = moment(getTimestamp, dateFormat);
            var hour = moment(convertTmestamp).format('HH');
            var minutes = moment(convertTmestamp).format('mm');
            var totalDist = 0;
            var secondsToArrival = 0;

            // set arrival time
            var arrival = new Date();
            arrival.setHours(hour); //Set Time
            arrival.setMinutes(minutes);
            arrival.setSeconds(0);

            var svcTemp = [];
            // For each route, display summary information.
            for (var i = 0; i < route.legs.length; i++) {

                var routeSegment = i + 1;
                secondsToArrival += route.legs[i].duration.value;
                totalDist += route.legs[i].distance.value;

                // new date variable.
                var startAtWaypoint = new Date();
                startAtWaypoint.setHours(arrival.getHours());
                startAtWaypoint.setMinutes(arrival.getMinutes());
                startAtWaypoint.setSeconds(arrival.getSeconds());

                // calculate difference.  We subtract the seconds.
                startAtWaypoint.setSeconds(arrival.getSeconds() + secondsToArrival); // Start

                switch (i) {
                    case 0:
                        var segment = 'A to B';
                        break;
                    case 1:
                        var segment = 'B to C';
                        break;
                    case 2:
                        var segment = 'C to D';
                        break;
                    case 3:
                        var segment = 'D to E';
                        break;
                    case 4:
                        var segment = 'E to F';
                        break;
                    case 5:
                        var segment = 'F to G';
                        break;
                    case 6:
                        var segment = 'G to H';
                        break;
                    case 7:
                        var segment = 'H to I';
                        break;
                    case 8:
                        var segment = 'I to J';
                        break;
                    case 9:
                        var segment = 'J to K';
                        break;
                    case 10:
                        var segment = 'K to L';
                        break;
                    default:
                        var segment = '';
                }

                var arrival_waypoint, departure_waypoint;

                if (i == 0) {
                    arrival_waypoint = moment(startAtWaypoint).format(dateFormat);
                    departure_waypoint = moment(startAtWaypoint).add(genSvcDuration, 'm').format(dateFormat);
                    svcTemp.push(genSvcDuration);
                } else {

                    if (genSvcDuration) {

                        arrival_waypoint = moment(startAtWaypoint).add(genSvcDuration * (routeSegment) - parseInt(genSvcDuration), 'm').format(dateFormat);
                        var sum = parseInt(genSvcDuration) + parseInt(svcTemp[0]);
                        svcTemp = [];
                        svcTemp.push(sum);
                    }
                    else {
                        arrival_waypoint = moment(startAtWaypoint).add(svcTemp[0], 'm').format(dateFormat);
                        svcTemp = [];
                    }

                    if (genSvcDuration) departure_waypoint = moment(startAtWaypoint).add(genSvcDuration * (routeSegment), 'm').format(dateFormat);
                }

                summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment + " (" + segment + ")" +
                    '</b><br>';
                summaryPanel.innerHTML += 'Location: ' + route.legs[i].start_address + ' to ';
                summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
                summaryPanel.innerHTML += 'Duration: ' + route.legs[i].duration.text + '<br>';
                summaryPanel.innerHTML += 'Distance: ' + route.legs[i].distance.text + '<br>';
                if (genSvcDuration) summaryPanel.innerHTML += 'Service Time: ' + genSvcDuration + '<br>';
                else summaryPanel.innerHTML += 'Service Time: ' + 0 + '<br>';
                summaryPanel.innerHTML += 'Arrival at waypoint: ' + arrival_waypoint + '<br>';
                if (genSvcDuration) summaryPanel.innerHTML += 'Departure at waypoint: ' + departure_waypoint + ' <hr>';

            }

      
            //Display total
            totalDist = totalDist / 1000.
            document.getElementById("total").innerHTML = "<div style='margin-top:10px;'>Total Distance: " + totalDist + " km<br>" +
                                                        "Total Driving Time: " + (secondsToArrival / 60).toFixed(2) + " minutes<br>" +
                                                        "Total Service Time: " + svcTemp[0] + " minutes<br>" +
                                                        "Start Time: " + $("#start_time").val() + "<br></div >" +
                                                        "End Time: " + moment(startAtWaypoint).add(svcTemp[0], 'm').format(dateFormat) + "<br></div >";

        } else {
            window.alert('Directions request failed due to ' + status);
        }
    });
}

function driveSim(response) {
       
    var path = response.routes[0].overview_path;
    var maxIter = path.length;
    var car = "M17.402,0H5.643C2.526,0,0,3.467,0,6.584v34.804c0,3.116,2.526,5.644,5.643,5.644h11.759c3.116,0,5.644-2.527,5.644-5.644 V6.584C23.044,3.467,20.518,0,17.402,0z M22.057,14.188v11.665l-2.729,0.351v-4.806L22.057,14.188z M20.625,10.773 c-1.016,3.9-2.219,8.51-2.219,8.51H4.638l-2.222-8.51C2.417,10.773,11.3,7.755,20.625,10.773z M3.748,21.713v4.492l-2.73-0.349 V14.502L3.748,21.713z M1.018,37.938V27.579l2.73,0.343v8.196L1.018,37.938z M2.575,40.882l2.218-3.336h13.771l2.219,3.336H2.575z M19.328,35.805v-7.872l2.729-0.355v10.048L19.328,35.805z";

    var heading = google.maps.geometry.spherical.computeHeading(lastPosn, p);
    icon.rotation = heading;

    taxiCab = new google.maps.Marker({
        position: path[0],
        map: map,
        rotation: heading,
        icon: {
            path: car,
            scale: 0.5,
            fillOpacity: 0.8,
            fillColor: 'yellow',
            offset: '100%',
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(16, 16),
        },
    });

    var delay = 100, count = 0;
    function delayed() {
        count += 1;
        taxiCab.setPosition({ lat: path[count].lat(), lng: path[count].lng() });
        if (count < maxIter - 1) {
            setTimeout(delayed, delay);
        }
    }
    delayed();
}  

var steps = [];

function calcRoute() {

    if ($('#start').val().length == 0 || $('#end').val().length == 0) {

        $.niftyNoty({
            type: 'danger',
            icon: 'fa fa-minus',
            message: 'Start/End must not be empty',
            container: 'floating',
            timer: 3000
        });

    } else {

        var waypts = [];
        //var svc_time = [];
        var $tds, itemNo, location;
        var table = $("#cusSvcAmount tbody");
        table.find('tr').each(function (i) {
            $tds = $(this).find('td'),
                itemNo = $tds.eq(1).text(),
                location = $tds.eq(2).text()

            waypts.push({
                location: location,
                stopover: true
            });

        });

        if (timerHandle) {
            clearTimeout(timerHandle);
        }
        if (car_marker) {
            car_marker.setMap(null);
        }

        polyline.setMap(null);
        poly2.setMap(null);
        directionsDisplay.setMap(null);
        polyline = new google.maps.Polyline({
            path: [],
            strokeColor: '#FF0000',
            strokeWeight: 3
        });
        poly2 = new google.maps.Polyline({
            path: [],
            strokeColor: '#FF0000',
            strokeWeight: 3
        });
        // Create a renderer for directions and bind it to the map.
        var rendererOptions = {
            map: map
        };
        directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);

        var start = document.getElementById("start").value;
        var end = document.getElementById("end").value;
        var travelMode = google.maps.DirectionsTravelMode.DRIVING;
        var tolls, highways;

        if ($('#tolls').prop("checked") == true) {
            tolls = true;
        } else {
            tolls = false;
        }

        if ($('#highways').prop("checked") == true) {
            highways = true;
        } else {
            highways = false;
        }


        var row = $('#cusSvcAmount tbody tr')[0];
        if (row.textContent == 'No matching records found') {
            // empty
            var request = {
                origin: start,
                destination: end,
                travelMode: travelMode,
                optimizeWaypoints: true,
                provideRouteAlternatives: false,
                avoidTolls: tolls,
                avoidHighways: highways,
                drivingOptions: {
                    departureTime: new Date(Date.now()),
                    trafficModel: $('#traffic_mode').val()
                }

            };
        } else {

            var request = {
                origin: start,
                destination: end,
                travelMode: travelMode,
                waypoints: waypts,
                optimizeWaypoints: true,
                provideRouteAlternatives: false,
                avoidTolls: tolls,
                avoidHighways: highways,
                drivingOptions: {
                    departureTime: new Date(Date.now()),
                    trafficModel: $('#traffic_mode').val()
                }

            };

        }

        // Route the directions and pass the response to a
        // function to create markers for each step.
        directionsService.route(request, function (response, status) {

            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);

                //Direction Panel
                var route = response.routes[0];
                var summaryPanel = document.getElementById('directions-panel');
                summaryPanel.innerHTML = '';

                var markup = "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto;' class=''>" +
                    "<table id='resultsTable' class='table table-bordered' cellspacing='0' width='100%'>" +
                    "<thead>" +
                    "<tr>" +
                    "<th style='color: blue;'>SN</th>" +
                    "<th style='color: blue;'>Segment</th>" +
                    "<th style='color: blue;'>Location From</th>" +
                    "<th style='color: blue;'>Location To</th>" +
                    "<th style='color: blue;'>Duration</th>" +
                    "<th style='color: blue;'>Distance</th>" +
                    "<th style='color: blue;'>Service Time</th>" +
                    "<th style='color: blue;'>Arrival at waypoint</th>" +
                    "<th style='color: blue;'>Departure at waypoint</th>" +
                    "<th style='color: blue;'>Waypoint Status</th>" +
                    "</tr>" +
                    "</thead>" +
                    "<tbody>"

                var genSvcDuration = $("#gen_svc_duration").val();
                var dateFormat = 'HH:mm';
                var getTimestamp = $("#start_time").val();
                var convertTimestamp = moment(getTimestamp, dateFormat);
                var hour = moment(convertTimestamp).format('HH');
                var minutes = moment(convertTimestamp).format('mm');
                var totalDist = 0;
                var secondsToArrival = 0

                // set arrival time
                var arrival = new Date();
                arrival.setHours(hour); //Set Time
                arrival.setMinutes(minutes);
                arrival.setSeconds(0);

                var bounds = new google.maps.LatLngBounds();
                startLocation = new Object();
                endLocation = new Object();

                var svcTemp = [];

                // For each route, display summary information.
                var legs = response.routes[0].legs;
                for (i = 0; i < legs.length; i++) {
                    if (i === 0) {
                        startLocation.latlng = legs[i].start_location;
                        startLocation.address = legs[i].start_address;
                    }
                    endLocation.latlng = legs[i].end_location;
                    endLocation.address = legs[i].end_address;
                    var steps = legs[i].steps;
                    for (j = 0; j < steps.length; j++) {
                        var nextSegment = steps[j].path;
                        for (k = 0; k < nextSegment.length; k++) {
                            polyline.getPath().push(nextSegment[k]);
                            bounds.extend(nextSegment[k]);
                        }
                    }

                    var routeSegment = i + 1;
                    secondsToArrival += legs[i].duration.value;
                    totalDist += legs[i].distance.value;

                    // new date variable.
                    var startAtWaypoint = new Date();
                    startAtWaypoint.setHours(arrival.getHours());
                    startAtWaypoint.setMinutes(arrival.getMinutes());
                    startAtWaypoint.setSeconds(arrival.getSeconds());

                    // calculate difference.  We subtract the seconds.
                    startAtWaypoint.setSeconds(arrival.getSeconds() + secondsToArrival); // Start

                    switch (i) {
                        case 0:
                            var segment = 'A to B';
                            break;
                        case 1:
                            var segment = 'B to C';
                            break;
                        case 2:
                            var segment = 'C to D';
                            break;
                        case 3:
                            var segment = 'D to E';
                            break;
                        case 4:
                            var segment = 'E to F';
                            break;
                        case 5:
                            var segment = 'F to G';
                            break;
                        case 6:
                            var segment = 'G to H';
                            break;
                        case 7:
                            var segment = 'H to I';
                            break;
                        case 8:
                            var segment = 'I to J';
                            break;
                        case 9:
                            var segment = 'J to K';
                            break;
                        case 10:
                            var segment = 'K to L';
                            break;
                        case 11:
                            var segment = 'L to M';
                            break;
                        case 12:
                            var segment = 'M to N';
                            break;
                        case 13:
                            var segment = 'N to O';
                            break;
                        case 14:
                            var segment = 'O to P';
                            break;
                        case 15:
                            var segment = 'P to Q';
                            break;
                        case 16:
                            var segment = 'Q to R';
                            break;
                        case 17:
                            var segment = 'R to S';
                            break;
                        case 18:
                            var segment = 'S to T';
                            break;
                        case 19:
                            var segment = 'T to U';
                            break;
                        case 20:
                            var segment = 'U to V';
                            break;
                        case 21:
                            var segment = 'V to W';
                            break;
                        case 22:
                            var segment = 'W to X';
                            break;
                        case 23:
                            var segment = 'X to Y';
                            break;
                        case 24:
                            var segment = 'Y to Z';
                            break;
                        default:
                            var segment = '';
                    }

                    var arrival_waypoint, departure_waypoint;

                    if (i == 0) {
                        arrival_waypoint = moment(startAtWaypoint).format(dateFormat);
                        departure_waypoint = moment(startAtWaypoint).add(genSvcDuration, 'm').format(dateFormat);
                        svcTemp.push(genSvcDuration);
                    } else {

                        if (genSvcDuration) {

                            arrival_waypoint = moment(startAtWaypoint).add(genSvcDuration * (routeSegment) - parseInt(genSvcDuration), 'm').format(dateFormat);
                            var sum = parseInt(genSvcDuration) + parseInt(svcTemp[0]);
                            svcTemp = [];
                            svcTemp.push(sum);
                        }
                        else {
                            arrival_waypoint = moment(startAtWaypoint).add(svcTemp[0], 'm').format(dateFormat);
                            svcTemp = [];
                        }

                        if (genSvcDuration) departure_waypoint = moment(startAtWaypoint).add(genSvcDuration * (routeSegment), 'm').format(dateFormat);
                    }

                    summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment + " (" + segment + ")" +
                        '</b><br>';
                    summaryPanel.innerHTML += 'Location: ' + route.legs[i].start_address + ' to ';
                    summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
                    summaryPanel.innerHTML += 'Duration: ' + route.legs[i].duration.text + '<br>';
                    summaryPanel.innerHTML += 'Distance: ' + route.legs[i].distance.text + '<br>';
                    if (genSvcDuration) summaryPanel.innerHTML += 'Service Time: ' + genSvcDuration + '<br>';
                    else summaryPanel.innerHTML += 'Service Time: ' + 0 + '<br>';
                    summaryPanel.innerHTML += 'Arrival at waypoint: ' + arrival_waypoint + '<br>';
                    if (genSvcDuration) summaryPanel.innerHTML += 'Departure at waypoint: ' + departure_waypoint + '<br>';
                    if (route.legs[i].duration_in_traffic) summaryPanel.innerHTML += 'Traffic Duration: ' + route.legs[i].duration_in_traffic.text;
                    summaryPanel.innerHTML += ' <hr>';
         
                    var duration = route.legs[i].duration.text;
                    var distance = route.legs[i].distance.text;

                    //Tables
                    markup += "<tr>" +
                        "<td style='padding: 5px;'>" +
                        serialFormatter(i) +
                        "</td>" +
                        "<td style='padding: 5px;'>Route Segment&nbsp;" +
                        routeSegment + " (" + segment + ")" +
                        "</td>" +
                        "<td style='padding: 5px;'>" +
                        route.legs[i].start_address +
                        "</td>" +
                        "<td style='padding: 5px;'>" +
                        route.legs[i].end_address +
                        "</td>" +
                        "<td style='padding: 5px;'>" +
                        duration.replace(/[^\d.-]/g, '') +
                        "</td>" +
                        "<td style='padding: 5px;'>" +
                        distance.replace(/[^\d.-]/g, '') +
                        "</td>" +
                        "<td style='padding: 5px;'>" +
                        genSvcDuration +
                        "</td>" +
                        "<td style='padding: 5px;'>" +
                        arrival_waypoint +
                        "</td>" +
                        "<td style='padding: 5px;'>" +
                        departure_waypoint +
                        "</td>" +
                        "<td style='padding: 5px;'>" +
                        waypointFormatter(i, legs.length) +
                        "</td>" +
                        "</tr>"

                    if (i + 1 == legs.length) {
                        markup += "</tbody></table>" + "</div>";

                        if (markup !== undefined || markup !== null) $('#results-panel').html(markup);
                    }

                }

                //Display total
                totalDist = totalDist / 1000.
                document.getElementById("total").innerHTML = "<div style='margin-top:10px;'><strong>Total Distance:&nbsp;</strong><span id='total_distance'></span>&nbsp;km<br>" +
                    "<strong>Total Driving Time:&nbsp;</strong><span id='total_journey'></span>&nbsp;minutes<br>" +
                    "<strong>Total Service Time:&nbsp;</strong><span id='total_svc'></span>&nbsp;minutes<br>" +
                    "<strong>Start Time:&nbsp;</strong>" + $("#start_time").val() + "<br></div >" +
                    "<strong>End Time:&nbsp;</strong><span id='end_time'></span>&nbsp;<br></div >";

                $("#total_distance").text(totalDist);
                $("#total_journey").text((secondsToArrival / 60).toFixed(2));
                $("#total_svc").text(svcTemp[0]);
                $("#end_time").text(moment(startAtWaypoint).add(svcTemp[0], 'm').format(dateFormat));

                polyline.setMap(map);
                map.fitBounds(bounds);
                map.setZoom(18);
                startAnimation();
            }
        });
    }
}

function serialFormatter(value) {

    return value + 1;
}

function waypointFormatter(value, arryNo) {
    var rtnVal;

    if (value == 0) {
        rtnVal = 1;
    }
    else if (value > 0 && value + 1 < arryNo) {
        rtnVal = 2;
    }
    else if (value + 1 == arryNo) {
        rtnVal = 3;
    }

    return rtnVal;
}


var step = 50; // 5; // metres
var tick = 100; // milliseconds
var eol;
var k = 0;
var stepnum = 0;
var speed = "";
var lastVertex = 1;

//=============== animation functions ======================
function updatePoly(d) {
    // Spawn a new polyline every 20 vertices, because updating a 100-vertex poly is too slow
    if (poly2.getPath().getLength() > 20) {
        poly2 = new google.maps.Polyline([polyline.getPath().getAt(lastVertex - 1)]);
        // map.addOverlay(poly2)
    }

    if (polyline.GetIndexAtDistance(d) < lastVertex + 2) {
        if (poly2.getPath().getLength() > 1) {
            poly2.getPath().removeAt(poly2.getPath().getLength() - 1);
        }
        poly2.getPath().insertAt(poly2.getPath().getLength(), polyline.GetPointAtDistance(d));
    } else {
        poly2.getPath().insertAt(poly2.getPath().getLength(), endLocation.latlng);
    }
}

function animate(d) {
    if (d > eol) {
        //map.panTo(endLocation.latlng);
        car_marker.setPosition(endLocation.latlng);
        return;
    }
    var p = polyline.GetPointAtDistance(d);
    //map.panTo(p);
    var lastPosn = car_marker.getPosition();
    car_marker.setPosition(p);
    var heading = google.maps.geometry.spherical.computeHeading(lastPosn, p);
    car_icon.rotation = heading;
    car_marker.setIcon(car_icon);
    updatePoly(d);
    timerHandle = setTimeout("animate(" + (d + step) + ")", tick);
}

function startAnimation() {
    eol = polyline.Distance();
    map.setCenter(polyline.getPath().getAt(0));
    car_marker = new google.maps.Marker({
        position: polyline.getPath().getAt(0),
        map: map,
        icon: car_icon
    });

    poly2 = new google.maps.Polyline({
        path: [polyline.getPath().getAt(0)],
        strokeColor: "#0000FF",
        strokeWeight: 10
    });

    setTimeout("animate(50)", 2000); // Allow time for the initial map display
}

//=============== ~animation funcitons =====================

var car = "M17.402,0H5.643C2.526,0,0,3.467,0,6.584v34.804c0,3.116,2.526,5.644,5.643,5.644h11.759c3.116,0,5.644-2.527,5.644-5.644 V6.584C23.044,3.467,20.518,0,17.402,0z M22.057,14.188v11.665l-2.729,0.351v-4.806L22.057,14.188z M20.625,10.773 c-1.016,3.9-2.219,8.51-2.219,8.51H4.638l-2.222-8.51C2.417,10.773,11.3,7.755,20.625,10.773z M3.748,21.713v4.492l-2.73-0.349 V14.502L3.748,21.713z M1.018,37.938V27.579l2.73,0.343v8.196L1.018,37.938z M2.575,40.882l2.218-3.336h13.771l2.219,3.336H2.575z M19.328,35.805v-7.872l2.729-0.355v10.048L19.328,35.805z";
var car_icon = {
    path: car,
    scale: .5,
    //strokeColor: 'white',
    //strokeWeight: .10,
    fillOpacity: 1,
    fillColor: 'yellow',
    offset: '5%',
    // rotation: parseInt(heading[i]),
    anchor: new google.maps.Point(10, 25) // orig 10,50 back of car, 10,0 front of car, 10,25 center of car
};

// === first support methods that don't (yet) exist in v3
google.maps.LatLng.prototype.distanceFrom = function (newLatLng) {
    var EarthRadiusMeters = 6378137.0; // meters
    var lat1 = this.lat();
    var lon1 = this.lng();
    var lat2 = newLatLng.lat();
    var lon2 = newLatLng.lng();
    var dLat = (lat2 - lat1) * Math.PI / 180;
    var dLon = (lon2 - lon1) * Math.PI / 180;
    var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var d = EarthRadiusMeters * c;
    return d;
}

google.maps.LatLng.prototype.latRadians = function () {
    return this.lat() * Math.PI / 180;
}

google.maps.LatLng.prototype.lngRadians = function () {
    return this.lng() * Math.PI / 180;
}

// === A method which returns the length of a path in metres ===
google.maps.Polygon.prototype.Distance = function () {
    var dist = 0;
    for (var i = 1; i < this.getPath().getLength(); i++) {
        dist += this.getPath().getAt(i).distanceFrom(this.getPath().getAt(i - 1));
    }
    return dist;
}

// === A method which returns a GLatLng of a point a given distance along the path ===
// === Returns null if the path is shorter than the specified distance ===
google.maps.Polygon.prototype.GetPointAtDistance = function (metres) {
    // some awkward special cases
    if (metres == 0) return this.getPath().getAt(0);
    if (metres < 0) return null;
    if (this.getPath().getLength() < 2) return null;
    var dist = 0;
    var olddist = 0;
    for (var i = 1;
        (i < this.getPath().getLength() && dist < metres); i++) {
        olddist = dist;
        dist += this.getPath().getAt(i).distanceFrom(this.getPath().getAt(i - 1));
    }
    if (dist < metres) {
        return null;
    }
    var p1 = this.getPath().getAt(i - 2);
    var p2 = this.getPath().getAt(i - 1);
    var m = (metres - olddist) / (dist - olddist);
    return new google.maps.LatLng(p1.lat() + (p2.lat() - p1.lat()) * m, p1.lng() + (p2.lng() - p1.lng()) * m);
}

// === A method which returns an array of GLatLngs of points a given interval along the path ===
google.maps.Polygon.prototype.GetPointsAtDistance = function (metres) {
    var next = metres;
    var points = [];
    // some awkward special cases
    if (metres <= 0) return points;
    var dist = 0;
    var olddist = 0;
    for (var i = 1;
        (i < this.getPath().getLength()); i++) {
        olddist = dist;
        dist += this.getPath().getAt(i).distanceFrom(this.getPath().getAt(i - 1));
        while (dist > next) {
            var p1 = this.getPath().getAt(i - 1);
            var p2 = this.getPath().getAt(i);
            var m = (next - olddist) / (dist - olddist);
            points.push(new google.maps.LatLng(p1.lat() + (p2.lat() - p1.lat()) * m, p1.lng() + (p2.lng() - p1.lng()) * m));
            next += metres;
        }
    }
    return points;
}

// === A method which returns the Vertex number at a given distance along the path ===
// === Returns null if the path is shorter than the specified distance ===
google.maps.Polygon.prototype.GetIndexAtDistance = function (metres) {
    // some awkward special cases
    if (metres == 0) return this.getPath().getAt(0);
    if (metres < 0) return null;
    var dist = 0;
    var olddist = 0;
    for (var i = 1;
        (i < this.getPath().getLength() && dist < metres); i++) {
        olddist = dist;
        dist += this.getPath().getAt(i).distanceFrom(this.getPath().getAt(i - 1));
    }
    if (dist < metres) {
        return null;
    }
    return i;
}
// === Copy all the above functions to GPolyline ===
google.maps.Polyline.prototype.Distance = google.maps.Polygon.prototype.Distance;
google.maps.Polyline.prototype.GetPointAtDistance = google.maps.Polygon.prototype.GetPointAtDistance;
google.maps.Polyline.prototype.GetPointsAtDistance = google.maps.Polygon.prototype.GetPointsAtDistance;
google.maps.Polyline.prototype.GetIndexAtDistance = google.maps.Polygon.prototype.GetIndexAtDistance;

function setMarkers(map, assets, callback) {


    if (getSessionstorageValueRoleID == 1) {

        MarkerAPI = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + '1' + '&CompanyID=' + '1';

    } else if (getSessionstorageValueRoleID == 2) {

        MarkerAPI = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {


        MarkerAPI = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }

    //alert(MarkerAPI);
    $.getJSON(MarkerAPI, function (assets) {

        callback(assets);

    });


}

var paramtitle;
var firstData = true;
function updateAssets(data) {

    //first start
    var bounds = new google.maps.LatLngBounds();

    for (var i = 0, length = data.length; i < length; i++) {

        if (data[i]) {

            if (data[i].LastPos == null || data[i].LastPos.Engine == null || data[i].LastPos.PosID == 0 || data[i].LastPos === "") {
                console.log('Data is Null');
                down++;
                continue;
            }

            else {

                var assets = data[i];
                var latLng = new google.maps.LatLng(data[i].LastPos.PosY, data[i].LastPos.PosX);
                var id = data[i].AssetID;
                var category = data[i].Category;
                var company = data[i].Company;
                var vechs = data[i].Name;
                var gps = data[i].Gps;
                var gprs = data[i].Gprs;
                var engine = data[i].Engine;
                var make = data[i].Make;
                var model = data[i].Model;
                var plate_no = data[i].LicensePlate;
                var address = data[i].LastPos.Location;
                var speed = data[i].LastPos.Speed;
                var course = data[i].LastPos.Course;
                var zone = data[i].LastPos.Zone;
                var speedLimit = data[i].SpeedLimit;
                var tagID = data[i].TagID;
                var mileage = data[i].LastPos.Mileage;
                var assetTimestamp = data[i].LastPos.Timestamp;
                var assetBattery = data[i].LastPos.Battery.toFixed(2);
                var finaldata1 = data[i].Name.match(/.{1,28}/g).join("<br/>");
                var finaldata = finaldata1.substring(0, 18);
                var getXPosition = data[i].LastPos.PosX;
                var getYPosition = data[i].LastPos.PosY;
                var timestamp1 = moment.utc(assetTimestamp).local().format("DD MMM YYYY");
                var d = new Date();
                var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
                timestamp2 = Date.parse(timestamp2);
                timestamp1 = Date.parse(timestamp1);

                //Convert Timezone
                var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
                var Bangkok = moment.tz(assetTimestamp, Asia);
                var timestamp;

                if (assets.TagType == "N32A") {
                    timestamp = moment.utc(Bangkok.format()).add('hours', 0).format('D-MMM-YYYY, hh:mm:ss A');
                }
                else {
                    timestamp = moment.utc(Bangkok.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
                }

                switch (engine) {
                    case "MOVE":
                        icon = "move";
                        break;
                    case "IDLE":
                        icon = "idle";
                        break;
                    case "STOP":
                        icon = "stop";
                        break;
                    default:
                        icon = "down";
                }

                // Category image
                switch (category) {
                    case "Car":
                        markerCategory = "car";
                        break;
                    case "Truck":
                        markerCategory = "truck";
                        break;
                    case "Van":
                        markerCategory = "van";
                        break;
                    case "Bus":
                        markerCategory = "bus";
                        break;
                    case "Motorcycle":
                        markerCategory = "motorcycle";
                        break;
                    case "Recovery Veh":
                        markerCategory = "truck";
                        break;
                    case "Lorry":
                        markerCategory = "truck";
                        break;
                    case "10 Footer Lorry":
                        markerCategory = "truck";
                        break;
                    case "14 Footer Lorry":
                        markerCategory = "truck";
                        break;
                    case "Ambulance":
                        markerCategory = "ambulance";
                        break;
                }

                if (timestamp2 > timestamp1) {

                    icon = {
                        url: iconURL + markerCategory + "-" + "down" + ".png", // url
                        scaledSize: new google.maps.Size(28, 28), // scaled size
                        origin: new google.maps.Point(0, 0), // origin
                        anchor: new google.maps.Point(14, 14) // anchor
                    };
                }
                else {
                    icon = {
                        url: iconURL + markerCategory + "-" + icon + ".png", // url
                        scaledSize: new google.maps.Size(28, 28), // scaled size
                        origin: new google.maps.Point(0, 0), // origin
                        anchor: new google.maps.Point(14, 14) // anchor
                    };
                }

                iconDirection = {
                    path: 'M -3,0 0,-3 3,0 0,-1 z',
                    scale: 2,
                    strokeColor: '#5CB000',
                    strokeWeight: 1,
                    fillOpacity: 0.8,
                    fillColor: 'green',
                    offset: '100%',
                    rotation: course,
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(0, 8)
                };

                //  Format for Asset Status Infobox Color
                // =================================================================
                var assetColor;

                if (engine == 'MOVE')
                    assetColor = "success";
                else if (engine == 'IDLE')
                    assetColor = "warning";
                else if (engine == 'STOP' && timestamp2 > timestamp1)
                    assetColor = "down";
                else if (engine == 'STOP')
                    assetColor = "danger";


                var assetDriver;
                if (assets.ImageFill == 'None') {
                    assetDriver = "img/av1.png";
                } else if (assets.ImageFill == 'Uniform') {
                    assetDriver = assets.Image;
                }

                var driverName;
                if (assets.Driver.Name == null) {
                    driverName = "No Driver";
                } else {
                    driverName = assets.Driver.Name;
                }


                var driverAddress;
                if (assets.Driver.Address == null) {
                    driverAddress = "No Driver Address";
                } else {
                    driverAddress = assets.Driver.Address;
                }


                var driverPhone;
                if (assets.Driver.Phone == null) {
                    driverPhone = "No Driver Phone";
                } else {
                    driverPhone = assets.Driver.Phone;
                }


                var assetContent = "<div id='assetInfo' class='form-group' style='padding:0px !important; color: black;'>";
                if (plate_no !== "Unknown") assetContent += "<h6 style='color:#4286CF;'>" + finaldata + " - (" + plate_no + ")</h6>";
                else assetContent += "<h6 style='color:#4286CF;'>" + finaldata + "</h6>";

                assetContent += "<table id='assetDetails' class='table table-bordered table-vcenter'>" +
                    "<tbody>" +
                    "<tr>" + "<td>";
                if (make !== "Unknown") assetContent += "<span data-l11n class='text-bold'>Brand:&nbsp;</span>" + make +
                    "<br />";
                if (model !== "Unknown") assetContent += "<span data-l11n class='text-bold'>Model:&nbsp;</span>" + model +
                    "<br />";
                assetContent += "<span data-l11n class='text-bold'>Address:&nbsp;</span>" + address +
                    "<br />" +
                    "<span data-l11n class='text-bold'>Date:&nbsp;</span>" + timestamp +
                    "<br />" +
                    "<span data-l11n class='text-bold'>Speed:&nbsp;</span>" + speedFormatter(speed) +
                    "<br />" +
                    //"<span data-l11n class='text-bold'>Total Mileage:&nbsp;</span>" + meterTokm(mileage) +
                    //"<br />" +
                    "<span data-l11n class='text-bold'>Driver:&nbsp;</span>" + driverName +
                    "<br />" +
                    "<span data-l11n class='text-bold'>Zones:&nbsp;</span>" + zone +
                    "<br />" +
                    '<span class="text-bold">Route Info:&nbsp;</span><input id="destination" type="text" class="input-sm" placeholder="Enter Destination" style="margin-right:10px;"><button id="submitdest" class="btn-dark btn btn-sm" onclick="searchdestination(\'' + getYPosition + ',' + getXPosition + '\')">Search</button>' +
                    "</td>" + "</tr>"
                "</tbody>" + "</table>" +
                    "</div>"; //infobox


                marker = new setInfoBubble({
                    map: map,
                    position: latLng,
                    icon: icon,
                    shape: shape,
                    category: category,
                    address: address,
                    vechs: vechs,
                    id: id,
                    gps: gps,
                    gprs: gprs,
                    title: vechs,
                    zone: zone,
                    engine: engine,
                    speed: speed,
                    mileage: mileage,
                    timestamp: timestamp,
                    getYPosition: getYPosition,
                    getXPosition: getXPosition,
                    assetBattery: assetBattery,
                    content: assetContent
                });

                marker.setMap(map);

                styleMaker = new StyledMarker({
                    styleIcon: new StyledIcon(StyledIconTypes.BUBBLE, {
                        color: "#458FD2",
                        text: vechs,
                        fore: "#FFFFFF"
                    }),
                    position: latLng,
                    map: map,
                    shadow: 'none'
                });

                direction = new google.maps.Marker({
                    position: latLng,
                    map: map,
                    icon: {
                        //path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
                        path: 'M -3,0 0,-3 3,0 0,-1 z',
                        scale: 2,
                        strokeColor: '#5CB000',
                        strokeWeight: 1,
                        fillOpacity: 0.8,
                        fillColor: 'green',
                        offset: '100%',
                        rotation: course,
                        origin: new google.maps.Point(0, 0),
                        anchor: new google.maps.Point(0, 8)

                    },
                    //shape: shape,
                    category: category,
                    engine: engine,
                    company: company,
                    vechs: vechs,
                    speed: speed,
                });


                if (speed > 0 && engine != "STOP") {

                    if (timestamp2 > timestamp1) {
                        direction.setVisible(false);
                    }
                    else {
                        if (engine == "MOVE") {
                            direction.setVisible(true);
                        }
                        else if (engine == "IDLE") {
                            direction.setVisible(false);
                        }
                    }

                }
                else {
                    direction.setVisible(false);
                }


                if (markers[i] && markers[i].setPosition) {
                    //$("#assetStatus tr").remove();
                    $("#assetStatus").empty();
                    //direction.setVisible(false);
                    //marker.setVisible(false);
                    // To remove the marker from the map
                    marker.setMap(null);
                    direction.setMap(null);
                    styleMaker.setMap(null);


                    markers[i].setPosition(latLng);
                    directions[i].setPosition(latLng);
                    styleMakers[i].setPosition(latLng);

                    if (speed > 0 && engine != "STOP") {

                        if (timestamp2 > timestamp1) {
                            directions[i].setVisible(false);
                        }
                        else {

                            directions[i].setIcon(iconDirection);

                            if (engine == "MOVE") {
                                directions[i].setVisible(true);
                            }
                            else if (engine == "IDLE") {
                                directions[i].setVisible(false);
                            }
                        }

                    }
                    else {
                        directions[i].setVisible(false);
                    }

                    markers[i].setIcon(icon);
                    //markers[i].setIcon(/** @type {google.maps.Icon} */({
                    //    url: icon,
                    //    scaledSize: new google.maps.Size(28, 28), // scaled size
                    //    origin: new google.maps.Point(0, 0), // origin
                    //    anchor: new google.maps.Point(14, 14) // anchor
                    //}));

                    if (paramtitle == vechs) {
                        markers[i].content = assetContent;
                        markers[i].address = address;
                        markers[i].timestamp = timestamp;
                        markers[i].gps = gps;
                        markers[i].gprs = gprs;
                        if ($('#assetInfo').val() != null || $('#assetInfo').val() != undefined) { document.getElementById('assetInfo').innerHTML = assetContent; }
                        //map.panTo(marker.getPosition());
                    }
                    else {
                        markers[i].content = assetContent;
                        markers[i].address = address;
                        markers[i].timestamp = timestamp;
                        markers[i].gps = gps;
                        markers[i].gprs = gprs;
                    }


                } else {

                    bounds.extend(latLng);
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
                    directions[i] = direction;
                    styleMakers[i] = styleMaker;


                }//end of else
            }//end of else continue     

        }


    }//end of for

    if (firstData) {
        map.setZoom(7);
        map.fitBounds(bounds);

        firstData = false;
    }

    if (marker) openmarker = findMarker(marker.position);

    //end

}

function findMarker(pt) {
    var openmarker = [];
    for (var i = 0; i < markers.length; i++) {
        openmarker.push(markers[i]);
    }

    return openmarker.splice(0);
}

function searchdestination(address) {

    destto = $('#destination').val();

    URLDest = "https://www.google.com/maps/dir/" + address + "/" + destto;

    if ($('#destination').val().length == 0) {
        alert("Your Destination is empty!");
    } else {
        window.open(URLDest, 'newwindow');
    }
}

function setInfoBubble(param) {

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
        getHeight = 260;
        getHeightChart = 220;
    } else {
        // not Google chrome 
        getWidth = 220;
        getHeight = 240;
        getHeightChart = 220;
    }


    var newMarker = new google.maps.Marker({
        map: param.map,
        position: param.position,
        title: param.title,
        category: param.category,
        address: param.address,
        timestamp: param.timestamp,
        vechs: param.vechs,
        gps: param.gps,
        gprs: param.gprs,
        zone: param.zone,
        engine: param.engine,
        speed: param.speed,
        icon: icon,
        shape: shape,
        content: param.content
    });

    if (param.content) {
        google.maps.event.addListener(newMarker, 'click', function () {

            for (var i = 0; i < infoBoxList.length; i++) {

                infoBoxList[i].close();
            }

            // Reset the markers array
            infoBoxList = [];

            var infoBubble;
            // this -> the marker on which the onclick event is being attached
            if (!this.getMap().newMarker) {
                infoBubble = this.getMap().newMarker = new google.maps.InfoWindow({

                });

                infoBoxList.push(infoBubble);

            }
            //this.getMap().newMarker.close();
            this.getMap().newMarker.setContent(this.content);
            this.getMap().newMarker.open(this.getMap(), this);
            //this.getMap().newMarker.removeTab(2);
            //this.getMap().newMarker.removeTab(1);
            //this.getMap().newMarker.removeTab(0);
            //this.getMap().newMarker.addTab('Details', this.content);
            //this.getMap().newMarker.addTab('Driver', param.assetDriverInfo);
            this.getMap().setCenter(this.position);
            paramtitle = param.title;

        });

        google.maps.event.addListener(newMarker, 'mouseover', function () {

            for (var i = 0; i < infoBoxList.length; i++) {

                infoBoxList[i].close();
            }

            // Reset the markers array
            infoBoxList = [];

            var infoBubble;
            // this -> the marker on which the onclick event is being attached
            if (!this.getMap().newMarker) {
                infoBubble = this.getMap().newMarker = new google.maps.InfoWindow({

                });

                infoBoxList.push(infoBubble);

            }
            //this.getMap().newMarker.close();
            this.getMap().newMarker.setContent(this.content);
            this.getMap().newMarker.open(this.getMap(), this);
            //this.getMap().newMarker.removeTab(2);
            //this.getMap().newMarker.removeTab(1);
            //this.getMap().newMarker.removeTab(0);
            //this.getMap().newMarker.addTab('Details', this.content);
            //this.getMap().newMarker.addTab('Driver', param.assetDriverInfo);
            this.getMap().setCenter(this.position);
            paramtitle = param.title;

        });

    }



    return newMarker;
}

function setZones(map, zones, callback) {

    if (getSessionstorageValueRoleID == 1) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + '4' + '&CompanyID=' + '2';

    } else if (getSessionstorageValueRoleID == 2) {
        url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {

        url = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }

    $.getJSON(url, function (data) {
        callback(data);
    });
}

var circle = {};
var circle1 = {};
var polygon1 = {};

function handleZones(zones) {

    for (var i = 0; i < zones.length; i++) {

        var zone = zones[i];
        var zoneID = zone.ZoneID;
        var name = zone.Name;
        var type = zone.Type;
        var perimeter = zone.Perimeter;
        var company = zone.Company;
        var color = zone.Color;
        var location = zone.Location;


        var coords = perimeter.split(" ");
        var recoords;
        var Pos;
        var zoneCircle;
        var zoneCircle1;
        var imageUrl = 'https://chart.apis.google.com/chart?cht=mm&chs=24x32&' + 'chco=FFFFFF,' + (Math.random() * 0xFFFFFF << 0).toString(16) + '&ext=.png';


        if (/\s/.test(perimeter)) {
            // It has any kind of whitespace
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

        } else {


            var perimeterPOI = zones[i].Perimeter.split(",");
            var latLngPOI = new google.maps.LatLng(parseFloat(perimeterPOI[0]), parseFloat(perimeterPOI[1]));

            poi = new google.maps.Marker({
                map: map,
                position: latLngPOI,
                draggable: false,
                icon: imageUrl,
                title: name
            });

            pois.push(poi);



            markerLabel = new MarkerWithLabel({
                position: latLngPOI,
                draggable: false,
                map: map,
                icon: imageUrl,
                labelContent: name,
                labelAnchor: new google.maps.Point(22, 0),
                labelClass: "labels", // the CSS class for the label
                labelStyle: { opacity: 0.75 }
            });

            markerLabels.push(markerLabel);


            // InfoBox
            poiContent = "<div class='form-group' style='color:#4C4C4C;'>" +
                "<h6 style='color:#4286CF;'>" + name + "</h6>" +
                "<table id='assetDetails' class='table table-bordered table-vcenter'>" +
                "<tbody>" +
                "<tr>" + "<td>" +
                "<span data-l11n class='text-bold'>Location:&nbsp;</span>" + location +
                "<br />" +
                "<span data-l11n class='text-bold'>Type:&nbsp;</span>" + type +
                "<br />" +
                "<span class='text-bold'>Coordinates:&nbsp;</span>" + perimeter +
                "</td>" + "</tr>"
            "</tbody>" + "</table>" +
                "</div>"; //infobox


            setPOILabel(markerLabel, markerLabels[i]);
        }




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

function setPOILabel(markerLabel, markerLabels) {


    var getWidth;
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
        getWidth = 220;
        getHeight = 150;
    } else {
        // not Google chrome 
        getWidth = 180;
        getHeight = 150;
    }

    var infoBubble = new InfoBubble({
        minWidth: getWidth,
        minHeight: getHeight,
        map: map,
        content: poiContent,
        shadowStyle: 1,
        //padding: 0,
        // backgroundColor: 'rgb(57,57,57)',
        borderRadius: 4,
        arrowSize: 15,
        borderWidth: 1,
        // borderColor: '#2c2c2c',
        disableAutoPan: false,
        hideCloseButton: false,
        arrowPosition: 30,
        backgroundClassName: 'phoney',
        arrowStyle: 2
    });

    infoWindowListLabel.push(infoBubble);


    markerLabel.addListener('click', function () {

        infoBubble.open(markerLabel.get('map'), markerLabel);
    });

}

/** @this {google.maps.Polygon} */
function showArrays(event) {

    // Since this polygon has only one path, we can call getPath()
    // to return the MVCArray of LatLngs.
    var vertices = this.getPath();

    var contentString = '<strong>Zone: &nbsp;</strong>' + this.Name + '<br>' +
        '<strong>Company: &nbsp;</strong>' + this.Company + '<br>' +
        '<strong>Clicked location:</strong> <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
        '<br>';

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

google.maps.event.addDomListener(window, 'load', initialize);


function speedFormatter(value) {

    //Speed Formula
    if (value < 20) {
        var convertKmPerHour = value * 3.6;
    }
    else {
        var convertKmPerHour = value * 3.6 / 2;
    }

    var roundoff = Math.round(convertKmPerHour * 100) / 100;

    return roundoff + ' Km/h';
}

function codeAddress() {

    for (var i = 0; i < circleCoordinates.length; i++) {
        circleCoordinates[i].setMap(null);
    }

    for (var i = 0; i < infoBoxList.length; i++) {
        infoBoxList[i].close(null);
    }


    var origin = $('#origin').val();

    var destination = $('#destination').val();

    if (origin.length == 0 && destination.length == 0) {
        alert(titleEnterAddressPostal);
        return;
    }
    else {
        geocoder.geocode({
            'address': origin

        }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                console.log(results[0].geometry.location);

                var coords = results[0].geometry.location;

                if (origin.length == 6 && isNaN(origin) == false) {
                    sessionStorage.setItem("setSessionstorageValueNewJobCoordinatesFrom", coords);
                    var input = sessionStorage.getItem('setSessionstorageValueNewJobCoordinatesFrom');
                    var latlngStr = input.split(',', 2);
                    var lat = parseFloat(latlngStr[0].replace(/\(/g, ""));
                    var lng = parseFloat(latlngStr[1].replace(/\)/g, ""));

                    //Reverse Geocode
                    var getAPI = "https://app.track-asia.com/tracksgwebapi/api/reversegeocode?PosY=" + lat + "&PosX=" + lng;
                    console.log(getAPI);

                    $.getJSON(getAPI, function (data) {

                        $.each(data, function (index, item) {
                            sessionStorage.setItem("setSessionstorageValueNewJobLocationFrom", item.Location);
                        });

                    });
                }
                else {
                    //Remove session storage
                    sessionStorage.removeItem("setSessionstorageValueNewJobCoordinatesFrom");
                    sessionStorage.removeItem("setSessionstorageValueNewJobLocationFrom");
                }


                if (customerMarker) customerMarker.setMap(null);
                customerMarker = new google.maps.Marker({
                    map: map,
                    icon: {
                        'url': 'img/blue_MarkerA.png',
                    },
                    position: results[0].geometry.location
                });


                var radiusOptions = ({
                    clickable: false,
                    strokeColor: '#1bb6ff',
                    strokeOpacity: 0.8,
                    strokeWeight: 2,
                    fillColor: '#61a0bf',
                    fillOpacity: 0.4,
                    map: map,
                    center: results[0].geometry.location,
                    radius: 5 * 1000
                });

                // Add the circle for this city to the map.
                geocodeCircle = new google.maps.Circle(radiusOptions);

                circleCoordinates.push(geocodeCircle);


                for (var i = 0; i < markers.length; i++) {
                    if (markers[i] === marker)
                        markers[i].setMap(null); //Check if marker is undefined   
                }

                var numResults = markers.length

                // get driving distance
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

    if (destination.length == 0) {
        alert(titleEnterAddressPostal);
        return;
    }
    else {
        geocoder.geocode({
            'address': destination

        }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                console.log(results[0].geometry.location);

                var coords = results[0].geometry.location;

                if (destination.length == 6 && isNaN(destination) == false) {
                    sessionStorage.setItem("setSessionstorageValueNewJobCoordinatesTo", coords);
                    var input = sessionStorage.getItem('setSessionstorageValueNewJobCoordinatesTo');
                    var latlngStr = input.split(',', 2);
                    var lat = parseFloat(latlngStr[0].replace(/\(/g, ""));
                    var lng = parseFloat(latlngStr[1].replace(/\)/g, ""));

                    //Reverse Geocode
                    var getAPI = "https://app.track-asia.com/tracksgwebapi/api/reversegeocode?PosY=" + lat + "&PosX=" + lng;
                    console.log(getAPI);

                    $.getJSON(getAPI, function (data) {

                        $.each(data, function (index, item) {
                            sessionStorage.setItem("setSessionstorageValueNewJobLocationTo", item.Location);
                        });

                    });
                }
                else {
                    //Remove session storage
                    sessionStorage.removeItem("setSessionstorageValueNewJobCoordinatesTo");
                    sessionStorage.removeItem("setSessionstorageValueNewJobLocationTo");
                }


                if (customerMarkerB) customerMarkerB.setMap(null);
                customerMarkerB = new google.maps.Marker({
                    map: map,
                    icon: {
                        'url': 'img/blue_MarkerB.png',
                    },
                    position: results[0].geometry.location
                });

                var radiusOptions = ({
                    clickable: false,
                    strokeColor: '#E64328',
                    strokeOpacity: 0.8,
                    strokeWeight: 2,
                    fillColor: '#a00000',
                    fillOpacity: 0.4,
                    map: map,
                    center: results[0].geometry.location,
                    radius: 5 * 1000
                });

                // Add the circle for this city to the map.
                geocodeCircle = new google.maps.Circle(radiusOptions);

                circleCoordinates.push(geocodeCircle);

                for (var i = 0; i < markers.length; i++) {
                    if (markers[i] === marker)
                        markers[i].setMap(null); //Check if marker is undefined   
                }


            }
            else {
                alert(titleGeoCodeFail + status);
            }
        });
    }




}

function findClosestN(pt, numberOfResults) {
    var closest = [];
    for (var i = 0; i < markers.length; i++) {
        if (markers[i] === marker) //Check if marker is undefined
        {
            markers[i].distance = google.maps.geometry.spherical.computeDistanceBetween(pt, markers[i].getPosition());
            markers[i].setMap(null);
        }
        if (markers[i].assetflag > 0) closest.push(markers[i]);
    }
    closest.sort(sortByDist);

    return closest.splice(0, numberOfResults);
}

function sortByDist(a, b) {
    return (a.distance - b.distance)
}

function calculateDistances(pt, closest, numberOfResults) {
    var service = new google.maps.DistanceMatrixService();

    var request = {
        origins: [pt],
        destinations: [],
        travelMode: google.maps.TravelMode.DRIVING,
        unitSystem: google.maps.UnitSystem.METRIC,
        avoidHighways: false,
        avoidTolls: false
    };
    for (var i = 0; i < closest.length; i++) request.destinations.push(closest[i].getPosition());

    service.getDistanceMatrix(request, function (response, status) {
        if (status != google.maps.DistanceMatrixStatus.OK) {
            alert(titleError + status);
        } else {
            var origins = response.originAddresses;
            var destinations = response.destinationAddresses;
            var outputDiv = document.getElementById('side_bar');
            outputDiv.innerHTML = '';

            var results = response.rows[0].elements;

            for (var i = 0; i < numberOfResults; i++) {
                //alert("Job Status: " + closest[i].jobStatus);
                //alert("Job Flag: " + closest[i].flag);
                //alert("Job Asset Flag: " + closest[i].assetflag);
                closest[i].setMap(map);
                if (closest[i].assetflag == 1)
                    //if (closest[i].flag == 0 || closest[i].flag == 1 && closest[i].jobStatus == "Scheduled")
                        var timestamp1 = moment.utc(closest[i].timestamp).local().format("DD MMM YYYY");
                var d = new Date();
                var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
                timestamp2 = Date.parse(timestamp2);
                timestamp1 = Date.parse(timestamp1);
                if (timestamp1 == timestamp2)


                    outputDiv.innerHTML += "<div style='margin-top:10px;'>"
                        + "<table id='availAmbulance' border='0'>"
                        + "<tbody>"
                        + "<tr>"
                        + "<td>"
                        + "<strong><a href='javascript:google.maps.event.trigger(closest[" + i + "],\"click\");' style='color:#458FD2;'>" + closest[i].title + '</a></strong><br>' + closest[i].address + "<br>"
                        + results[i].distance.text + ' appoximately '
                        + results[i].duration.text + '<br>'
                        + "</td>"
                        + "<td class='col-md-1'>"
                        + "<div class='pad-ver'><label class='form-primary'><input id='getAddress' value='" + closest[i].address + "'  type='checkbox' onClick='getAvailableAmbulance(this,&quot;" + closest[i].title + "&quot;,&quot;" + closest[i].address + "&quot;,&quot;" + closest[i].id + "&quot;);'></label><div>"
                        + "</td>"
                        + "</tr>"
                        + "</tbody>"
                        + "</table>"
                        + "</div>"
                        + "<hr>";

            }
        }
    });

}

function getAvailableAmbulance(cb, title, address, id) {

    var $inputs = $('input:checkbox')

    if (cb.checked == true) {
        //alert('Asset ID: ' + id);
        sessionStorage.setItem("setSessionstorageValueAvailableAmbulance", id);
        searchDriver(id);
        searchDevice(id);
        alert(titleSelected + title);
        //$inputs.not(cb).prop('disabled', true);
    }
    else if (cb.checked == false) {
        //$inputs.prop('disabled', false); // <-- enable all checkboxes
        sessionStorage.removeItem('setSessionstorageValueAvailableAmbulance');
        //alert('This will reset you have selected');
        //window.location.reload(true);
    }

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
    var apiDriver = 'https://app.track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&AssetID=' + id;
    var apiDevice = 'https://app.track-asia.com/tracksgwebapi/api/deviceinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&AssetID=' + id;
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
    var apiDevice = 'https://app.track-asia.com/tracksgwebapi/api/deviceinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&AssetID=' + id;
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

    $('#cusSvcAmount').bootstrapTable('removeAll');
    $('#cusSvcAmount-modify').show();


    var getJobNumber = $('#reference').val();
    var apiJobNumber = 'https://app.track-asia.com/tracksgwebapi/api/searchjob?JobNumber=' + getJobNumber;
    
    $.getJSON(apiJobNumber, function (data) {

        if (data.length == 1) {

            $.each(data, function (index, item) {

                if (item.JobType == 2) {
                    alert(titleCannotEditSchedule);
                }
                else {

                    if (item.flag == 0 || item.flag == 4 || item.flag == 5) {
                        if (item.FlagValue == "Completed") alert(titleJobCompletedCannotLoad);
                        else alert(titleCannotTransfer)
                    }
                    else {

                        // var getDriverPhone = item.MobileNumber;
                        // sessionStorage.setItem("setSessionstorageValueDriverPhone", getDriverPhone);

                        // var getAssetID = item.AssetID;
                        // sessionStorage.setItem("setSessionstorageValuePreviousAsset", getAssetID);


                        //Format UTC
                        // var timestamp = moment.utc(item.Timestamp).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
                        // var rxtime = moment.utc(item.RxTime).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');


                        // var jobID = $('#jobid').val(item.JobID);
                        // var jobCusCompany = $('#company-destination').val(item.CusCompany);
                        // var jobName = $('#name').val(item.CusName);
                        // var jobEmail = $('#email').val(item.Email);
                        // var jobDateTime = $('#date').val(timestamp);
                        // var jobDateTimeTo = $('#date-to').val(rxtime);
                        // var jobAmount = $('#amount').val(item.Amount);
                        // var jobSvcAmount = $('#svcAmount').val(item.SvcAmount);
                        // var jobTransportAmount = $('#transportAmount').val(item.TransportAmount);

                        // var jobOfficeNumber = $('#office').val(item.OfficeNumber);
                        // var jobMobileNumber = $('#mobile').val(item.MobileNumber);
                        // var jobOrigin = $('#origin').val(item.Origin);
                        // var jobOriginUnit = $('#originUnit').val(item.OriginUnit);
                        // var jobOriginPostal = $('#postal-from').val(item.OriginPostalCode);
                        // var jobOriginDistrict = $('#district-from').val(item.OriginDistrict);
                        // var jobOriginProvince = $('#province-from').val(item.OriginProvince);
                        // var jobDestination = $('#destination').val(item.Destination);
                        // var jobDestinationUnit = $('#destinationUnit').val(item.DestinationUnit);
                        // var jobDestinationPostal = $('#postal-to').val(item.DestinationPostalCode);
                        // var jobDestinationDistrict = $('#district-to').val(item.DestinationDistrict);
                        // var jobDestinationProvince = $('#province-to').val(item.DestinationProvince);
                        // var jobRemarks = $('#remarks').val(item.Remarks);
                        // var jobTransport = $('#transport').val(item.TransportID);
                        // var jobPayment = $('#payment').val(item.Payment);

                        $("#service").prop('disabled', true);

                        if(item.Flag == 1 || item.Flag == 6)
                        {
                            $("#service").val("pickup").change();

                            //Pick Up 
                            $("#name").prop('disabled', false);
                            //$("#invoice-pickup").prop('disabled', false);
                            $("#company-destination").prop('disabled', false);
                            $("#email").prop('disabled', false);
                            $("#mobile").prop('disabled', false);
                            $("#office").prop('disabled', false);
                            $("#origin").prop('disabled', false);
                            $("#originUnit").prop('disabled', false);
                            $("#date").prop('disabled', false);
                            $("#date-to").prop('disabled', false);

                            //Delivery
                            $("#dcp").prop('disabled', true);
                            //$("#invoice-delivery").prop('disabled', true);
                            $("#dcpCompany").prop('disabled', true);
                            $("#dcpEmail").prop('disabled', true);
                            $("#dcpNumber").prop('disabled', true);
                            $("#dcpOffice").prop('disabled', true);
                            $("#destination").prop('disabled', true);
                            $("#destinationUnit").prop('disabled', true);
                            $("#dcpdate").prop('disabled', true);
                            $("#dcpdate-to").prop('disabled', true);

                            $('#destination').val('');
                            $('#destinationUnit').val('');
                            $('#dcp').val('');
                            $('#dcpCompany').val('');
                            $('#dcpEmail').val('');
                            $('#dcpNumber').val('');
                            $('#dcpOffice').val('');
                            $("#dcpdate").val('');
                            $("#dcpdate-to").val('');

                            $('#jobid').val(item.JobID);
                            $('#remarks').val(item.Remarks);
                            $('#origin').val(item.PickupOrigin);
                            $('#originUnit').val(item.PickupOriginUnit);
                            $('#name').val(item.PickupName);
                            $('#company-destination').val(item.PickupCompany);
                            $('#email').val(item.PickupEmail);
                            $('#mobile').val(item.PickupMobileNumber);
                            $('#office').val(item.PickupOfficeNumber);


                            var Pickup = item.Pickup;
                            var rows = [];
                            for (var i = 0; i < Pickup.length; ++i) {
                                rows.push({
                                    PickupID: Pickup[i].PickupID,
                                    Weight: Pickup[i].Weight,
                                    OrderNo: Pickup[i].InvoiceID,
                                    Commodity: Pickup[i].ProductName,
                                    Quantity: Pickup[i].Quantity,
                                    Item: Pickup[i].ItemNo
                                });
                            }
                            
                            var timestamp = moment(Pickup[0].Timestamp).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');
                            var rxtime = moment(Pickup[0].RxTime).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');


                            $('#date').val(timestamp);
                            $('#date-to').val(rxtime);
                            // $('#pickupID-cusSvcAmount').val(Pickup[0].PickupID);
                            $('#jobID-cusSvcAmount').val(item.JobID);
                            
                        }
                        else if (item.Flag == 2 || item.Flag == 7)
                        {
                            $("#service").val("delivery").change();

                            //Pick Up 
                            $("#name").prop('disabled', true);
                            //$("#invoice-pickup").prop('disabled', true);
                            $("#company-destination").prop('disabled', true);
                            $("#email").prop('disabled', true);
                            $("#mobile").prop('disabled', true);
                            $("#office").prop('disabled', true);
                            $("#origin").prop('disabled', true);
                            $("#originUnit").prop('disabled', true);
                            $("#date").prop('disabled', true);
                            $("#date-to").prop('disabled', true);
                            
                            //Delivery
                            $("#dcp").prop('disabled', false);
                            //$("#invoice-delivery").prop('disabled', false);
                            $("#dcpCompany").prop('disabled', false);
                            $("#dcpEmail").prop('disabled', false);
                            $("#dcpNumber").prop('disabled', false);
                            $("#dcpOffice").prop('disabled', false);
                            $("#destination").prop('disabled', false);
                            $("#destinationUnit").prop('disabled', false);
                            $("#dcpdate").prop('disabled', false);
                            $("#dcpdate-to").prop('disabled', false);

                            $('#origin').val('');
                            $('#originUnit').val('');
                            $('#name').val('');
                            $('#company-destination').val('');
                            $('#email').val('');
                            $('#mobile').val('');
                            $('#office').val('');
                            $('#date').val('');
                            $('#date-to').val('');

                            $('#jobid').val(item.JobID);
                            $('#remarks').val(item.Remarks);
                            $('#jobID-cusSvcAmount').val(item.JobID);
                            $('#destination').val(item.DeliveryDestination);
                            $('#destinationUnit').val(item.DeliveryDestinationUnit);
                            $('#dcp').val(item.DeliveryName);
                            $('#dcpCompany').val(item.DeliveryCompany);
                            $('#dcpEmail').val(item.DeliveryEmail);
                            $('#dcpNumber').val(item.DeliveryMobileNumber);
                            $('#dcpOffice').val(item.DeliveryOfficeNumber);
                           

                            var Delivery = item.Delivery;
                            var rows = [];
                            for (var i = 0; i < Delivery.length; ++i) {
                                rows.push({
                                    PickupID: Delivery[i].DeliveryID,
                                    Weight: Delivery[i].Weight,
                                    OrderNo: Delivery[i].InvoiceID,
                                    Commodity: Delivery[i].ProductName,
                                    Quantity: Delivery[i].Quantity,
                                    Item: Delivery[i].ItemNo
                                });
                            }

                            var timestamp = moment(Delivery[0].Timestamp).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');
                            var rxtime = moment(Delivery[0].RxTime).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');

                            $('#dcpdate').val(timestamp);
                            $('#dcpdate-to').val(rxtime);

                            // $('#pickupID-cusSvcAmount').val(Delivery[0].DeliveryID);
                            
                        }
                       

                        $('#cusSvcAmount').bootstrapTable('append', rows);
                        $('#getAssets').val(item.Asset);

                        // if (getSessionstorageValueCompanyID == 4) {
                        //     $('.phoneuserRemarks').show();
                        // }
                        // else {
                        //     $('.phoneuserRemarks').hide();
                        // }
                        // $(".jobsCreatedTable").css('height', '295px');
                        // codeAddress();

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

function reloadItem() {

    $('#cusSvcAmount').bootstrapTable('removeAll');
    //$('#cusSvcAmount-modify').show();

    var getJobNumber = $('#reference').val();
    var apiJobNumber = 'https://app.track-asia.com/tracksgwebapi/api/searchjob?JobNumber=' + getJobNumber;
    
    $.getJSON(apiJobNumber, function (data) {

        if (data.length == 1) {

            $.each(data, function (index, item) {

                if (item.JobType == 2) {
                    alert(titleCannotEditSchedule);
                }
                else {

                    if (item.Flag == 0 || item.Flag == 4 || item.Flag == 5) {
                        if (item.FlagValue == "Completed") 
                        alert(titleJobCompletedCannotLoad);
                        else alert(titleCannotTransfer)
                    }
                    else {
                        //$("#service").prop('disabled', true);

                        if(item.Flag == 1 || item.Flag == 6)
                        {
                            $("#service").val("pickup").change();
                            //Pick Up 
                            $("#name").prop('disabled', false);
                            //$("#invoice-pickup").prop('disabled', false);
                            $("#company-destination").prop('disabled', false);
                            $("#email").prop('disabled', false);
                            $("#mobile").prop('disabled', false);
                            $("#office").prop('disabled', false);
                            $("#origin").prop('disabled', false);
                            $("#originUnit").prop('disabled', false);
                            $("#date").prop('disabled', false);
                            $("#date-to").prop('disabled', false);

                            //Delivery
                            $("#dcp").prop('disabled', true);
                            //$("#invoice-delivery").prop('disabled', true);
                            $("#dcpCompany").prop('disabled', true);
                            $("#dcpEmail").prop('disabled', true);
                            $("#dcpNumber").prop('disabled', true);
                            $("#dcpOffice").prop('disabled', true);
                            $("#destination").prop('disabled', true);
                            $("#destinationUnit").prop('disabled', true);
                            $("#dcpdate").prop('disabled', true);
                            $("#dcpdate-to").prop('disabled', true);

                            $('#destination').val('');
                            $('#destinationUnit').val('');
                            $('#dcp').val('');
                            $('#dcpCompany').val('');
                            $('#dcpEmail').val('');
                            $('#dcpNumber').val('');
                            $('#dcpOffice').val('');
                            $("#dcpdate").val('');
                            $("#dcpdate-to").val('');

                            $('#jobid').val(item.JobID);
                            $('#remarks').val(item.Remarks);
                            $('#origin').val(item.PickupOrigin);
                            $('#originUnit').val(item.PickupOriginUnit);
                            $('#name').val(item.PickupName);
                            $('#company-destination').val(item.PickupCompany);
                            $('#email').val(item.PickupEmail);
                            $('#mobile').val(item.PickupMobileNumber);
                            $('#office').val(item.PickupOfficeNumber);


                            var Pickup = item.Pickup;
                            var rows = [];
                            for (var i = 0; i < Pickup.length; ++i) {
                                rows.push({
                                    PickupID: Pickup[i].PickupID,
                                    Weight: Pickup[i].Weight,
                                    OrderNo: Pickup[i].InvoiceID,
                                    Commodity: Pickup[i].ProductName,
                                    Quantity: Pickup[i].Quantity,
                                    Item: Pickup[i].ItemNo
                                });
                            }
                            
                            var timestamp = moment(Pickup[0].Timestamp).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');
                            var rxtime = moment(Pickup[0].RxTime).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');


                            $('#date').val(timestamp);
                            $('#date-to').val(rxtime);
                            // $('#pickupID-cusSvcAmount').val(Pickup[0].PickupID);
                            $('#jobID-cusSvcAmount').val(item.JobID);
                            
                        }
                        else if (item.Flag == 2 || item.Flag == 7)
                        {
                            $("#service").val("delivery").change();

                            //Pick Up 
                            $("#name").prop('disabled', true);
                            //$("#invoice-pickup").prop('disabled', true);
                            $("#company-destination").prop('disabled', true);
                            $("#email").prop('disabled', true);
                            $("#mobile").prop('disabled', true);
                            $("#office").prop('disabled', true);
                            $("#origin").prop('disabled', true);
                            $("#originUnit").prop('disabled', true);
                            $("#date").prop('disabled', true);
                            $("#date-to").prop('disabled', true);
                            
                            //Delivery
                            $("#dcp").prop('disabled', false);
                            //$("#invoice-delivery").prop('disabled', false);
                            $("#dcpCompany").prop('disabled', false);
                            $("#dcpEmail").prop('disabled', false);
                            $("#dcpNumber").prop('disabled', false);
                            $("#dcpOffice").prop('disabled', false);
                            $("#destination").prop('disabled', false);
                            $("#destinationUnit").prop('disabled', false);
                            $("#dcpdate").prop('disabled', false);
                            $("#dcpdate-to").prop('disabled', false);

                            $('#origin').val('');
                            $('#originUnit').val('');
                            $('#name').val('');
                            $('#company-destination').val('');
                            $('#email').val('');
                            $('#mobile').val('');
                            $('#office').val('');
                            $('#date').val('');
                            $('#date-to').val('');

                            $('#jobid').val(item.JobID);
                            $('#remarks').val(item.Remarks);
                            $('#jobID-cusSvcAmount').val(item.JobID);
                            $('#destination').val(item.DeliveryDestination);
                            $('#destinationUnit').val(item.DeliveryDestinationUnit);
                            $('#dcp').val(item.DeliveryName);
                            $('#dcpCompany').val(item.DeliveryCompany);
                            $('#dcpEmail').val(item.DeliveryEmail);
                            $('#dcpNumber').val(item.DeliveryMobileNumber);
                            $('#dcpOffice').val(item.DeliveryOfficeNumber);
                           

                            var Delivery = item.Delivery;
                            var rows = [];
                            for (var i = 0; i < Delivery.length; ++i) {
                                rows.push({
                                    PickupID: Delivery[i].DeliveryID,
                                    Weight: Delivery[i].Weight,
                                    OrderNo: Delivery[i].InvoiceID,
                                    Commodity: Delivery[i].ProductName,
                                    Quantity: Delivery[i].Quantity,
                                    Item: Delivery[i].ItemNo
                                });
                            }

                            var timestamp = moment(Delivery[0].Timestamp).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');
                            var rxtime = moment(Delivery[0].RxTime).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');

                            $('#dcpdate').val(timestamp);
                            $('#dcpdate-to').val(rxtime);

                            // $('#pickupID-cusSvcAmount').val(Delivery[0].DeliveryID);
                            
                        }
                       

                        $('#cusSvcAmount').bootstrapTable('append', rows);
                        $('#getAssets').val(item.Asset);

                        // if (getSessionstorageValueCompanyID == 4) {
                        //     $('.phoneuserRemarks').show();
                        // }
                        // else {
                        //     $('.phoneuserRemarks').hide();
                        // }
                        // $(".jobsCreatedTable").css('height', '295px');
                        // codeAddress();

                        $('.selectpicker').selectpicker('refresh');
                    }

                }

            });


        }

    });

}

function clearJobForms() {

    $("#name").val('');
    $("#company-destination").val('');
    $("#email").val('');
    $("#mobile").val('');
    $("#office").val('');
    $("#origin").val('');
    $("#originUnit").val('');
    $("#dcp").val('');
    $("#dcpCompany").val('');
    $("#dcpEmail").val('');
    $("#dcpNumber").val('');
    $("#dcpOffice").val('');
    $("#destination").val('');
    $("#destinationUnit").val('');
    $("#remarks").val('');
    $("#jobid").val('');
    // $("#date").val('');
    // $("#date-to").val('');
    // $("#dcpdate").val('');
    // $("#dcpdate-to").val('');
    $('#cusSvcAmount').bootstrapTable('removeAll');
    $("#cusSvcAmount-modify").hide();
    rows = [];



}

function clearJobFormsScheduled() {
    
        $('#name-scheduled').val('');
        $('#company-destination-scheduled').val('');
        $('#email-scheduled').val('');
        $('#origin-scheduled').val('');
        $('#originUnit-scheduled').val('');
        $('#destination-scheduled').val('');
        $('#desUnit-scheduled').val('');
        $('#mobile-scheduled').val('');
        $('#office-scheduled').val('');
        $('#remarks-scheduled').val('');  
        $('#svcAmount-scheduled').val('');    
        $('#transportAmount-scheduled').val('');    
        $('#amount-scheduled').val('');      
        $('#weight-scheduled').val('');    
        $('#width-scheduled').val('');    
        $('#height-scheduled').val('');  
        $('#length-scheduled').val('');              
        $tableScheduled.bootstrapTable('removeAll');
        rows = [];
        
}

function signFormatter(value, row) {
    var labelColor;
    var text;

    if (row.ImageFillSignatures == "Uniform") {
        text = value;
        labelColor = "dark";
        
        if (text.substring(0, 16) == "pickupsignatures" || text.substring(0, 18) == "deliverysignatures")
        {    
            if (getSessionstorageValueLanguage == "en") {
                text = "No Signature Photo";
            }
            else if (getSessionstorageValueLanguage == "th") {
                text = "ไม่มีภาพถ่ายลายเซ็น";
            } else if (getSessionstorageValueLanguage == "vn") {
                text = "Không có Ảnh Chữ ký";
            } else if (getSessionstorageValueLanguage == "id") {
                text = "Tidak ada Signature Foto";
            }
            return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
        }
        else
        {
            return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.JobNumber + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';
        }
   

    } else if (row.ImageFillSignatures != "Uniform") {
        labelColor = "dark";
        if (getSessionstorageValueLanguage == "en") {
            text = "No Signature Photo";
        }
        else if (getSessionstorageValueLanguage == "th") {
            text = "ไม่มีภาพถ่ายลายเซ็น";
        } else if (getSessionstorageValueLanguage == "vn") {
            text = "Không có Ảnh Chữ ký";
        } else if (getSessionstorageValueLanguage == "id") {
            text = "Tidak ada Signature Foto";
        }
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }

}

function pickupsignFormatter(value, row) {
    var labelColor;
    var text;

    if (row.PickupFillSignatures == "Uniform") {
        text = value;
        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.JobNumber + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

    }
    else if (row.PickupFillSignatures != "Uniform") {
        labelColor = "dark";

        if (getSessionstorageValueLanguage == "en") {
            text = "No Signature Photo";
        }
        else if (getSessionstorageValueLanguage == "th") {
            text = "ไม่มีภาพถ่ายลายเซ็น";
        } else if (getSessionstorageValueLanguage == "vn") {
            text = "Không có Ảnh Chữ ký";
        } else if (getSessionstorageValueLanguage == "id") {
            text = "Tidak ada Signature Foto";
        }
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }


}

function cameraFormatter(value, row) {
    var labelColor;
    var text;

    if (row.ImageFillCamera == "Uniform") {
        text = value;
        if (text.substring(0, 14) == "deliverycamera" || text.substring(0, 12) == "pickupcamera")
        {
            labelColor = "dark";
            if (getSessionstorageValueLanguage == "en") {
                text = "No Image";
            }
            else if (getSessionstorageValueLanguage == "th") {
                text = "ไม่มีรูป";
            } else if (getSessionstorageValueLanguage == "vn") {
                text = "Không có hình ảnh";
            } else if (getSessionstorageValueLanguage == "id") {
                text = "Tidak ada gambar";
            }
            return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
        }

        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.JobNumber + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';
    }
    else if (row.DeliveryFillCamera == "Uniform") {

        text = value;
        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.JobNumber + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

    } else if (row.ImageFillCamera != "Uniform" || row.ImageFillCamera == "") {
        labelColor = "dark";
        if (getSessionstorageValueLanguage == "en") {
            text = "No Image";
        }
        else if (getSessionstorageValueLanguage == "th") {
            text = "ไม่มีรูป";
        } else if (getSessionstorageValueLanguage == "vn") {
            text = "Không có hình ảnh";
        } else if (getSessionstorageValueLanguage == "id") {
            text = "Tidak ada gambar";
        }
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }
    else if (row.DeliveryFillCamera != "Uniform" || row.DeliveryFillCamera == "") {

        labelColor = "dark";
        if (getSessionstorageValueLanguage == "en") {
            text = "No Image";
        }
        else if (getSessionstorageValueLanguage == "th") {
            text = "ไม่มีรูป";
        } else if (getSessionstorageValueLanguage == "vn") {
            text = "Không có hình ảnh";
        } else if (getSessionstorageValueLanguage == "id") {
            text = "Tidak ada gambar";
        }
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }
    

}

function formFormatter(value, row) {
    var labelColor;
    var text;
    if (row.ImageFillForms == "Uniform") {
        text = value;

        //return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.JobNumber + '">View PDF</a></div></center>';
        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.JobNumber + '"><i class="fa fa-file-pdf-o fa-lg" style="color:white;"></i></a></div></center>';

    } else if (row.ImageFillForms != "Uniform") {
        labelColor = "dark";
        if (getSessionstorageValueLanguage == "en") {
            text = "No PDF";
        }
        else if (getSessionstorageValueLanguage == "th") {
            text = "ไม่มีรูป";
        } else if (getSessionstorageValueLanguage == "vn") {
            text = "Không có hình ảnh";
        } else if (getSessionstorageValueLanguage == "id") {
            text = "Tidak ada gambar";
        }
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }

}

function snFormatter(value, row, index) {

    return index + 1;
}

function statusFormatter(value, row) {

    var text;

    if(row.Flag == 0)
    {
        if(row.PickupOrigin == "" && row.PickupDestination == "")
        {
            text = "Delivery Completed"
        }
        else if(row.DeliveryOrigin == "" && row.DeliveryDestination == "")
        {
            text = "Pick Up Completed"
        }
    }
    else if(row.Flag == 4)
    {
        if(row.PickupOrigin == "" && row.PickupDestination == "")
        {
            text = "Delivery Cancelled"
        }
        else if(row.DeliveryOrigin == "" && row.DeliveryDestination == "")
        {
            text = "Pick Up Cancelled "
        }
    }
    else if(row.Flag == 5)
    {
        if(row.PickupOrigin == "" && row.PickupDestination == "")
        {
            text = "Incomplete Delivery"
        }
        else if(row.DeliveryOrigin == "" && row.DeliveryDestination == "")
        {
            text = "Incomplete Pick Up"
        }
    }
    else 
    {
        text = row.FlagValue;
    }

    
    return text;
}

function itemFormatter(value, row) {

    var item = '';
    
    if(row.PickupOrigin == "" && row.PickupDestination == "")
    {
        for (var i = 0; i < row.Delivery.length; ++i) {
            if (row.Delivery[i].ItemNo == 0)
            {
                item = '';
            }
            else
            {
                item += "Item No: " + row.Delivery[i].ItemNo + "<br />" + "Product Name: " + row.Delivery[i].ProductName + "<br />" + "Order No: " + row.Delivery[i].InvoiceID + "<br />";

                // Only show a comma if it's not the last one in the loop
                if (i < (row.Delivery.length - 1)) {
                    item += "<br />";
                }
            }
        }

        return "<div style='width: 150px !important;'>" + item + "</div>";
    }
    else if(row.DeliveryOrigin == "" && row.DeliveryDestination == "")
    {
        for (var i = 0; i < row.Pickup.length; ++i) {
            if (row.Pickup[i].ItemNo == 0)
            {
                item = '';
            }
            else
            {
                item += "Item No: " + row.Pickup[i].ItemNo + "<br />" + "Product Name: " + row.Pickup[i].ProductName + "<br />" + "Order No: " + row.Pickup[i].InvoiceID + "<br />";

                // Only show a comma if it's not the last one in the loop
                if (i < (row.Pickup.length - 1)) {
                    item += "<br />";
                }
            }
        }

        return "<div style='width: 150px !important;'>" + item + "</div>";
    }

}

function originFormatter(value, row) {

    var text;

    if (row.Flag == 1 || row.Flag == 6)
    {
        text = row.PickupOrigin;
    }
    else if (row.Flag == 2 || row.Flag == 7)
    {
        text = row.DeliveryOrigin;
    }
    else if (row.Flag == 0 || row.Flag == 4) {

        if (row.PickupOrigin) text = row.PickupOrigin;
        if (row.DeliveryOrigin) text = row.DeliveryOrigin;
    }

    return text;
}

function destinationFormatter(value, row) {

    var text;

    if (row.Flag == 1 || row.Flag == 6)
    {
        text = row.PickupDestination;
    }
    else if (row.Flag == 2 || row.Flag == 7)
    {
        text = row.DeliveryDestination;
    }
    else if (row.Flag == 0 || row.Flag == 4) {

        if (row.PickupDestination) text = row.PickupDestination;
        if (row.DeliveryDestination) text = row.DeliveryDestination;
    }

    return text;
}

$(function () {


    generateJobNumber();

    loadSvcAmount();
  
    $('#date-scheduled').val(moment().format('D-MMM-YYYY, HH:mm'));
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
        var string_length = 6;
        var randomstring = '';
        for (var i = 0; i < string_length; i++) {
            var rnum = Math.floor(Math.random() * chars.length);
            randomstring += chars.substring(rnum, rnum + 1);
        }

        return randomstring;
    }
    var str = getSessionstorageValueCompany;
    var array = str.split(" ");
    var jobNumber = array[0] + "-" + z + y + q + "-" + randomString();

    $('#reference').val(jobNumber);

}


function loadSvcAmount() {

    $('#cusSvcAmount').bootstrapTable('destroy');
    $(document).ready(function () {

        $('#cusSvcAmount').bootstrapTable(
        {
            idField: 'LocationID',
            columns: [{
                    field: 'state',
                    checkbox: true
                    }, {
                        field: 'ItemNo',
                        title: 'Item No',
                        formatter: snFormatter
                    }, {
                        field: 'Location',
                        title: 'Location'              
                    }, {
                        field: 'Index',
                        title: 'index',
                        class: 'hidden-xs hidden-sm hidden-md hidden-lg'
                    }],
                        onCheck: function (row, index) {
                            
                            console.log(index)
                        },
                        onLoadSuccess: function (row) {


                        },
                        onPostBody: function () {



                        },
                        onPreBody: function (data) {


                        },
                        onCheck: function (row, $element) {

                        },
                        onUncheck: function (row) {

                        },

                    });
    });

}

$(function () {

    //On Load assets
    var WebAPIAsset = "";
    if (getSessionstorageValueRoleID == 1) {

        WebAPIAsset = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + '4' + '&CompanyID=' + '2';

        $.getJSON(WebAPIAsset, function (data) {

            $.each(data, function (index, item) {
                $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
            });
            $(".selectpicker").selectpicker('refresh');
        });

    }
    else if (getSessionstorageValueRoleID == 2) {

        WebAPIAsset = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

        $.getJSON(WebAPIAsset, function (data) {
            $.each(data, function (index, item) {
                $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
            });
            $(".selectpicker").selectpicker('refresh');
        });
    }
    else if (getSessionstorageValueRoleID >= 3) {

        WebAPIAsset = 'https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

        $.getJSON(WebAPIAsset, function (data) {
            $.each(data, function (index, item) {
                $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
            });
            $(".selectpicker").selectpicker('refresh');
        });
    }


});

/*** Function to Assets*/
$(function () {

    $('.SelectAssetFilter').on('change', function () {
        
        var selected = $(this).find("option:selected").val();
        //paramtitle = selected;
        for (k = 0; k < markers.length; k++) {
            marker = markers[k];
           
            if (markers[k]) {
                // If is same assets or assets not picked
                if (marker.title == selected) {

                    marker.setVisible(true);
                    var position = marker.getPosition();
                    map.setCenter(position);
                    map.setZoom(18);

                    for (var i = 0; i < infoBoxList.length; i++) {

                        infoBoxList[i].close();
                    }

                    // Reset the markers array
                    infoBoxList = [];

                    var infoBubble = new google.maps.InfoWindow();

                    infoBoxList.push(infoBubble);

                    infoBubble.setContent(marker.content);
                    infoBubble.open(this, marker);
                    paramtitle = marker.title;
                    //Open Infowindow
                    infoBubble.setContent(marker.content);
                    infoBubble.open(this, marker);

                }
            }


        }

    }); // end of on change


}); //end of function

$(function () {


    $button.click(function (e) {        
        e.preventDefault();

        insertData();
    
    });

    var $tableItem = $('#cusSvcAmount'),
        $removeItem = $('#deleteItem');

    //Disable cancel button by default
    $removeItem.prop("disabled", true);

    $tableItem.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
        $removeItem.prop('disabled', !$tableItem.bootstrapTable('getSelections').length);
    });

    $removeItem.on('click', function (e) {
        e.preventDefault();
        var ids = $.map($tableItem.bootstrapTable('getSelections'), function (row) {
            return row.Index;
        });
        console.log(ids);

        $tableItem.bootstrapTable('remove', {
            field: 'Index',
            values: ids
        });


        $removeItem.prop('disabled', true);

    });

    $buttonClear.click(function (e) {        
        e.preventDefault();
        $('#cusSvcAmount').bootstrapTable('removeAll');
        $('#location').val('');
    });


});

function insertData() {

    if ($('#location').val().length == 0) {

        $.niftyNoty({
            type: 'danger',
            icon: 'fa fa-minus',
            message: 'Location must not be empty!',
            container: 'floating',
            timer: 3000
        });

    } else {

        var rowId;
        var boostrapTableValue = JSON.stringify($('#cusSvcAmount').bootstrapTable().bootstrapTable('getData'));
        var stringify = JSON.parse(boostrapTableValue);
        if (stringify.length > 0) {
            rowId = stringify[stringify.length - 1]['Index'] + 1;
        } else {
            rowId = 1;
        }

        rows.push({
            Location: $('#location').val(),
            Index: rowId
        });

        $('#cusSvcAmount').bootstrapTable('append', rows);
        rows = [];

        $('#location').val('');

    }


}

$(function () {

    //On Load Drivers
    var WebAPIDriver = "";
    if (getSessionstorageValueRoleID == 1) {

        WebAPIDriver = 'https://app.track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + '4' + '&CompanyID=' + '2';

    }
    else if (getSessionstorageValueRoleID == 2) {

        WebAPIDriver = 'https://app.track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }
    else if (getSessionstorageValueRoleID >= 3) {

        WebAPIDriver = 'https://app.track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }

    var driver = $.getJSON(WebAPIDriver, function (data) {
        $('#load-driver').append($('<option selected="selected"></option>').val(0).html("ALL"));
        $.each(data, function (index, item) {
            $('#drivers').append($('<option></option>').val(item.DriverID).html(item.Name));
            $('#load-driver').append($('<option></option>').val(item.DriverID).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });


    //Populate Flag Value
    var WebAPISystem = "https://app.track-asia.com/tracksgwebapi/api/flagvalueinfo";
    var filter = $.getJSON(WebAPISystem, function (data) {
        $('#load-proj-status').append($('<option></option>').val(0).html("ALL"));
        $.each(data, function (index, item) {
            if (item.FlagID == 1) $('#load-proj-status').append($('<option selected="selected"></option>').val(item.FlagID).html(item.FlagValue));
            else $('#load-proj-status').append($('<option></option>').val(item.FlagID).html(item.FlagValue));
        });
        $('.selectpicker').selectpicker('refresh');
    }).error(function (jqXHR, textStatus, errorThrown) {
        if (textStatus == "error") alert("Unable to load dropdown, Please check your network connection");
    });

    if (!navigator.onLine) { alert("Unable to connect to server, Please check your network connection"); }



    reloadJobsCreated();

    //No Network Coverage Alert
    setTimeout(function () {
        driver.abort();
        filter.abort();
        if ($('#LoadingForm').is(":visible")) {
            $('#LoadingForm').modal('hide');
            return alert("Unable to connect to server, Please check your network connection");
        }
    }, 120000);


});

//Search Places
function SearchPlacesFrom() {

    var defaultBounds = new google.maps.LatLngBounds(
       new google.maps.LatLng(1.3000, 103.8000),
       new google.maps.LatLng(1.3000, 103.5710));


    var input = document.getElementById('start');

    var options = {
        bounds: defaultBounds,
        types: $('#autocomplete').val(),
        componentRestrictions: {
            country: 'SG'
        }
    };

    var autocomplete = new google.maps.places.Autocomplete(input, options);
    autocomplete.setTypes();


}

function SearchPlacesTo() {

    var defaultBounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(1.3000, 103.8000),
        new google.maps.LatLng(1.3000, 103.5710));


    var input = document.getElementById('end');

    var options = {
        bounds: defaultBounds,
        types: $('#autocomplete').val(),
        componentRestrictions: {
            country: 'SG'
        }
    };

    var autocomplete = new google.maps.places.Autocomplete(input, options);
    autocomplete.setTypes();


}

//Search Places
function SearchWaypoints() {

    var defaultBounds = new google.maps.LatLngBounds(
       new google.maps.LatLng(1.3000, 103.8000),
       new google.maps.LatLng(1.3000, 103.5710));


    var input = document.getElementById('location');

    var options = {
        bounds: defaultBounds,
        types: $('#autocomplete').val(),
        componentRestrictions: {
            country: 'SG'
        }
    };

    var autocomplete = new google.maps.places.Autocomplete(input, options);
    autocomplete.setTypes();


}

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
    document.getElementById("softwareEN").innerHTML = version;


});

function reloadJobsCreated() {

    $('#LoadingForm').modal('show');
    //https://app.track-asia.com/tracksgwebapi/api/routeinfo?CompanyID=14
    var WebAPIJobs;
    if (getSessionstorageValueRoleID == 1) {

        WebAPIJobs = 'https://app.track-asia.com/tracksgwebapi/api/routeinfo?CompanyID=' + getSessionstorageValueCompanyID + '&DriverID=' + '&Flag=1';
    }
    else if (getSessionstorageValueRoleID == 2) {

        WebAPIJobs = 'https://app.track-asia.com/tracksgwebapi/api/routeinfo?CompanyID=' + getSessionstorageValueCompanyID + '&DriverID=' + '&Flag=1';
    }
    else if (getSessionstorageValueRoleID == 3) {

        WebAPIJobs = 'https://app.track-asia.com/tracksgwebapi/api/routeinfo?CompanyID=' + getSessionstorageValueCompanyID + '&DriverID=' + '&Flag=1';
    }
    else if (getSessionstorageValueRoleID > 3) {

        WebAPIJobs = 'https://app.track-asia.com/tracksgwebapi/api/routeinfo?CompanyID=' + getSessionstorageValueCompanyID + '&DriverID=' + '&Flag=1';
    }

    console.log(WebAPIJobs);

    $('#jobsCreated').bootstrapTable('destroy');

    $('#jobsCreated').bootstrapTable(
        {
            idField: 'RouteID',
            url: WebAPIJobs,
            exportOptions: {
                fileName: '[Route Plans] ' + moment.utc().add('hours', 8).format('D-MMM-YYYY')
            },
            columns: [{
                field: 'SN',
                title: 'SN',
                formatter: snFormatter
            },  {
                field: 'Action',
                title: 'Action',
                formatter: actionFormatter
            }, {
                field: 'RouteID',
                title: 'Route ID',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg'
            }, {
                field: 'RouteName',
                title: 'Route Name'
            }, {
                field: 'RouteNo',
                title: 'Route Number'
            }, {
                field: 'Driver',
                title: 'Driver'
            }, {
                field: 'SvcDuration',
                title: 'Service Duration',
                formatter: minutesFormatter
            }, {
                field: 'Start',
                title: 'Starting Point'
            }, {
                field: 'StartDate',
                title: 'Start Date',
                formatter: dateFormatter
            }, {
                field: 'End',
                title: 'Ending Point'
            }, {
                field: 'EndDate',
                title: 'End Date',
                formatter: dateFormatter
            }, {
                field: 'Distance',
                title: 'Total Distance',
                formatter: kmFormatter
            }, {
                field: 'Journey',
                title: 'Total Driving Time',
                formatter: minutesFormatter
            }, {
                field: 'SvcTime',
                title: 'Total Serving Time',
                formatter: minutesFormatter
            }, {
                field: 'Status',
                title: 'Status'
            }
            ], onLoadSuccess: function (row) {

                setTimeout(function () {
                    $('#LoadingForm').modal('hide');
                }, 500);


            }, onCheck: function (row) {

            },
            onUncheck: function (row) {

            },
            onLoadError: function (status) {

                alert("Unable to load table, Please check your network connection");
            }

        });
}

function searchRouteFilter() {

    $('#LoadingForm').modal('show');

    var dateFrom = $('#SearchDateFrom').val();
    var dateTo = $('#SearchDateTo').val();
    var flag = $('#load-proj-status').val();
    var driver = $('#load-driver').val();
   
    var WebAPIJobs;
    if (getSessionstorageValueRoleID == 1) {

        WebAPIJobs = 'https://app.track-asia.com/tracksgwebapi/api/routeinfo?CompanyID=' + getSessionstorageValueCompanyID + '&DriverID=' + driver + '&Flag=' + flag + '&StartDate=' + dateFrom + '&EndDate=' + dateTo;
    }
    else if (getSessionstorageValueRoleID == 2) {

        WebAPIJobs = 'https://app.track-asia.com/tracksgwebapi/api/routeinfo?CompanyID=' + getSessionstorageValueCompanyID + '&DriverID=' + driver + '&Flag=' + flag + '&StartDate=' + dateFrom + '&EndDate=' + dateTo;
    }
    else if (getSessionstorageValueRoleID == 3) {

        WebAPIJobs = 'https://app.track-asia.com/tracksgwebapi/api/routeinfo?CompanyID=' + getSessionstorageValueCompanyID + '&DriverID=' + driver + '&Flag=' + flag + '&StartDate=' + dateFrom + '&EndDate=' + dateTo;
    }
    else if (getSessionstorageValueRoleID > 3) {

        WebAPIJobs = 'https://app.track-asia.com/tracksgwebapi/api/routeinfo?CompanyID=' + getSessionstorageValueCompanyID + '&DriverID=' + driver + '&Flag=' + flag + '&StartDate=' + dateFrom + '&EndDate=' + dateTo;
    }

    console.log(WebAPIJobs);

    $('#jobsCreated').bootstrapTable('destroy');

    $('#jobsCreated').bootstrapTable(
        {
            idField: 'RouteID',
            url: WebAPIJobs,
            exportOptions: {
                fileName: '[Route Plans] ' + moment.utc().add('hours', 8).format('D-MMM-YYYY')
            },
            columns: [{
                field: 'SN',
                title: 'SN',
                formatter: snFormatter
            }, {
                field: 'Action',
                title: 'Action',
                formatter: actionFormatter
            }, {
                field: 'RouteID',
                title: 'Route ID',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg'
            }, {
                field: 'RouteName',
                title: 'Route Name'
            }, {
                field: 'RouteNo',
                title: 'Route Number'
            }, {
                field: 'Driver',
                title: 'Driver'
            }, {
                field: 'SvcDuration',
                title: 'Service Duration',
                formatter: minutesFormatter
            }, {
                field: 'Start',
                title: 'Starting Point'
            }, {
                field: 'StartDate',
                title: 'Start Date',
                formatter: dateFormatter
            }, {
                field: 'End',
                title: 'Ending Point'
            }, {
                field: 'EndDate',
                title: 'End Date',
                formatter: dateFormatter
            }, {
                field: 'Distance',
                title: 'Total Distance',
                formatter: kmFormatter
            }, {
                field: 'Journey',
                title: 'Total Driving Time',
                formatter: minutesFormatter
            }, {
                field: 'SvcTime',
                title: 'Total Serving Time',
                formatter: minutesFormatter
            }, {
                field: 'Status',
                title: 'Status'
            }
            ], onLoadSuccess: function (row) {

                setTimeout(function () {
                    $('#LoadingForm').modal('hide');
                }, 500);


            }, onCheck: function (row) {

            },
            onUncheck: function (row) {

            },
            onLoadError: function (status) {

                alert("Unable to load table, Please check your network connection");
            }

        });

}

function dateFormatter(value, row) {

    if (value < '2001-01-01T00:00:00' || value == null || value == "") {
        return '-';
    }
    else {

        //Format UTC
        var timestamp = moment(value).add('hours', 8).format('DD-MMM-YYYY HH:mm:ss');
        return '<div>' + '<span>' + timestamp + '</span>' + '</div>';

    }

}

function timeFormatter(value, row) {

    if (value < '2001-01-01T00:00:00' || value == null || value == "") {
        return '-';
    }
    else {

        //Format UTC
        var timestamp = moment(value).add('hours', 8).format('HH:mm:ss');
        return '<div>' + '<span>' + timestamp + '</span>' + '</div>';

    }

}

function minutesFormatter(value, row) {

    return '<div>' + '<span>' + value + ' minutes</span>' + '</div>';

}

function kmFormatter(value, row) {

    return '<div>' + '<span>' + value + ' km</span>' + '</div>';

}

function actionFormatter(value, row) {

    var markup = "<div style='width:180px;'><strong><a href='javascript:viewWaypoints(" + row.RouteID + ")' style='color:#458FD2;'>" + "View Waypoints" + '</a></strong>&nbsp;&nbsp;&nbsp;' +
        "<strong><a href='javascript:deletePlan(" + row.RouteID + ")' style='color:#458FD2;'>" + "Delete Plan" + '</a></strong></div>';
    return markup;
}

//1st View/Edit Dialog
function viewWaypoints(route_id) {

    $('#LoadingForm').modal('show');
    $('#waypointsForms').dialog('destroy');

    var WebAPI = 'https://app.track-asia.com/tracksgwebapi/api/routelocationinfo?CompanyID=' + getSessionstorageValueCompanyID + '&RouteID=' + route_id;

    $.ajax({
        type: 'GET',
        url: WebAPI,
        async: false,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (data) {

            $("<div id='waypointsForms'>").dialog({
                modal: true,
                title: "Waypoints",
                width: '100%',
                position: 'center',
                height: 'auto',
                dialogClass: 'no-close',
                open: function () {

                    $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
                    $(".ui-dialog-titlebar-close").hide(); //hide close button

                    var top = Math.max(jQuery(window).height() / 2 - jQuery(this)[0].offsetHeight / 2, 0) - 300;
                    var left = Math.max(jQuery(window).width() / 2 - jQuery(this)[0].offsetWidth / 2, 0);

                    jQuery(this).parent().css('top', top + "px");
                    jQuery(this).parent().css('left', left + "px");
                    jQuery(this).parent().css('position', 'fixed');

                    var markup = "<div id='custom-waypoints'>" +
                        "</div>" +
                        "<div class='col-sm-12'>" +
                        "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto; height: 450px;' class=''>" +
                        "<table id='waypointsTable' class='table table-condensed table-vcenter searchable'" +
                        " data-toolbar='#custom-waypoints'" +
                        " data-click-to-select='true'" +
                        " data-single-select='true'" +
                        " data-search='false'" +
                        " data-show-export='true'" +
                        " data-show-refresh='false'" +
                        " data-show-toggle='false'" +
                        " data-show-columns='false'" +
                        " data-show-toggle='false'" +
                        " data-pagination='false'" +
                        " data-show-pagination-switch='false'" +
                        "cellspacing = '0' width = '100%' > "

                    markup += "</table>" + "</div></div>";

                    if (markup !== undefined || markup !== null) $(this).html(markup);

                    $('#waypointsTable').bootstrapTable({
                        data: data,
                        idField: 'LocationID',
                        exportOptions: {
                            fileName: '[Waypoints] ' + moment.utc().add(8, 'hours').format('D-MMM-YYYY')
                        },
                        exportTypes: ['csv'],
                        columns: [{
                            field: 'ItemNo',
                            title: 'Item No.',
                            formatter: snFormatter
                        }, {
                            field: 'LocationID',
                            title: 'Location ID',
                            class: 'hidden-xs hiddden-sm hidden-md hidden-lg'
                        }, {
                            field: 'Segment',
                            title: 'Segment',
                        }, {
                            field: 'LocationFrom',
                            title: 'Location From'
                        }, {
                            field: 'LocationTo',
                            title: 'Location To'
                        }, {
                            field: 'Duration',
                            title: 'Duration',
                            formatter: minutesFormatter
                        }, {
                            field: 'Distance',
                            title: 'Distance',
                            formatter: kmFormatter
                        }, {
                            field: 'ETArrival',
                            title: 'Arrival at Waypoint',
                            formatter: dateFormatter
                        }, {
                            field: 'ETDeparture',
                            title: 'Departure at Waypoint',
                            formatter: dateFormatter
                        }, {
                            field: 'Status',
                            title: 'Status'
                        }],
                        onCheck: function (row, index) {
                            console.log(index)
                        },
                        onLoadSuccess: function (row) {


                        },
                        onPostBody: function () {



                        },
                        onPreBody: function (data) {


                        },
                        onCheck: function (row, $element) {

                        },
                        onUncheck: function (row) {

                        },

                    });


                    //No Network Coverage Alert
                    setTimeout(function () {
                        if ($('#LoadingForm').is(":visible")) {
                            $('#LoadingForm').modal('hide');
                            return alert("Unable to connect to server, Please check your network connection");
                        }
                    }, 120000);


                },
                buttons: {

                    Close: function () {

                        $(this).dialog('destroy');
                    },
                }
            });

            setTimeout(function () {
                $('#LoadingForm').modal('hide');
            }, 500);


        }
    });


}

//2nd Dialog
function deletePlan(route_id) {

    bootbox.setDefaults({
        /**
         * @optional String
         * @default: en
         * which locale settings to use to translate the three
         * standard button labels: OK, CONFIRM, CANCEL
         */
        locale: "en",


    });

    bootbox.confirm("<div style='color:black'>Are you sure you want to delete ?</div>", function (result) {

        if (result) {

            $('#LoadingForm').modal('show');

            var routes = JSON.stringify({ 'RouteID': route_id });
            var WebAPI = 'https://app.track-asia.com/tracksgwebapi/api/routeinfo/' + route_id;

            $.ajax({
                url: WebAPI,
                type: "Delete",
                data: JSON.stringify(routes),
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
                permissions: ["https://*.track-asia.com"],
                success: function (res) {
                    console.log(res);

                    $('#jobsCreated').bootstrapTable('refresh');

                    $.niftyNoty({
                        type: 'success',
                        icon: 'fa fa-check',
                        message: 'Deleted Successfully',
                        container: 'floating',
                        timer: 3000
                    });

                }
            });

            setTimeout(function () {
                $('#LoadingForm').modal('hide');
            }, 500);

            //No Network Coverage Alert
            setTimeout(function () {
                if ($('#LoadingForm').is(":visible")) {
                    $('#LoadingForm').modal('hide');
                    return alert("Unable to connect to server, Please check your network connection");
                }
            }, 120000);


        }


        else {
            $.niftyNoty({
                type: 'danger',
                icon: 'fa fa-minus',
                message: 'Delete Canceled',
                container: 'floating',
                timer: 3000
            });
        };

    });



}
