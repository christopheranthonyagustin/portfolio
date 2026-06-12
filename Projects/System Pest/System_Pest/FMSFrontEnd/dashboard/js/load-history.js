
var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

var titleJobNumber, titlePhone, titlePersonInCharge, titleScheduleTime, titleAddressTo, titleContactNumber, titleCallCenter ,titlePhoneUser, titleLocation, titleStart, titleEnd, titleSpeed, titleDeviceStatus, titlePhonePower, titleTimestamp, titleEvent, titleRemarks, titleLastKnown ,titleJobStatus ,titleCustomerCompany, titleUnit, titlePostal, titleAmount, titleSignature, titleEmail, titlePhoneUserAddress, titlePhoneUserProfile, titleJobType;
var titleNoPositionDate, titleNoData, titleNoJobFound, titleDateInvalid;

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
    titleCustomerCompany = "Customer Company";
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
    titleNoPositionDate = "No Position Data"
    titleNoData = "No Data";
    titleNoJobFound = "No Job Found!";
    titleDateInvalid = "Date Invalid!";

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
    titleCustomerCompany = "บริษัท ลูกค้า";
    titleUnit = "หน่วย";
    titlePostal = "ไปรษณีย์";
    titleAmount = "จำนวน";
    titleSignature = "ลายเซ็น";
    titleEmail = "อีเมล";
    titlePhoneUserAddress = "ที่อยู่ผู้ใช้โทรศัพท์";
    titlePhoneUserProfile = "โปรไฟล์ผู้ใช้โทรศัพท์";
    titleJobType = "ประเภทงาน";
    titleNoPositionDate = "ไม่มีข้อมูลตำแหน่ง"
    titleNoData = "ไม่มีข้อมูล";
    titleNoJobFound = "ไม่พบตำแหน่งงาน!";
    titleDateInvalid = "วันที่ไม่ถูกต้อง!";

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
    titleSpeed = "Tốc Độ";
    titleDeviceStatus = "Trạng Thái Thiết Bị";
    titlePhonePower = "Điện Thoại";
    titleTimestamp = "Dấu Thời Gian";
    titleEvent = "Biến Sự";
    titleRemarks = "Chú ý";
    titleLastKnown = "Vị Trí Được Biết Lần Cuối";
    titleJobStatus = "Trạng Thái Công Việc";
    titleCustomerCompany = "Công Ty Khách Hàng";
    titleUnit = "Đơn Vị";
    titlePostal = "Bưu Diện";
    titleAmount = "Số Tiền";
    titleSignature = "Chữ Ký";
    titleEmail = "Email";
    titlePhoneUserAddress = "Địa Chỉ Người Sử Dụng Điện Thoại";
    titlePhoneUserProfile = "Hồ Sơ Người Dùng Điện Thoại";
    titleJobType = "Loại Công Việc";
    titleNoPositionDate = "Không Có Dữ Liệu Vị Trí"
    titleNoData = "Không Có Dữ Liệu";
    titleNoJobFound = "Không tìm thấy Công Việc!";
    titleDateInvalid = "Ngày Không hợp lệ!";

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
    titleCustomerCompany = "Perusahaan Pelanggan";
    titleUnit = "Satuan";
    titlePostal = "Kartu Pos";
    titleAmount = "Jumlah";
    titleSignature = "Tanda Tangan";
    titleEmail = "Email";
    titlePhoneUserAddress = "Alamat Telepon Pengguna";
    titlePhoneUserProfile = "Profil Telepon Pengguna";
    titleJobType = "Jenis Kerja";
    titleNoPositionDate = "Tidak ada Data Posisi"
    titleNoData = "Tidak ada Data";
    titleNoJobFound = "Tidak ada Kerja!";
    titleDateInvalid = "Tanggal Salah!";

}

$(document).ready(function ($) {
    // delegate calls to data-toggle="lightbox"
    $(document).delegate('*[data-toggle="lightbox"]:not([data-gallery="navigateTo"])', 'click', function (event) {
        event.preventDefault();
        return $(this).ekkoLightbox({
            onShown: function () {
                if (window.console) {
                    return console.log('Checking our the events huh?');
                }
            },
            onNavigate: function (direction, itemIndex) {
                if (window.console) {
                    return console.log('Navigating ' + direction + '. Current item: ' + itemIndex);
                }
            }
        });
    });


    // navigateTo
    $(document).delegate('*[data-gallery="navigateTo"]', 'click', function (event) {
        event.preventDefault();
        return $(this).ekkoLightbox({
            onShown: function () {

                var a = this.modal_content.find('.modal-footer a');
                if (a.length > 0) {

                    a.click(function (e) {

                        e.preventDefault();
                        this.navigateTo(2);

                    }.bind(this));

                }

            }
        });
    });


});


//Load Events
$.getJSON("http://117.120.7.119/spwebapi/api/statusinfo", function (data) {
    $.each(data, function (index, item) {

        if (item.StatusID != 4) {
            if (getSessionstorageValueLanguage == "en")
            {
                $('#load-events').append($('<option></option>').val(item.StatusID).html(item.StatusDesc));
            }
            else if (getSessionstorageValueLanguage == "th")
            {
                switch (item.StatusDesc) {
                    case "User Logout":
                        text = "ผู้ใช้ออกจากระบบ";
                        break;

                    case "User Login":
                        text = "เข้าสู่ระบบผู้ใช้";
                        break;

                   case "Zone Enter":
                       text = "ป้อนโซน";
                        break;

                    case "Zone Exit":
                        text = "โซนออก";
                        break;
                }

                $('#load-events').append($('<option></option>').val(item.StatusID).html(text));

            }
            else if (getSessionstorageValueLanguage == "vn")
            {
                switch (item.StatusDesc) {
                    case "User Logout":
                        text = "Đăng Xuất Người Dùng";
                        break;

                    case "User Login":
                        text = "Đăng Nhập Người Dùng";
                        break;

                    case "Zone Enter":
                        text = "Vùng Đi Vào";
                        break;

                    case "Zone Exit":
                        text = "Vùng Lối Ra";
                        break;
                }

                $('#load-events').append($('<option></option>').val(item.StatusID).html(text));
            }
            else if (getSessionstorageValueLanguage == "id")
            {
                switch (item.StatusDesc) {
                    case "User Logout":
                        text = "Pengguna Log Keluar";
                        break;

                    case "User Login":
                        text = "Pengguna Log Masuk";
                        break;

                    case "Zone Enter":
                        text = "Zona Masuk";
                        break;

                    case "Zone Exit":
                        text = "Zona Keluar";
                        break;
                }

                $('#load-events').append($('<option></option>').val(item.StatusID).html(text));
            }
        }
    });

    $(".selectpicker").selectpicker('refresh');
});




//Desktop
if (getSessionstorageValueRoleID == 1) {

    if (getSessionstorageValueLanguage == "en") {
        $('#load-assets').append($('<option value="" selected=""></option>').val('').html("ALL"));
    }
    else if (getSessionstorageValueLanguage == "th")
    {
        $('#load-assets').append($('<option value="" selected=""></option>').val('').html("ทั้งหมด"));
    }
    else if (getSessionstorageValueLanguage == "vn")
    {
        $('#load-assets').append($('<option value="" selected=""></option>').val('').html("Tất Cả"));
    }
    else if (getSessionstorageValueLanguage == "id")
    {
        $('#load-assets').append($('<option value="" selected=""></option>').val('').html("SEMUA"));
    }

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + '&ResellerID=' + "1" + '&CompanyID=' + "1", function (data) {
        $.each(data, function (index, item) {
            $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    if (getSessionstorageValueLanguage == "en") {
        $('#load-assets').append($('<option value="" selected=""></option>').val('').html("ALL"));
    }
    else if (getSessionstorageValueLanguage == "th") {
        $('#load-assets').append($('<option value="" selected=""></option>').val('').html("ทั้งหมด"));
    }
    else if (getSessionstorageValueLanguage == "vn") {
        $('#load-assets').append($('<option value="" selected=""></option>').val('').html("Tất Cả"));
    }
    else if (getSessionstorageValueLanguage == "id") {
        $('#load-assets').append($('<option value="" selected=""></option>').val('').html("SEMUA"));
    }

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID == 3) {
    $('#selectCompany').remove();

    if (getSessionstorageValueLanguage == "en") {
        $('#load-assets').append($('<option value="" selected=""></option>').val('').html("ALL"));
    }
    else if (getSessionstorageValueLanguage == "th") {
        $('#load-assets').append($('<option value="" selected=""></option>').val('').html("ทั้งหมด"));
    }
    else if (getSessionstorageValueLanguage == "vn") {
        $('#load-assets').append($('<option value="" selected=""></option>').val('').html("Tất Cả"));
    }
    else if (getSessionstorageValueLanguage == "id") {
        $('#load-assets').append($('<option value="" selected=""></option>').val('').html("SEMUA"));
    }

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 4) {
    $('#selectCompany').remove();
    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}

$('#load-reference').append($('<option selected="selected"></option>').val("").html("All"));

$.getJSON("http://117.120.7.119/spwebapi/api/inventoryinfo?CompanyID=" + getSessionstorageValueCompanyID, function (data) {
    $.each(data, function (index, item) {
        $('#load-reference').append($('<option></option>').val(item.Reference).html(item.Reference));
    });
    $(".selectpicker").selectpicker('refresh');
});


/*** Function to filter reseller and companies*/
$(function () {

    var selectedCompany = "";
    var selectedReseller = "";
    $('.SelectResellerFilter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();

        $('#mobile-load-reseller').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name)
                     );
                    }
                    else {
                        $('#mobile-load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#mobile-load-reseller').remove();
        }

        $('#mobile-load-company').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#load-company').empty();
        $(".SelectCompanyFilter").selectpicker('refresh');

        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#mobile-load-company').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));

            $.each(data, function (index, item) {
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $(".MobileSelectCompanyFilter").selectpicker('refresh');
            $(".SelectCompanyFilter").selectpicker('refresh');
        });


        $('#mobile-load-assets').empty();
        $('#mobile-load-assets').append($('<option></option>').val(0).html("-------"));
        $(".MobileSelectVechsFilter").selectpicker('refresh');

        $('#load-assets').empty();
        $('#load-assets').append($('<option></option>').val(0).html("-------"));
        $(".SelectVechsFilter").selectpicker('refresh');

    });


    $('.SelectCompanyFilter').on('change', function () {
        selectedCompany = $(this).find("option:selected").val();

        //Select New Company
        $('#mobile-load-company').empty();
        $('.MobileSelectCompanyFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {

                $.each(data, function (index, item) {

                    if (item.CompanyID == selectedCompany) {
                        $('#mobile-load-company').append(
                         $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                     );
                    }
                    else {
                        $('#mobile-load-company').append(
                         $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                     );
                    }
                });
                var getCompany = $("#load-company").val();
                sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                $('#mobile-load-company').selectpicker('refresh');
            })
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                $.each(data, function (index, item) {

                    if (item.CompanyID == selectedCompany) {
                        $('#mobile-load-company').append(
                         $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                     );
                    }
                    else {
                        $('#mobile-load-company').append(
                         $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                     );
                    }

                });
                var getCompany = $("#load-company").val();
                sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                $('#mobile-load-company').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                $.each(data, function (index, item) {

                    if (item.CompanyID == selectedCompany) {
                        $('#mobile-load-company').append(
                         $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                     );
                    }
                    else {
                        $('#mobile-load-company').append(
                         $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                     );
                    }

                });

                var getCompany = $("#load-company").val();
                sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                $('#mobile-load-company').selectpicker('refresh');

            });
        }

        //Load New Assets
        $('#mobile-load-assets').empty();
        $('.MobileSelectVechsFilter').selectpicker('refresh');
        $('#load-assets').empty();
        $('SelectVechsFilter').selectpicker('refresh');
        var getReseller = $('#load-reseller').val();
        var getCompany = $('#load-company').val();

        var userReseller;
        if (selectedReseller == '' || selectedReseller == null) {
            userReseller = $("#load-reseller").val();
        } else {
            userReseller = selectedReseller;
        }

        if (getSessionstorageValueRoleID == 1) {

            $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany, function (data) {

                $.each(data, function (index, item) {

                    $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                });

                $('.MobileSelectVechsFilter').selectpicker('refresh');
                $(".SelectVechsFilter").selectpicker('refresh');
            });

        }
        else if (getSessionstorageValueRoleID == 2) {

            $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {

                $.each(data, function (index, item) {

                    $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));

                });

                $('.MobileSelectVechsFilter').selectpicker('refresh');
                $(".SelectVechsFilter").selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {

            $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {
                $.each(data, function (index, item) {

                    $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));

                });

                $('.MobileSelectVechsFilter').selectpicker('refresh');
                $(".SelectVechsFilter").selectpicker('refresh');
            });
        }

    });
});



if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo", function (data) {
        $.each(data, function (index, item) {
            $('#load-assets2').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID, function (data) {
        $.each(data, function (index, item) {
            $('#load-assets2').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#load-assets2').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}


$.getJSON("http://117.120.7.119/spwebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-category').append(
             $('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc)
         );

    });

    $(".selectpicker").selectpicker('refresh');
});


//  Format for Vehicle Column.
// =================================================================
function vehicleFormatter(value, row) {

    return '<a class="btn-link" id="showVehicle" onClick="showVehicle()">' + value + '</a>';
}

function snFormatter(value, row, index) {

    return index + 1;
}

//  Format for Mileage Column.
// =================================================================
function mileageFormatter(value, row) {

    var roundoff = Math.round(value * 100) / 100;
    return '<span>' + roundoff + ' Km' + '</span>';
}

//  Format for Speed  Column.
// =================================================================
function speedFormatter(value, row) {

    if (value > 20)
    {
        var convertKmPerHour = value * 3.6 / 2;
    }
    else
    {
        var convertKmPerHour = value * 3.6;
    }
  
    var roundoff = Math.round(convertKmPerHour * 100) / 100;

    return '<span>' + roundoff + ' Km/h' + '</span>';
}


//  Format for Ignition Column.
// =================================================================
function ignitionFormatter(value, row) {
    var labelColor;
    var text;

    if (getSessionstorageValueLanguage == "en") {
        switch (value) {
            case 1:
                text = "On";
                break;
            case 0:
                text = "Off";
                break;
        }
    }
    else if (getSessionstorageValueLanguage == "th") {
        switch (value) {
            case 1:
                text = "เปิด";
                break;
            case 0:
                text = "ปิด";
                break;
        }
    }
    else if (getSessionstorageValueLanguage == "vn") {
        switch (value) {
            case 1:
                text = "BAT";
                break;
            case 0:
                text = "TAT";
                break;
        }
    }
    else if (getSessionstorageValueLanguage == "id") {
        switch (value) {
            case 1:
                text = "HIDUP";
                break;
            case 0:
                text = "MATI";
                break;
        }
    }

    if (value == 1) {
        labelColor = "success";
    } else if (value == 0) {
        labelColor = "dark";
    }

    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
}

//  Format for Barlight Column.
// =================================================================
function barlightFormatter(value, row) {
    var labelColor;
    var text;

    if (getSessionstorageValueLanguage == "en") {
        switch (value) {
            case "On":
                text = "On";
                break;
            case "Off":
                text = "Off";
                break;
        }
    }
    else if (getSessionstorageValueLanguage == "th") {
        switch (value) {
            case "On":
                text = "เปิด";
                break;
            case "Off":
                text = "ปิด";
                break;
        }
    }
    else if (getSessionstorageValueLanguage == "vn") {
        switch (value) {
            case "On":
                text = "BAT";
                break;
            case "Off":
                text = "TAT";
                break;
        }
    }
    else if (getSessionstorageValueLanguage == "id") {
        switch (value) {
            case "On":
                text = "HIDUP";
                break;
            case "Off":
                text = "MATI";
                break;
        }
    }

    if (value == 1) {
        labelColor = "success";
    } else if (value == 0) {
        labelColor = "dark";
    }
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
}


//  Format for Engine Column.
// =================================================================
function engineFormatter(value, row) {
    var labelColor;
    var text;

    if (getSessionstorageValueLanguage == "en")
    {
        switch(value){
            case "MOVE":
                text = "MOVE";
                break;
            case "IDLE":
                text = "IDLE";
                break;
            case "STOP":
                text = "STOP"
                break;
        }
    }
    else if (getSessionstorageValueLanguage == "th") {
        switch (value) {
            case "MOVE":
                text = "ย้าย";
                break;
            case "IDLE":
                text = "ว่าง";
                break;
            case "STOP":
                text = "หยุด"
                break;
        }
    }
    else if (getSessionstorageValueLanguage == "vn") {
        switch (value) {
            case "MOVE":
                text = "DI CHUYEN";
                break;
            case "IDLE":
                text = "RANH RANG";
                break;
            case "STOP":
                text = "DỪNG LẠI"
                break;
        }
    }
    else if (getSessionstorageValueLanguage == "id") {
        switch (value) {
            case "MOVE":
                text = "GERAK";
                break;
            case "IDLE":
                text = "TAK JALAN";
                break;
            case "STOP":
                text = "HENTI"
                break;
        }
    }

    if (value == "MOVE") {
        labelColor = "success";
    } else if (value == "IDLE") {
        labelColor = "warning";
    } else if (value == "STOP") {
        labelColor = "danger";
    }

    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
}


//  Format for Timestamp Column.
// =================================================================
function timestampFormatter(value, row) {

    //Convert Timezone
    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
    var Singapore = moment.tz(value, Asia);

    if (getSessionstorageValueTrackVersion == "sg")
    {
        var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss');
    }
    else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id")
    {
        var timestamp = moment.utc(Singapore.format()).add('hours', 7).format('D-MMM-YYYY, HH:mm:ss');
    }

    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';
}

function rxtimeFormatter(value, row) {


    //Convert Timezone
    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
    var Singapore = moment.tz(value, Asia);
    if (getSessionstorageValueTrackVersion == "sg") {
        //Format UTC
        var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss');
        var rxtimestamp = moment(Singapore.format()).format("D-MMM-YYYY");
    }
    else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id") {
        //Format UTC
        var timestamp = moment.utc(Singapore.format()).add('hours', 7).format('D-MMM-YYYY, HH:mm:ss');
        var rxtimestamp = moment(Singapore.format()).format("D-MMM-YYYY");
    }

    if (rxtimestamp == "1-Jan-2000")
    {
        return;
    }
    else
    {
        return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';
    }



}

function numberHoursFormatter(value, row) {

    var dateFormat = "HH:mm:ss";
    var timestamp = moment(row.Timestamp).subtract('hours', 0).format(dateFormat);
    var rxtime = moment(row.RxTime).add('hours', 0).format(dateFormat);

    var convertTimestamp = moment(timestamp, dateFormat);
    var convertRxtime = moment(rxtime, dateFormat);
    var duration = '<div>' + moment.duration(convertRxtime - convertTimestamp).humanize() + '</div>';


    return '<div>' +  duration + '</div>';

}

// Format for User Name Column.
// =================================================================
function jobdriverFormatter(value, row) {
    var labelColor;
    var text;

    if (value == "")
    {
        labelColor = "danger";
        text = "No Driver - Job Invalid! Pls. contact administrator";
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }
    else
    {
        labelColor = "success";
        return '<center><div class="label label-table label-' + labelColor + '">' + value + '</div></center>';
    }

}

// Format for User Name Column.
// =================================================================
function paymentFormatter(value, row) {
    var labelColor;
    var text = value;

    console.log(text)

    if (value == '')
    {
        labelColor = "danger";
        text = "No Payment Method";
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }
    else if (value == 1)
    {
        labelColor = "success";
        text = "Cash";
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }
    else
    {
        text = "Cheque";
        labelColor = "success";
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }

}

function pestTreatmentFormatter(value, row) {

    var item = '';
    if (value) {
        //console.log(value.length)
        for (var index = 0; index < value.length; index++) {

            if (value[index].ItemNo == 0)
            {
                item = '';
            }
            else
            {
                item += "Item No: " + value[index].ItemNo + "<br />" + "Pest: " + value[index].PestDesc + "<br />" + "Area Concerned: " + value[index].AocDesc + "<br />" + "Findings: " + value[index].Findings + "<br />";

                // Only show a comma if it's not the last one in the loop
                if (index < (value.length - 1)) {
                    item += "<br />";
                }
            }
        }

        return "<div style='width: 150px !important;'>" + item + "</div>";

    }

}

function amountFormatter(value, row) {

    return '<div>' + '<span><i class="fa fa-usd hidden-xs hidden-md"></i>&nbsp;' + value + '</span>' + '</div>';
}

function totalamountFormatter(value, row) {

    var getTotal = row.Amount;

    return '<div>' + '<span><i class="fa fa-usd hidden-xs hidden-md"></i>&nbsp;' + getTotal + '</span>' + '</div>';
}

function amountFormatter(value, row) {

    return '<div>' + '<span><i class="fa fa-usd hidden-xs hidden-md"></i>&nbsp;' + value + '</span>' + '</div>';
}

function stocktypeFormatter(value, row) {
    var text = '';
    if(value == 1){
        text = 'New';
    }else if(value == 2){
        text = 'Stock In'
    }else if(value == 3){
        text = 'Stock Out'
    }else if(value == 4){
        text = 'Deleted'
    }

    return '<div>' + '<span><i class="hidden-xs hidden-md"></i>&nbsp;' + text + '</span>' + '</div>';
}

function platformFormatter(value, row) {
    var text = '';
    if(value == 1){
        text = 'Desktop';
    }else if(value == 2){
        text = 'Mobile Application'
    }

    return '<div>' + '<span><i class="hidden-xs hidden-md"></i>&nbsp;' + text + '</span>' + '</div>';
}

function flagFormatter(value, row) {
    var labelColor;
    var text;
    if (value == 0) {
        labelColor = "success";
        text = "Sent";
    } else if (value == 1) {
        labelColor = "warning";
        text = "Pending";
    }

    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
}

function tripFormatter(value, row) {
    var labelColor;
    var text;
    if (value == 1) {
        labelColor = "warning";
        text = "One Way";
    } else if (value == 2) {
        labelColor = "success";
        text = "Two Way";
    }

    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
}

function paymentFormatter(value, row) {
    var labelColor;
    var text;
    if (value == 1) {
        labelColor = "success";
        text = "Cash";
    } else if (value == 2) {
        labelColor = "warning";
        text = "Billing";
    }

    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
}

function driveridFormatter(value, row) {

    if (value == null) {

        return '<a class="btn-link" id="showVehicle">' + '#' + 'No Driver ID' + '</a>';
    }
    else {
        return '<a class="btn-link" id="showVehicle">' + '#' + value + '</a>';
    }
}

// Format for User Name Column.
// =================================================================
function signFormatter(value, row) {
    var labelColor;
    var text;
    if (row.ImageFill == "Uniform") {
        text = value;

        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + 'Supervisor Signature' + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

    } else if (row.ImageFill != "Uniform") {
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

function nameFormatter(value, row) {
    var labelColor;
    var text;

    var getDriverID = row.DriverInfo.DriverID;

    var driverAddress;
    if (row.DriverInfo.Address == '') {
        driverAddress = "No Address";
    } else {
        driverAddress = row.DriverInfo.Address;
    }

    var driverPhone;
    if (row.DriverInfo.Phone == '') {
        driverPhone = "No Phone";
    } else {
        driverPhone = row.DriverInfo.Phone;
    }


    if (row.DriverInfo.DriverID != "0" && row.DriverInfo.ImageFill == "Uniform") {
        text = value;
        return '<center><div style="color:blck;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.DriverInfo.Name + '" data-footer="' + "<strong>Address: </strong>" + driverAddress + "\n" + "<strong>Phone: </strong>" + driverPhone + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

    } else if (row.DriverInfo.DriverID != "0" && row.DriverInfo.ImageFill == "None") {
        labelColor = "success";
        text = row.DriverInfo.Name;
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';

    } else if (row.DriverInfo.DriverID == "0") {
        labelColor = "dark";
        if (getSessionstorageValueLanguage == "en") {
            text = "No Phone User";
        }
        else if (getSessionstorageValueLanguage == "th") {
            text = "ไม่มีผู้ใช้โทรศัพท์";
        } else if (getSessionstorageValueLanguage == "vn") {
            text = "Không Có Người Sử Dụng Điện Thoại";
        } else if (getSessionstorageValueLanguage == "id") {
            text = "Tidak Pengguna Telepon  ";
        }


        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';

    }
}

function accessoriesFormatter(value, row) {

    var text, oxygen, wheelchair, stairchair, stretches;

    var valueAccessories = value.split(",");
    var getOxygen = valueAccessories[0];
    var getWheelChair = valueAccessories[1];
    var getStairChair = valueAccessories[2];
    var getStretches = valueAccessories[3];


    if (getOxygen == 1){oxygen = "Oxygen";}
    if (getWheelChair == 2) {wheelchair = "Wheel Chair";}
    if (getStairChair == 3) {stairchair = "Stair Chair";}
    if (getStretches == 4) {stretches = "Stretches";}

    if (oxygen == "undefined" || oxygen == null) {oxygen = "";}
    if (wheelchair == "undefined" || wheelchair == null) {wheelchair = "";}
    if (stairchair == "undefined" || stairchair == null) {stairchair = "";}
    if (stretches == "undefined" || stretches == null) {stretches = "";}

    text = oxygen + "\r\n" + wheelchair + "\r\n" + stairchair + "\r\n" + stretches;

    return text;
  
}

//<!--Filter-Vehicle-->
(function (document) {
    'use strict';

    var VehicleTableFilter = (function (Arr) {


        var _select;


        function _onSelectEvent(e) {
            _select = e.target;
            var tables = document.getElementsByClassName(_select.getAttribute('data-table'));
            Arr.forEach.call(tables, function (table) {
                Arr.forEach.call(table.tBodies, function (tbody) {
                    Arr.forEach.call(tbody.rows, _filterSelect);
                });
            });
        }

        function _filter(row) {

            var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
            row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';

        }

        function _filterSelect(row) {

            var text_select = row.textContent.toLowerCase(), val_select = _select.options[_select.selectedIndex].value.toLowerCase();
            row.style.display = text_select.indexOf(val_select) === -1 ? 'none' : 'table-row';

        }


        return {
            init: function () {
                var selects = document.getElementsByClassName('select-vehicle-filter');
                Arr.forEach.call(selects, function (select) {
                    select.onchange = _onSelectEvent;


                });
            }
        };
    })(Array.prototype);

    document.addEventListener('readystatechange', function () {
        if (document.readyState === 'complete') {
            VehicleTableFilter.init();

        }
    });

})(document);


//Hide Elements
$(document).ready(function () {
    options = {
        clearOnHide: true
    }
    $('[visibly]').Visibly();
})


//Select Report                                 
$(function () {

    $("#playback").hide();
    $("#viewLocation").hide();
    //Click Generate

    document.getElementById("clickGenerateEN").onclick = Generate;

    function Generate() {

        localStorage.removeItem("setLocalstorageValueReport");

        var e = document.getElementById("load-report");
        var strReport = e.options[e.selectedIndex].value;

        var reports = "";
        switch (strReport) {
            case "Positions":
                reports = "reports-positions";
                break;
            case "Speed":
                reports = "reports-speed";
                break;
            case "Mileage":
                reports = "reports-mileage";
                break;
            case "Utilization (Type 1)":
                reports = "reports-utilization";
                break;
            case "Events":
                reports = "reports-events";
                break;
            case "Messages":
                reports = "reports-messages";
                break;
            case "Jobs":
                reports = "reports-jobs";
                break;
            case "Job Status":
                reports = "reports-jobstatus";
                break;
            case "Call Center":
                reports = "reports-callcenter";
                break;
            case "Trip":
                reports = "reports-trip";
                break;
            case "Payment":
                reports = "reports-payment";
                break;
            case "Paramedic":
                reports = "reports-paramedic";
                break;
            case "Phone User":
                reports = "reports-driver";
                break;
	        case "Type":
                reports = "reports-type";
                break;
            case "Comprehensive Report":
                reports = "reports-cvr";
                break;
            case "Barlight":
                reports = "reports-barlight";
                break;
            case "Inventory":
                reports = "reports-inventory";
                break;

        }


        //Set
        localStorage.setItem("setLocalstorageValueReport", reports);


        $("#load-assets :selected").text(); //the text content of the selected option
        var getAsset = $("#load-assets").val(); //the value of the selected option       
        var getCompany = $("#load-company").val();
        var getReseller = $("#load-reseller").val();
        var getTimestamp = $("#dateFrom").val();
        var getRxTime = $("#dateTo").val();
        var getSpeed = $("#speedLimit").val();
        var getStatusID = $("#load-events").val();
        var getFlag = $("#load-messages").val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getPayment = $("#payment").val();
        var getJobStatus = $("#jobStatus").val();
        var getAgent = $("#agent").val();
        var getTrip = $("#trip").val();
	    var getDriver = $("#driver").val();
        var getType = $("#type").val();
        var getReference = $('#load-reference').val();

        var convertTimestamp = moment(getTimestamp, dateFormat);
        var convertRxtime = moment(getRxTime, dateFormat);

        var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
        var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);

        var duration = '<div style="color:white">Selected Date:&nbsp;' + moment.duration(convertRxtime - convertTimestamp).humanize() + ' duration</div>';


        var validateTimestamp = moment(getTimestamp, dateFormat).isValid();
        var validateRxTime = moment(getRxTime, dateFormat).isValid();

        if (getSpeed < 20) {

            var convertMeterPerSeconds = getSpeed / 3.6;
        }
        else
        {
            var convertMeterPerSeconds = getSpeed / 3.6 * 2;
        }

 


        //if (timestamp < rxtime) {
            // alert("Entered date is greater than today's date ");


            if (validateTimestamp == true && validateRxTime == true) {

                var getLocalstorageValueRetrieveReport = localStorage.getItem('setLocalstorageValueReport');
                localStorage.setItem('setLocalstorageValueReport', getLocalstorageValueRetrieveReport);

                var WebApiCVR = "";
                var WebApi = "";
                var WebApiBarlight = "";
                var jobApi = "";
                var WebApiMessages = "http://117.120.7.119/spwebapi/api/messageinfo?Asset=" + getAsset + "&Flag=" + getFlag + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;
                
                var inventoryAPI = 'http://117.120.7.119/spwebapi/api/inventoryhistoryinfo?CompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&Reference=' + getReference;

                if (getAsset == "")
                {
                    if (getReseller == "" || getReseller == "undefined" || getReseller == null)
                    {
                        getReseller = getSessionstorageValueUserResellerID;
                    }
                        
                    if (getCompany == "" || getCompany == "undefined" || getCompany == null)
                    {
                        getCompany = getSessionstorageValueCompanyID;
                    }

                    WebApiCVR = "http://117.120.7.119/spwebapi/api/cvrinfo?&CompanyID=" + getCompany + "&Timestamp=" + timestamp + "&RxTime=" + rxtime + "&Speed=" + convertMeterPerSeconds;
                    WebApi = "http://117.120.7.119/spwebapi/api/posinfo?&CompanyID=" + getCompany + "&Timestamp=" + timestamp + "&RxTime=" + rxtime + "&Speed=" + convertMeterPerSeconds;
                    WebApiBarlight = "http://117.120.7.119/spwebapi/api/posinfo?&CompanyID=" + getCompany + "&Timestamp=" + timestamp + "&RxTime=" + rxtime + "&Barlight=1";
                    jobApi = 'http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=' + getReseller + '&AssetCompanyID=' + getCompany + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&Flag=0' + '&Payment=' + getPayment + '&JobStatus=' + getJobStatus + '&Agent=' + getAgent + '&Trip=' + getTrip + '&JobDriver=' + getDriver + '&JobType=' + getType;
                }
                else
                {
                    if (getReseller == "" || getReseller == "undefined" || getReseller == null)
                    {
                        getReseller = getSessionstorageValueUserResellerID;
                    }
                        
                    if (getCompany == "" || getCompany == "undefined" || getCompany == null)
                    {
                        getCompany = getSessionstorageValueCompanyID;
                    }
                    
                    WebApiCVR = "http://117.120.7.119/spwebapi/api/cvrinfo?Asset=" + getAsset + "&Speed=" + convertMeterPerSeconds + "&CompanyID=" + getCompany + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;
                    WebApi = "http://117.120.7.119/spwebapi/api/posinfo?Asset=" + getAsset + "&Speed=" + convertMeterPerSeconds + "&CompanyID=" + getCompany + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;
                    WebApiBarlight = "http://117.120.7.119/spwebapi/api/posinfo?Asset=" + getAsset + "&Speed=" + convertMeterPerSeconds + "&Barlight=1" + "&CompanyID=" + getCompany + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;
                    jobApi = 'http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=' + getReseller + '&AssetCompanyID=' + getCompany + '&Asset=' + getAsset + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&Flag=0' + '&Payment=' + getPayment + '&JobStatus=' + getJobStatus + '&Agent=' + getAgent + '&Trip=' + getTrip + '&JobDriver=' + getDriver + '&JobType=' + getType;            
                }
                
                //alert(WebApiMessages);
                var WebApiEvent;
                var getEvents = document.getElementById("load-events");
                var strEvent = getEvents.options[getEvents.selectedIndex].value;
            

                if (getLocalstorageValueRetrieveReport == "reports-positions") {
                    console.log("WebAPI:" + WebApi);
                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalPosition").innerHTML = duration;


                    //Positions Table
                    $(document).ready(function () {

                        $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'PosID',
                                url: WebApi,
                                columns: [{
                                    field: 'PosID',
                                    title: 'id',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'Asset',
                                    title: titlePhone,
                                    formatter: vehicleFormatter
                                }, {
                                    field: 'Tag',
                                    title: 'Device',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'Driver',
                                    title: titlePhoneUser
                                }, {
                                    field: 'Location',
                                    title: titleLocation
                                }, {
                                    field: 'Timestamp',
                                    title: titleTimestamp,
                                    sortable: 'true',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'Speed',
                                    title: titleSpeed,
                                    formatter: speedFormatter
                                }, {
                                    field: 'Mileage',
                                    title: 'Mileage',
                                    formatter: mileageFormatter,
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'Engine',
                                    title: titleDeviceStatus,
                                    sortable: 'true',
                                    formatter: engineFormatter
                                }, {
                                    field: 'Ignition',
                                    title: 'Ignition',
                                    sortable: 'true',
                                    formatter: ignitionFormatter
                                }],

                                onLoadSuccess: function (data) {

                                    //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));

                                    if (data == "")
                                    {
                                        $('#chartPositionStatus').hide();
                                        $('#chartPositionIgnition').hide();
                                        alert(titleNoPositionDate);

                                    }
                                    else
                                    {
                                        $('#chartPositionStatus').show();
                                        $('#chartPositionIgnition').show();
                                        //Set
                                        //sessionStorage.setItem("setSessionstorageValueData", JSON.stringify(data));
                                        //drawPositionChartStatus();
                                        //drawPositionChartIgnition();
                                    }

                                },

                                onClickRow: function (row) {
                                    //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                    //Store
                                    localStorage.setItem("row", JSON.stringify(row));

                                    var width = 640;
                                    var height = 360;


                                    $('#myModal').modal("show");

                                    $("#myModal iframe").attr({
                                        'src': 'report_map.html',
                                        'height': height,
                                        'width': width,
                                    });

                                }

                            });


                    });


                }

                else if (getLocalstorageValueRetrieveReport == "reports-speed") {

                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalSpeed").innerHTML = duration;
                    //Speed Table
                    $(document).ready(function () {


                        $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'PosID',
                                url: WebApi,
                                columns: [{
                                    field: 'PosID',
                                    title: 'id',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'Asset',
                                    title: titlePhone,
                                    //title: 'พาหนะ',
                                    formatter: vehicleFormatter
                                }, {
                                    field: 'Tag',
                                    title: 'Device',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                    //title: 'เครื่อง'
                                }, {
                                    field: 'Driver',
                                    title: titlePhoneUser
                                }, {
                                    field: 'Speed',
                                    title: titleSpeed,
                                    formatter: speedFormatter
                                    //title: 'ความเร็ว'
                                }, {
                                    field: 'Timestamp',
                                    title: titleTimestamp,
                                    sortable: 'true',
                                    //title: 'การประทับเวลา',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'Engine',
                                    title: titleDeviceStatus,
                                    sortable: 'true',
                                    //title: 'เครื่องยนต์',
                                    formatter: engineFormatter
                                }, {
                                    field: 'Ignition',
                                    title: titlePhonePower,
                                    sortable: 'true',
                                    //title: 'การเผาไหม้',
                                    formatter: ignitionFormatter
                                }],

                                onLoadSuccess: function (data, row) {

                                    if (data == "") {

                                        alert(titleNoData);
                                    }

                                },

                                onClickRow: function (row) {
                                    //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                    //Store
                                    localStorage.setItem("row", JSON.stringify(row));

                                    var width = 640;
                                    var height = 360;


                                    $('#myModal').modal("show");

                                    $("#myModal iframe").attr({
                                        'src': 'report_map.html',
                                        'height': height,
                                        'width': width,
                                    });
      

                                },

                            });

                    });

                }


                else if (getLocalstorageValueRetrieveReport == "reports-mileage") {

                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalMileage").innerHTML = duration;
                    //Mileage Table
                    $(document).ready(function () {


                        $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'PosID',
                                url: WebApi,
                                columns: [{
                                    field: 'PosID',
                                    title: 'id',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'Asset',
                                    title: 'Vehicle',
                                    //title: 'พาหนะ',
                                    formatter: vehicleFormatter
                                }, {
                                    field: 'Tag',
                                    title: 'Device',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                    //title: 'เครื่อง'
                                }, {
                                    field: 'Mileage',
                                    title: 'Mileage',
                                    formatter: mileageFormatter
                                    //title: 'การสะสมไมล์'
                                }, {
                                    field: 'Timestamp',
                                    title: 'Timestamp',
                                    sortable: 'true',
                                    //title: 'การประทับเวลา',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'Speed',
                                    title: 'Speed',
                                    formatter: speedFormatter
                                    //title: 'แบตเตอรี่'
                                }, {
                                    field: 'Engine',
                                    title: 'Device Status',
                                    sortable: 'true',
                                    //title: 'เครื่องยนต์',
                                    formatter: engineFormatter
                                }, {
                                    field: 'Ignition',
                                    title: 'Ignition',
                                    sortable: 'true',
                                    //title: 'การเผาไหม้',
                                    formatter: ignitionFormatter
                                }],

                                onLoadSuccess: function (data, row) {

                                    if (data == 1) {
                                       
                                        alert(titleNoData);
                                    }
                                    else
                                    {
                                        //Set
                                        sessionStorage.setItem("setSessionstorageValueData", JSON.stringify(data));
                                        drawMileageChart();

                                    }

                                },

                                onClickRow: function (row) {
                                    //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                    //Store
                                    localStorage.setItem("row", JSON.stringify(row));


                                    var width = 640;
                                    var height = 360;


                                    $('#myModal').modal("show");

                                    $("#myModal iframe").attr({
                                        'src': 'report_map.html',
                                        'height': height,
                                        'width': width,
                                    });





                                }
                              

                            });

                    });


                }


                else if (getLocalstorageValueRetrieveReport == "reports-utilization") {

                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalUtilization").innerHTML = duration;
                    //Utilization Table
                    $(document).ready(function () {


                        $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'PosID',
                                url: WebApi,
                                columns: [{
                                    field: 'PosID',
                                    title: 'id',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'Asset',
                                    title: 'Vehicle',
                                    //title: 'พาหนะ',
                                    formatter: vehicleFormatter
                                }, {
                                    field: 'Tag',
                                    title: 'Device',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                    //title: 'เครื่อง'
                                }, {
                                    field: 'Timestamp',
                                    title: 'Timestamp',
                                    //title: 'การประทับเวลา',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'Speed',
                                    title: 'Speed'
                                    //title: 'แบตเตอรี่'
                                }, {
                                    field: 'Engine',
                                    title: 'Device Status',
                                    //title: 'เครื่องยนต์',
                                    formatter: engineFormatter
                                }, {
                                    field: 'Ignition',
                                    title: 'Ignition',
                                    //title: 'การเผาไหม้',
                                    formatter: ignitionFormatter
                                }],

                                onLoadSuccess: function (row) {

                                 
                                    if (data == "") {
                                       
                                        alert(titleNoData);
                                    }
                                    else
                                    {
                                        drawChart();
                                    }


                                },
                                onClickRow: function (row) {
                                    //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                    //Store
                                    localStorage.setItem("row", JSON.stringify(row));


                                    //Then retrieve
                                    var localObj = JSON.parse(localStorage.getItem(row));


                                    //if (Modernizr.localstorage) {
                                    //    $("#Perimeter").text('localStorage is available');
                                    //} else {
                                    //    $("#Perimeter").text('localStorage is not available');
                                    //}

                                    var panel1 = $.jsPanel({
                                        iframe: {
                                            src: "report_pie.html",
                                            id: "myFrame",
                                            style: { "display": "none", "border": "10px solid transparent" },
                                            width: '100%',
                                            height: '100%'
                                        },

                                        callback: function () {
                                            document.getElementById("myFrame").onload = function () {
                                                $("#myFrame").fadeIn(1000);
                                            }
                                        },
                                        size: { width: 425, height: 425 },
                                        position: { left: "center", top: 30 },
                                        title: row.Asset, //Utilization Report
                                        theme: "black"
                                    });

                                },
                            });

                    });
                }

                else if (getLocalstorageValueRetrieveReport == "reports-events") {

                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalEvents").innerHTML = duration;


                    if (strEvent == 12 | strEvent == 13) {
                        WebApiEvent = "http://117.120.7.119/spwebapi/api/eventinfo/?StatusID=" + getStatusID + "&Timestamp=" + timestamp + "&RxTime=" + rxtime + '&CompanyID=' + getCompany + '&AckRoleID=' + getSessionstorageValueRoleID;

                        //User Login/Logout Table
                        $(document).ready(function () {

                            $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                                {
                                    idField: 'EventID',
                                    url: WebApiEvent,
                                    columns: [{
                                        field: 'EventID',
                                        title: 'id',
                                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                    }, {
                                        field: 'SN',
                                        title: 'SN',
                                        formatter: snFormatter
                                    }, {
                                        field: 'Timestamp',
                                        title: titleTimestamp,
                                        //title: 'การประทับเวลา',
                                        formatter: timestampFormatter
                                    }, {
                                        field: 'Event',
                                        title: titleEvent
                                    }, {
                                        field: 'Remarks',
                                        title: titleRemarks
                                    }],

                                    onLoadSuccess: function (data) {

                                        if (data == "") {
                                            
                                            alert(titleNoData);
                                        }

                                    }
                                });

                        });
                    }
                    else if (strEvent == 17 | strEvent == 18) {
                        WebApiEvent = "http://117.120.7.119/spwebapi/api/eventinfo/?Asset=" + getAsset + "&StatusID=" + getStatusID + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;

                        //Zone Enter/Exit Table
                        $(document).ready(function () {

                            $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                                {
                                    idField: 'EventID',
                                    url: WebApiEvent,
                                    columns: [{
                                        field: 'EventID',
                                        title: 'id',
                                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                    }, {
                                        field: 'SN',
                                        title: 'SN',
                                        formatter: snFormatter
                                    }, {
                                        field: 'Timestamp',
                                        title: titleTimestamp,
                                        formatter: timestampFormatter
                                    }, {
                                        field: 'Event',
                                        title: titleEvent
                                    }, {
                                        field: 'Remarks',
                                        title: titleRemarks
                                    }, {
                                        field: 'Asset',
                                        title: titlePhone,
                                        formatter: vehicleFormatter
                                    }, {
                                        field: 'Location',
                                        title: titleLastKnown
                                    }, ],

                                    onLoadSuccess: function (data) {

                                        if (data == "") {
                                     
                                            alert(titleNoData);
                                        }

                                    },

                                    onClickRow: function (row) {
                                        //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                        var getEvent = row.Event;

                                        if (getEvent == "Zone Enter" || getEvent == "Zone Exit") {

                                            //Store
                                            localStorage.setItem("row", JSON.stringify(row));

                                            var width = 640;
                                            var height = 360;


                                            $('#myModal').modal("show");

                                            $("#myModal iframe").attr({
                                                'src': 'history_event.html',
                                                'height': height,
                                                'width': width,
                                            });


                                        }
                                    }

                                });

                        });

                    }

                    else if (strEvent == 19) {
                        WebApiEvent = "http://117.120.7.119/spwebapi/api/eventinfo/?Asset=" + getAsset + "&StatusID=" + getStatusID + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;

                        //Speed Limit Table
                        $(document).ready(function () {

                            $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                                {
                                    idField: 'EventID',
                                    url: WebApiEvent,
                                    columns: [{
                                        field: 'EventID',
                                        title: 'id',
                                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                    }, {
                                        field: 'SN',
                                        title: 'SN',
                                        formatter: snFormatter
                                    }, {
                                        field: 'Timestamp',
                                        title: 'Timestamp',
                                        formatter: timestampFormatter
                                    }, {
                                        field: 'Event',
                                        title: 'Event'
                                    }, {
                                        field: 'Remarks',
                                        title: 'Remarks'
                                    }, {
                                        field: 'Speed',
                                        title: 'Speed',
                                        formatter: speedFormatter
                                    }, {
                                        field: 'Asset',
                                        title: 'Vehicle',
                                        formatter: vehicleFormatter
                                    }, ],

                                    onLoadSuccess: function (data) {

                                        if (data == "") {
                                   
                                            alert(titleNoData);
                                        }

                                    },

                                    onClickRow: function (row) {
                                        //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                    }

                                });

                        });

                    }

                    else if (strEvent == 20) {
                        WebApiEvent = "http://117.120.7.119/spwebapi/api/eventinfo/?Asset=" + getAsset + "&StatusID=" + getStatusID + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;

                        //Driver Break Table
                        $(document).ready(function () {

                            $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                                {
                                    idField: 'EventID',
                                    url: WebApiEvent,
                                    columns: [{
                                        field: 'EventID',
                                        title: 'id',
                                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                    }, {
                                        field: 'SN',
                                        title: 'SN',
                                        formatter: snFormatter
                                    }, {
                                        field: 'Asset',
                                        title: 'Vehicle',
                                        formatter: vehicleFormatter
                                    }, {
                                        field: 'Timestamp',
                                        title: 'Start',
                                        formatter: timestampFormatter
                                    }, {
                                        field: 'RxTime',
                                        title: 'End',
                                        formatter: timestampFormatter
                                    }, {
                                        field: 'Duration',
                                        title: 'Duration',
                                        formatter: numberHoursFormatter
                                    }, {
                                        field: 'Event',
                                        title: 'Event'
                                    }, {
                                        field: 'Remarks',
                                        title: 'Remarks'
                                    } ],

                                    onLoadSuccess: function (row) {

                                        var rows = document.getElementById('reports-events').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                        if (rows <= 1) {
                                     
                                            alert(titleNoData);
                                        }

                                    },

                                    onClickRow: function (row) {
                                        //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                    }

                                });

                        });

                    }

                    else if (strEvent == 21) {
                        WebApiEvent = "http://117.120.7.119/spwebapi/api/eventinfo/?Asset=" + getAsset + "&StatusID=" + getStatusID + "&Timestamp=" + timestamp + "&RxTime=" + rxtime;

                        //Onboard & Offload Table
                        $(document).ready(function () {

                            $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                                {
                                    idField: 'EventID',
                                    url: WebApiEvent,
                                    columns: [{
                                        field: 'EventID',
                                        title: 'id',
                                        class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                    }, {
                                        field: 'SN',
                                        title: 'SN',
                                        formatter: snFormatter
                                    }, {
                                        field: 'Asset',
                                        title: 'Vehicle',
                                        formatter: vehicleFormatter
                                    }, {
                                        field: 'Timestamp',
                                        title: 'Start',
                                        formatter: timestampFormatter
                                    }, {
                                        field: 'RxTime',
                                        title: 'End',
                                        formatter: timestampFormatter
                                    }, {
                                        field: 'Duration',
                                        title: 'Duration',
                                        formatter: numberHoursFormatter
                                    }, {
                                        field: 'Event',
                                        title: 'Event'
                                    }, {
                                        field: 'Remarks',
                                        title: 'Remarks'
                                    }],

                                    onLoadSuccess: function (row) {

                                        var rows = document.getElementById('reports-events').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                        if (rows <= 1) {

                                            alert(titleNoData);
                                        }
                                    },

                                    onClickRow: function (row) {
                                        //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                    }

                                });

                        });

                    }

                }

                else if (getLocalstorageValueRetrieveReport == "reports-messages") {

                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalMessages").innerHTML = duration;
                    //Messages Table
                    $(document).ready(function () {


                        $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'MessageID',
                                url: WebApiMessages,
                                columns: [{
                                    field: 'MessageID',
                                    title: 'id',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'Timestamp',
                                    title: 'Timestamp',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'Flag',
                                    title: 'Status',
                                    formatter: flagFormatter
                                }, {
                                    field: 'Sender',
                                    title: 'From'
                                }, {
                                    field: 'Recipients',
                                    title: 'To'
                                }, {
                                    field: 'Asset',
                                    title: 'Vehicle',
                                    formatter: vehicleFormatter
                                }, {
                                    field: 'Message',
                                    title: 'Message'
                                }, ],

                                onLoadSuccess: function (row) {

                                    //console.log('Messages: onLoadSuccess, data: ' + JSON.stringify(row));

                                    var rows = document.getElementById('reports-messages').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                    if (rows <= 1) {
                                     
                                        alert(titleNoData);
                                    }

                                },

                            });

                    });
                }

                else if (getLocalstorageValueRetrieveReport == "reports-jobs") {
                    console.log("JobAPI:" + jobApi);

                    if (getSessionstorageValueCompanyID == 4) {
                        var finalRemarks = 'Remarks2';
                    }
                    else {
                        var finalRemarks = 'Remarks';
                    }

                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalJobs").innerHTML = duration;

                    //Jobs Table
                    $(document).ready(function () {


                        $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'id',
                                url: jobApi,
                                columns: [{
                                    field: 'JobID',
                                    title: 'Job id',
                                    sortable: 'true',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'JobNumber',
                                    title: titleJobNumber,
                                    sortable: 'true'
                                }, {
                                    field: 'FlagValue',
                                    title: titleJobStatus,
                                    sortable: 'true'
                                }, {
                                    field: 'Timestamp',
                                    title: titleScheduleTime,
                                    sortable: 'true',
                                    formatter: 'timestampFormatter'
                                },  {
                                    field: 'Company',
                                    title: 'Company',
                                    sortable: 'true'
                                }, {
                                    field: 'Destination',
                                    title: 'Address',
                                    sortable: 'true'
                                }, {
                                    field: 'Postal',
                                    title: 'Postal',
                                    sortable: 'true'
                                }, {
                                    field: 'Unit',
                                    title: 'Unit',
                                    sortable: 'true'
                                }, {
                                    field: 'PIC',
                                    title: titlePersonInCharge,
                                    sortable: 'true'
                                }, {
                                    field: 'Phone',
                                    title: titlePhone,
                                    sortable: 'true'
                                }, {
                                    field: 'CusEmail',
                                    title: 'Email',
                                    sortable: 'true'
                                }, {
                                    field: 'Findings',
                                    title: 'Findings',
                                    formatter: 'pestTreatmentFormatter'
                                }, {
                                    field: 'Amount',
                                    title: titleAmount,
                                    class: 'amount',
                                    sortable: 'true',
                                    formatter: 'amountFormatter'
                                },  {
                                    field: 'ReceivedAmount',
                                    title: 'ReceivedAmount',
                                    class: 'amount',
                                    sortable: 'true',
                                    formatter: 'amountFormatter'
                                }, {
                                    field: 'PaymentType',
                                    title: 'Payment Type',
                                    formatter: 'paymentFormatter',
                                    sortable: 'true'
                                }, {
                                    field: 'Remarks',
                                    title: titleRemarks,
                                    sortable: 'true'
                                }, {
                                    field: 'Recommendations',
                                    title: 'Recommendations',
                                    sortable: 'true'
                                }, {
                                    field: 'DriverName',
                                    title: titlePhoneUser,
                                    formatter: 'jobdriverFormatter',
                                    sortable: 'true'
                                }, {
                                    field: 'Image',
                                    title: titleSignature,
                                    formatter: 'signFormatter'
                                }],

                                onLoadSuccess: function (data, row) {


                                    if (data == "") {
                                     
                                        alert(titleNoJobFound);                                       
                                    } 
                                    else
                                    {
                                        //Set
                                        drawJobChart(data);
                                    }
                             
                                }

                            });

                    });
                }

                else if (getLocalstorageValueRetrieveReport == "reports-jobstatus") {
                    console.log("JobAPI:" + jobApi);
                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalJobStatus").innerHTML = duration;

                    //Job Status Table
                    $(document).ready(function () {


                        $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'id',
                                url: jobApi,
                                columns: [{
                                    field: 'JobID',
                                    title: 'Job id',
                                    sortable: 'true',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'JobNumber',
                                    title: titleJobNumber,
                                    sortable: 'true'
                                }, {
                                    field: 'Asset',
                                    title: titlePhone,
                                    sortable: 'true'
                                }, {
                                    field: 'PIC',
                                    title: titlePersonInCharge,
                                    sortable: 'true'
                                }, {
                                    field: 'Timestamp',
                                    title: titleScheduleTime,
                                    sortable: 'true',
                                    formatter: 'timestampFormatter'
                                }, {
                                    field: 'Destination',
                                    title: titleAddressTo,
                                    sortable: 'true'
                                }, {
                                    field: 'Phone',
                                    title: titleContactNumber,
                                    sortable: 'true'
                                }, {
                                    field: 'JobStatus',
                                    title: titleJobStatus,
                                    sortable: 'true'
                                }],

                                onLoadSuccess: function (data, row) {

                                    //Check if no data
                                    var rows = document.getElementById('reports-jobstatus').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                    if (rows <= 0) {
                                        alert(titleNoJobFound);
                                    }

                                    //Set
                                    drawJobStatusChart(data);

                                },

                            });

                    });
                }

                else if (getLocalstorageValueRetrieveReport == "reports-callcenter") {
                    console.log("JobAPI:" + jobApi);
                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalCallCenter").innerHTML = duration;

                    //Call Center Table
                    $(document).ready(function () {


                        $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'id',
                                url: jobApi,
                                columns: [{
                                    field: 'JobID',
                                    title: 'Job id',
                                    sortable: 'true',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'JobNumber',
                                    title: titleJobNumber,
                                    sortable: 'true'
                                }, {
                                    field: 'Asset',
                                    title: titlePhone,
                                    sortable: 'true'
                                }, {
                                    field: 'PIC',
                                    title: titlePersonInCharge,
                                    sortable: 'true'
                                }, {
                                    field: 'Timestamp',
                                    title: titleScheduleTime,
                                    sortable: 'true',
                                    formatter: 'timestampFormatter'
                                }, {
                                    field: 'Destination',
                                    title: titleAddressTo,
                                    sortable: 'true'
                                }, {
                                    field: 'Phone',
                                    title: titleContactNumber,
                                    sortable: 'true'
                                }, {
                                    field: 'Agent',
                                    title: titleCallCenter,
                                    sortable: 'true'
                                }],

                                onLoadSuccess: function (data, row) {

                                    //Check if no data
                                    var rows = document.getElementById('reports-callcenter').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                    if (rows <= 0) {
                                    
                                        alert(titleNoJobFound);
                                    }

                                    //Set
                                    drawCallCenterChart(data);

                                },

                            });

                    });
                }

                else if (getLocalstorageValueRetrieveReport == "reports-trip") {
                    console.log("JobAPI:" + jobApi);
                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalTrip").innerHTML = duration;

                    //Trip Table
                    $(document).ready(function () {


                        $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'id',
                                url: jobApi,
                                columns: [{
                                    field: 'JobID',
                                    title: 'Job id',
                                    sortable: 'true',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'JobNumber',
                                    title: titleJobNumber,
                                    sortable: 'true'
                                }, {
                                    field: 'Asset',
                                    title: titlePhone,
                                    sortable: 'true'
                                }, {
                                    field: 'Caller',
                                    title: 'Caller Name',
                                    sortable: 'true'
                                }, {
                                    field: 'Timestamp',
                                    title: 'Date & Time',
                                    sortable: 'true',
                                    formatter: 'timestampFormatter'
                                }, {
                                    field: 'Destination',
                                    title: 'Destination',
                                    sortable: 'true'
                                }, {
                                    field: 'Phone',
                                    title: titlePhone,
                                    sortable: 'true'
                                }, {
                                    field: 'Receipt',
                                    title: 'Receipt No.',
                                    sortable: 'true'
                                }, {
                                    field: 'Trip',
                                    title: 'Trip',
                                    sortable: 'true',
                                    formatter: 'tripFormatter'
                                }],

                                onLoadSuccess: function (data, row) {

                                    //Check if no data
                                    var rows = document.getElementById('reports-trip').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                    if (rows <= 0) {
                                       
                                        alert(titleNoJobFound);
                                    }

                                    //Set
                                    sessionStorage.setItem("setSessionstorageValueData", JSON.stringify(data));
                                    drawTripChart(data);

                                },

                            });

                    });
                }

                else if (getLocalstorageValueRetrieveReport == "reports-payment") {
                    console.log("JobAPI:" + jobApi);
                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalPayment").innerHTML = duration;

                    //Payment Table
                    $(document).ready(function () {


                        $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'id',
                                url: jobApi,
                                columns: [{
                                    field: 'JobID',
                                    title: 'Job id',
                                    sortable: 'true',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'JobNumber',
                                    title: 'Job Number',
                                    sortable: 'true'
                                }, {
                                    field: 'Asset',
                                    title: 'Phone',
                                    sortable: 'true'
                                }, {
                                    field: 'Caller',
                                    title: 'Caller Name',
                                    sortable: 'true'
                                }, {
                                    field: 'Timestamp',
                                    title: 'Date & Time',
                                    sortable: 'true',
                                    formatter: 'timestampFormatter'
                                }, {
                                    field: 'Destination',
                                    title: 'Destination',
                                    sortable: 'true'
                                }, {
                                    field: 'Phone',
                                    title: 'Phone',
                                    sortable: 'true'
                                }, {
                                    field: 'Receipt',
                                    title: 'Receipt No.',
                                    sortable: 'true'
                                }, {
                                    field: 'Amount',
                                    title: 'Amount',
                                    class: 'amount',
                                    sortable: 'true',
                                    formatter: 'amountFormatter'
                                }, {
                                    field: 'NewAmount',
                                    title: 'New Amount',
                                    class: 'amount',
                                    sortable: 'true',
                                    formatter: 'amountFormatter'
                                }, {
                                    field: 'Payment',
                                    title: 'Payment',
                                    sortable: 'true',
                                    formatter: 'paymentFormatter'
                                }],

                                onLoadSuccess: function (data, row) {

                                    //Check if no data
                                    var rows = document.getElementById('reports-payment').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                    if (rows <= 0) {
                                    
                                        alert(titleNoJobFound);
                                    }


                                    //Set
                                    drawPaymentChart(data);

                                },

                            });

                    });
                }

                else if (getLocalstorageValueRetrieveReport == "reports-paramedic") {
                    console.log("JobAPI:" + jobApi);
                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalParamedic").innerHTML = duration;

                    //Paramedic Table
                    $(document).ready(function () {


                        $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'id',
                                url: jobApi,
                                columns: [{
                                    field: 'JobID',
                                    title: 'Job id',
                                    sortable: 'true',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'JobNumber',
                                    title: 'Job Number',
                                    sortable: 'true'
                                }, {
                                    field: 'Asset',
                                    title: 'Phone',
                                    sortable: 'true'
                                }, {
                                    field: 'Caller',
                                    title: 'Caller Name',
                                    sortable: 'true'
                                }, {
                                    field: 'Timestamp',
                                    title: 'Date & Time',
                                    sortable: 'true',
                                    formatter: 'timestampFormatter'
                                }, {
                                    field: 'Destination',
                                    title: 'Destination',
                                    sortable: 'true'
                                }, {
                                    field: 'Phone',
                                    title: 'Phone',
                                    sortable: 'true'
                                }, {
                                    field: 'Receipt',
                                    title: 'Receipt No.',
                                    sortable: 'true'
                                }, {
                                    field: 'JobDriver',
                                    title: 'Driver',
                                    sortable: 'true'
                                },{
                                    field: 'Paramedic',
                                    title: 'Paramedic',
                                    sortable: 'true'
                                }],

                                onLoadSuccess: function (data, row) {

                                    //Check if no data
                                    var rows = document.getElementById('reports-paramedic').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                    if (rows <= 0) {
                                   
                                        alert(titleNoJobFound);
                                    }

                                    //Set
                                    sessionStorage.setItem("setSessionstorageValueData", JSON.stringify(data));
                                    drawParamedicChart(data);

                                },

                            });

                    });
                }

                else if (getLocalstorageValueRetrieveReport == "reports-driver") {
                    console.log("JobAPI:" + jobApi);
                    $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
                    document.getElementById("timeIntervalDriver").innerHTML = duration;

                    //Driver Table
                    $(document).ready(function () {


                        $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'id',
                                url: jobApi,
                                columns: [{
                                    field: 'JobID',
                                    title: 'Job id',
                                    sortable: 'true',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'JobNumber',
                                    title: titleJobNumber,
                                    sortable: 'true'
                                }, {
                                    field: 'Asset',
                                    title: titlePhone,
                                    sortable: 'true'
                                }, {
                                    field: 'Timestamp',
                                    title: titleScheduleTime,
                                    sortable: 'true',
                                    formatter: 'timestampFormatter'
                                }, {
                                    field: 'Destination',
                                    title: titleAddressTo,
                                    sortable: 'true'
                                }, {
                                    field: 'JobUser',
                                    title: titlePhoneUser,
                                    sortable: 'true'
                                }, {
                                    field: 'DriverInfo.Email',
                                    title: titleEmail,
                                    sortable: 'true'
                                }, {
                                    field: 'DriverInfo.Phone',
                                    title: titleContactNumber,
                                    sortable: 'true'
                                }, {
                                    field: 'DriverInfo.Address',
                                    title: titlePhoneUserAddress,
                                    sortable: 'true'
                                }, {
                                    field: 'DriverInfo.Image',
                                    title: titlePhoneUserProfile,
                                    sortable: 'true',
                                    formatter: 'nameFormatter',
                                }, ],

                                onLoadSuccess: function (data, row) {

                                    //Check if no data
                                    var rows = document.getElementById('reports-driver').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                    if (rows <= 0) {
                                      
                                        alert(titleNoJobFound);
                                    }

                                    //Set
                                    drawDriverChart(data);

                                },

                            });

                    });
                }

		        else if (getLocalstorageValueRetrieveReport == "reports-type") {
		            console.log("JobAPI:" + jobApi);
		            $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
		            document.getElementById("timeIntervalType").innerHTML = duration;

		            //Type Table
		            $(document).ready(function () {


		                $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'id',
                                url: jobApi,
                                columns: [{
                                    field: 'JobID',
                                    title: 'Job id',
                                    sortable: 'true',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'JobNumber',
                                    title: titleJobNumber,
                                    sortable: 'true'
                                }, {
                                    field: 'Asset',
                                    title: titlePhone,
                                    sortable: 'true'
                                }, {
                                    field: 'Timestamp',
                                    title: titleScheduleTime,
                                    sortable: 'true',
                                    formatter: 'timestampFormatter'
                                }, {
                                    field: 'Destination',
                                    title: titleAddressTo,
                                    sortable: 'true'
                                },  {
                                    field: 'JobUser',
                                    title: titlePhoneUser,
                                    sortable: 'true'
                                }, {
                                    field: 'JobType',
                                    title: titleJobType,
                                    sortable: 'true'
                                }],

                                onLoadSuccess: function (data, row) {

                                    //Check if no data
                                    var rows = document.getElementById('reports-type').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                    if (rows <= 0) {

                                        alert(titleNoJobFound);
                                    }

                                    //Set
                                    sessionStorage.setItem("setSessionstorageValueData", JSON.stringify(data));
                                    drawDriverChart();

                                },

                            });

		            });
		        }

		        else if (getLocalstorageValueRetrieveReport == "reports-cvr") {
		            console.log("WebAPICVR:" + WebApiCVR);
		            $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
		            document.getElementById("timeIntervalCVR").innerHTML = duration;


		            //CVR Table
		            $(document).ready(function () {

		                $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'PosID',
                                url: WebApiCVR,
                                columns: [{
                                    field: 'PosID',
                                    title: 'id',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'Asset',
                                    title: titlePhone,
                                    formatter: vehicleFormatter
                                }, {
                                    field: 'Tag',
                                    title: 'Device',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'Driver',
                                    title: titlePhoneUser
                                }, {
                                    field: 'Location',
                                    title: titleLocation
                                }, {
                                    field: 'Timestamp',
                                    title: titleStart,
                                    sortable: 'true',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'RxTime',
                                    title: titleEnd,
                                    sortable: 'true',
                                    formatter: rxtimeFormatter
                                }, {
                                    field: 'Speed',
                                    title: titleSpeed,
                                    formatter: speedFormatter
                                }, {
                                    field: 'Mileage',
                                    title: 'Mileage',
                                    formatter: mileageFormatter,
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'Engine',
                                    title: titleDeviceStatus,
                                    sortable: 'true',
                                    formatter: engineFormatter
                                }, {
                                    field: 'Ignition',
                                    title: titlePhonePower,
                                    sortable: 'true',
                                    formatter: ignitionFormatter
                                }],

                                onLoadSuccess: function (data) {

                                    //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));

                                    if (data == "") {
                                        $('#chartCVRStatus').hide();
                                        $('#chartCVRIgnition').hide();
                                        alert(titleNoPositionDate);

                                    }
                                    else {
                                        $('#chartPositionStatus').show();
                                        $('#chartPositionIgnition').show();
                                        //Set
                                        //sessionStorage.setItem("setSessionstorageValueData", JSON.stringify(data));
                                        drawCVRChartStatus(data);
                                        drawCVRChartIgnition(data);
                                    }

                                },

                                onClickRow: function (row) {
                                    //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                    //Store
                                    localStorage.setItem("row", JSON.stringify(row));

                                    var width = 640;
                                    var height = 360;


                                    $('#myModal').modal("show");

                                    $("#myModal iframe").attr({
                                        'src': 'report_map.html',
                                        'height': height,
                                        'width': width,
                                    });

                                }

                            });


		            });


		        }

		        else if (getLocalstorageValueRetrieveReport == "reports-barlight") {
		            console.log("WebApiBarlight:" + WebApiBarlight);
		            $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
		            document.getElementById("timeIntervalBarlight").innerHTML = duration;

		            //Barlight Table
		            $(document).ready(function () {

		                $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'PosID',
                                url: WebApiBarlight,
                                columns: [{
                                    field: 'PosID',
                                    title: 'id',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter
                                }, {
                                    field: 'Asset',
                                    title: 'Phone',
                                    formatter: vehicleFormatter
                                }, {
                                    field: 'Tag',
                                    title: 'Device',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'Driver',
                                    title: 'Phone User'
                                }, {
                                    field: 'Location',
                                    title: 'Location'
                                }, {
                                    field: 'Timestamp',
                                    title: 'Timestamp',
                                    sortable: 'true',
                                    formatter: timestampFormatter
                                }, {
                                    field: 'Speed',
                                    title: 'Speed',
                                    formatter: speedFormatter
                                }, {
                                    field: 'Mileage',
                                    title: 'Mileage',
                                    formatter: mileageFormatter,
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
                                }, {
                                    field: 'Engine',
                                    title: 'Device Status',
                                    sortable: 'true',
                                    formatter: engineFormatter
                                }, {
                                    field: 'Ignition',
                                    title: 'Ignition',
                                    sortable: 'true',
                                    formatter: ignitionFormatter
                                }, {
                                    field: 'BarLight',
                                    title: 'Bar Light',
                                    sortable: 'true',
                                    formatter: barlightFormatter
                                }],

                                onLoadSuccess: function (data) {

                                    //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));
                                    var rows = document.getElementById('reports-barlight').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                    if (rows <= 1) {

                                        alert(titleNoData);
                                    }


                                    //Set
                                    sessionStorage.setItem("setSessionstorageValueData", JSON.stringify(data));


                                },

                                onClickRow: function (row) {
                                    //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                                    //Store
                                    localStorage.setItem("row", JSON.stringify(row));
                                    //alert(row.PosID);

                                    var panel1 = $.jsPanel({
                                        iframe: {
                                            src: "report_map.html",
                                            id: "myFrame",
                                            style: { "display": "none", "border": "10px solid transparent" },
                                            width: '100%',
                                            height: '100%'
                                        },

                                        callback: function () {

                                            document.getElementById("myFrame").onload = function () {

                                                $("#myFrame").fadeIn(1000);
                                                localStorage.setItem("PosID", row.PosID);
                                                localStorage.setItem("jsPanel", "true");

                                            }
                                        },
                                        size: { width: 425, height: 425 },
                                        position: { left: "center", top: 30 },
                                        title: row.Asset, //Position Report
                                        theme: "black"
                                    });


                                    //panel1.close(function () {
                                    //    alert("#" + this.attr('id') + " closed !");
                                    //});



                                }

                            });


		            });


		        }

                else if (getLocalstorageValueRetrieveReport == "reports-inventory") {
		            console.log("Inventory API:" + inventoryAPI);
		            $('#' + getLocalstorageValueRetrieveReport).bootstrapTable('destroy');
		            document.getElementById("timeIntervalType").innerHTML = duration;

		            //Type Table
		            $(document).ready(function () {

		                $('#' + getLocalstorageValueRetrieveReport).bootstrapTable(
                            {
                                idField: 'id',
                                url: inventoryAPI,
                                columns: [{
                                    field: 'InventoryHistoryID',
                                    title: 'InventoryHistoryID',
                                    sortable: 'true',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg',
                                    align: 'center'
                                }, {
                                    field: 'InventoryID',
                                    title: 'InventoryID',
                                    sortable: 'true',
                                    class: 'hidden-xs hidden-sm hidden-md hidden-lg',
                                    align: 'center'
                                }, {
                                    field: 'SN',
                                    title: 'SN',
                                    formatter: snFormatter,
                                    align: 'center'
                                }, {
                                    field: 'Name',
                                    title: 'Name',
                                    sortable: 'true',
                                    align: 'center'
                                }, {
                                    field: 'Reference',
                                    title: 'Reference',
                                    sortable: 'true',
                                    align: 'center'
                                }, {
                                    field: 'Timestamp',
                                    title: 'Time',
                                    sortable: 'true',
                                    formatter: 'timestampFormatter',
                                    align: 'center'
                                }, {
                                    field: 'PreviousQuantity',
                                    title: 'Previous Quantity',
                                    sortable: 'true',
                                    align: 'center'
                                },  {
                                    field: 'Quantity',
                                    title: 'Quantity',
                                    sortable: 'true',
                                    align: 'center'
                                },  {
                                    field: 'TotalQuantity',
                                    title: 'Total Quantity',
                                    sortable: 'true',
                                    align: 'center'
                                },  {
                                    field: 'StockType',
                                    title: 'Stock Type',
                                    sortable: 'true',
                                    formatter: stocktypeFormatter,
                                    align: 'center'
                                }, {
                                    field: 'Platform',
                                    title: 'Platform',
                                    sortable: 'true',
                                    formatter: platformFormatter,
                                    align: 'center'
                                }, {
                                    field: 'UserName',
                                    title: 'Agent',
                                    sortable: 'true',
                                    align: 'center'
                                }, {
                                    field: 'DriverName',
                                    title: 'Driver',
                                    sortable: 'true',
                                    align: 'center'
                                }, {
                                    field: 'Asset',
                                    title: 'Phone',
                                    sortable: 'true',
                                    align: 'center'
                                }, {
                                    field: 'Image',
                                    title: 'Supervisor Signature',
                                    formatter: 'signFormatter'
                                } ],

                                onLoadSuccess: function (data, row) {

                                    //Check if no data
                                    var rows = document.getElementById('reports-inventory').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                                    if (rows <= 0) {

                                        alert(titleNoJobFound);
                                    }

                                    //Set
                                    sessionStorage.setItem("setSessionstorageValueData", JSON.stringify(data));
                                    //drawDriverChart();

                                },

                            });

		            });
		        }
                //===============================

            }

            else {

                alert(titleDateInvalid);

            }
        //} else {

        //    alert('Date Invalid');

        //}


    }



});


//OnChange Filter
$(document).ready(function () {

    $('#load-report').change(function () {
        var selected = $(this).find("option:selected").val();
        if (selected == "Positions") {
            $("#playback").show();
            $("#viewLocation").show();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
	        $("#historyDriver").hide();
	        $("#historyType").hide();
	        $("#historyReference").hide();
	        $("#speedLimit").val('');
        }
        else if (selected == "Speed") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
	        $("#historyDriver").hide();
	        $("#historyReference").hide();
            $("#historyType").hide();
        }
        else if (selected == "Events") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
            $("#historyDriver").hide();
            $("#historyType").hide();
	        $("#historyReference").hide();
            $("#speedLimit").val('');
        }
        else if (selected == "Mileage") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
            $("#historyDriver").hide();
            $("#historyType").hide();
	        $("#historyReference").hide();
            $("#speedLimit").val('');
        }
        else if (selected == "Utilization (Type 1)") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
	        $("#historyDriver").hide();
	        $("#historyType").hide();
	        $("#historyReference").hide();
	        $("#speedLimit").val('');
        }
        else if (selected == "Messages") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
	        $("#historyDriver").hide();
	        $("#historyType").hide();
	        $("#historyReference").hide();
	        $("#speedLimit").val('');

        }
        else if (selected == "Jobs") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            //$("#historyPayment").show();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            //$("#historyTrip").show();
	        $("#historyDriver").show();
	        $("#historyType").hide();
	        $("#historyReference").hide();
	        $("#speedLimit").val('');
        }
        else if (selected == "Job Status") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").show();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
	        $("#historyDriver").hide();
	        $("#historyReference").hide();
	        $("#historyType").hide();
	        $("#speedLimit").val('');
        }
        else if (selected == "Call Center") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").show();
            $("#historyTrip").hide();
	        $("#historyDriver").hide();
	        $("#historyType").hide();
	        $("#historyReference").hide();
	        $("#speedLimit").val('');
        }
        else if (selected == "Trip") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").show();
	        $("#historyDriver").hide();
	        $("#historyType").hide();
	        $("#historyReference").hide();
	        $("#speedLimit").val('');
        }
        else if (selected == "Payment") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").show();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
	        $("#historyDriver").hide();
	        $("#historyType").hide();
	        $("#historyReference").hide();
	        $("#speedLimit").val('');
        }
        else if (selected == "Paramedic") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
	        $("#historyDriver").show();
	        $("#historyReference").hide();
	        $("#historyType").hide();
	        $("#speedLimit").val('');
        }
        else if (selected == "Phone User") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
	        $("#historyDriver").show();
	        $("#historyType").hide();
	        $("#historyReference").hide();
	        $("#speedLimit").val('');
        }
        else if (selected == "Type") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
            $("#historyDriver").show();
            $("#historyType").show();
	        $("#historyReference").hide();
            $("#speedLimit").val('');
        }
        else if (selected == "Comprehensive Report") {
            $("#playback").show();
            $("#viewLocation").show();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
            $("#historyDriver").hide();
            $("#historyType").hide();
	        $("#historyReference").hide();
            $("#speedForm").show();
        }
        else if (selected == "Barlight") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").show();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
            $("#historyDriver").hide();
            $("#historyType").hide();
	        $("#historyReference").hide();
            $("#speedLimit").val('');
        }else if (selected == "Inventory") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").hide();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
            $("#historyDriver").hide();
            $("#historyType").hide();
	        $("#historyReference").show();
            $("#speedLimit").val('');
        }
        else if (selected == "") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $(".vehicle").hide();
            $("#historyPayment").hide();
            $("#historyStatus").hide();
            $("#historyCallCenter").hide();
            $("#historyTrip").hide();
	        $("#historyDriver").hide();
	        $("#historyReference").hide();
	        $("#historyType").hide();
	        $("#speedLimit").val('');
        }

    });

    $('#load-messages').change(function () {
        localStorage.setItem("setLocalstorageValueMessages", $(this).val());

    });

    $('#load-events').change(function () {
        localStorage.setItem("setLocalstorageValueEvents", $(this).val());
        var selected = $(this).find("option:selected").html();

        if (selected == "User Logout") {
            $("#historyAssets").hide();
        }
        else if (selected == "User Login") {
            $("#historyAssets").hide();
        }
        else if (selected == "Zone Enter") {
            $("#historyAssets").show();
        }
        else if (selected == "Zone Exit") {
            $("#historyAssets").show();
        }
        else if (selected == "Speeding Report") {
            $("#historyAssets").show();
        }
        else if (selected == "Driver Break") {
            $("#historyAssets").show();
        }
        else if (selected == "Onboard & Offload") {
            $("#historyAssets").show();
        }


    });

    $('#load-assets').change(function () {
        localStorage.setItem("setLocalstorageValueAsset", $(this).val());

    });

    $('#load-reseller').change(function () {
        localStorage.setItem("setLocalstorageValueReseller", $(this).val());

    });

    $('#load-company').change(function () {

        localStorage.setItem("setLocalstorageValueCompany", $(this).val());

    });


    $('#speedLimit').change(function () {
        localStorage.setItem("setLocalstorageValueSpeedLimit", $(this).val());

    });


    $('#dateFrom').on('change', function () {
        localStorage.setItem("setLocalstorageValueDateFrom", $(this).val());
    });

    $('#dateTo').on('change', function () {
        localStorage.setItem("setLocalstorageValueDateTo", $(this).val());
    });


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

  //  document.getElementById("software").innerHTML = version;
    document.getElementById("softwareEN").innerHTML = version;


});


//Storage
$(document).ready(function () {


    try {

        var getAsset = $("#load-assets").val();
        var getCompany = $("#load-company").val();
        var getReseller = $("#load-reseller").val();
        var getDateFrom = $("#dateFrom").val();
        var getDateTo = $("#dateTo").val();

        localStorage.setItem("setLocalstorageValueAsset", getAsset);
        localStorage.setItem("setLocalstorageValueCompany", getCompany);
        localStorage.setItem("setLocalstorageValueReseller", getReseller);
        localStorage.setItem("setLocalstorageValueDateFrom", getDateFrom);
        localStorage.setItem("setLocalstorageValueDateTo", getDateTo);

        var getSpeed = $("#speedLimit").val();

        localStorage.setItem("setLocalstorageValueSpeedLimit", getSpeed);
        var getStatusID = $("#load-events").val();
        localStorage.setItem("setLocalstorageValueEvents", getStatusID);

        var getLocalstorageValueAsset = localStorage.getItem('setLocalstorageValueAsset');
        var getLocalstorageValueCompany = localStorage.getItem('setLocalstorageValueCompany');
        var getLocalstorageValueReseller = localStorage.getItem('setLocalstorageValueReseller');

    }
    catch (e) {

        alert('Error: ' + e);
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


//Load Report in History
$.getJSON("http://117.120.7.119/spwebapi/api/reportinfo", function (data) {
    $.each(data, function (index, item) {

        if (item.Name != "Mileage" && item.Name != "Messages" && item.Name != "Positions" && item.Name != "Barlight" && item.Name != "Paramedic" && item.Name != "Payment" && item.Name != "Trip")
            if (getSessionstorageValueLanguage == "en")
            {
                $('#load-report').append($('<option></option>').val(item.Name).html(item.Name));
            }
            else if (getSessionstorageValueLanguage == "th")
            {
                switch (item.Name) {
                    case "Call Center":
                        text = "ศูนย์รับแจ้ง";
                        break;
                    case "Comprehensive Report":
                        text = "รายงานฉบับสมบูรณ์";
                        break;
                    case "Events":
                        text = "เหตุการณ์";
                        break;
                    case "Job Status":
                        text = "สถานะงาน";
                        break;
                    case "Jobs":
                        text = "งาน";
                        break;
                    case "Phone User":
                        text = "ผู้ใช้โทรศัพท์";
                        break;
                    case "Speed":
                        text = "ผู้ใช้โทรศัพท์";
                        break;
                    case "Type":
                        text = "ประเภท";
                        break;
                }

                $('#load-report').append($('<option></option>').val(item.Name).html(text));
            }
            else if (getSessionstorageValueLanguage == "vn")
            {
                switch (item.Name) {
                    case "Call Center":
                        text = "Trung Tâm Cuộc Gọi";
                        break;
                    case "Comprehensive Report":
                        text = "Báo Cáo Toàn Diện";
                        break;
                    case "Events":
                        text = "Sự Kiện";
                        break;
                    case "Job Status":
                        text = "Trạng Thái Công Việc";
                        break;
                    case "Jobs":
                        text = "Công Việc";
                        break;
                    case "Phone User":
                        text = "Điện Thoại Người Dùng";
                        break;
                    case "Speed":
                        text = "Tốc Dộ";
                        break;
                    case "Type":
                        text = "Kiểu";
                        break;
                }
                $('#load-report').append($('<option></option>').val(item.Name).html(text));
            }
            else if (getSessionstorageValueLanguage == "id")
            {
                switch (item.Name) {
                    case "Call Center":
                        text = "Call Center";
                        break;
                    case "Comprehensive Report":
                        text = "Laporan Komprehensif";
                        break;
                    case "Events":
                        text = "Peristiwa";
                        break;
                    case "Job Status":
                        text = "Status Kerja";
                        break;
                    case "Jobs":
                        text = "Kerja";
                        break;
                    case "Phone User":
                        text = "Telepon Pengguna";
                        break;
                    case "Speed":
                        text = "Kecepatan";
                        break;
                    case "Type":
                        text = "Jenis";
                        break;
                }
                $('#load-report').append($('<option></option>').val(item.Name).html(text));
            }
       
    });

    $(".selectpicker").selectpicker('refresh');
});

var WebAPIAgent = "";


if (getSessionstorageValueRoleID == 1) {

    WebAPIAgent = 'http://117.120.7.119/spwebapi/api/userinfo?ResellerID=' + '1' + '&CompanyID=' + '1' + '&RoleID=' + getSessionstorageValueRoleID;

} else if (getSessionstorageValueRoleID == 2) {
    WebAPIAgent = 'http://117.120.7.119/spwebapi/api/userinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&RoleID=' + getSessionstorageValueRoleID;

} else if (getSessionstorageValueRoleID == 3) {

    WebAPIAgent = 'http://117.120.7.119/spwebapi/api/userinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&RoleID=' + getSessionstorageValueRoleID;
    //$('#agent').append($('<option value="" selected="selected"></option>').val('').html("ALL"));

    if (getSessionstorageValueLanguage == "en")
    {
        $('#agent').append($('<option value="" selected="selected"></option>').val('').html("ALL"));
    }
    else if (getSessionstorageValueLanguage == "th")
    {
        $('#agent').append($('<option value="" selected="selected"></option>').val('').html("ทั้งหมด"));
    }
    else if (getSessionstorageValueLanguage == "vn") {
        $('#agent').append($('<option value="" selected="selected"></option>').val('').html("Tất Cả"));
    }
    else if (getSessionstorageValueLanguage == "id") {
        $('#agent').append($('<option value="" selected="selected"></option>').val('').html("Semua"));
    }

}
else if (getSessionstorageValueRoleID >= 4) {

    WebAPIAgent = 'http://117.120.7.119/spwebapi/api/userinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&RoleID=' + getSessionstorageValueRoleID;
}


    $.getJSON(WebAPIAgent, function (data) {
        $.each(data, function (index, item) {
            $('#agent').append($('<option></option>').val(item.User).html(item.Name));

        });

        $(".selectpicker").selectpicker('refresh');
    });





var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {

        //$('#load-reseller').append(
        //$('<option></option>').val(0).html("-------")
        //);

        $.each(data, function (index, item) {
            if (item.ResellerID == 1) {
                $('#load-reseller').append(
                     $('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name)
                 );
            } else {
                $('#load-reseller').append(
                 $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)
             );
            }
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#load-reseller').append(
                 $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#formsReseller').remove();
}


//Desktop
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + "1", function (data) {

        $.each(data, function (index, item) {

            $('#load-company').append(
                 $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
             );

        });
        $(".selectpicker").selectpicker('refresh');
    });

}

else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID) {
                $('#load-company').append(
                 $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                );
            }
            else {
                $('#load-company').append(
                 $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                );
            }

        });


        $('.selectpicker').selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


        $.each(data, function (index, item) {


            $('#load-company').append(
                 $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
             );

        });


        $('.selectpicker').selectpicker('refresh');

    });
}



//Mobile
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo", function (data) {

        $.each(data, function (index, item) {

            $('#load-company2').append(
                 $('<option></option>').val(item.CompanyID).html(item.Name)
             );

        });
        $(".selectpicker").selectpicker('refresh');
    });

}

else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID) {
                $('#load-company2').append(
                 $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                );
            }
            else {
                $('#load-company2').append(
                 $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                );
            }

        });


        $('.selectpicker').selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


        $.each(data, function (index, item) {

            $('#load-company2').append(
                 $('<option></option>').val(item.CompanyID).html(item.Name)
             );

        });


        $('.selectpicker').selectpicker('refresh');

    });
}


// Mobile Reseller
var MobileWebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    MobileWebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo';

    $.getJSON(MobileWebAPIReseller, function (data) {
        $.each(data, function (index, item) {

            if (item.ResellerID == "1") {
                $('#mobile-load-reseller').append(
                     $('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name)

                 );
            } else {

                $('#mobile-load-reseller').append(
                    $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)

                );
            }
        });
        var getReseller = $("#mobile-load-reseller").val();
        sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
        $('#mobile-load-reseller').selectpicker('refresh');

    });

} else if (getSessionstorageValueRoleID == 2) {

    MobileWebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(MobileWebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#mobile-load-reseller').append(
                 $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)
             );
        });
        var getReseller = $("#mobile-load-reseller").val();
        sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
        $('#mobile-load-reseller').selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#modalReseller').remove();
}


//Mobile Company
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {


        $.each(data, function (index, item) {

            if (item.CompanyID == 2) {

                $('#mobile-load-company').append(
                 $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                );

            } else {

                $('#mobile-load-company').append(
                     $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                 );

            }

        });


        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {
        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID) {
                $('#mobile-load-company').append(
                 $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                );
            }
            else {
                $('#mobile-load-company').append(
                 $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                );
            }

        });

        $(".selectpicker").selectpicker('refresh');

    });
} else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            $('#mobile-load-company').append(
                 $('<option></option>').val(item.CompanyID).html(item.Name)
             );

        });

        $(".selectpicker").selectpicker('refresh');

    });

}


//Mobile Assets
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + '&ResellerID=' + '1' + '&CompanyID=' + '1', function (data) {

        $.each(data, function (index, item) {

            $('#mobile-load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {

        $.each(data, function (index, item) {

            $('#mobile-load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );

        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#mobile-load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}


//Mobile Report
$.getJSON("http://117.120.7.119/spwebapi/api/reportinfo", function (data) {
    $.each(data, function (index, item) {
        $('#mobile-load-report').append(
             $('<option></option>').val(item.Name).html(item.Name)
         );

    });

    $(".selectpicker").selectpicker('refresh');
});

//Mobile Events
$.getJSON("http://117.120.7.119/spwebapi/api/statusinfo", function (data) {
    $.each(data, function (index, item) {

        if (item.StatusID != 4 && item.StatusID != 20 && item.StatusID != 21) {
            $('#mobile-load-events').append(
                 $('<option></option>').val(item.StatusID).html(item.StatusDesc)
             );
        }
    });

    $(".selectpicker").selectpicker('refresh');
});




var selectedAsset = "";

//Dashboard Asset
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.SelectVechsFilter').on('change', function () {
        selectedAsset = $(this).find("option:selected").val();

        $('#mobile-load-assets').empty();
        $('.MobileSelectVechsFilter').selectpicker('refresh');
        var getReseller = $('#load-reseller').val();
        var getCompany = $('#load-company').val();

        if (getSessionstorageValueRoleID == 1) {

            $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany, function (data) {

                $.each(data, function (index, item) {

                    if (item.Name == selectedAsset) {
                        $('#mobile-load-assets').append($('<option selected="selected"></option>').val(item.Name).html(item.Name));
                    }
                    else {
                        $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    }

                });

                $(".MobileSelectVechsFilter").selectpicker('refresh');
            });

        }
        else if (getSessionstorageValueRoleID == 2) {

            $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID, function (data) {

                $.each(data, function (index, item) {

                    if (item.Name == selectedAsset) {
                        $('#mobile-load-assets').append($('<option selected="selected"></option>').val(item.Name).html(item.Name));
                    }
                    else {
                        $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    }

                });

                $(".MobileSelectVechsFilter").selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {

            $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {
                $.each(data, function (index, item) {

                    if (item.Name == selectedAsset) {
                        $('#mobile-load-assets').append($('<option selected="selected"></option>').val(item.Name).html(item.Name));
                    }
                    else {
                        $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    }

                });

                $(".MobileSelectVechsFilter").selectpicker('refresh');
            });
        }

    });

});

//====================================================//

var selectedMobileReseller = "";

/*** Function to filter reseller and companies*/
$(function () {

    $('.MobileSelectResellerFilter').on('change', function () {
        selectedMobileReseller = $(this).find("option:selected").val();

        $('#load-reseller').empty();
        $('.SelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedMobileReseller) {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name)
                     );
                    }
                    else {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedMobileReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedMobileReseller) {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#load-reseller').remove();
        }


        $('#mobile-load-company').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#load-company').empty();
        $(".SelectCompanyFilter").selectpicker('refresh');

        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedMobileReseller, function (data) {

            $('#mobile-load-company').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));

            $.each(data, function (index, item) {
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $(".MobileSelectCompanyFilter").selectpicker('refresh');
            $(".SelectCompanyFilter").selectpicker('refresh');
        });

        $('#mobile-load-assets').empty();
        $(".MobileSelectVechsFilter").selectpicker('refresh');

        $('#load-assets').empty();
        $(".SelectVechsFilter").selectpicker('refresh');

    });

});

var selectedMobileCompany = "";

//Mobile Company
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.MobileSelectCompanyFilter').on('change', function () {
        selectedMobileCompany = $(this).find("option:selected").val();

        if (selectedMobileCompany != 0) {

            //Select New Company
            $('#load-company').empty();
            $('.SelectCompanyFilter').selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedMobileCompany) {
                            $('#load-company').append(
                             $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                         );
                        }
                        else {
                            $('#load-company').append(
                             $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                         );
                        }
                    });
                    var getCompany = $("#mobile-load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $('#load-company').selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedMobileCompany) {
                            $('#load-company').append(
                             $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                         );
                        }
                        else {
                            $('#load-company').append(
                             $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                         );
                        }

                    });
                    var getCompany = $("#mobile-load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $('#load-company').selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedMobileCompany) {
                            $('#load-company').append(
                             $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                         );
                        }
                        else {
                            $('#load-company').append(
                             $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                         );
                        }

                    });

                    var getCompany = $("#mobile-load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $('#load-company').selectpicker('refresh');

                });
            }

            //Load New Assets
            $('#mobile-load-assets').empty();      
            $('.MobileSelectVechsFilter').selectpicker('refresh');
            $('#load-assets').empty();
            $('.SelectVechsFilter').selectpicker('refresh');
            var getReseller = $('#mobile-load-reseller').val();
            var getCompany = $('#mobile-load-company').val();

            if (getSessionstorageValueRoleID == 1) {

                $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany, function (data) {

                    $.each(data, function (index, item) {

                        $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                        $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    });

                    $('.MobileSelectVechsFilter').selectpicker('refresh');
                    $(".SelectVechsFilter").selectpicker('refresh');
                });

            }
            else if (getSessionstorageValueRoleID == 2) {

                $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {

                    $.each(data, function (index, item) {
                        
                        $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                        $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));

                    });
                    
                    $('.MobileSelectVechsFilter').selectpicker('refresh');
                    $(".SelectVechsFilter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {

                $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {
                    $.each(data, function (index, item) {
                       
                        $('#mobile-load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                        $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));

                    });
                    
                    $('.MobileSelectVechsFilter').selectpicker('refresh');
                    $(".SelectVechsFilter").selectpicker('refresh');
                });
            }
       
        }

    });


});

var selectedMobileAsset = "";

//Mobile Asset
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.MobileSelectVechsFilter').on('change', function () {
        selectedMobileAsset = $(this).find("option:selected").val();

        $('#load-assets').empty();
        $('.SelectVechsFilter').selectpicker('refresh');
        var getReseller = $('#mobile-load-reseller').val();
        var getCompany = $('#mobile-load-company').val();

        if (getSessionstorageValueRoleID == 1) {

            $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany, function (data) {

                $.each(data, function (index, item) {

                    if (item.Name == selectedMobileAsset)
                    {
                        $('#load-assets').append($('<option selected="selected"></option>').val(item.Name).html(item.Name));
                    }
                    else
                    {
                        $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    }
                
                });

                $(".SelectVechsFilter").selectpicker('refresh');
            });

        }
        else if (getSessionstorageValueRoleID == 2) {

            $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID, function (data) {

                $.each(data, function (index, item) {

                    if (item.Name == selectedMobileAsset) {
                        $('#load-assets').append($('<option selected="selected"></option>').val(item.Name).html(item.Name));
                    }
                    else {
                        $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    }

                });

                $(".SelectVechsFilter").selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {

            $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getCompany, function (data) {
                $.each(data, function (index, item) {

                    if (item.Name == selectedMobileAsset) {
                        $('#load-assets').append($('<option selected="selected"></option>').val(item.Name).html(item.Name));
                    }
                    else {
                        $('#load-assets').append($('<option></option>').val(item.Name).html(item.Name));
                    }

                });

                $(".SelectVechsFilter").selectpicker('refresh');
            });
        }
       
    });

});

//====================================================//

$(function () {

    $("#mobile-assets").hide();
    $('#mobile-events').hide();
    $("#mobile-speed").hide();
    $("#mobile-messages").hide();
    $("#mobile-payment").hide();

    $('#mobile-load-report').change(function () {
        var selected = $(this).find("option:selected").val();

        if (selected == "Positions") {
            $("#playback").show();
            $("#viewLocation").show();
            $("#mobile-assets").show();
            $("#mobile-events").hide();
            $("#mobile-speed").hide();
            $("#mobile-messages").hide();
            $("#mobile-payment").hide();
        }
        else if (selected == "Speed") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $("#mobile-assets").show();
            $("#mobile-events").hide();
            $("#mobile-speed").show();
            $("#mobile-messages").hide();
            $("#mobile-payment").hide();
        }
        else if (selected == "Events") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $("#mobile-assets").show();
            $("#mobile-events").show();
            $("#mobile-speed").hide();
            $("#mobile-messages").hide();
            $("#mobile-payment").hide();
        }
        else if (selected == "Utilization (Type 1)") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $("#mobile-assets").show();
            $("#mobile-events").hide();
            $("#mobile-speed").hide();
            $("#mobile-messages").hide();
            $("#mobile-payment").hide();
        }
        else if (selected == "Messages") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $("#mobile-assets").show();
            $("#mobile-events").hide();
            $("#mobile-speed").hide();
            $("#mobile-messages").show();
            $("#mobile-payment").hide();

        } else if (selected == "Jobs") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $("#mobile-assets").show();
            $("#mobile-events").hide();
            $("#mobile-speed").hide();
            $("#mobile-messages").hide();
            $("#mobile-payment").show();

        } else if (selected == "") {
            $("#playback").hide();
            $("#viewLocation").hide();
            $("#mobile-assets").hide();
            $("#mobile-events").hide();
            $("#mobile-speed").hide();
            $("#mobile-messages").hide();
            $("#mobile-payment").hide();
        }

    });

    $('#mobile-load-events').change(function () {
        localStorage.setItem("setLocalstorageValueEvents", $(this).val());
        var selected = $(this).find("option:selected").html();

        if (selected == "User Logout") {
            $("#mobile-assets").hide();
        }
        else if (selected == "User Login") {
            $("#mobile-assets").hide();
        }
        else if (selected == "Zone Enter") {
            $("#mobile-assets").show();
        }
        else if (selected == "Zone Exit") {
            $("#mobile-assets").show();
        }
        else if (selected == "Speeding Report") {
            $("#mobile-assets").show();
        }


    });

});


$('#generatemobile').on('click', function () {

    var reseller = $('#mobile-load-reseller').val();
    var company = $('#mobile-load-company').val();
    var reports = $('#mobile-load-report').val();
    var vehicle = $('#mobile-load-assets').val();
    var speed = $('#mobile-load-speed').val();
    var datefrom = $('#mobile-dateFrom').val();
    var dateto = $('#mobile-dateTo').val();
    var getFlag = $("#mobile-load-messages").val();
    var getStatusID = $("#mobile-load-events").val();
    var getPayment = $("#mobile-load-payment").val();

    localStorage.setItem("setLocalstorageValueAsset", vehicle);
    localStorage.setItem("setLocalstorageValueCompany", company);
    localStorage.setItem("setLocalstorageValueDateFrom", datefrom);
    localStorage.setItem("setLocalstorageValueDateTo", dateto);

    var webapiMobile = "http://117.120.7.119/spwebapi/api/posinfo?Asset=" + vehicle + "&Speed=" + speed + "&Timestamp=" + datefrom + "&RxTime=" + dateto;
    var WebApiEvent = "http://117.120.7.119/spwebapi/api/eventinfo/?Asset=" + vehicle + "&StatusID=" + getStatusID + "&Timestamp=" + datefrom + "&RxTime=" + dateto;
    var WebApiMessages = "http://117.120.7.119/spwebapi/api/messageinfo?Asset=" + vehicle + "&Flag=" + getFlag + "&Timestamp=" + datefrom + "&RxTime=" + dateto;
    var jobApi = 'http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=' + reseller + '&AssetCompanyID=' + company + '&Asset=' + vehicle + '&Timestamp=' + datefrom + '&RxTime=' + dateto + '&Flag=0' + '&Payment=' + getPayment;


    if (reports == "Positions") {

        $("#event-report").hide();
        $("#position-report").show();
        $("#speed-report").hide();
        $("#mileage-report").hide();
        $("#utilization-report").hide();
        $("#messages-report").hide();
        $("#jobs-report").hide();
        $("#jobstatus-report").hide();

        $('#reports-positions').bootstrapTable('destroy');

        $('#reports-positions').bootstrapTable({
            idField: 'id',
            url: webapiMobile,
            columns: [{
                field: 'Asset',
                title: 'Phone',
                formatter: vehicleFormatter
            }, {
                field: 'Tag',
                title: 'Device',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
            }, {
                field: 'Driver',
                title: 'Phone User'
            }, {
                field: 'Location',
                title: 'Location'
            }, {
                field: 'Timestamp',
                title: 'Timestamp',
                sortable: 'true',
                formatter: timestampFormatter
            }, {
                field: 'Speed',
                title: 'Speed'
            }, {
                field: 'Engine',
                title: 'Device Status',
                sortable: 'true',
                formatter: engineFormatter
            }, {
                field: 'Ignition',
                title: 'Ignition',
                sortable: 'true',
                formatter: ignitionFormatter
            }],

            onLoadSuccess: function (row) {

                //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));

                var move = 0;
                var idle = 0;
                var stop = 0;

                for (var i = 0; i < row.length; ++i) {
                    if (row[i].Engine == "MOVE") {
                        move++;
                    } else if (row[i].Engine == "IDLE") {
                        idle++;
                    } else if (row[i].Engine == "STOP") {
                        stop++;
                    }

                }

                var objEngine = {
                    Move: move,
                    Idle: idle,
                    Stop: stop,
                };


                //Set
                sessionStorage.setItem("setSessionstorageValueEngine", JSON.stringify(objEngine));


                drawChart();

                var rows = document.getElementById('reports-positions').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                if (rows <= 0) {
                    alert(titleNoData);
                }

            },

            onClickRow: function (row) {
                //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                //Store
                localStorage.setItem("row", JSON.stringify(row));


                //Then retrieve
                var localObj = JSON.parse(localStorage.getItem(row));


                //if (Modernizr.localstorage) {
                //    $("#Perimeter").text('localStorage is available');
                //} else {
                //    $("#Perimeter").text('localStorage is not available');
                //}

                var panel1 = $.jsPanel({
                    iframe: {
                        src: "report_map.html",
                        id: "myFrame",
                        style: { "display": "none", "border": "10px solid transparent" },
                        width: '100%',
                        height: '100%'
                    },

                    callback: function () {
                        document.getElementById("myFrame").onload = function () {
                            $("#myFrame").fadeIn(1000);
                        }
                    },
                    size: { width: 425, height: 425 },
                    position: { left: "center", top: 30 },
                    title: row.Asset, //Position Report
                    theme: "black"
                });



            }

        });
    }

    else if (reports == "Speed") {

        $("#event-report").hide();
        $("#position-report").hide();
        $("#speed-report").show();
        $("#mileage-report").hide();
        $("#utilization-report").hide();
        $("#messages-report").hide();
        $("#jobs-report").hide();

        $('#reports-speed').bootstrapTable('destroy');

        $('#reports-speed').bootstrapTable({
            idField: 'id',
            url: webapiMobile,
            columns: [{
                field: 'Asset',
                title: 'Phone',
                formatter: vehicleFormatter
            }, {
                field: 'Tag',
                title: 'Device',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
            }, {
                field: 'Driver',
                title: 'Phone User'
            }, {
                field: 'Speed',
                title: 'Speed'
            }, {
                field: 'Timestamp',
                title: 'Timestamp',
                sortable: 'true',
                formatter: timestampFormatter
            }, {
                field: 'Engine',
                title: 'Engine',
                sortable: 'true',
                formatter: engineFormatter
            }, {
                field: 'Ignition',
                title: 'Ignition',
                sortable: 'true',
                formatter: ignitionFormatter
            }],

            onLoadSuccess: function (row) {

                //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));


                var move = 0;
                var idle = 0;
                var stop = 0;

                for (var i = 0; i < row.length; ++i) {
                    if (row[i].Engine == "MOVE") {
                        move++;
                    } else if (row[i].Engine == "IDLE") {
                        idle++;
                    } else if (row[i].Engine == "STOP") {
                        stop++;
                    }

                }

                var objEngine = {
                    Move: move,
                    Idle: idle,
                    Stop: stop,
                };


                //Set
                sessionStorage.setItem("setSessionstorageValueEngine", JSON.stringify(objEngine));


                drawChart();



            },

            onClickRow: function (row) {
                //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                //Store
                localStorage.setItem("row", JSON.stringify(row));


                //Then retrieve
                var localObj = JSON.parse(localStorage.getItem(row));


                //if (Modernizr.localstorage) {
                //    $("#Perimeter").text('localStorage is available');
                //} else {
                //    $("#Perimeter").text('localStorage is not available');
                //}

                var panel1 = $.jsPanel({
                    iframe: {
                        src: "report_map.html",
                        id: "myFrame",
                        style: { "display": "none", "border": "10px solid transparent" },
                        width: '100%',
                        height: '100%'
                    },

                    callback: function () {
                        document.getElementById("myFrame").onload = function () {
                            $("#myFrame").fadeIn(1000);
                        }
                    },
                    size: { width: 425, height: 425 },
                    position: { left: "center", top: 30 },
                    title: row.Asset, //Speed Report
                    theme: "black"
                });

            },

        });
    } 

    else if (reports == "Mileage")
    {

        $("#event-report").hide();
        $("#position-report").hide();
        $("#speed-report").hide();
        $("#mileage-report").show();
        $("#utilization-report").hide();
        $("#messages-report").hide();
        $("#jobs-report").hide();

        $('#reports-mileage').bootstrapTable('destroy');

        $('#reports-mileage').bootstrapTable({
            idField: 'id',
            url: webapiMobile,
            columns: [{
                field: 'Asset',
                formatter: vehicleFormatter
            }, {
                field: 'Tag',
                title: 'Device',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
            }, {
                field: 'Mileage',
                title: 'Mileage'
            }, {
                field: 'Timestamp',
                title: 'Timestamp',
                sortable: 'true',
                formatter: timestampFormatter
            }, {
                field: 'Speed',
                title: 'Speed'
            }, {
                field: 'Engine',
                title: 'Engine',
                sortable: 'true',
                formatter: engineFormatter
            }, {
                field: 'Ignition',
                title: 'Ignition',
                sortable: 'true',
                formatter: ignitionFormatter
            }],

            onLoadSuccess: function (row) {

                //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));


                var move = 0;
                var idle = 0;
                var stop = 0;

                for (var i = 0; i < row.length; ++i) {
                    if (row[i].Engine == "MOVE") {
                        move++;
                    } else if (row[i].Engine == "IDLE") {
                        idle++;
                    } else if (row[i].Engine == "STOP") {
                        stop++;
                    }

                }

                var objEngine = {
                    Move: move,
                    Idle: idle,
                    Stop: stop,
                };


                //Set
                sessionStorage.setItem("setSessionstorageValueEngine", JSON.stringify(objEngine));

                drawChart();


            },

            onClickRow: function (row) {
                //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                //Store
                localStorage.setItem("row", JSON.stringify(row));


                //Then retrieve
                var localObj = JSON.parse(localStorage.getItem(row));


                //if (Modernizr.localstorage) {
                //    $("#Perimeter").text('localStorage is available');
                //} else {
                //    $("#Perimeter").text('localStorage is not available');
                //}

                var panel1 = $.jsPanel({
                    iframe: {
                        src: "report_bar.html",
                        id: "myFrame",
                        style: { "display": "none", "border": "10px solid transparent" },
                        width: '100%',
                        height: '100%'
                    },

                    callback: function () {
                        document.getElementById("myFrame").onload = function () {
                            $("#myFrame").fadeIn(1000);
                        }
                    },
                    size: { width: 425, height: 425 },
                    position: { left: "center", top: 30 },
                    title: row.Asset, //Mileage Report
                    theme: "black"
                });


            },

        });
    }
    else if (reports == "Utilization (Type 1)")
    {

        $("#event-report").hide();
        $("#position-report").hide();
        $("#speed-report").hide();
        $("#mileage-report").hide();
        $("#utilization-report").show();
        $("#messages-report").hide();
        $("#jobs-report").hide();

        $('#reports-utilization').bootstrapTable('destroy');

        $('#reports-utilization').bootstrapTable({
            idField: 'id',
            url: webapiMobile,
            columns: [{
                field: 'Asset',
                title: 'Vehicle',
                formatter: vehicleFormatter
            }, {
                field: 'Tag',
                title: 'Device',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop'
            }, {
                field: 'Timestamp',
                title: 'Timestamp',
                formatter: timestampFormatter
            }, {
                field: 'Speed',
                title: 'Speed'
            }, {
                field: 'Engine',
                title: 'Engine',
                formatter: engineFormatter
            }, {
                field: 'Ignition',
                title: 'Ignition',
                formatter: ignitionFormatter
            }],
            onLoadSuccess: function (row) {

                //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));

                var move = 0;
                var idle = 0;
                var stop = 0;

                for (var i = 0; i < row.length; ++i) {
                    if (row[i].Engine == "MOVE") {
                        move++;
                    } else if (row[i].Engine == "IDLE") {
                        idle++;
                    } else if (row[i].Engine == "STOP") {
                        stop++;
                    }

                }

                var objEngine = {
                    Move: move,
                    Idle: idle,
                    Stop: stop,
                };

                //Set
                sessionStorage.setItem("setSessionstorageValueEngine", JSON.stringify(objEngine));

                drawChart();


            },


            onClickRow: function (row) {
                //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                //Store
                localStorage.setItem("row", JSON.stringify(row));


                //Then retrieve
                var localObj = JSON.parse(localStorage.getItem(row));


                //if (Modernizr.localstorage) {
                //    $("#Perimeter").text('localStorage is available');
                //} else {
                //    $("#Perimeter").text('localStorage is not available');
                //}

                var panel1 = $.jsPanel({
                    iframe: {
                        src: "report_pie.html",
                        id: "myFrame",
                        style: { "display": "none", "border": "10px solid transparent" },
                        width: '100%',
                        height: '100%'
                    },

                    callback: function () {
                        document.getElementById("myFrame").onload = function () {
                            $("#myFrame").fadeIn(1000);
                        }
                    },
                    size: { width: 425, height: 425 },
                    position: { left: "center", top: 30 },
                    title: row.Asset, //Utilization Report
                    theme: "black"
                });

            },

        });
    }

    else if (reports == "Messages") {

        $("#event-report").hide();
        $("#position-report").hide();
        $("#speed-report").hide();
        $("#mileage-report").hide();
        $("#utilization-report").hide();
        $("#messages-report").show();
        $("#jobs-report").hide();

        $('#reports-messages').bootstrapTable('destroy');

        $('#reports-messages').bootstrapTable({
            idField: 'id',
            url: WebApiMessages,
            columns: [{
                field: 'Timestamp',
                title: 'Timestamp',
                formatter: timestampFormatter
            }, {
                field: 'Flag',
                title: 'Status',
                formatter: flagFormatter
            }, {
                field: 'Sender',
                title: 'From'
            }, {
                field: 'Recipients',
                title: 'To'
            }, {
                field: 'Asset',
                title: 'Vehicle',
                formatter: vehicleFormatter
            }, {
                field: 'Message',
                title: 'Message'
            }, ],

            onLoadSuccess: function (row) {

                console.log('Messages: onLoadSuccess, data: ' + JSON.stringify(row));
                var sent = 0;
                var pending = 0;


                for (var i = 0; i < row.length; ++i) {
                    if (row[i].Flag == 0) {
                        sent++;
                    } else if (row[i].Flag == 1) {
                        pending++;
                    }
                }

                var objMessages = {
                    Sent: sent,
                    Pending: pending
                };


                //Set
                sessionStorage.setItem("setSessionstorageValueMessages", JSON.stringify(objMessages));

                drawMessages();

            }
        });
    }

    else if (reports == "Jobs") {

        $("#event-report").hide();
        $("#position-report").hide();
        $("#speed-report").hide();
        $("#mileage-report").hide();
        $("#utilization-report").hide();
        $("#messages-report").hide();
        $("#jobs-report").show();

        $('#reports-jobs').bootstrapTable('destroy');

        $('#reports-jobs').bootstrapTable({
            idField: 'id',
            url: jobApi,
            columns: [{
                field: 'JobID',
                title: 'Job id',
                sortable: 'true',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg'
            }, {
                field: 'Asset',
                title: 'Vehicle',
                sortable: 'true'
            }, {
                field: 'Caller',
                title: 'Caller Name',
                sortable: 'true'
            }, {
                field: 'Timestamp',
                title: 'Date & Time',
                sortable: 'true',
                formatter: timestampFormatter
            }, {
                field: 'Bed',
                title: 'Bed/Ward',
                sortable: 'true'
            }, {
                field: 'Destination',
                title: 'Destination',
                sortable: 'true'
            }, {
                field: 'Phone',
                title: 'Phone',
                sortable: 'true'
            }, {
                field: 'Accessories',
                title: 'Accessories',
                sortable: 'true',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg'
            }, {
                field: 'Amount',
                title: 'Amount',
                class: 'amount',
                sortable: 'true',
                formatter: 'amountFormatter'
            }, {
                field: 'Remarks',
                title: 'Remarks',
                sortable: 'true'
            }, {
                field: 'Receipt',
                title: 'Receipt No.',
                sortable: 'true'
            }, {
                field: 'DriverInfo.Image',
                title: 'Driver Profile',
                formatter: 'nameFormatter',
                sortable: 'true'
            }],
        });
    }

    else if (reports == "Events") {

        $("#event-report").show();
        $("#position-report").hide();
        $("#speed-report").hide();
        $("#mileage-report").hide();
        $("#utilization-report").hide();
        $("#messages-report").hide();
        $("#jobs-report").hide();

        $('#reports-events').bootstrapTable('destroy');

        //Event Table
        var getEvents = document.getElementById("mobile-load-events");
        var strEvent = getEvents.options[getEvents.selectedIndex].value;

        if (strEvent == 12 | strEvent == 13) {
            //User Log In/Out
            $(document).ready(function () {

                $('#reports-events').bootstrapTable(
                    {
                        idField: 'EventID',
                        url: 'http://117.120.7.119/spwebapi/api/eventinfo/?StatusID=' + getStatusID + '&Timestamp=' + datefrom + '&RxTime=' + dateto + "&CompanyID=" + company + "&AckRoleID=" + getSessionstorageValueRoleID,
                        columns: [{
                            field: 'Timestamp',
                            title: titleTimestamp,

                            formatter: timestampFormatter
                        }, {
                            field: 'Event',
                            title: titleEvent
                        }, {
                            field: 'Remarks',
                            title: titleRemarkss
                        }]

                    });

            });
        }
        else if (strEvent == 17 | strEvent == 18) {
            $(document).ready(function () {

                $('#reports-events').bootstrapTable(
                    {
                        idField: 'EventID',
                        url: WebApiEvent,
                        columns: [{
                            field: 'Timestamp',
                            title: titleTimestamp,
                            formatter: timestampFormatter
                        }, {
                            field: 'Event',
                            title: titleEvent
                        }, {
                            field: 'Remarks',
                            title: titleRemarks
                        }, {
                            field: 'Asset',
                            title: titlePhone,
                            formatter: vehicleFormatter
                        }, ],

                        onLoadSuccess: function (row) {

                            //console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));
                            var enter = 0;
                            var exit = 0;


                            for (var i = 0; i < row.length; ++i) {
                                if (row[i].Event == "Zone Enter") {
                                    enter++;
                                } else if (row[i].Event == "Zone Exit") {
                                    exit++;
                                }
                            }

                            var objEvent = {
                                ZoneEnter: enter,
                                ZoneExit: exit
                            };


                            //Set
                            sessionStorage.setItem("setSessionstorageValueEvents", JSON.stringify(objEvent));

                            drawEvent();

                        },

                        onClickRow: function (row) {
                            //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                            //Store
                            localStorage.setItem("row", JSON.stringify(row));


                            //Then retrieve
                            var localObj = JSON.parse(localStorage.getItem(row));


                            //if (Modernizr.localstorage) {
                            //    $("#Perimeter").text('localStorage is available');
                            //} else {
                            //    $("#Perimeter").text('localStorage is not available');
                            //}

                            var panel1 = $.jsPanel({
                                iframe: {
                                    src: "history_event.html",
                                    id: "myFrame",
                                    style: { "display": "none", "border": "10px solid transparent" },
                                    width: '100%',
                                    height: '100%'
                                },

                                callback: function () {
                                    document.getElementById("myFrame").onload = function () {
                                        $("#myFrame").fadeIn(1000);
                                    }
                                },
                                size: { width: 425, height: 425 },
                                position: { left: "center", top: 30 },
                                title: row.Asset,
                                theme: "black"
                            });
                        },

                    });

            });
        }
        else if (strEvent == 19) {
            //Speed Limit Table
            $(document).ready(function () {

                $('#reports-events').bootstrapTable(
                    {
                        idField: 'EventID',
                        url: WebApiEvent,
                        columns: [{
                            field: 'Timestamp',
                            title: titleTimestamp,
                            formatter: timestampFormatter
                        }, {
                            field: 'Event',
                            title: titleEvent
                        }, {
                            field: 'Remarks',
                            title: titleRemarks
                        }, {
                            field: 'Asset',
                            title: titlePhone,
                            formatter: vehicleFormatter
                        }, ],

                        onLoadSuccess: function (row) {

                            // console.log('Event: onLoadSuccess, data: ' + JSON.stringify(row));
                            var speed = 0;


                            for (var i = 0; i < row.length; ++i) {
                                if (row[i].Event == "Speeding Report") {
                                    speed++;
                                }
                            }

                            var objEvent = {
                                SpeedLimit: speed,
                            };


                            //Set
                            sessionStorage.setItem("setSessionstorageValueEvents", JSON.stringify(objEvent));

                            drawEventSpeedLimit();

                        },

                        onClickRow: function (row) {
                            //console.log('Event: onClickRow, data: ' + JSON.stringify(row));

                        }

                    });

            });
        }
    }


});

//Populate Driver
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

//Translation of Forms
if (getSessionstorageValueLanguage == "en") {
    $("#clickGenerateEN").text("Generate");
    $("#clickRefreshEN").text("Reset");
    $(".report").text("Choose one of the following...");
    $(".report2").text("Choose one of the following...");
    $(".allReport").text("ALL");
    $(".jobStatusAll").text("ALL");
    $(".driverAll").text("ALL");
    $(".normal").text("Normal");
    $(".schedule").text("Schedule");
    $(".completed").text("Completed");
    $(".inProgress").text("In Progress");
    $(".transferred").text("Transferred");
    $(".new").text("New");

}
else if (getSessionstorageValueLanguage == "th") {
    $("#clickGenerateEN").text("ผลิต");
    $("#clickRefreshEN").text("ตั้งใหม่");
    $(".report").text("เลือกรายการใดรายการหนึ่งต่อไปนี้...");
    $(".report2").text("เลือกรายการใดรายการหนึ่งต่อไปนี้...");
    $(".allReport").text("ทั้งหมด");
    $(".jobStatusAll").text("ทั้งหมด");
    $(".driverAll").text("ทั้งหมด");
    $(".normal").text("ปกติ");
    $(".schedule").text("หมายกำหนดการ");
    $(".completed").text("เสร็จสมบูรณ์แล้ว");
    $(".inProgress").text("กำลังดำเนินการ");
    $(".transferred").text("โอนแล้ว");
    $(".new").text("ใหม่");
}
else if (getSessionstorageValueLanguage == "vn") {
    $("#clickGenerateEN").text("Tạo Ra");
    $("#clickRefreshEN").text("Đặt Lại");
    $(".report").text("Chọn Một Trong Những Điều Dưới...");
    $(".report2").text("Chọn Một Trong Những Điều Dưới...");
    $(".allReport").text("Tất Cả");
    $(".jobStatusAll").text("Tất Cả");
    $(".driverAll").text("Tất Cả");
    $(".normal").text("Bình Thường");
    $(".schedule").text("Lịch Trình");
    $(".completed").text("Đã Hoàn Thành");
    $(".inProgress").text("Đang Tiến Hành");
    $(".transferred").text("Đã Chuyển Giao");
    $(".new").text("Mới");
}
else if (getSessionstorageValueLanguage == "id") {
    $("#clickGenerateEN").text("Hasilkan");
    $("#clickRefreshEN").text("Hasil Semula");
    $(".report").text("Pilih salah satu dari berikut...");
    $(".report2").text("Pilih salah satu dari berikut...");
    $(".allReport").text("Semua");
    $(".jobStatusAll").text("Semua");
    $(".driverAll").text("Semua");
    $(".normal").text("Biasa");
    $(".schedule").text("Jadwal");
    $(".completed").text("Selesai");
    $(".inProgress").text("Sedang Berlangsung");
    $(".transferred").text("Dipindah");
    $(".new").text("Baru");
}
