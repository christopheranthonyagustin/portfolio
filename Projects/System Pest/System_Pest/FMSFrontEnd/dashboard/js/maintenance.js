var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');
var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');
var titleJobNumber, titlePhone, titlePersonInCharge, titleScheduleTime, titleAddressTo, titleContactNumber, titleTo, titleAlertTime, titleCallCenter, titlePhoneUser, titleLocation, titleStart, titleEnd, titleSpeed, titleDeviceStatus, titlePhonePower, titleTimestamp, titleEvent, titleRemarks, titleLastKnown, titleJobStatus, titleCustomerCompany, titleUnit, titlePostal, titleAmount, titleSignature, titleEmail, titlePhoneUserAddress, titlePhoneUserProfile, titleJobType;
var titleItemNo, titleWeight, titleWidth, titleHeight, titleLength, titleVolWeight, titlePrice;
var titleEnterAddressPostal, titleEnterAddress, titleGeoCodeFail, titleError, titleSelected, titleCannotEditSchedule, titleJobCompletedCannotLoad, titleJobLoaded, titleJobNumberNotFound, titleCannotTransfer;
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
    titleCustomerCompany = "Company";
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
    titleVolWeight = "Vol. Weight";
    titlePrice = "Price";
    titleCannotTransfer = "Job Cannot be Transfer or edit";

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
    titleVolWeight = "น้ำหนักปริมาตร";
    titlePrice = "ราคา";
    titleCannotTransfer = "งานไม่สามารถถ่ายโอนหรือแก้ไขได้";

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
    titleItemNo = "Mã số";
    titleWeight = "Cân nặng";
    titleWidth = "Chiều rộng";
    titleHeight = "Chiều cao";
    titleLength = "Chiều dài";
    titleVolWeight = "Trọng lượng thể tích";
    titlePrice = "Giá bán";
    titleCannotTransfer = "Không thể chuyển công việc hoặc chỉnh sửa";

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
    titleVolWeight = "Berat Volumetrik";
    titlePrice = "Harga";
    titleCannotTransfer = "Pekerjaan Tidak Bisa Transfer atau Edit";
}

var jobsCreatedInterval;

//Show Default forms
$('#submit-project').hide();


//Show Default forms
$('#newJobForm').show();
$('#scheduledJobForm').hide();
$('#apptForm').hide();
$('#purchaseForm').hide();
$('#warrantyForm').hide();
$('#apptForm-scheduled').hide();
$('#purchaseForm-scheduled').hide();
$('#warrantyForm-scheduled').hide();

$('#jobsCreatedMaintenance-cancel').prop('disabled', true);
$('#jobsCreatedMaintenance-edit').prop('disabled', true);

//Populate Work Done
//$.getJSON('http://track-asia.com/spwebapi/api/workdoneinfo', function (data) {

//    $.each(data, function (index, item) {
//        $('#workDone').append($('<option></option>').val(item.WorkID).html(item.WorkDesc));
//    });
//    $(".selectpicker").selectpicker('refresh');
//});

//Populate Notes
//$.getJSON('http://track-asia.com/spwebapi/api/notesinfo', function (data) {

//    $.each(data, function (index, item) {
//        $('#notes').append($('<option></option>').val(item.NotesID).html(item.NotesDesc));
//    });
//    $(".selectpicker").selectpicker('refresh');
//});



function clearJobForms() {
    $('#jobid').val('');
    $('#date').val('');
    $('#amount').val('');
    $('#pic').val('');
    $('#phone').val('');
    $('#address').val('');
    $('#unit').val('');
    $('#remarks').val('');
    $('#destination').val('');
    $('#reference').val('');

}


function snFormatter(value, row, index) {

    return index + 1;
}

function serialFormatter(value) {

    return value + 1;
}


//  Format for Timestamp Column.
// =================================================================
function timeFormatter(value, row) {


    //Convert Timezone
    //var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    //var Singapore = moment.tz(value, Asia);

    //Format UTC
    var timestamp = moment(value).add('hours', 8).format('HH:mm:ss A');


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

function dateFormatter(value) {

    if (value <= '2001-01-01 00:00:00' || value == null || value == "" || value == 'undefined')
    {
        return;
    }
    else
    {

        //Format UTC
        var timestamp = moment(value).add('hours', 8).format('D-MMMM, YYYY');

        return '<div>' + '<span>' + timestamp + '</span>' + '</div>';
    }



}



function jobtypeFormatter(value, row) {

    //Format UTC
    var text;
    switch (value) {
        case 1:
            text = "T & C";
            break;
        case 2:
            text = "Maintenance";
            break;
        case 3:
            text = "SRF";
            break;
        case 4:
            text = "Delivery";
            break;
    }

    return '<div>' + '<span>' + text + '</span>' + '</div>';


}

function bpFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[0] + '</span>' + '</div>';

}

function tpFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[1] + '</span>' + '</div>';

}

function ospFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[2] + '</span>' + '</div>';

}

function spFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[3] + '</span>' + '</div>';

}

function rpFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[4] + '</span>' + '</div>';

}

function epFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[5] + '</span>' + '</div>';

}

function cspFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[6] + '</span>' + '</div>';

}

function othersFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[7] + '</span>' + '</div>';

}



function signFormatter(value, row) {
    var labelColor;
    var text;
    if (row.ImageFillSignatures == "Uniform") {
        text = value;

        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.JobNumber + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

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

function techSignFormatter(value, row) {
    var labelColor;
    var text;
    if (row.TechFillSignatures == "Uniform") {
        text = value;

        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.JobNumber + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

    } else if (row.TechFillSignatures != "Uniform") {
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

function witnessSignFormatter(value, row) {
    var labelColor;
    var text;
    if (row.WitnessFillSignatures == "Uniform") {
        text = value;

        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.JobNumber + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

    } else if (row.WitnessFillSignatures != "Uniform") {
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

        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.JobNumber + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

    } else if (row.ImageFillCamera != "Uniform") {
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
    if (row.BoosterPumpFillForms == "Uniform") {
        text = value;

        //return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.JobNumber + '">View PDF</a></div></center>';
        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.JobNumber + '"><i class="fa fa-file-pdf-o fa-lg" style="color:white;"></i></a></div></center>';

    } else if (row.BoosterPumpFillForms != "Uniform") {
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


$(function () {
    if (getSessionstorageValueLanguage == "en") {
        $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("Maintenance Created by " + getSessionstorageValueUser + " (" + moment().format('D-MMM-YYYY') + ")"));
    }
    else if (getSessionstorageValueLanguage == "th") {
        $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("งานสร้างโดย " + getSessionstorageValueUser + " (" + moment().format('D-MMM-YYYY') + ")"));
    }
    else if (getSessionstorageValueLanguage == "vn") {
        $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("Jobs Tạo bởi " + getSessionstorageValueUser + " (" + moment().format('D-MMM-YYYY') + ")"));
    }
    else if (getSessionstorageValueLanguage == "id") {
        $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("Kerja Dicipta oleh " + getSessionstorageValueUser + " (" + moment().format('D-MMM-YYYY') + ")"));
    }

    reloadJobsCreated();

    jobsCreatedInterval = setInterval(function () {
        reloadJobsCreated();
        //$('#jobsCreated').bootstrapTable('refresh');
    }, '5000');

});


function reloadJobsCreated() {
    var timestamp = moment().format('D-MMM-YYYY');
    var rxtime = moment().add('days', 1).format('D-MMM-YYYY');

    var WebAPIJobs;
    if (getSessionstorageValueRoleID == 1) {

        WebAPIJobs = 'http://track-asia.com/spwebapi/api/maintenanceinfo?CompanyID=' + getSessionstorageValueCompanyID;
    }
    else if (getSessionstorageValueRoleID == 2) {

        WebAPIJobs = 'http://track-asia.com/spwebapi/api/maintenanceinfo?CompanyID=' + getSessionstorageValueCompanyID;
    }
    else if (getSessionstorageValueRoleID == 3) {

        WebAPIJobs = 'http://track-asia.com/spwebapi/api/maintenanceinfo?CompanyID=' + getSessionstorageValueCompanyID;
    }
    else if (getSessionstorageValueRoleID >= 4) {

        WebAPIJobs = 'http://track-asia.com/spwebapi/api/maintenanceinfo?CompanyID=' + getSessionstorageValueCompanyID;
    }

    
    //alert(WebAPIJobs);


    $(document).ready(function () {


        $.ajax({
            url: WebAPIJobs,
            type: 'GET',
            success: function (res) {
                //console.log(res);
                $("#jobsCreated").empty();

                document.getElementById('total-jobsCreated').innerHTML = res.length;

                var outputDiv = document.getElementById('jobsCreated');

                outputDiv.innerHTML += "<table id='jobsCreated' border='1'>"
                                    + "<thead>"
                                    + "<tr>"
                                    + "<th style='padding: 5px;'>SN</th>"
                                    + "<th style='padding: 5px;'>" + "Address" + "</th>"
                                    + "<th style='padding: 5px;'>" + "Postal" + "</th>"
                                    + "<th style='padding: 5px;'>" + "Unit" + "</th>"
                                    + "<th style='padding: 5px;'>Person In Charge</th>"
                                    + "<th style='padding: 5px;'>" + "Phone" + "</th>"
                                    + "<th style='padding: 5px;'>" + "Email" + "</th>"
                                    + "<th style='padding: 5px;'>" + "Site" + "</th>"
                                    + "<th style='padding: 5px;'>" + "Contract Start" + "</th>"
                                    + "<th style='padding: 5px;'>" + "Contract End" + "</th>"
                                    + "<th style='padding: 5px;'>" + "Maintenance Interval" + "</th>"
                                    + "<th style='padding: 5px;'>" + "Notification Interval" + "</th>"
                                    + "<th style='padding: 5px;'>Action</th>"
                                    + "</tr>"
                                    + "</thead>"
                                    + "</table>";

                for (k = 0; k < res.length; k++) {

                    if (res[k] != undefined || res[k]) {

                        outputDiv.innerHTML += "<table id='jobsCreated' border='1'>"
                                    + "<tbody>"
                                    + "<tr>"
                                    + "<td style='padding: 5px;'>"
                                    + serialFormatter(k)
                                    + "</td>"
                                    + "<td style='padding: 5px;'>"
                                    + res[k].Address
                                    + "</td>"
                                    + "<td style='padding: 5px;'>"
                                    + res[k].Postal
                                    + "</td>"
                                    + "<td style='padding: 5px;'>"
                                    + res[k].Unit
                                    + "</td>"
                                    + "<td style='padding: 5px;'>"
                                    + res[k].PIC
                                    + "</td>"
                                    + "<td style='padding: 5px;'>"
                                    + res[k].Phone
                                    + "</td>"
                                    + "<td style='padding: 5px;'>"
                                    + res[k].Email
                                    + "</td>"
                                     + "<td style='padding: 5px;'>"
                                    + res[k].Site
                                    + "</td>"
                                    + "<td style='padding: 5px;'>"
                                    + dateFormatter(res[k].ContractStart)
                                    + "</td>"
                                    + "<td style='padding: 5px;'>"
                                    + dateFormatter(res[k].ContractEnd)
                                    + "</td>"
                                    + "<td style='padding: 5px;'>"
                                    + res[k].MaintenanceInterval
                                    + "</td>"
                                     + "<td style='padding: 5px;'>"
                                    + res[k].NotificationInterval
                                    + "</td>"
                                    + "<td style='padding: 5px;'>"
                                    + "<strong><a href='javascript:viewjob(" + res[k].MaintenanceID + ")' style='color:#458FD2;'>" + "View" + '</a></strong>'
                                    + "&nbsp;&nbsp;&nbsp;&nbsp;<strong><a href='javascript:deletejob(" + res[k].MaintenanceID + ")' style='color:#458FD2;'>" + "Delete" + '</a></strong>'
                                    + "</td>"
                                    + "</tr>"
                                    + "</tbody>";
                                    + "</table>";
                    }


                }



            },
            error: function (xhr, ajaxOptions, thrownError) {
                console.log("error: " + xhr.status);
                console.log("error: " + thrownError);
            }
        });



    });

}


function viewjob(job_id) {


    var WebAPI = 'http://117.120.7.119/spwebapi/api/maintenancejobinfo?MaintenanceID=' + job_id;

    $.ajax({
        type: 'GET',
        url: WebAPI,
        data: { get_param: 'value' },
        dataType: 'json',
        success: function (data) {

            $("<div id='viewForms'>").dialog({
                modal: true,
                title: "Maintenance Job",
                width: '100%',
                position: 'absolute',
                height: 'auto',
                open: function () {
                    $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
                    $(".ui-dialog-titlebar-close").hide(); //hide close button

                    var markup = "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto' class=''>"
                        + "<table id='maintenancejobTable' class='table table-bordered' cellspacing='0' width='100%'>"
                        + "<thead>"
                        + "<tr>"
                        + "<th style='color: blue;'>SN</th>"
                        + "<th style='color: blue;'>Maintenance Job ID</th>"
                        + "<th style='color: blue;'>Alert Date</th>"
                        + "<th style='color: blue;'>Scheduled Date</th>"
                        + "<th style='color: blue;'>Status</th>"
                        + "<th style='color: blue;'>Findings</th>"
                        + "<th style='color: blue;'>Date of Cancellation</th>"
                        + "<th style='color: blue;'>Cancel Remarks</th>"
                        + "<th style='color: blue;'>Action</th>"
                        + "</tr>"
                        + "</thead>"
                        + "<tbody>"

                    for (k = 0; k < data.length; k++) {

                        if (data[k] != undefined || data[k]) {

                                 markup += "<tr>"
                                        + "<td style='padding: 5px;'>"
                                        + serialFormatter(k)
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + data[k].MaintenanceJobID
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + dateFormatter(data[k].AlertDate)
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + dateFormatter(data[k].Timestamp)
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + data[k].FlagValue
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + findingFormatter(data[k].Findings)
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + dateFormatter(data[k].JobCancelled)
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + data[k].CancelRemarks
                                        + "</td>"
                                        + "<td style='padding: 5px;'>"
                                        + editactionFormatter(data[k])
                                        + "</td>"
                                        + "</tr>"
                        }


                    }

                    markup += "</tbody></table>" + "</div>";

                    if (markup !== undefined || markup !== null) $(this).html(markup);

                    function dateFormatter(value) {
                        if (value <= '2001-01-01 00:00:00' || value == null || value == "" || value == 'undefined') {
                            return "-";
                        }
                        else {
                            //Format UTC
                            var timestamp = moment(value).add('hours', 8).format('DD-MMM-YYYY');
                            return '<div>' + '<span>' + timestamp + '</span>' + '</div>';
                        }
                    }



                    function findingFormatter(value) {
                       
                        var itemno, pest, aoc, findings;
                        if (value != "") {
                            for (k = 0; k < value.length; k++) {

                                if (value[k] != undefined || value[k]) {

                                    itemno = value[k].ItemNo;
                                    pest = value[k].PestDesc;
                                    aoc = value[k].AocDesc;
                                    findings = value[k].Findings;
                                }

                                return '<div>' +
                                       '<span>' +
                                       'No.: ' + itemno +
                                       '</br>' +
                                       'Pest: ' + pest +
                                       '</br>' +
                                       'Area of Concerned: ' + aoc +
                                       '</br>' +
                                       'Findings: ' + findings +
                                       '</br>' +
                                       '</span>' +
                                       '</div>';
                            }
                        } else {
                            return '<div>' + '<span>' + "No Findings" + '</span>' + '</div>';
                        }




                    }

                    function editactionFormatter(value) {


                        return "<div>" + "<span>" + "<a href='javascript:editmaintenancejob(" + JSON.stringify(value) + ")' style='color:#458FD2;'>" + "Edit" + "</a>" + "</span>" + "</div>";
                        //return "<button type='button' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#MaintenanceJobForm'>Launch demo modal</button>";

                    }

                },
                buttons: {
                    'Export': function () {
                        $('#maintenancejobTable').tableExport({
                            type: 'excel',
                            escape: 'false',
                            htmlContent: 'false',
                            fileName: "[" + getSessionstorageValueCompany + "] Maintenance Job" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
                        });

                    },
                    Close: function () {
                        $(this).dialog("close");
                    },
                }
            });


            // change the border color just for fun
            $(this).css('border-color', 'red');


        }
    });


}


function datetimeFormatter(value) {

    if (value <= '2001-01-01 00:00:00' || value == null || value == "" || value == 'undefined') {
        return;
    }
    else {

        //Format UTC
        var timestamp = moment(value).add('hours', 8).format('DD-MMM-YYYY');

        return timestamp;
    }



}

function deletejob(job_id) {


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

    bootbox.confirm("<div style='color:black'>" + titleAreYouSureDelete + "</div>", function (result) {
        if (result) {

            $.niftyNoty({
                type: 'success',
                icon: 'fa fa-check',
                //message: 'Deleted Successfully',
                message: titleDeleteSuccess,
                container: 'floating',
                timer: 3000
            });


            var maintenance = JSON.stringify({ 'MaintenanceID': job_id });
            var WebAPI = 'http://117.120.7.119/spwebapi/api/maintenanceinfo/' + job_id;

            $.ajax({
                url: WebAPI,
                type: "Delete",
                data: JSON.stringify(maintenance),
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
                success: function (maintenance) {
                    console.log(maintenance);
                    //window.location.reload(true);
                }
            });

        }


        else {
            $.niftyNoty({
                type: 'danger',
                icon: 'fa fa-minus',
                //message: 'Delete Canceled',
                message: titleDeleteCancel,
                container: 'floating',
                timer: 3000
            });
        };

    });



}

function editmaintenancejob(value) {

    $("<div id='editForms'>").dialog({
        modal: true,
        title: "Edit Maintenance Job",
        width: '100%',
        position: 'center',
        height: 'auto',
        open: function () {

            if (value.Flag == 0) {
                $(this).dialog('destroy');
                alert('Completed Job cannot be edited');
               
            } else {


                $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
                $(".ui-dialog-titlebar-close").hide(); //hide close button

                var top = Math.max(jQuery(window).height() / 2 - jQuery(this)[0].offsetHeight / 2, 0) - 150;
                var left = Math.max(jQuery(window).width() / 2 - jQuery(this)[0].offsetWidth / 2, 0);

                jQuery(this).parent().css('top', top + "px");
                jQuery(this).parent().css('left', left + "px");
                jQuery(this).parent().css('position', 'fixed');

                var markup = "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto' class=''>"
                    + "<table id='maintenancejobTable' class='table table-bordered' cellspacing='0' width='100%' height='150'>"
                    + "<thead>"
                    + "<tr>"
                    + "<th style='color: blue;'>Maintenance Job ID</th>"
                    + "<th style='color: blue;'>Alert Date</th>"
                    + "<th style='color: blue;'>Scheduled Date</th>"
                    + "<th style='color: blue;'>Cancel Remarks</th>"
                    + "<th style='color: blue;'>Status</th>"
                    + "</tr>"
                    + "</thead>"
                    + "<tbody>"

                markup += "<tr>"
                       + "<td style='padding: 5px;'>"
                       + "<input id='maintenancejobID' type='text' placeholder='Maintenance ID' class='form-control' disabled='disabled'>"
                       + "</td>"
                       + "<td style='padding: 5px;'>"
                       + "<input id='alertDate' type='text' placeholder='Alert Date' class='form-control'>"
                       + "</td>"
                       + "<td style='padding: 5px;'>"
                       + "<input id='scheduledDate' type='text' placeholder='Scheduled Date' class='form-control'>"
                       + "</td>"
                       + "<td style='padding: 5px;'>"
                       //+ "<input id='cancelRemarks' type='text' placeholder='Cancel Remarks' class='form-control'>"
                       + "<textarea rows='4' class='form-control' placeholder='Cancel Remarks' name='cancelRemarks' id='cancelRemarks' data-by-field='cancelRemarks'></textarea>"
                       + "</td>"
                       + "<td style='padding: 5px;'>"
                       + "<select id='status' class='selectpicker form-control' data-width='100%' data-style='btn-asiacomDropdown'></select>"
                       + "</td>"
                       + "</tr>"


                markup += "</tbody></table>" + "</div>";

                if (markup !== undefined || markup !== null) $(this).html(markup);

                $.getJSON('http://track-asia.com/spwebapi/api/emailflaginfo', function (data) {

                    $.each(data, function (index, item) {

                        if (item.EmailFlagID == value.Flag) {
                            $('#status').append($('<option selected="selected"></option>').val(item.EmailFlagID).html(item.FlagValue));
                        } else {
                            $('#status').append($('<option></option>').val(item.EmailFlagID).html(item.FlagValue));
                        }

                    });
                    $(".selectpicker").selectpicker('refresh');
                });

                //OnChange Dropdown
                $('#status').change(function () {
                    var selected = $(this).find("option:selected").html();
                    console.log("You have selected: " +  selected);
                    if (selected == "Cancelled") {
                        
                        $('#cancelRemarks').prop("disabled", false);
                    }
                    else if (selected == "Completed") {

                        $('#cancelRemarks').prop("disabled", true);
                    }
                    else if (selected == "Incomplete") {

                        $('#cancelRemarks').prop("disabled", true);
                    }
                });

                $('#maintenancejobID').val(value.MaintenanceJobID);
                $('#alertDate').val(datetimeFormatter(value.AlertDate));
                $('#scheduledDate').val(datetimeFormatter(value.Timestamp));

                $('#cancelRemarks').val(value.CancelRemarks);

                Date.parseDate = function (input, format) {
                    return moment.utc(input, format).toDate();
                };
                Date.prototype.dateFormat = function (format) {
                    return moment.utc(this).format(format);
                };

                var dateToday = new Date();

                jQuery('#alertDate').datetimepicker({
                    format: 'DD-MMM-YYYY',
                    formatTime: 'HH:mm',
                    formatDate: 'DD-MMM-YYYY',
                    theme: 'dark',
                    minDate: dateToday,
                    autoclose: true,
                    mask: false,
                    onChangeDateTime: function (dp, $input) {
                        $(this).hide();
                        $('#alertDate').datetimepicker();
                    }
                });

                jQuery('#scheduledDate').datetimepicker({
                    format: 'DD-MMM-YYYY',
                    formatTime: 'HH:mm',
                    formatDate: 'DD-MMM-YYYY',
                    theme: 'dark',
                    autoclose: true,
                    mask: false,
                    onChangeDateTime: function (dp, $input) {
                        $(this).hide();
                        $('#scheduledDate').datetimepicker();
                    }
                });
            }

            //Filter Cancel Remarks
            if (value.Flag == 2) {
                $('#cancelRemarks').prop("disabled", false);
            } else {
                $('#cancelRemarks').prop("disabled", true);
            }

        },
        buttons: {
            'Update Maintenance Job': function () {

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

                bootbox.confirm("<div style='color:black'>" + "Are you sure you wish to update job?" + "</div>", function (result) {
                    if (result) {

                        $.niftyNoty({
                            type: 'success',
                            icon: 'fa fa-check',
                            message: titleSuccess,
                            container: 'floating',
                            timer: 3000
                        });

                        //Do task
                        var getAlertDate = $('#alertDate').val();
                        var getTimestamp = $('#scheduledDate').val();
                        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
                        var convertAlertDate = moment(getAlertDate, dateFormat);
                        var convertTimestamp = moment(getTimestamp, dateFormat);
                        var timestamp;
                        var alertdate;

                        if (getSessionstorageValueTrackVersion == "sg") {
                            timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
                            alertdate = moment(convertAlertDate).subtract('hours', 8).format(dateFormat);
                        }
                        else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id") {
                            timestamp = moment(convertTimestamp).subtract('hours', 7).format(dateFormat);
                            alertdate = moment(convertAlertDate).subtract('hours', 7).format(dateFormat);
                        }

                        //console.log('Alert Date : ' + alertdate + ', Timestamp : ' + timestamp);

                        var jobCancelled;
                        var cancelRemarks;

                        if ($('#status').val() == 2) {
                            jobCancelled = moment().format();
                            cancelRemarks = $('#cancelRemarks').val();
                        }else{
                            jobCancelled = value.JobCancelled;
                            cancelRemarks = value.CancelRemarks;
                        }
                       
                        //Update Maintenance Job
                        var maintenancejob = {
                            MaintenanceJobID: value.MaintenanceJobID,
                            MaintenanceID: value.MaintenanceID,
                            AlertDate: alertdate,
                            Timestamp: timestamp,
                            RxTime: moment().format(),
                            Flag: $('#status').val(),
                            JobCancelled: jobCancelled,
                            CancelRemarks: cancelRemarks,
                            isSent: value.isSent,
                        }

                        console.log('Maintenance Job Array : ' + JSON.stringify(maintenancejob));


                        var updateMaintenanceJob = 'http://117.120.7.119/spwebapi/api/maintenancejobinfo?id=' + maintenancejob.MaintenanceJobID;

                        $.ajax({
                            url: updateMaintenanceJob,
                            type: "PUT",
                            data: JSON.stringify(maintenancejob),
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
                            success: function (maintenancejob) {
                                console.log(maintenancejob);
                                $('#editForms').dialog('destroy');
                                $('#viewForms').dialog('destroy');
                            }
                        });

                       
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

              
            },
            Close: function () {

                //$(this).dialog("close");
                $(this).dialog('destroy');
            },
        }
    });

   
}





//Disable cancel button by default
$('#jobsCreatedProject-cancel').prop("disabled", true);
$('#jobsCreatedProject-edit').prop("disabled", true);

//Delete Row
var $table = $('#jobsCreated'), $removeEN = $('#jobsCreatedProject-cancel');
var $editEN = $('#jobsCreatedProject-edit');

$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $editEN.prop('disabled', !$table.bootstrapTable('getSelections').length);

});



//On Load assets
var WebAPIAsset = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIAsset = 'http://track-asia.com/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + '1' + '&CompanyID=' + '1';

    $.getJSON(WebAPIAsset, function (data) {

        $.each(data, function (index, item) {
            $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    WebAPIAsset = 'http://track-asia.com/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    $.getJSON(WebAPIAsset, function (data) {
        $.each(data, function (index, item) {
            $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 3) {

    WebAPIAsset = 'http://track-asia.com/spwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    $.getJSON(WebAPIAsset, function (data) {
        $.each(data, function (index, item) {
            $('#getAssets').append($('<option></option>').val(item.Name).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });
}


//Translation of Forms
if (getSessionstorageValueLanguage == "en") {
    $("#newjob").text("New Project");
    $("#company").text("Company");
    $("#addressTo").text("Address To");
    $("#unit2").text("Unit Nos.");
    $("#postal2").text("Postal Code");
    $("#scheduleTime").text("Schedule Time");
    $("#amount").text("Amount");
    $("#person").text("Person In Charge");
    $("#contactNumber").text("Contact Number");
    $("#remarks2").text("Remarks");
    $("#phone-remarks").text("Phone User Remarks");
    $('#company-destination').attr('placeholder', 'Company');
    $('#destination').attr('placeholder', 'Address To');
    $('#unit').attr('placeholder', 'Unit Nos.');
    $('#postal').attr('placeholder', 'Postal Code');
    $('#date').attr('placeholder', 'Date & Time');
    $('#amount2').attr('placeholder', 'Amount');
    $('#pic').attr('placeholder', 'Person In Charge');
    $('#phone').attr('placeholder', 'Contact Number');
    $('#remarks').attr('placeholder', 'Remarks');
    $('#phoneremarks').attr('placeholder', 'Phone User Remarks');
    $("#viewmap").text("View Map");
    $("#nearestDevice").text("Nearest Device");
    $("#total").text("Total");
    $("#available-Device").text("Available");
    $("#submit-call").text("Assign");
    $('#reference').attr('placeholder', 'Search Job Number');
    $("#jobOverview").text("Jobs Overview");
    $("#avaiableFooter").text("Available");
    $("#inProgressFooter").text("In Progress");
    $("#logoutFooter").text("Logout");
    $(".selectPhone").text("Select Phone");
    $(".acceptedFooter").text("Accepted");
    $(".pickUpFooter").text("Pick Up");
    $(".transferredFooter").text("Transferred");
    $(".editedFooter").text("Edited");
    $("#totaljobs").text("Total Maintenance: ");
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
    $('#destination').attr('placeholder', 'ปลายทาง');
    $('#unit').attr('placeholder', 'หน่วย.');
    $('#postal').attr('placeholder', 'ไปรษณีย์');
    $('#date').attr('placeholder', 'วันเวลา');
    $('#amount2').attr('placeholder', 'จำนวนเงิน');
    $('#pic').attr('placeholder', 'ผู้รับผิดชอบในการปฎิบัติหน้าที่');
    $('#phone').attr('placeholder', 'เบอร์ติดต่อ');
    $('#remarks').attr('placeholder', 'หมายเหตุ');
    $('#phoneremarks').attr('placeholder', 'หมายเหตุผู้ใช้โทรศัพท์');
    $("#viewmap").text("ดูแผนที่");
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
    $(".acceptedFooter").text("ได้รับการยืนยัน");
    $(".pickUpFooter").text("รับ");
    $(".transferredFooter").text("โอน");
    $(".editedFooter").text("แก้ไข");
    $("#totaljobs").text("งานทั้งหมด: ");
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
    $('#destination').attr('placeholder', 'Địa Chỉ');
    $('#unit').attr('placeholder', 'Đơn Vị Nos.');
    $('#postal').attr('placeholder', 'Mã Postal');
    $('#date').attr('placeholder', 'Ngày giờ');
    $('#amount2').attr('placeholder', 'Số Lượng');
    $('#pic').attr('placeholder', 'Người Phụ Trách');
    $('#phone').attr('placeholder', 'Số ĐT Liên Hệ');
    $('#remarks').attr('placeholder', 'Nhận Xét');
    $('#phoneremarks').attr('placeholder', 'Nhận Xét');
    $("#viewmap").text("Xem Bản Đồ");
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
    $(".acceptedFooter").text("Được chấp nhận");
    $(".pickUpFooter").text("Nhặt lên");
    $(".transferredFooter").text("Chuyển");
    $(".editedFooter").text("Đã chỉnh sửa");
    $("#totaljobs").text("Tổng số việc làm");
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
    $('#destination').attr('placeholder', 'Tempat Tujuan');
    $('#unit').attr('placeholder', 'Unit Nos.');
    $('#postal').attr('placeholder', 'Pos Kode');
    $('#date').attr('placeholder', 'Tanggal Waktu');
    $('#amount2').attr('placeholder', 'Jumlah');
    $('#person2').attr('placeholder', 'Orang In Charge');
    $('#phone').attr('placeholder', 'Nomor Kontak');
    $('#remarks').attr('placeholder', 'Keterangan');
    $('#phoneremarks').attr('placeholder', 'Keterangan Pengguna Ponsel');
    $("#viewmap").text("Lihat Peta");
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
    $(".acceptedFooter").text("Diterima");
    $(".pickUpFooter").text("Ambil");
    $(".transferredFooter").text("Ditransfer");
    $(".editedFooter").text("Diedit");
    $("#totaljobs").text("Jumlah Kerja: ");
}

$(function () {

    //Populate phone user
    var WebAPIDriver = "";

    if (getSessionstorageValueRoleID == 1) {
        WebAPIDriver = 'http://track-asia.com/spwebapi/api/driverinfoex?ResellerID=' + '1' + '&CompanyID=' + '1';
    }

    else if (getSessionstorageValueRoleID == 2) {
        WebAPIDriver = 'http://track-asia.com/spwebapi/api/driverinfoex?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    }
    else if (getSessionstorageValueRoleID >= 3) {
        WebAPIDriver = 'http://track-asia.com/spwebapi/api/driverinfoex?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }


    $('#driver').append($('<option selected="selected"></option>').val("0").html("No Phone User"));

    $.getJSON(WebAPIDriver, function (data) {
        $.each(data, function (index, item) {

            if (item.AssetID > 0) {
                $('#driver').append($('<option></option>').val(item.Name).html(item.Name));

            } else {
                $('#driver').append($('<option></option>').val(item.Name).html(item.Name));
            }
        });

        $('.selectpicker').selectpicker('refresh');
    });

});



function ExportToTable() {

    $('#submit-project').show();

    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xlsx|.xls)$/;
    /*Checks whether the file is a valid excel file*/
    if (regex.test($("#excelfile").val().toLowerCase())) {
        var xlsxflag = false; /*Flag for checking whether excel is .xls format or .xlsx format*/
        if ($("#excelfile").val().toLowerCase().indexOf(".xlsx") > 0) {
            xlsxflag = true;
        }
        /*Checks whether the browser supports HTML5*/
        if (typeof (FileReader) != "undefined") {
            var reader = new FileReader();
            reader.onload = function (e) {
                var data = e.target.result;
                /*Converts the excel data in to object*/
                if (xlsxflag) {
                    var workbook = XLSX.read(data, { type: 'binary' });
                }
                else {
                    var workbook = XLS.read(data, { type: 'binary' });
                }
                /*Gets all the sheetnames of excel in to a variable*/
                var sheet_name_list = workbook.SheetNames;

                var cnt = 0; /*This is used for restricting the script to consider only first sheet of excel*/
                sheet_name_list.forEach(function (y) { /*Iterate through all sheets*/
                    /*Convert the cell value to Json*/
                    if (xlsxflag) {
                        var exceljson = XLSX.utils.sheet_to_json(workbook.Sheets[y]);
                    }
                    else {
                        var exceljson = XLS.utils.sheet_to_row_object_array(workbook.Sheets[y]);
                    }
                    if (exceljson.length > 0 && cnt == 0) {

                        BindTable(exceljson);
                        cnt++;

                    }
                });
                $('#exceltable').show();
            }
            if (xlsxflag) {/*If excel file is .xlsx extension than creates a Array Buffer from excel*/
                reader.readAsArrayBuffer($("#excelfile")[0].files[0]);
            }
            else {
                reader.readAsBinaryString($("#excelfile")[0].files[0]);
            }
        }
        else {
            alert("Sorry! Your browser does not support HTML5!");
        }
    }
    else {
        alert("Please upload a valid Excel file!");
    }
}

function BindTable(jsondata) {/*Function used to convert the JSON array to Html Table*/

    $('#exceltable').bootstrapTable('destroy');

    var filterData = [];

    for (var i = 0; i < jsondata.length; ++i) {

        var data = jsondata[i];

        if (data.MAINTENANCE_INTERVAL == "Daily" ||
            data.MAINTENANCE_INTERVAL == "Weekly" ||
            data.MAINTENANCE_INTERVAL == "Monthly" ||
            data.MAINTENANCE_INTERVAL == "Yearly" ||
            data.MAINTENANCE_INTERVAL == "Quaterly" ||
            data.MAINTENANCE_INTERVAL == "Tri-Monthly") {
            filterData.push(data);
        } else {
            alert("Person In Charge : " + data.PERSON_IN_CHARGE + " is not added, incorrect format.")
        }
		
    }

    $('#exceltable').bootstrapTable(
    {
        idField: 'ID',
        data: filterData,
        columns: [{
            field: 'SN',
            title: 'SN',
            formatter: snFormatter
        }, {
            field: 'ADDRESS',
            title: 'ADDRESS'
        }, {
            field: 'POSTAL',
            title: 'POSTAL'
        }, {
            field: 'UNIT',
            title: 'UNIT'
        }, {
            field: 'PERSON_IN_CHARGE',
            title: 'PERSON_IN_CHARGE'
        }, {
            field: 'PHONE',
            title: 'PHONE'
        }, {
            field: 'EMAIL',
            title: 'EMAIL'
        }, {
            field: 'SITE',
            title: 'SITE'
        }, {
            field: 'CONTRACT_START',
            title: 'CONTRACT START'
        }, {
            field: 'CONTRACT_END',
            title: 'CONTRACT END'
        }, {
            field: 'MAINTENANCE_INTERVAL',
            title: 'MAINTENANCE INTERVAL'
        }, {
            field: 'NOTIFICATION_INTERVAL',
            title: 'NOTIFICATION INTERVAL'
        }, {
            field: 'REMARKS',
            title: 'REMARKS'
        }],
        onLoadSuccess: function (row) {


        },
        onPostBody: function () {



        },
        onPreBody: function (data) {


        },

    });

}

//Storage
$(document).ready(function () {

    //Then retrieve
    var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
    var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
    var getSessionstorageValueEmail = sessionStorage.getItem('setSessionstorageValueEmail');
    var getSessionstorageValueName = sessionStorage.getItem('setSessionstorageValueName');
    var getSessionstorageValueRoleDesc = sessionStorage.getItem('setSessionstorageValueRoleDesc');
    var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');

    if (getSessionstorageValueUser == null | getSessionstorageValueUser == "undefined" | getSessionstorageValueUser == "") {

        window.location.href = 'http://track-asia.com/systempest/'; //Login URL
        sessionStorage.clear();
        //window.location.href = '/';
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

        if (getSessionstorageValueCompanyID == 0) $('#titleCompany').append($('<div></div>').val("Calpeda").html("Calpeda"));
        else $('#titleCompany').append($('<div></div>').val(getSessionstorageValueCompany).html(getSessionstorageValueCompany));


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


//OnLoad Version Number
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

    if (getSessionstorageValueLanguage == "th") document.getElementById("verNum").innerHTML = version;
    if (getSessionstorageValueLanguage == "en") document.getElementById("verNumEN").innerHTML = version;
    if (getSessionstorageValueLanguage == "vn") document.getElementById("verNumVN").innerHTML = version;
    if (getSessionstorageValueLanguage == "id") document.getElementById("verNumID").innerHTML = version;

});

