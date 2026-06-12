var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

var titleAgent, titleAmount, titleJobNumber, titleDevice, titlePersonInCharge, titlePhoneUser, titleAlertDate, titlePickupDate, titleAddress, titlePhone, titleRemarks, titleReceiptNo, titleJobStatus, titleJobType, titleTotalAmount;
var titleToday, titlePrint, titleMonth, titleWeek, titleDay, titleAllDay;
var titleCompany, titleUnit, titlePostal, titleStart;
var titleCompleted, titleInProgress, titleNew;
if (getSessionstorageValueLanguage == "en") {
    titleAgent = "Agent";
    titleJobNumber = "Job Number";
    titleDevice = "Device";
    titlePersonInCharge = "Person In Charge";
    titlePhoneUser = "Phone User";
    titleAlertDate = "Alert Date";
    titlePickupDate = "Pickup Date";
    titleAddress = "Address";
    titlePhone = "Phone";
    titleRemarks = "Remarks";
    titleReceiptNo = "Receipt No";
    titleJobStatus = "Job Status";
    titleJobType = "Job Type";
    titleTotalAmount = "Total Amount"
    titleAmount = "Amount";
    titleToday = "today";
    titlePrint = "print";
    titleMonth = "month";
    titleWeek = "week";
    titleDay = "day";
    titleCompany = "Company";
    titleUnit = "Unit";
    titlePostal = "Postal";
    titleStart = "Start";
    titleAllDay = "all-day";
    titleCompleted = "Completed";
    titleInProgress = "In Progress";
    titleNew = "New Jobs";
} else if (getSessionstorageValueLanguage == "th") {
    titleAgent = "ตัวแทน";
    titleJobNumber = "หมายเลขงาน";
    titleDevice = "อุปกรณ์";
    titlePersonInCharge = "ผู้รับผิดชอบในการปฎิบัติหน้าที่";
    titlePhoneUser = "ผู้ใช้โทรศัพท์";
    titleAlertDate = "วันที่แจ้งเตือน";
    titlePickupDate = "วันที่รับสินค้า";
    titleAddress = "ที่อยู่";
    titlePhone = "โทรศัพท์";
    titleRemarks = "หมายเหตุ";
    titleReceiptNo = "หมายเลขใบเสร็จ";
    titleJobStatus = "สถานะงาน";
    titleJobType = "ประเภทงาน";
    titleTotalAmount = "จำนวนเงินทั้งหมด";
    titleAmount = "จำนวนเงิน";
    titleToday = "today";
    titlePrint = "พิมพ์";
    titleMonth = "เดือน";
    titleWeek = "สัปดาห์";
    titleDay = "วัน";
    titleCompany = "บริษัท";
    titleUnit = "หน่วย";
    titlePostal = "ไปรษณีย์";
    titleStart = "เริ่มต้น";
    titleAllDay = "ทั้งวัน";
    titleCompleted = "เสร็จ";
    titleInProgress = "กำลังดำเนินการ";
    titleNew = "ใหม่";
} else if (getSessionstorageValueLanguage == "vn") {
    titleAgent = "Người Dại Lý";
    titleJobNumber = "Số Việc Làm";
    titleDevice = "Thiết Bị";
    titlePersonInCharge = "Người Phụ Trách";
    titlePhoneUser = "Người Sử Dụng Diện Thoại";
    titleAlertDate = "Ngày Báo";
    titlePickupDate = "Ngày Nhận";
    titleAddress = "Địa Chỉ Nhà";
    titlePhone = "Điện Thoại";
    titleRemarks = "Ghi Chú";
    titleReceiptNo = "Số Nhận";
    titleJobStatus = "Trạng Thái Công Việc";
    titleJobType = "Loại Công Việc";
    titleTotalAmount = "Tổng Cộng";
    titleAmount = "Số Tiền";
    titleToday = "hôm nay";
    titlePrint = "xuất bản";
    titleMonth = "tháng";
    titleWeek = "tuần";
    titleDay = "Ngày";
    titleCompany = "Công ty";
    titleUnit = "Đơn vị";
    titlePostal = "Bưu điện";
    titleStart = "Khởi đầu";
    titleAllDay = "Cả Ngày";
    titleCompleted = "Đã Hoàn Thành";
    titleInProgress = "Trong Tiến Trình";
    titleNew = "Mới";
} else if (getSessionstorageValueLanguage == "id") {
    titleAgent = "Agen";
    titleJobNumber = "Nomor Kerja";
    titleDevice = "Alatan";
    titlePersonInCharge = "Orang In Charge";
    titlePhoneUser = "Pengguna Ponsel";
    titleAlertDate = "Tanggal Peringatan";
    titlePickupDate = "Tanggal Angkat";
    titleAddress = "Alamat";
    titlePhone = "Telepon";
    titleRemarks = "Keterangan";
    titleReceiptNo = "Nomor Tanda Terima";
    titleJobStatus = "Status Kerja";
    titleJobType = "Jenis Kerja";
    titleTotalAmount = "Jumlah total";
    titleAmount = "Jumlah";
    titleToday = "hari ini";
    titlePrint = "cetak";
    titleMonth = "bulan";
    titleWeek = "minggu";
    titleDay = "Hari";
    titleCompany = "Perusahaan";
    titleUnit = "Satuan";
    titlePostal = "Pos";
    titleStart = "Mulai";
    titleAllDay = "sepanjang-hari";
    titleCompleted = "Selesai";
    titleInProgress = "Sedang Berlangsung";
    titleNew = "Kerja Baru";
}

$('#LoadingForm').modal('show');
$('#groupDiv').hide();
$('#historyAssets').hide();
$('#historyDriver').hide();

//$('#JobAreaExcel').hide();
//$('#JobTechnicianExcel').hide();
$('#JobMainAreaExcel').hide();
$('#JobMainTechnicianExcel').hide();

$('#divAreaExcel').hide();
$('#divTechnicianExcel').hide();


var tableToExcel = (function () {
    var uri = 'data:application/vnd.ms-excel;base64,',
        template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
        base64 = function (s) {
            return window.btoa(unescape(encodeURIComponent(s)))
        },
        format = function (s, c) {
            return s.replace(/{(\w+)}/g, function (m, p) {
                return c[p];
            })
        }
    return function (table, name, filename) {
        if (!table.nodeType) table = document.getElementById(table)
        var ctx = {
            worksheet: name || 'Worksheet',
            table: table.innerHTML
        }
        document.getElementById("dlink").href = uri + base64(format(template, ctx));
        document.getElementById("dlink").download = getSessionstorageValueCompany + "] Area Table" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY') + ".xls";;
        document.getElementById("dlink").click();
    }
})()

var tableTechnicianToExcel = (function () {
    var uri = 'data:application/vnd.ms-excel;base64,',
        template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
        base64 = function (s) {
            return window.btoa(unescape(encodeURIComponent(s)))
        },
        format = function (s, c) {
            return s.replace(/{(\w+)}/g, function (m, p) {
                return c[p];
            })
        }
    return function (table, name, filename) {
        if (!table.nodeType) table = document.getElementById(table)
        var ctx = {
            worksheet: name || 'Worksheet',
            table: table.innerHTML
        }
        document.getElementById("dlink2").href = uri + base64(format(template, ctx));
        document.getElementById("dlink2").download = getSessionstorageValueCompany + "] Technician Table" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY') + ".xls";
        document.getElementById("dlink2").click();
    }
})()


document.getElementById("loader").style.display = "none";

//populate the Drop Down List
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

//Desktop
if (getSessionstorageValueRoleID == 1) {

    $('#load-assets').append(
        $('<option></option>').val(0).html("ALL")
    );
    $.getJSON("https://webapi.systempest.com/api/assetinfo?UserID=" + '&ResellerID=' + "1" + '&CompanyID=' + "1", function (data) {
        $.each(data, function (index, item) {
            $('#load-assets').append(
                $('<option></option>').val(item.AssetID).html(item.Name)
            );

        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    $('#load-assets').append(
        $('<option></option>').val(0).html("ALL")
    );
    $.getJSON("https://webapi.systempest.com/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {

            $('#load-assets').append(
                $('<option></option>').val(item.AssetID).html(item.Name)
            );

        });
        $(".selectpicker").selectpicker('refresh');
    });
} else if (getSessionstorageValueRoleID >= 3) {
    if (getSessionstorageValueLanguage == "en") {
        $('#load-assets').append($('<option></option>').val(0).html("ALL"));
    } else if (getSessionstorageValueLanguage == "th") {
        $('#load-assets').append($('<option></option>').val(0).html("ทั้งหมด"));
    } else if (getSessionstorageValueLanguage == "vn") {
        $('#load-assets').append($('<option></option>').val(0).html("TẤT CẢ CÁC"));
    } else if (getSessionstorageValueLanguage == "id") {
        $('#load-assets').append($('<option></option>').val(0).html("SEMUA"));
    }

    $.getJSON("https://webapi.systempest.com/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#load-assets').append(
                $('<option></option>').val(item.AssetID).html(item.Name)
            );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}

if (getSessionstorageValueCompanyID == 1) {
    groupApi = 'https://webapi.systempest.com/api/groupinfo';
} else if (getSessionstorageValueCompanyID == 2) {
    groupApi = 'https://webapi.systempest.com/api/groupmyinfo';
} else if (getSessionstorageValueCompanyID == 3) {
    groupApi = 'https://webapi.systempest.com/api/groupinfo';
} else {
    groupApi = 'https://webapi.systempest.com/api/groupinfo';
}

$('#load-groups').append(
    $('<option></option>').val(0).html("No Group Selected")
);
$.getJSON(groupApi, function (data) {
    $.each(data, function (index, item) {
        $('#load-groups').append(
            $('<option></option>').val(item.Groups).html(item.Groups)
        );

    });
    $(".selectpicker").selectpicker('refresh');
});

//Populate phone user
var WebAPIDriver = "";

if (getSessionstorageValueRoleID == 1) {
    WebAPIDriver = 'https://webapi.systempest.com/api/driverinfo?ResellerID=' + '1' + '&CompanyID=' + '1';
} else if (getSessionstorageValueRoleID == 2) {
    WebAPIDriver = 'https://webapi.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

} else if (getSessionstorageValueRoleID >= 3) {
    WebAPIDriver = 'https://webapi.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
}

//alert(WebAPIDriver)

$('#load-drivers').append($('<option selected="selected"></option>').val('').html("All"));
$.getJSON(WebAPIDriver, function (data) {
    $.each(data, function (index, item) {

        if (item.AssetID > 0) {
            $('#load-drivers').append($('<option></option>').val(item.DriverID).html(item.Name));

        } else {
            $('#load-drivers').append($('<option></option>').val(item.DriverID).html(item.Name));
        }
    });

    $('.selectpicker').selectpicker('refresh');
});





/*** Function to filter reseller and companies*/
$(function () {

    var selectedCompany = "";
    var selectedReseller = "";

    $('.SelectResellerFilter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();

        $('#load-company').empty();
        $('#load-company').selectpicker('refresh');
        $('#jobCompany').empty();
        $('#jobCompany').selectpicker('refresh');
        $.getJSON("https://webapi.systempest.com/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#load-company').append($('<option></option>').val(0).html("All"));

            $.each(data, function (index, item) {

                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $('#load-company').selectpicker('refresh');
            $('#jobCompany').selectpicker('refresh');
        });

    });


    $('.SelectCompanyFilter').on('change', function () {
        selectedCompany = $(this).find("option:selected").val();

        var getReseller = $('#load-reseller').val();

        //On Change Company
        $('#jobCompany').empty();
        $("#jobCompany").selectpicker('refresh');

        $.getJSON("https://webapi.systempest.com/api/companyinfo?ResellerID=" + getReseller, function (data) {

            $.each(data, function (index, item) {

                if (item.CompanyID == selectedCompany) {
                    $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                } else {
                    $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                }

            });

            $('#jobCompany').selectpicker('refresh');
        });

        $('#load-assets').empty();
        $("#load-assets").selectpicker('refresh');
        $('#jobAssets').empty();
        $("#jobAssets").selectpicker('refresh');
        var userReseller;
        if (selectedReseller == '' || selectedReseller == null) {
            userReseller = $("#load-reseller").val();
        } else {
            userReseller = selectedReseller;
        }

        $.getJSON("https://webapi.systempest.com/api/assetinfo?UserID=" + "&ResellerID=" + userReseller + "&CompanyID=" + selectedCompany, function (data) {

            $.each(data, function (index, item) {
                $('#load-assets').append($('<option></option>').val(item.AssetID).html(item.Name));
                $('#jobAssets').append($('<option></option>').val(item.AssetID).html(item.Name));
            });

            $("#load-assets").selectpicker('refresh');
            $("#jobAssets").selectpicker('refresh');
        });

    });

    $('.MobileSelectCompanyFilter').on('change', function () {
        selectedCompany = $(this).find("option:selected").val();

        var getMobileReseller = $('#jobReseller').val();

        //On Change Company
        $('#load-company').empty();
        $("#load-company").selectpicker('refresh');

        $.getJSON("https://webapi.systempest.com/api/companyinfo?ResellerID=" + getMobileReseller, function (data) {

            $.each(data, function (index, item) {

                if (item.CompanyID == selectedCompany) {
                    $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                } else {
                    $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                }

            });

            $('#load-company').selectpicker('refresh');
        });

        $('#load-assets').empty();
        $("#load-assets").selectpicker('refresh');
        $('#jobAssets').empty();
        $("#jobAssets").selectpicker('refresh');
        var userReseller;
        if (selectedReseller == '' || selectedReseller == null) {
            userReseller = $("#load-reseller").val();
        } else {
            userReseller = selectedReseller;
        }

        $.getJSON("https://webapi.systempest.com/api/assetinfo?UserID=" + "&ResellerID=" + userReseller + "&CompanyID=" + selectedCompany, function (data) {

            $.each(data, function (index, item) {
                $('#load-assets').append($('<option></option>').val(item.AssetID).html(item.Name));
                $('#jobAssets').append($('<option></option>').val(item.AssetID).html(item.Name));
            });

            $("#load-assets").selectpicker('refresh');
            $("#jobAssets").selectpicker('refresh');
        });

    });
});

$(function () {

    var selectedJobCompany = "";
    var selectedJobReseller = "";

    $('.SelectJobResellerFilter').on('change', function () {
        selectedJobReseller = $(this).find("option:selected").val();

        $('#jobCompany').empty();
        $('#jobCompany').selectpicker('refresh');
        $.getJSON("https://webapi.systempest.com/api/companyinfo?&ResellerID=" + selectedJobReseller, function (data) {

            //$('#load-company').append($('<option></option>').val(0).html("All"));

            $.each(data, function (index, item) {
                $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });
            $('#jobCompany').selectpicker('refresh');
        });

    });


    $('.SelectJobCompanyFilter').on('change', function () {
        selectedJobCompany = $(this).find("option:selected").val();

        $('#jobAssets').empty();
        $("#jobAssets").selectpicker('refresh');
        var jobReseller;
        if (selectedJobReseller == '' || selectedJobReseller == null) {
            jobReseller = $("#jobReseller").val();
        } else {
            jobReseller = selectedJobReseller;
        }

        $.getJSON("https://webapi.systempest.com/api/assetinfo?UserID=" + "&ResellerID=" + jobReseller + "&CompanyID=" + selectedJobCompany, function (data) {

            $.each(data, function (index, item) {
                $('#jobAssets').append($('<option></option>').val(item.AssetID).html(item.Name));
            });
            $("#jobAssets").selectpicker('refresh');
        });

    });
});


//modal
if (getSessionstorageValueRoleID == 1) {

    $('#jobAssets').append($('<option></option>').val(0).html("No Vehicle"));
    $.getJSON("https://webapi.systempest.com/api/assetinfo?UserID=" + '&ResellerID=' + "1" + '&CompanyID=' + "1", function (data) {
        $.each(data, function (index, item) {
            $('#jobAssets').append(
                $('<option></option>').val(item.AssetID).html(item.Name)
            );
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {
    $('#jobAssets').append($('<option></option>').val(0).html("No Vehicle"));

    $.getJSON("https://webapi.systempest.com/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {

            $('#jobAssets').append(
                $('<option></option>').val(item.AssetID).html(item.Name)
            );
        });
        $(".selectpicker").selectpicker('refresh');
    });
} else if (getSessionstorageValueRoleID >= 3) {

    $('#jobAssets').append($('<option></option>').val(0).html("No Vehicle"));
    $.getJSON("https://webapi.systempest.com/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#jobAssets').append(
                $('<option></option>').val(item.AssetID).html(item.Name)
            );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}
var WebAPIDriver = "";

if (getSessionstorageValueRoleID == 1) {
    WebAPIDriver = 'https://webapi.systempest.com/api/driverinfoex?ResellerID=' + '1' + '&CompanyID=' + '1';
} else if (getSessionstorageValueRoleID == 2) {
    WebAPIDriver = 'https://webapi.systempest.com/api/driverinfoex?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

} else if (getSessionstorageValueRoleID >= 3) {
    WebAPIDriver = 'https://webapi.systempest.com/api/driverinfoex?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
}

$.getJSON(WebAPIDriver, function (data) {
    $.each(data, function (index, item) {

        if (item.AssetID != 0) {
            $('#driver').append($('<option data-imagesrc="' + item.Image + '"></option>').val(item.Name).html(item.Name));
            $('#cal-driver').append($('<option data-imagesrc="' + item.Image + '"></option>').val(item.Name).html(item.Name));

        } else {
            $('#driver').append($('<option data-imagesrc="' + item.Image + '"></option>').val(item.Name).html(item.Name));
            $('#cal-driver').append($('<option data-imagesrc="' + item.Image + '"></option>').val(item.Name).html(item.Name));

        }
    });

    $('.selectpicker').selectpicker('refresh');
});

function timeTableFormatter(value) {
    //Format UTC
    var timestamp = moment(value).add('hours', 8).format('HHmm');
    return timestamp;
}

function timeTableDisplayFormatter(value) {
    //Format UTC
    var timestamp = moment(value).add('hours', 8).format('D-MMM-YYYY, hh:mm A');
    return timestamp;
}

function timeTableDateFormatter(value) {
    //Format UTC
    var timestamp = moment(value).add('hours', 8).format('D-MMM-YYYY');
    return timestamp;
}



//Delete Row
var $table = $('#jobs-editable'),
    $remove = $('#job-confirm-delete'),
    $removeEN = $('#job-confirm-deleteEN');



$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);


});


//  Format for Vehicle Column.
// =================================================================
function vehicleFormatter(value, row) {


    return '<a class="btn-link" id="showVehicle" onClick="showVehicle()">' + value + '</a>';
}


function jobFormatter(value, row) {

    return '<a class="btn-link" id="showJobID">' + '#' + value + '</a>';
}



//  Format for Ignition Column.
// =================================================================
function ignitionFormatter(value, row) {
    var labelColor;
    var text;
    if (value == 1) {
        labelColor = "success";
        text = "On";
    } else if (value == 0) {
        labelColor = "dark";
        text = "Off";
    }
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
}


//  Format for Engine Column.
// =================================================================
function engineFormatter(value, row) {
    var labelColor;
    if (value == "MOVE") {
        labelColor = "success";
    } else if (value == "IDLE") {
        labelColor = "warning";
    } else if (value == "STOP") {
        labelColor = "danger";
    }
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    return '<div class="label label-table label-' + labelColor + '"> ' + value + '</div>';
}


//  Format for Timestamp Column.
// =================================================================
function timestampFormatter(value, row) {


    //Convert Timezone
    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    var Singapore = moment.tz(value, Asia);

    //Format UTC
    var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');


    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';


}

function pickupFormatter(value, row) {

    //Convert Timezone
    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    var Singapore = moment.tz(value, Asia);

    if (row.JobType == "Scheduled") {
        var timestamp = moment.utc(Singapore.format()).add('hours', 8).add('minutes', 30).format('D-MMM-YYYY, HH:mm:ss A');
    } else if (row.JobType == "Normal") {
        var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');
    }


    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';

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

// Format for User Name Column.
// =================================================================
function statusFormatter(value) {
    var text;

    if (value == "Edited" || value == "New" || value == "Scheduled" || value == "Incomplete") {
        text = "<span style='background-color: #ffc133; padding: 3px;color: black;'>" + value + "</span>";
        return text;
    } else if (value == "Completed") {
        text = "<span style='background-color: #77ff33; padding: 3px;color: black;'>" + value + "</span>";
        return text;
    } else {
        text = "<span style='background-color: #FD3B3B; padding: 3px;color: black;'>" + value + "</span>";
        return text;
    }

}

// Format for User Name Column.
// =================================================================
function jobdriverFormatter(value, row) {
    var labelColor;
    var text;

    if (value == "") {
        labelColor = "danger";
        text = "No Driver - Job Invalid! Pls. contact administrator";
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    } else {
        labelColor = "success";
        return '<center><div class="label label-table label-' + labelColor + '">' + value + '</div></center>';
    }

}

function nameFormatter(value, row) {
    var labelColor;
    var text;

    var getDriverID = row.DriverInfo.DriverID;

    var driverAddress;
    if (row.DriverInfo.Address == '') {
        driverAddress = "No Name";
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
        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.DriverInfo.Name + '" data-footer="' + "<strong>Address: </strong>" + driverAddress + "<br>" + "<strong>Phone: </strong>" + driverPhone + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

    } else if (row.DriverInfo.DriverID != "0" && row.DriverInfo.ImageFill == "None") {
        labelColor = "success";
        text = row.DriverInfo.Name;
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';

    } else if (row.DriverInfo.DriverID == "0") {
        labelColor = "dark";
        text = "No Driver";

        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';

    }
}

function snFormatter(value, row, index) {

    return index + 1;
}

// Format for User Name Column.
// =================================================================
function paymentFormatter(value, row) {
    var labelColor;
    var text = value;

    console.log(text)

    if (value == '') {
        labelColor = "danger";
        text = "No Payment Method";
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    } else if (value == 1) {
        labelColor = "success";
        text = "Cash";
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    } else if (value == 2) {
        text = "Cheque";
        labelColor = "success";
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    } else if (value == 3) {
        text = "Internet Banking";
        labelColor = "success";
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }

}

function pestTreatmentFormatter(value, row) {

    var item = '';
    if (value) {
        console.log(value.length)
        for (var index = 0; index < value.length; index++) {

            if (value[index].ItemNo == 0) {
                item = '';
            } else {
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
        error: function () {
            alert('error');
        }
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
        error: function () {
            alert('error');
        }
    });


    //Then retrieve
    var version = localStorage.getItem('setLocalstorageValueSoftware');

    //  document.getElementById("software").innerHTML = version;
    document.getElementById("softwareEN").innerHTML = version;


});



var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'https://webapi.systempest.com/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {

        //$('#load-reseller').append(
        //$('<option></option>').val(0).html("-------")
        //);

        $.each(data, function (index, item) {
            if (item.ResellerID == 1) {
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#jobReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#cal-jobReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
            } else {
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#jobReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#cal-jobReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            }
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    WebAPIReseller = 'https://webapi.systempest.com/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#jobReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#cal-jobReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#formsReseller').remove();
    $('#modalReseller').remove();
    $('#cal-modalReseller').remove();

}


//Desktop
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("https://webapi.systempest.com/api/companyinfo?ResellerID=" + "1", function (data) {

        $.each(data, function (index, item) {

            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));

        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("https://webapi.systempest.com/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID) {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
            } else {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            }
        });


        $('.selectpicker').selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("https://webapi.systempest.com/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


        $.each(data, function (index, item) {

            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
        });


        $('.selectpicker').selectpicker('refresh');

    });
}


$(document).ready(function () {

	$("#JobAreaImage").click(function () {
        printAreaTable();
    });
	
	$("#JobTechnicianImage").click(function () {
        printTechnicianTable();
    });
	
    $("#JobAreaExcel").click(function () {
        /* $('#job-area-table').tableExport({
            type: "excel",
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Area Table" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        }); */
    });

    $("#JobTechnicianExcel").click(function () {
        /* $('#job-technician-table').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Techcnician Table" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        }); */
    });

    $("#JobMainAreaExcel").click(function () {
		
        $('#job-area-table').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Maintenance Area Table" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });

    $("#JobMainTechnicianExcel").click(function () {
        $('#job-technician-table').tableExport({
            type: 'excel',
            escape: 'false',
            htmlContent: 'false',
            fileName: "[" + getSessionstorageValueCompany + "] Maintenance Techcnician Table" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
        });
    });
});

//OnChange Jobs
$(function () {

    document.getElementById("clickGenerateEN").onclick = GenerateEN;

    function GenerateEN() {


        if ($('#load-category').val() == 1) {
            if ($('#load-groups').val() == 0) {
              
                $('#LoadingForm').modal('show');
              
                setTimeout(function () {
                    alert("Please Select a Group")
                }, 500);

                setTimeout(function () {
                    $('#LoadingForm').modal('hide');
                }, 500);
            } else {
                document.getElementById("loader").style.display = "block";
                if ($('#loader').css('display') == 'none') {
                    $("#clickGenerateEN").show();
                    $('#divAreaExcel').show();
                } else {
                    $("#clickGenerateEN").hide();
                    $('#divAreaExcel').hide();
                }
                GenerateAreaTable();
                document.getElementById("loader").style.display = "none";
                if ($('#loader').css('display') == 'none') {
                    $("#clickGenerateEN").show();
                    $('#divAreaExcel').show();
                } else {
                    $("#clickGenerateEN").hide();
                    $('#divAreaExcel').hide();
                }
                $('#divAreaExcel').show();
                $('#divTechnicianExcel').hide();
            }

        } else if ($('#load-category').val() == 2) {
            document.getElementById("loader").style.display = "block";
            if ($('#loader').css('display') == 'none') {
                $("#clickGenerateEN").show();
            } else {
                $("#clickGenerateEN").hide();
            }
            GenerateTechnicianTable();
            document.getElementById("loader").style.display = "none";
            if ($('#loader').css('display') == 'none') {
                $("#clickGenerateEN").show();
                $('#divAreaExcel').show();
            } else {
                $("#clickGenerateEN").hide();
                $('#divAreaExcel').hide();
            }
            $('#divAreaExcel').hide();
            $('#divTechnicianExcel').show();
        } else {
            $('#job-area-table').hide();
            $('#job-main-area-table').hide();
            $('#job-technician-table').hide();
            $('#job-main-technician-table').hide();
            //$('#JobAreaExcel').hide();
            //$('#JobTechnicianExcel').hide();
            $('#JobMainAreaExcel').hide();
            $('#JobMainTechnicianExcel').hide();
            $('#divAreaExcel').hide();
            $('#divTechnicianExcel').hide();
            alert("Please Select a Category")
        }

        $("#load-assets :selected").text(); //the text content of the selected option
        var getAsset = $("#load-assets").val(); //the value of the selected option
        var getCompany = $("#load-company").val();
        var getReseller = $("#load-reseller").val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
        var getTimestamp = $("#dateFrom").val();
        var getRxTime = $("#dateTo").val();

        var convertTimestamp = moment(getTimestamp, dateFormat);
        var convertRxtime = moment(getRxTime, dateFormat);
        var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
        //var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);

        var rxtime = moment(convertTimestamp).add('hours', 24).format(dateFormat);

    }



});

function printAreaTable()
{
   var divToPrint=document.getElementById("AreaTableDiv");
   newWin= window.open("");
   newWin.document.write(divToPrint.outerHTML);
   newWin.print();
   newWin.close();
}

function printTechnicianTable()
{
   var divToPrint=document.getElementById("TechnicianTableDiv");
   newWin= window.open("");
   newWin.document.write(divToPrint.outerHTML);
   newWin.print();
   newWin.close();
}

function GenerateAreaTable() {

    $('#job-area-table').empty()

    var acAPI = '';

    if (getSessionstorageValueCompanyID == 1) {

        acAPI = 'https://webapi.systempest.com/api/acinfo?Groups=' + $('#load-groups').val();

    } else if (getSessionstorageValueCompanyID == 2) {

        acAPI = 'https://webapi.systempest.com/api/acmyinfo?Groups=' + $('#load-groups').val();

    } else if (getSessionstorageValueCompanyID == 3) {

        acAPI = 'https://webapi.systempest.com/api/acinfo?Groups=' + $('#load-groups').val();

    } else {

        acAPI = 'https://webapi.systempest.com/api/acinfo?Groups=' + $('#load-groups').val();

    }

    console.log(acAPI)

    var markup = "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto class=''>" +
        "<table id='areaTable' class=' ' cellspacing='0'>" +
        "<thead>" +
        "<tr>" +
        "<th style='font-size: 12px; padding-left: 10px;padding: 10px;'> </th>"

    //var timestamp = moment().format('D-MMM-YYYY');
    //var rxtime = moment().add('days', 1).format('D-MMM-YYYY');

    var dateFormat = "D-MMM-YYYY, HH:mm:ss";

    var getTimestamp = $("#dateFrom").val();

    var convertTimestamp = moment(getTimestamp, dateFormat);
    var convertRxtime = moment(getTimestamp, dateFormat);
    var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
    var rxtime = moment(convertRxtime).add('hours', 19).format(dateFormat);

    //alert('Timestamp : ' + getTimestamp + ', Changed Timestamp : ' + timestamp);
    //alert('RxTime : ' + convertRxtime + ', Changed RxTime : ' + rxtime);
    var getGroup = $('#load-groups').val();

    var WebAPIJobs = 'https://webapi.systempest.com/api/joboverview?AssetResellerID=' + getSessionstorageValueUserResellerID + '&AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&FormType=' + getSessionstorageValueCompanyID + '&Groups=' + getGroup;

    var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&Groups=' + getGroup;

    console.log(WebAPIJobs)
    console.log(WebAPIMainJobs)
    if (getSessionstorageValueCompanyID == 2) {

        $.ajax({
            type: 'GET',
            async: false,
            url: acAPI,
            data: {
                get_param: 'value'
            },
            dataType: 'json',
            success: function (data) {
                console.log("Data Length" + data.length)
               
                for (var i = 0; i < data.length; i++) {
                    markup += "<th style='font-size: 14px;padding-left: 10px;padding: 10px; width: 100%;'>" + data[i].Groups + "</th>"

                    if (i + 1 == data.length) {
                        markup += "</tr>" +
                            "</thead>" +
                            "<tbody>" +
                            "<tr>"

                        // 4 AM to 8 AM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;text-align: center;font-weight: bold;'>" +
                            "4 am - 8 am</td>"


                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    //markup += "<td style= 'background-color: white'></td>"
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {

                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableDateFormatter(jobs[k].Timestamp) == timestamp) {
                                                                if (timeTableFormatter(jobs[k].Timestamp) > '0359' && timeTableFormatter(jobs[k].Timestamp) < '0800') {
                                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                    }
                                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                                    var remarks = finalRemarks[0];

                                                                    jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Customer Company : " + jobs[k].CusCompany +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Unit No : " + jobs[k].Unit +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Address : " + jobs[k].Address +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Site : " + jobs[k].Site +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Pests : " + pestIncluded +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Remarks : " + remarks +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Job Type : " + "Maintenance" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />";
                                                                    hasJob = true;
                                                                }
                                                            }

                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        var dateFormat = "D-MMM-YYYY";
                                        var getTimestamp = $("#dateFrom").val();
                                        var convertTimestamp = moment(getTimestamp, dateFormat);
                                        var timestamp = moment(convertTimestamp).format(dateFormat);

                                        for (var k = 0; k < jobs.length; k++) {

                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableDateFormatter(jobs[k].Timestamp) == timestamp) {
                                                    if (timeTableFormatter(jobs[k].Timestamp) > '0359' && timeTableFormatter(jobs[k].Timestamp) < '0800') {
                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                        }

                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                        var remarks = finalRemarks[0];
                                                        jobInformation += "ID : " + jobs[k].JobID +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Customer Company : " + jobs[k].Company +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Unit No : " + jobs[k].Unit +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Address : " + jobs[k].Destination +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Site : " + jobs[k].Site +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Pests : " + pestIncluded +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Remarks : " + remarks +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Job Type : " + "Ad-Hoc" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />";
                                                        hasJob = true;
                                                    }
                                                }

                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){

                                                //     markup += "<td style='font-size: 10px;padding: 5px;white-space: nowrap;'>" 
                                                //         + jobInformation 
                                                //         + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableDateFormatter(jobs[k].Timestamp) == timestamp) {
                                                                        if (timeTableFormatter(jobs[k].Timestamp) > '0359' && timeTableFormatter(jobs[k].Timestamp) < '0800') {
                                                                            for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                                pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                            }
                                                                            var finalRemarks = jobs[k].Remarks.split('~');
                                                                            var remarks = finalRemarks[0];

                                                                            jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Customer Company : " + jobs[k].CusCompany +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Unit No : " + jobs[k].Unit +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Address : " + jobs[k].Address +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Site : " + jobs[k].Site +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Pests : " + pestIncluded +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Remarks : " + remarks +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Job Type : " + "Maintenance" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />";
                                                                            hasJob = true;
                                                                        }
                                                                    }

                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }

                                    }


                                }
                            });


                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 8 AM to 10 AM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;text-align: center;font-weight: bold;'>" +
                            "8 am - 10 am</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '0759' && timeTableFormatter(jobs[k].Timestamp) < '1000') {
                                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                }
                                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                                var remarks = finalRemarks[0];

                                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Customer Company : " + jobs[k].CusCompany +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Unit No : " + jobs[k].Unit +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Address : " + jobs[k].Address +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Site : " + jobs[k].Site +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Pests : " + pestIncluded +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Remarks : " + remarks +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Job Type : " + "Maintenance" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />";
                                                                hasJob = true;
                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].AyInfo.Groups) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '0759' && timeTableFormatter(jobs[k].Timestamp) < '1000') {
                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                    }
                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                    var remarks = finalRemarks[0];
                                                    jobInformation += "ID : " + jobs[k].JobID +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Customer Company : " + jobs[k].Company +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Unit No : " + jobs[k].Unit +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Address : " + jobs[k].Destination +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Site : " + jobs[k].Site +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Pests : " + pestIncluded +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Remarks : " + remarks +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Job Type : " + "Ad-Hoc" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />";
                                                    hasJob = true;
                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '0759' && timeTableFormatter(jobs[k].Timestamp) < '1000') {
                                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                        }
                                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                                        var remarks = finalRemarks[0];

                                                                        jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Customer Company : " + jobs[k].CusCompany +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Unit No : " + jobs[k].Unit +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Address : " + jobs[k].Address +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Site : " + jobs[k].Site +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Pests : " + pestIncluded +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Remarks : " + remarks +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Job Type : " + "Maintenance" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />";
                                                                        hasJob = true;
                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }
                                    }


                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 10 AM to 12 PM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap; text-align: center;font-weight: bold;'>" +
                            "10 am - 12 pm</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '0959' && timeTableFormatter(jobs[k].Timestamp) < '1200') {
                                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                }
                                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                                var remarks = finalRemarks[0];

                                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Customer Company : " + jobs[k].CusCompany +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Unit No : " + jobs[k].Unit +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Address : " + jobs[k].Address +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Site : " + jobs[k].Site +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Pests : " + pestIncluded +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Remarks : " + remarks +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Job Type : " + "Maintenance" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />";
                                                                hasJob = true;
                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '0959' && timeTableFormatter(jobs[k].Timestamp) < '1200') {
                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                    }
                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                    var remarks = finalRemarks[0];
                                                    jobInformation += "ID : " + jobs[k].JobID +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Customer Company : " + jobs[k].Company +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Unit No : " + jobs[k].Unit +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Address : " + jobs[k].Destination +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Site : " + jobs[k].Site +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Pests : " + pestIncluded +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Remarks : " + remarks +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Job Type : " + "Ad-Hoc" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />";
                                                    hasJob = true;
                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '0959' && timeTableFormatter(jobs[k].Timestamp) < '1200') {
                                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                        }
                                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                                        var remarks = finalRemarks[0];

                                                                        jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Customer Company : " + jobs[k].CusCompany +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Unit No : " + jobs[k].Unit +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Address : " + jobs[k].Address +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Site : " + jobs[k].Site +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Pests : " + pestIncluded +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Remarks : " + remarks +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Job Type : " + "Maintenance" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />";
                                                                        hasJob = true;
                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }
                                    }


                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 12 PM to 2 PM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap ; text-align: center;font-weight: bold;'>" +
                            "12 pm - 2 pm</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '1159' && timeTableFormatter(jobs[k].Timestamp) < '1400') {
                                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                }
                                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                                var remarks = finalRemarks[0];

                                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Customer Company : " + jobs[k].CusCompany +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Unit No : " + jobs[k].Unit +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Address : " + jobs[k].Address +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Site : " + jobs[k].Site +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Pests : " + pestIncluded +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Remarks : " + remarks +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Job Type : " + "Maintenance" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />";
                                                                hasJob = true;
                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '1159' && timeTableFormatter(jobs[k].Timestamp) < '1400') {
                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                    }
                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                    var remarks = finalRemarks[0];
                                                    jobInformation += "ID : " + jobs[k].JobID +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Customer Company : " + jobs[k].Company +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Unit No : " + jobs[k].Unit +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Address : " + jobs[k].Destination +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Site : " + jobs[k].Site +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Pests : " + pestIncluded +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Remarks : " + remarks +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Job Type : " + "Ad-Hoc" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />";
                                                    hasJob = true;
                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '1159' && timeTableFormatter(jobs[k].Timestamp) < '1400') {
                                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                        }
                                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                                        var remarks = finalRemarks[0];

                                                                        jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Customer Company : " + jobs[k].CusCompany +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Unit No : " + jobs[k].Unit +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Address : " + jobs[k].Address +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Site : " + jobs[k].Site +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Pests : " + pestIncluded +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Remarks : " + remarks +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Job Type : " + "Maintenance" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />";
                                                                        hasJob = true;
                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });

                                            }
                                        }
                                    }


                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 2 PM to 4 PM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap; text-align: center;font-weight: bold;'>" +
                            "2 pm - 4 pm</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '1359' && timeTableFormatter(jobs[k].Timestamp) < '1600') {
                                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                }
                                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                                var remarks = finalRemarks[0];

                                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Customer Company : " + jobs[k].CusCompany +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Unit No : " + jobs[k].Unit +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Address : " + jobs[k].Address +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Site : " + jobs[k].Site +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Pests : " + pestIncluded +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Remarks : " + remarks +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Job Type : " + "Maintenance" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />";
                                                                hasJob = true;
                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '1359' && timeTableFormatter(jobs[k].Timestamp) < '1600') {
                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                    }
                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                    var remarks = finalRemarks[0];
                                                    jobInformation += "ID : " + jobs[k].JobID +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Customer Company : " + jobs[k].Company +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Unit No : " + jobs[k].Unit +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Address : " + jobs[k].Destination +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Site : " + jobs[k].Site +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Pests : " + pestIncluded +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Remarks : " + remarks +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Job Type : " + "Ad-Hoc" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />";
                                                    hasJob = true;
                                                }
                                            }

                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '1359' && timeTableFormatter(jobs[k].Timestamp) < '1600') {
                                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                        }
                                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                                        var remarks = finalRemarks[0];

                                                                        jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Customer Company : " + jobs[k].CusCompany +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Unit No : " + jobs[k].Unit +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Address : " + jobs[k].Address +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Site : " + jobs[k].Site +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Pests : " + pestIncluded +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Remarks : " + remarks +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Job Type : " + "Maintenance" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />";
                                                                        hasJob = true;
                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }
                                    }

                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 4 PM to 6 PM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap; text-align: center;font-weight: bold;'>" +
                            "4 pm - 6 pm</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '1559' && timeTableFormatter(jobs[k].Timestamp) < '1800') {
                                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                }
                                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                                var remarks = finalRemarks[0];

                                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Customer Company : " + jobs[k].CusCompany +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Unit No : " + jobs[k].Unit +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Address : " + jobs[k].Address +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Site : " + jobs[k].Site +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Pests : " + pestIncluded +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Remarks : " + remarks +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Job Type : " + "Maintenance" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />";
                                                                hasJob = true;
                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '1559' && timeTableFormatter(jobs[k].Timestamp) < '1800') {
                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                    }
                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                    var remarks = finalRemarks[0];
                                                    jobInformation += "ID : " + jobs[k].JobID +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Customer Company : " + jobs[k].Company +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Unit No : " + jobs[k].Unit +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Address : " + jobs[k].Destination +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Site : " + jobs[k].Site +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Pests : " + pestIncluded +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Remarks : " + remarks +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Job Type : " + "Ad-Hoc" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />";
                                                    hasJob = true;
                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '1959' || timeTableDateFormatter(jobs[k].Timestamp) > timestamp) {
                                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                        }
                                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                                        var remarks = finalRemarks[0];

                                                                        jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Customer Company : " + jobs[k].CusCompany +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Unit No : " + jobs[k].Unit +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Address : " + jobs[k].Address +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Site : " + jobs[k].Site +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Pests : " + pestIncluded +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Remarks : " + remarks +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Job Type : " + "Maintenance" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />";
                                                                        hasJob = true;
                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }
                                    }

                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 6 PM to 8 PM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap; text-align: center;font-weight: bold;'>" +
                            "6 pm - 8 pm</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '1759' && timeTableFormatter(jobs[k].Timestamp) < '2000') {
                                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                }
                                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                                var remarks = finalRemarks[0];

                                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Customer Company : " + jobs[k].CusCompany +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Unit No : " + jobs[k].Unit +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Address : " + jobs[k].Address +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Site : " + jobs[k].Site +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Pests : " + pestIncluded +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Remarks : " + remarks +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Job Type : " + "Maintenance" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />";
                                                                hasJob = true;
                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '1759' && timeTableFormatter(jobs[k].Timestamp) < '2000') {
                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                    }
                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                    var remarks = finalRemarks[0];
                                                    jobInformation += "ID : " + jobs[k].JobID +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Customer Company : " + jobs[k].Company +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Unit No : " + jobs[k].Unit +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Address : " + jobs[k].Destination +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Site : " + jobs[k].Site +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Pests : " + pestIncluded +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Remarks : " + remarks +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Job Type : " + "Ad-Hoc" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />";
                                                    hasJob = true;
                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '1959' || timeTableDateFormatter(jobs[k].Timestamp) > timestamp) {
                                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                        }
                                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                                        var remarks = finalRemarks[0];

                                                                        jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Customer Company : " + jobs[k].CusCompany +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Unit No : " + jobs[k].Unit +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Address : " + jobs[k].Address +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Site : " + jobs[k].Site +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Pests : " + pestIncluded +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Remarks : " + remarks +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Job Type : " + "Maintenance" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />";
                                                                        hasJob = true;
                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }
                                    }

                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 8 PM to 4 AM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap; text-align: center;font-weight: bold;'>" +
                            "8 pm - 4 am</td>"
                        
                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '1959' || timeTableDateFormatter(jobs[k].Timestamp) > timestamp) {

                                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                }
                                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                                var remarks = finalRemarks[0];

                                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Customer Company : " + jobs[k].CusCompany +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Unit No : " + jobs[k].Unit +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Address : " + jobs[k].Address +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Site : " + jobs[k].Site +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Pests : " + pestIncluded +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Remarks : " + remarks +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "Job Type : " + "Maintenance" +
                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                    "<br style='mso-data-placement:same-cell;' />";
                                                                hasJob = true;

                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        var dateFormat = "D-MMM-YYYY";
                                        var getTimestamp = $("#dateFrom").val();
                                        var convertTimestamp = moment(getTimestamp, dateFormat);
                                        var timestamp = moment(convertTimestamp).format(dateFormat);

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '1959' || timeTableDateFormatter(jobs[k].Timestamp) > timestamp) {
                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                    }
                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                    var remarks = finalRemarks[0];
                                                    jobInformation += "ID : " + jobs[k].JobID +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Customer Company : " + jobs[k].Company +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Unit No : " + jobs[k].Unit +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Address : " + jobs[k].Destination +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Site : " + jobs[k].Site +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Pests : " + pestIncluded +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Remarks : " + remarks +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Job Type : " + "Ad-Hoc" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />";
                                                    hasJob = true;

                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '1959' || timeTableDateFormatter(jobs[k].Timestamp) > timestamp) {

                                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                        }
                                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                                        var remarks = finalRemarks[0];

                                                                        jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Customer Company : " + jobs[k].CusCompany +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Unit No : " + jobs[k].Unit +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Address : " + jobs[k].Address +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Site : " + jobs[k].Site +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Pests : " + pestIncluded +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Remarks : " + remarks +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Job Type : " + "Maintenance" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />";
                                                                        hasJob = true;

                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }
                                    }

                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }
                    }
                }
            }
        });

    } else {
        console.log(WebAPIJobs)
  
        $.ajax({
            type: 'GET',
            async: false,
            url: acAPI,
            data: {
                get_param: 'value'
            },
            dataType: 'json',
            success: function (data) {

                 console.log("Data Length: " + data.length)
            
                for (var i = 0; i < data.length; i++) {
                   
                    markup += "<th style='font-size: 14px;padding-left: 10px;padding: 10px; width: 400px'>" + data[i].GeneralLocation + "</th>"

                    if (i + 1 == data.length) {
                        markup += "</tr>" +
                            "</thead>" +
                            "<tbody>" +
                            "<tr>"

                        // 4 AM to 8 AM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;text-align: center;font-weight: bold;'>" +
                            "4 am - 8 am</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    //markup += "<td style= 'background-color: white'></td>"
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);


                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                      
                                                           //alert("Maintenance ID: " + jobs[k].MaintenanceJobID + " Timestamp: " + timeTableDateFormatter(jobs[k].Timestamp))
                                                           if (timeTableFormatter(jobs[k].Timestamp) > '0359' && timeTableFormatter(jobs[k].Timestamp) < '0800') {


                                                                    if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                        }

                                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                                        var remarks = finalRemarks[0];

                                                                        jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Customer Company : " + jobs[k].CusCompany +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Unit No : " + jobs[k].Unit +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Address : " + jobs[k].Address +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Site : " + jobs[k].Site +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Pests : " + pestIncluded +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Remarks : " + remarks +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "Job Type : " + "Maintenance" +
                                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                                            "<br style='mso-data-placement:same-cell;' />";
                                                                        hasJob = true;
                                                                    }
                                                                }
                                                            

                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        var dateFormat = "D-MMM-YYYY";
                                        var getTimestamp = $("#dateFrom").val();
                                        var convertTimestamp = moment(getTimestamp, dateFormat);
                                        var timestamp = moment(convertTimestamp).format(dateFormat);

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';

                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableDateFormatter(jobs[k].Timestamp) == timestamp) {
                                                    if (timeTableFormatter(jobs[k].Timestamp) > '0359' && timeTableFormatter(jobs[k].Timestamp) < '0800') {

                                                        if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                            for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                            }

                                                            var finalRemarks = jobs[k].Remarks.split('~');
                                                            var remarks = finalRemarks[0];

                                                            jobInformation += "ID : " + jobs[k].JobID +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Company : " + formtypeFormatter(jobs[k].FormType) +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Customer Company : " + jobs[k].Company +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Unit No : " + jobs[k].Unit +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Address : " + jobs[k].Destination +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Site : " + jobs[k].Site +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Pests : " + pestIncluded +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Remarks : " + remarks +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Job Type : " + "Ad-Hoc" +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "<br style='mso-data-placement:same-cell;' />";
                                                            hasJob = true;
                                                        }
                                                    }
                                                }

                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){

                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" 
                                                //         + jobInformation 
                                                //         + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {

                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableDateFormatter(jobs[k].Timestamp) == timestamp) {
                                                                        if (timeTableFormatter(jobs[k].Timestamp) > '0359' && timeTableFormatter(jobs[k].Timestamp) < '0800') {
                                                                            if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                                }
                                                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                                                var remarks = finalRemarks[0];

                                                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                                    "Customer Company : " + jobs[k].CusCompany +
                                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                                    "Unit No : " + jobs[k].Unit +
                                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                                    "Address : " + jobs[k].Address +
                                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                                    "Site : " + jobs[k].Site +
                                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                                    "Pests : " + pestIncluded +
                                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                                    "Remarks : " + remarks +
                                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                                    "Job Type : " + "Maintenance" +
                                                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                                                    "<br style='mso-data-placement:same-cell;' />";
                                                                                hasJob = true;
                                                                            }
                                                                        }
                                                                    }

                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }

                                    }


                                }
                            });


                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 8 AM to 10 AM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;text-align: center;font-weight: bold;'>" +
                            "8 am - 10 am</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {

                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '0759' && timeTableFormatter(jobs[k].Timestamp) < '1000') {
                                                                if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                    }

                                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                                    var remarks = finalRemarks[0];

                                                                    jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Customer Company : " + jobs[k].CusCompany +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Unit No : " + jobs[k].Unit +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Address : " + jobs[k].Address +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Site : " + jobs[k].Site +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Pests : " + pestIncluded +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Remarks : " + remarks +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Job Type : " + "Maintenance" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />";
                                                                    hasJob = true;
                                                                }
                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '0759' && timeTableFormatter(jobs[k].Timestamp) < '1000') {
                                                    if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                        }
                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                        var remarks = finalRemarks[0];

                                                        jobInformation += "ID : " + jobs[k].JobID +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Company : " + formtypeFormatter(jobs[k].FormType) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Customer Company : " + jobs[k].Company +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Unit No : " + jobs[k].Unit +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Address : " + jobs[k].Destination +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Site : " + jobs[k].Site +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Pests : " + pestIncluded +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Remarks : " + remarks +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Job Type : " + "Ad-Hoc" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />";
                                                        hasJob = true;
                                                    }
                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';

                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '0759' && timeTableFormatter(jobs[k].Timestamp) < '1000') {
                                                                        if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                            for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                                pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                            }
                                                                            var finalRemarks = jobs[k].Remarks.split('~');
                                                                            var remarks = finalRemarks[0];

                                                                            jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Customer Company : " + jobs[k].CusCompany +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Unit No : " + jobs[k].Unit +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Address : " + jobs[k].Address +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Site : " + jobs[k].Site +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Pests : " + pestIncluded +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Remarks : " + remarks +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Job Type : " + "Maintenance" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />";
                                                                            hasJob = true;
                                                                        }
                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }
                                    }


                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 10 AM to 12 PM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap; text-align: center;font-weight: bold;'>" +
                            "10 am - 12 pm</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    //alert(WebAPIMainJobs)

                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';

                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '0959' && timeTableFormatter(jobs[k].Timestamp) < '1200') {
                                                                if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                    }
                                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                                    var remarks = finalRemarks[0];

                                                                    jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Customer Company : " + jobs[k].CusCompany +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Unit No : " + jobs[k].Unit +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Address : " + jobs[k].Address +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Site : " + jobs[k].Site +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Pests : " + pestIncluded +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Remarks : " + remarks +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Job Type : " + "Maintenance" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />";
                                                                    hasJob = true;
                                                                }
                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });

                                    } else {
                                        //alert(WebAPIJobs)
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '0959' && timeTableFormatter(jobs[k].Timestamp) < '1200') {
                                                    if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                        }
                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                        var remarks = finalRemarks[0];

                                                        jobInformation += "ID : " + jobs[k].JobID +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Company : " + formtypeFormatter(jobs[k].FormType) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Customer Company : " + jobs[k].Company +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Unit No : " + jobs[k].Unit +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Address : " + jobs[k].Destination +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Site : " + jobs[k].Site +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Pests : " + pestIncluded +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Remarks : " + remarks +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Job Type : " + "Ad-Hoc" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />";
                                                        hasJob = true;
                                                    }
                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '0959' && timeTableFormatter(jobs[k].Timestamp) < '1200') {
                                                                        if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                            for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                                pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                            }
                                                                            var finalRemarks = jobs[k].Remarks.split('~');
                                                                            var remarks = finalRemarks[0];

                                                                            jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Customer Company : " + jobs[k].CusCompany +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Unit No : " + jobs[k].Unit +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Address : " + jobs[k].Address +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Site : " + jobs[k].Site +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Pests : " + pestIncluded +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Remarks : " + remarks +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Job Type : " + "Maintenance" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />";
                                                                            hasJob = true;
                                                                        }
                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }
                                    }


                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 12 PM to 2 PM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap ; text-align: center;font-weight: bold;'>" +
                            "12 pm - 2 pm</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '1159' && timeTableFormatter(jobs[k].Timestamp) < '1400') {
                                                                if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                    }
                                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                                    var remarks = finalRemarks[0];

                                                                    jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Customer Company : " + jobs[k].CusCompany +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Unit No : " + jobs[k].Unit +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Address : " + jobs[k].Address +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Site : " + jobs[k].Site +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Pests : " + pestIncluded +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Remarks : " + remarks +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Job Type : " + "Maintenance" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />";
                                                                    hasJob = true;
                                                                }
                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '1159' && timeTableFormatter(jobs[k].Timestamp) < '1400') {
                                                    if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                        }
                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                        var remarks = finalRemarks[0];

                                                        jobInformation += "ID : " + jobs[k].JobID +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Company : " + formtypeFormatter(jobs[k].FormType) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Customer Company : " + jobs[k].Company +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Unit No : " + jobs[k].Unit +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Address : " + jobs[k].Destination +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Site : " + jobs[k].Site +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Pests : " + pestIncluded +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Remarks : " + remarks +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Job Type : " + "Ad-Hoc" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />";
                                                        hasJob = true;
                                                    }
                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '1159' && timeTableFormatter(jobs[k].Timestamp) < '1400') {
                                                                        if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                            for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                                pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                            }
                                                                            var finalRemarks = jobs[k].Remarks.split('~');
                                                                            var remarks = finalRemarks[0];

                                                                            jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Customer Company : " + jobs[k].CusCompany +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Unit No : " + jobs[k].Unit +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Address : " + jobs[k].Address +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Site : " + jobs[k].Site +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Pests : " + pestIncluded +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Remarks : " + remarks +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Job Type : " + "Maintenance" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />";
                                                                            hasJob = true;
                                                                        }
                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }
                                    }


                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 2 PM to 4 PM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap; text-align: center;font-weight: bold;'>" +
                            "2 pm - 4 pm</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //arkup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '1359' && timeTableFormatter(jobs[k].Timestamp) < '1600') {
                                                                if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                    }
                                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                                    var remarks = finalRemarks[0];

                                                                    jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Customer Company : " + jobs[k].CusCompany +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Unit No : " + jobs[k].Unit +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Address : " + jobs[k].Address +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Site : " + jobs[k].Site +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Pests : " + pestIncluded +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Remarks : " + remarks +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Job Type : " + "Maintenance" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />";
                                                                    hasJob = true;
                                                                }
                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '1359' && timeTableFormatter(jobs[k].Timestamp) < '1600') {

                                                    if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                        }

                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                        var remarks = finalRemarks[0];

                                                        jobInformation += "ID : " + jobs[k].JobID +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Company : " + formtypeFormatter(jobs[k].FormType) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Customer Company : " + jobs[k].Company +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Unit No : " + jobs[k].Unit +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Address : " + jobs[k].Destination +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Site : " + jobs[k].Site +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Pests : " + pestIncluded +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Remarks : " + remarks +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Job Type : " + "Ad-Hoc" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />";
                                                        hasJob = true;
                                                    }
                                                }
                                            }

                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '1359' && timeTableFormatter(jobs[k].Timestamp) < '1600') {
                                                                        if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                            for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                                pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                            }
                                                                            var finalRemarks = jobs[k].Remarks.split('~');
                                                                            var remarks = finalRemarks[0];

                                                                            jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Customer Company : " + jobs[k].CusCompany +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Unit No : " + jobs[k].Unit +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Address : " + jobs[k].Address +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Site : " + jobs[k].Site +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Pests : " + pestIncluded +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Remarks : " + remarks +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Job Type : " + "Maintenance" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />";
                                                                            hasJob = true;
                                                                        }
                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }
                                    }

                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 4 PM to 6 PM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap; text-align: center;font-weight: bold;'>" +
                            "4 pm - 6 pm</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '1559' && timeTableFormatter(jobs[k].Timestamp) < '1800') {
                                                                if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                    }
                                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                                    var remarks = finalRemarks[0];

                                                                    jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Customer Company : " + jobs[k].CusCompany +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Unit No : " + jobs[k].Unit +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Address : " + jobs[k].Address +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Site : " + jobs[k].Site +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Pests : " + pestIncluded +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Remarks : " + remarks +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Job Type : " + "Maintenance" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />";
                                                                    hasJob = true;
                                                                }
                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '1559' && timeTableFormatter(jobs[k].Timestamp) < '1800') {
                                                    if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                        }
                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                        var remarks = finalRemarks[0];

                                                        jobInformation += "ID : " + jobs[k].JobID +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Company : " + formtypeFormatter(jobs[k].FormType) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Customer Company : " + jobs[k].Company +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Unit No : " + jobs[k].Unit +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Address : " + jobs[k].Destination +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Site : " + jobs[k].Site +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Pests : " + pestIncluded +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Remarks : " + remarks +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Job Type : " + "Ad-Hoc" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />";
                                                        hasJob = true;
                                                    }
                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '1559' && timeTableFormatter(jobs[k].Timestamp) < '1800') {
                                                                        if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                            for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                                pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                            }
                                                                            var finalRemarks = jobs[k].Remarks.split('~');
                                                                            var remarks = finalRemarks[0];

                                                                            jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Customer Company : " + jobs[k].CusCompany +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Unit No : " + jobs[k].Unit +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Address : " + jobs[k].Address +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Site : " + jobs[k].Site +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Pests : " + pestIncluded +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Remarks : " + remarks +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Job Type : " + "Maintenance" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />";
                                                                            hasJob = true;
                                                                        }
                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }
                                    }

                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 6 PM to 8 PM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap; text-align: center;font-weight: bold;'>" +
                            "6 pm - 8 pm</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            if (timeTableFormatter(jobs[k].Timestamp) > '1759' && timeTableFormatter(jobs[k].Timestamp) < '2000') {
                                                                if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                    }
                                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                                    var remarks = finalRemarks[0];

                                                                    jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Customer Company : " + jobs[k].CusCompany +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Unit No : " + jobs[k].Unit +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Address : " + jobs[k].Address +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Site : " + jobs[k].Site +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Pests : " + pestIncluded +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Remarks : " + remarks +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Job Type : " + "Maintenance" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />";
                                                                    hasJob = true;
                                                                }
                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });
                                    } else {
                                        var dateFormat = "D-MMM-YYYY";
                                        var getTimestamp = $("#dateFrom").val();
                                        var convertTimestamp = moment(getTimestamp, dateFormat);
                                        var timestamp = moment(convertTimestamp).format(dateFormat);

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                if (timeTableDateFormatter(jobs[k].Timestamp) == timestamp) {
                                                    if (timeTableFormatter(jobs[k].Timestamp) > '1759' && timeTableFormatter(jobs[k].Timestamp) < '2000') {
                                                        if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                            for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                            }
                                                            var finalRemarks = jobs[k].Remarks.split('~');
                                                            var remarks = finalRemarks[0];

                                                            jobInformation += "ID : " + jobs[k].JobID +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Company : " + formtypeFormatter(jobs[k].FormType) +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Customer Company : " + jobs[k].Company +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Unit No : " + jobs[k].Unit +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Address : " + jobs[k].Destination +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Site : " + jobs[k].Site +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Pests : " + pestIncluded +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Remarks : " + remarks +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "Job Type : " + "Ad-Hoc" +
                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                "<br style='mso-data-placement:same-cell;' />";
                                                            hasJob = true;
                                                        }
                                                    }
                                                }

                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '1759' && timeTableFormatter(jobs[k].Timestamp) < '2000') {
                                                                        if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                            for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                                pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                            }
                                                                            var finalRemarks = jobs[k].Remarks.split('~');
                                                                            var remarks = finalRemarks[0];

                                                                            jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Customer Company : " + jobs[k].CusCompany +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Unit No : " + jobs[k].Unit +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Address : " + jobs[k].Address +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Site : " + jobs[k].Site +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Pests : " + pestIncluded +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Remarks : " + remarks +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Job Type : " + "Maintenance" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />";
                                                                            hasJob = true;
                                                                        }
                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });
                                            }
                                        }
                                    }

                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }

                        // 8 PM to 4 AM
                        markup += "<td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap; text-align: center;font-weight: bold;'>" +
                            "8 pm - 4 am</td>"

                        for (var j = 0; j < data.length; j++) {

                            var hasJob = false;
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        //markup += "<td style='font-size: 10px'></td>"
                                        $.ajax({
                                            type: 'GET',
                                            async: false,
                                            url: WebAPIMainJobs,
                                            data: {
                                                get_param: 'value'
                                            },
                                            dataType: 'json',
                                            success: function (jobs) {
                                                //var jobInformation = '';
                                                if (jobs.length <= 0) {
                                                    if (hasJob) {
                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                        //console.log("Job : True at " + jobInformation);
                                                    } else {
                                                        markup += "<td style='font-size: 10px'></td>"
                                                        //console.log("Job : False");
                                                    }

                                                } else {
                                                    var dateFormat = "D-MMM-YYYY";
                                                    var getTimestamp = $("#dateFrom").val();
                                                    var convertTimestamp = moment(getTimestamp, dateFormat);
                                                    var timestamp = moment(convertTimestamp).format(dateFormat);

                                                    for (var k = 0; k < jobs.length; k++) {
                                                        var pestIncluded = '';
                                                        if (getGroup == jobs[k].Groups) {
                                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                            //if (jobs[k].MaintenanceJobID == 29612) alert("Maintenance ID: " + jobs[k].MaintenanceJobID + " Timestamp: " + timeTableDateFormatter(jobs[k].Timestamp))
                                                            //if (jobs[k].MaintenanceJobID == 83048) alert('Timestamp: ' + timestamp + ' Date: ' + timeTableDateFormatter(jobs[k].Timestamp))

                                                            if (timeTableFormatter(jobs[k].Timestamp) > '1959' == true && timestamp > timeTableDateFormatter(jobs[k].Timestamp) == false) {
                                                            //if (timeTableFormatter(jobs[k].Timestamp) > '1959' || timeTableFormatter(jobs[k].Timestamp) > timestamp) {
                                                                
                                                                if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                    }
                                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                                    var remarks = finalRemarks[0];

                                                                    jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Customer Company : " + jobs[k].CusCompany +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Unit No : " + jobs[k].Unit +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Address : " + jobs[k].Address +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Site : " + jobs[k].Site +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Pests : " + pestIncluded +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Remarks : " + remarks +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "Job Type : " + "Maintenance" +
                                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                                        "<br style='mso-data-placement:same-cell;' />";
                                                                    hasJob = true;
                                                                }

                                                            }
                                                        }


                                                        if (k + 1 == jobs.length) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }
                                                        }
                                                    }
                                                }

                                            }
                                        });

                                    } else {
                                        var dateFormat = "D-MMM-YYYY";
                                        var getTimestamp = $("#dateFrom").val();
                                        var convertTimestamp = moment(getTimestamp, dateFormat);
                                        var timestamp = moment(convertTimestamp).format(dateFormat);

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (getGroup == jobs[k].Groups) {
                                                //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                if (timeTableFormatter(jobs[k].Timestamp) > '1959' || timeTableDateFormatter(jobs[k].Timestamp) > timestamp) {
                                                    if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                        for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                            pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                        }
                                                        var finalRemarks = jobs[k].Remarks.split('~');
                                                        var remarks = finalRemarks[0];

                                                        jobInformation += "ID : " + jobs[k].JobID +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Company : " + formtypeFormatter(jobs[k].FormType) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Customer Company : " + jobs[k].Company +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Unit No : " + jobs[k].Unit +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Address : " + jobs[k].Destination +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Site : " + jobs[k].Site +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Pests : " + pestIncluded +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Remarks : " + remarks +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Technician : " + "<span id=driverTable onclick=changeDriver(" + jobs[k].JobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "Job Type : " + "Ad-Hoc" +
                                                            "<br style='mso-data-placement:same-cell;' />" +
                                                            "<br style='mso-data-placement:same-cell;' />";
                                                        hasJob = true;

                                                        //alert(jobInformation)
                                                    }

                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                // if(hasJob){
                                                //     markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                //     //console.log("Job : True at " + jobInformation);
                                                // }else{
                                                //     markup += "<td style='font-size: 10px'></td>"
                                                //     //console.log("Job : False");
                                                // }

                                                $.ajax({
                                                    type: 'GET',
                                                    async: false,
                                                    url: WebAPIMainJobs,
                                                    data: {
                                                        get_param: 'value'
                                                    },
                                                    dataType: 'json',
                                                    success: function (jobs) {
                                                        //var jobInformation = '';
                                                        if (jobs.length <= 0) {
                                                            if (hasJob) {
                                                                markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                //console.log("Job : True at " + jobInformation);
                                                            } else {
                                                                markup += "<td style='font-size: 10px'></td>"
                                                                //console.log("Job : False");
                                                            }

                                                        } else {
                                                            var dateFormat = "D-MMM-YYYY";
                                                            var getTimestamp = $("#dateFrom").val();
                                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                                            var timestamp = moment(convertTimestamp).format(dateFormat);

                                                            for (var k = 0; k < jobs.length; k++) {
                                                                var pestIncluded = '';
                                                                if (getGroup == jobs[k].Groups) {
                                                                    //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                                                    if (timeTableFormatter(jobs[k].Timestamp) > '1959' || timeTableDateFormatter(jobs[k].Timestamp) > timestamp) {
                                                                        if (jobs[k].GeneralLocation == data[j].GeneralLocation) {
                                                                            for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                                                pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                                            }
                                                                            var finalRemarks = jobs[k].Remarks.split('~');
                                                                            var remarks = finalRemarks[0];

                                                                            jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Customer Company : " + jobs[k].CusCompany +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Unit No : " + jobs[k].Unit +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Address : " + jobs[k].Address +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Site : " + jobs[k].Site +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Pests : " + pestIncluded +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Remarks : " + remarks +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "Job Type : " + "Maintenance" +
                                                                                "<br style='mso-data-placement:same-cell;' />" +
                                                                                "<br style='mso-data-placement:same-cell;' />";
                                                                            hasJob = true;
                                                                        }

                                                                    }
                                                                }


                                                                if (k + 1 == jobs.length) {
                                                                    if (hasJob) {
                                                                        markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                                        //console.log("Job : True at " + jobInformation);
                                                                    } else {
                                                                        markup += "<td style='font-size: 10px'></td>"
                                                                        //console.log("Job : False");
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                });

                                            }
                                        }
                                    }

                                }
                            });

                            if (j + 1 == data.length) {

                                markup += "</tr>"
                            }
                        }
                    }
                }


  

            }
        });
    }

    markup += "</tbody></table>" + "</div>";

    if (markup !== undefined || markup !== null) $('#job-area-table').html(markup);
    //$('#JobAreaExcel').show();
    //$('#JobTechnicianExcel').hide();
    $('#JobMainAreaExcel').hide();
    $('#JobMainTechnicianExcel').hide();


}

function formtypeFormatter(value, row, index) {

    var text = "";

    if (value == 1) {
        text = 'System Pest Singapore'
    } else if (value == 2) {
        text = 'System Pest Malaysia'
    } else if (value == 3) {
        text = 'Asia White Ant'
    }

    return text;
}

//Web Api Driver

$(function () {

    //Populate phone user
    var WebAPIDriver = "";

    if (getSessionstorageValueRoleID == 1) {
        WebAPIDriver = 'https://webapi.systempest.com/api/driverinfo?ResellerID=' + '1' + '&CompanyID=' + '1';
    } else if (getSessionstorageValueRoleID == 2) {
        WebAPIDriver = 'https://webapi.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {
        WebAPIDriver = 'https://webapi.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }

    //alert(WebAPIDriver)

    $('#jobTechnician').append($('<option selected="selected"></option>').val(0).html("No Technician Selected"));
    $.getJSON(WebAPIDriver, function (data) {
        $.each(data, function (index, item) {

            if (item.AssetID > 0) {
                $('#jobTechnician').append($('<option data-technician="' + item.Technician + '"></option>').val(item.DriverID).html(item.Name));

            } else {
                $('#jobTechnician').append($('<option data-technician="' + item.Technician + '"></option>').val(item.DriverID).html(item.Name));
            }
        });

        $('.selectpicker').selectpicker('refresh');
    });

    $('#jobMainTechnician').append($('<option selected="selected"></option>').val(0).html("No Technician Selected"));
    $.getJSON(WebAPIDriver, function (data) {
        $.each(data, function (index, item) {

            if (item.AssetID > 0) {
                $('#jobMainTechnician').append($('<option data-technician="' + item.Technician + '"></option>').val(item.DriverID).html(item.Name));

            } else {
                $('#jobMainTechnician').append($('<option data-technician="' + item.Technician + '"></option>').val(item.DriverID).html(item.Name));
            }
        });

        $('.selectpicker').selectpicker('refresh');
    });

});

function driverFormatter(value) {

    var text;

    if (value == null || value == '') text = "No Technician";
    else text = value;


    return text;

}

function changeDriver(jobid) {
    //alert(jobid);

    $('#TableFormDriver').modal("show");

    var getJobID = $('#tableJobID').val(jobid);

    var WebAPIJob = '';
    WebAPIJobs = 'https://webapi.systempest.com/api/jobinfo/' + jobid;

    //alert(WebAPIJobs);

    $.ajax({
        type: 'GET',
        async: false,
        url: WebAPIJobs,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (data) {
            //alert(data.Timestamp)
            var dateTimestamp = moment(data.Timestamp).add('hours', 8).format('DD-MMM-YYYY');
            var timestamp = moment(data.Timestamp).add('hours', 8).format('DD-MMM-YYYY HH:mm:ss A');
            var currentDate = moment().format('DD-MMM-YYYY');

            $('#jobDate').val(timestamp);
            $('#jobTechnician').val(data.DriverID);
            $('.selectpicker').selectpicker('refresh');
        }
    });

}

function changeMainDriver(jobid) {
    //alert(jobid);

    $('#TableFormMainDriver').modal("show");

    var getJobID = $('#tableMainJobID').val(jobid);

    var WebAPIJob = '';
    WebAPIJobs = 'https://webapi.systempest.com/api/maintenancejobinfo/' + jobid;

    //alert(WebAPIJobs);

    $.ajax({
        type: 'GET',
        async: false,
        url: WebAPIJobs,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (data) {
            //alert(data.Timestamp)
            var dateTimestamp = moment(data.Timestamp).add('hours', 8).format('DD-MMM-YYYY');
            var timestamp = moment(data.Timestamp).add('hours', 8).format('DD-MMM-YYYY HH:mm:ss A');
            var currentDate = moment().format('DD-MMM-YYYY');

            $('#jobMainDate').val(timestamp);
            $('#jobMainTechnician').val(data.DriverID);
            $('.selectpicker').selectpicker('refresh');
        }
    });

}

function GenerateTechnicianTable() {
    //technician table

    var acAPI = '';

    if (getSessionstorageValueCompanyID == 1) {

        acAPI = 'https://webapi.systempest.com/api/acinfo?Groups=' + $('#load-groups').val();

    } else if (getSessionstorageValueCompanyID == 2) {

        acAPI = 'https://webapi.systempest.com/api/acmyinfo?Groups=' + $('#load-groups').val();

    } else if (getSessionstorageValueCompanyID == 3) {

        acAPI = 'https://webapi.systempest.com/api/acinfo?Groups=' + $('#load-groups').val();

    } else {

        acAPI = 'https://webapi.systempest.com/api/acinfo?Groups=' + $('#load-groups').val();

    }

    var markup = "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto;'>" +
        "<table id='technicianTable' class='table table-bordered' cellspacing='0' style='width:100%'>" +
        "<thead>" +
        "<tr>" +
        "<th style='font-size: 14px; padding-left: 10px;padding: 10px; white-space: nowrap;'> </th>" +
        "<th style='font-size: 14px; padding-left: 10px;padding: 10px; white-space: nowrap'>4 am - 8 am</th>" +
        "<th style='font-size: 14px; padding-left: 10px;padding: 10px; white-space: nowrap'>8 am - 10 am</th>" +
        "<th style='font-size: 14px; padding-left: 10px;padding: 10px; white-space: nowrap'>10 am - 12 pm</th>" +
        "<th style='font-size: 14px; padding-left: 10px;padding: 10px; white-space: nowrap'>12 pm - 2 pm</th>" +
        "<th style='font-size: 14px; padding-left: 10px;padding: 10px; white-space: nowrap'>2 pm - 4 pm</th>" +
        "<th style='font-size: 14px; padding-left: 10px;padding: 10px; white-space: nowrap'>4 pm - 6 pm</th>" +
        "<th style='font-size: 14px; padding-left: 10px;padding: 10px; white-space: nowrap'>6 pm - 8 pm</th>" +
        "<th style='font-size: 14px; padding-left: 10px;padding: 10px; white-space: nowrap'>8 pm - 4 am</th>" +
        "</tr>" +
        "</thead>" +
        "<tbody>"
    var WebAPIDriver = "";

    if (getSessionstorageValueRoleID == 1) {
        WebAPIDriver = 'https://webapi.systempest.com/api/driverinfo?ResellerID=' + '1' + '&CompanyID=' + '1';
    } else if (getSessionstorageValueRoleID == 2) {
        WebAPIDriver = 'https://webapi.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {
        WebAPIDriver = 'https://webapi.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }

    console.log(WebAPIDriver)
    //var timestamp = moment().format('D-MMM-YYYY');
    //var rxtime = moment().add('days', 1).format('D-MMM-YYYY');

    var dateFormat = "D-MMM-YYYY, HH:mm:ss";
    var getTimestamp = $("#dateFrom").val();
    var convertTimestamp = moment(getTimestamp, dateFormat);
    var convertRxtime = moment(getTimestamp, dateFormat);
    var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
    var rxtime = moment(convertRxtime).add('hours', 22).format(dateFormat);

    if (getSessionstorageValueCompanyID == 2) {
            $.ajax({
            type: 'GET',
            async: false,
            url: WebAPIDriver,
            data: {
                get_param: 'value'
            },
            dataType: 'json',
            success: function (data) {
                //console.log(data.length)
                for (var i = 0; i < data.length; i++) {
                    markup += "<tr><td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap;text-align: center;font-weight: bold;'>" +
                        data[i].Name + "</td>"

                    for (var q = 0; q < 8; q++) {
                        if (q == 0) {
                            var hasJob = false;
                            var jobInformation = '';

                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {
                                        var dateFormat = "D-MMM-YYYY";
                                        var getTimestamp = $("#dateFrom").val();
                                        var convertTimestamp = moment(getTimestamp, dateFormat);
                                        var checkTimestamp = moment(convertTimestamp).format(dateFormat);

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                            if (timeTableDateFormatter(jobs[k].Timestamp) == checkTimestamp) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '0359' && timeTableFormatter(jobs[k].Timestamp) < '0800') {
                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                    }
                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                    var remarks = finalRemarks[0];

                                                    jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Customer Company : " + jobs[k].CusCompany +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Unit No : " + jobs[k].Unit +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Address : " + jobs[k].Address +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Site : " + jobs[k].Site +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Pests : " + pestIncluded +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Remarks : " + remarks +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Job Type : " + "Maintenance" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />";
                                                    hasJob = true;
                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 1) {
                            var hasJob = false;
                            var jobInformation = '';
                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (timeTableFormatter(jobs[k].Timestamp) > '0759' && timeTableFormatter(jobs[k].Timestamp) < '1000') {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;
                                            }


                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }

                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 2) {
                            var hasJob = false;
                            var jobInformation = '';
                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (timeTableFormatter(jobs[k].Timestamp) > '0959' && timeTableFormatter(jobs[k].Timestamp) < '1200') {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;
                                            }

                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 3) {
                            var hasJob = false;
                            var jobInformation = '';
                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (timeTableFormatter(jobs[k].Timestamp) > '1159' && timeTableFormatter(jobs[k].Timestamp) < '1400') {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;
                                            }


                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });
                        } else if (q == 4) {
                            var hasJob = false;
                            var jobInformation = '';
                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                            if (timeTableFormatter(jobs[k].Timestamp) > '1359' && timeTableFormatter(jobs[k].Timestamp) < '1600') {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;
                                            }


                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 5) {
                            var hasJob = false;
                            var jobInformation = '';
                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (timeTableFormatter(jobs[k].Timestamp) > '1559' && timeTableFormatter(jobs[k].Timestamp) < '1800') {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;
                                            }


                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 6) {
                            var hasJob = false;
                            var jobInformation = '';
                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (timeTableFormatter(jobs[k].Timestamp) > '1759' && timeTableFormatter(jobs[k].Timestamp) < '2000') {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;
                                            }


                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 7) {
                            var hasJob = false;
                            var jobInformation = '';


                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {
                                        var dateFormat = "D-MMM-YYYY";
                                        var getTimestamp = $("#dateFrom").val();
                                        var convertTimestamp = moment(getTimestamp, dateFormat);
                                        var checkTimestamp = moment(convertTimestamp).format(dateFormat);

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            //#1
                                            if (timeTableFormatter(jobs[k].Timestamp) > '1959' || timeTableDateFormatter(jobs[k].Timestamp) > checkTimestamp) {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;

                                            }

                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        }
                    }

                }

            }
        });
    } else {

        $.ajax({
            type: 'GET',
            async: false,
            url: WebAPIDriver,
            data: {
                get_param: 'value'
            },
            dataType: 'json',
            success: function (data) {
                //console.log(data.length)
                for (var i = 0; i < data.length; i++) {
                    markup += "<tr><td style='font-size: 14px;padding: 10px; width:auto;white-space:nowrap;text-align: center;font-weight: bold;'>" +
                        data[i].Name + "</td>"

                    var q = 0, len = 8;
                    while (q < len) {
                        // your code

                        if (q == 0) {
                            var hasJob = false;
                            var jobInformation = '';

                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;
                            console.log(WebAPIMainJobs)
                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {

                                    console.log()
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {
                                        var dateFormat = "D-MMM-YYYY";
                                        var getTimestamp = $("#dateFrom").val();
                                        var convertTimestamp = moment(getTimestamp, dateFormat);
                                        var checkTimestamp = moment(convertTimestamp).format(dateFormat);

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                            if (timeTableDateFormatter(jobs[k].Timestamp) == checkTimestamp) {
                                                if (timeTableFormatter(jobs[k].Timestamp) > '0359' && timeTableFormatter(jobs[k].Timestamp) < '0800') {
                                                    for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                        pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                    }
                                                    var finalRemarks = jobs[k].Remarks.split('~');
                                                    var remarks = finalRemarks[0];

                                                    jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Customer Company : " + jobs[k].CusCompany +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Unit No : " + jobs[k].Unit +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Address : " + jobs[k].Address +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Site : " + jobs[k].Site +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Pests : " + pestIncluded +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Remarks : " + remarks +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "Job Type : " + "Maintenance" +
                                                        "<br style='mso-data-placement:same-cell;' />" +
                                                        "<br style='mso-data-placement:same-cell;' />";
                                                    hasJob = true;
                                                }
                                            }


                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 1) {
                            var hasJob = false;
                            var jobInformation = '';
                            //alert(jobs.length)
                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (timeTableFormatter(jobs[k].Timestamp) > '0759' && timeTableFormatter(jobs[k].Timestamp) < '1000') {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;
                                            }


                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }

                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 2) {
                            var hasJob = false;
                            var jobInformation = '';
                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {
                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (timeTableFormatter(jobs[k].Timestamp) > '0959' && timeTableFormatter(jobs[k].Timestamp) < '1200') {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;
                                            }

                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 3) {
                            var hasJob = false;
                            var jobInformation = '';
                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (timeTableFormatter(jobs[k].Timestamp) > '1159' && timeTableFormatter(jobs[k].Timestamp) < '1400') {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;
                                            }


                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 4) {
                            var hasJob = false;
                            var jobInformation = '';
                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            //alert(timeTableDateFormatter(jobs[k].Timestamp) + ', ' + timestamp)
                                            if (timeTableFormatter(jobs[k].Timestamp) > '1359' && timeTableFormatter(jobs[k].Timestamp) < '1600') {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;
                                            }


                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 5) {
                            var hasJob = false;
                            var jobInformation = '';

                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (timeTableFormatter(jobs[k].Timestamp) > '1559' && timeTableFormatter(jobs[k].Timestamp) < '1800') {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;
                                            }


                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 6) {
                            var hasJob = false;
                            var jobInformation = '';
                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (timeTableFormatter(jobs[k].Timestamp) > '1759' && timeTableFormatter(jobs[k].Timestamp) < '2000') {
                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;
                                            }


                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        } else if (q == 7) {
                            var hasJob = false;
                            var jobInformation = '';
                            var WebAPIMainJobs = 'https://webapi.systempest.com/api/maintenancejobdateinfo?AssetCompanyID=' + getSessionstorageValueCompanyID + '&Timestamp=' + timestamp + '&RxTime=' + rxtime + '&DriverID=' + data[i].DriverID;

                            $.ajax({
                                type: 'GET',
                                async: false,
                                url: WebAPIMainJobs,
                                data: {
                                    get_param: 'value'
                                },
                                dataType: 'json',
                                success: function (jobs) {
                                    //var jobInformation = '';
                                    if (jobs.length <= 0) {
                                        if (hasJob) {
                                            markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                            //console.log("Job : True at " + jobInformation);
                                        } else {
                                            markup += "<td style='font-size: 10px'></td>"
                                            //console.log("Job : False");
                                        }

                                    } else {
                                        var dateFormat = "D-MMM-YYYY";
                                        var getTimestamp = $("#dateFrom").val();
                                        var convertTimestamp = moment(getTimestamp, dateFormat);
                                        var checkTimestamp = moment(convertTimestamp).format(dateFormat);

                                        for (var k = 0; k < jobs.length; k++) {
                                            var pestIncluded = '';
                                            if (timeTableFormatter(jobs[k].Timestamp) > '1959' || timeTableDateFormatter(jobs[k].Timestamp) > checkTimestamp) {

                                                for (var p = 0; p < jobs[k].Pest.length; p++) {
                                                    pestIncluded += jobs[k].Pest[p].PestDesc + " "
                                                }
                                                var finalRemarks = jobs[k].Remarks.split('~');
                                                var remarks = finalRemarks[0];

                                                jobInformation += "ID : " + jobs[k].MaintenanceJobID +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Company : " + formtypeFormatter(jobs[k].AssetCompanyID) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Time : " + timeTableDisplayFormatter(jobs[k].Timestamp) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Customer Company : " + jobs[k].CusCompany +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Unit No : " + jobs[k].Unit +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Address : " + jobs[k].Address +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Site : " + jobs[k].Site +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Pests : " + pestIncluded +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Remarks : " + remarks +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Technician : " + "<span id=driverTable onclick=changeMainDriver(" + jobs[k].MaintenanceJobID + ") style='color: blue;'>" + driverFormatter(jobs[k].DriverName) + "</span>" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />" + "Status : " + statusFormatter(jobs[k].FlagValue) +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "Job Type : " + "Maintenance" +
                                                    "<br style='mso-data-placement:same-cell;' />" +
                                                    "<br style='mso-data-placement:same-cell;' />";
                                                hasJob = true;

                                            }

                                            if (k + 1 == jobs.length) {
                                                if (hasJob) {
                                                    markup += "<td style='font-size: 10px;padding: 5px;'>" + jobInformation + "</td>"
                                                    //console.log("Job : True at " + jobInformation);
                                                } else {
                                                    markup += "<td style='font-size: 10px'></td>"
                                                    //console.log("Job : False");
                                                }
                                            }
                                        }
                                    }

                                }
                            });

                        }

                        q++
                    }


                }

            }
        });

    }

    markup += "</tbody></table>" + "</div>";

    if (markup !== undefined || markup !== null) $('#job-technician-table').html(markup);
    //$('#JobAreaExcel').hide();
    //$('#JobTechnicianExcel').show();
    $('#JobMainAreaExcel').hide();
    $('#JobMainTechnicianExcel').hide();
}



//OnChange Filter
$(document).ready(function () {


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

    $('.SelectJobType').on('change', function () {

        $('#job-technician-table').hide();
        $('#job-area-table').hide();
        //$('#JobAreaExcel').hide();
        //$('#JobTechnicianExcel').hide();
        $('#job-main-technician-table').hide();
        $('#job-main-area-table').hide();
        $('#JobMainAreaExcel').hide();
        $('#JobMainTechnicianExcel').hide();
        $('#groupDiv').hide();
        $('#load-category').val(0);
        $('#load-groups').val(0);
        $('.selectpicker').selectpicker('refresh')

        selectedJobType = $(this).find("option:selected").val();
        if (selectedJobType == 0) {
            $('#categoryDiv').show();

        } else {
            $('#categoryDiv').show();
        }
    });

    $('.SelectCategory').on('change', function () {

        selectedCategory = $(this).find("option:selected").val();
        $('#divAreaExcel').hide();
        $('#divTechnicianExcel').hide();

        if (selectedCategory == 1) {
            $('#job-technician-table').hide();
            $('#job-area-table').show();
            //$('#JobAreaExcel').show();
            //$('#JobTechnicianExcel').hide();
            $('#groupDiv').show();
            $('#historyAssets').hide();
            $('#historyDriver').hide();
            //$('#divAreaExcel').show();
            //$('#divTechnicianExcel').hide();
            $('#job-main-technician-table').hide();
            $('#job-main-area-table').hide();
            $('#JobMainAreaExcel').hide();
            $('#JobMainTechnicianExcel').hide();
            $('#load-groups').val(0);
            $('.selectpicker').selectpicker('refresh')
            $('#job-technician-table').empty();

        } else if (selectedCategory == 2) {
            $('#job-area-table').hide();
            $('#job-technician-table').show();
            //$('#JobAreaExcel').hide();
            //$('#JobTechnicianExcel').show();
            //$('#divAreaExcel').hide();
            //$('#divTechnicianExcel').show();
            $('#groupDiv').hide();
            $('#historyAssets').hide();
            $('#historyDriver').hide();

            $('#job-main-technician-table').hide();
            $('#job-main-area-table').hide();
            $('#JobMainAreaExcel').hide();
            $('#JobMainTechnicianExcel').hide();

            $('#job-area-table').empty();

        } else {
            $('#job-technician-table').hide();
            $('#job-area-table').hide();
            //$('#JobAreaExcel').hide();
            //$('#JobTechnicianExcel').hide();
            $('#groupDiv').hide();
            $('#historyAssets').hide();
            $('#historyDriver').hide();
            //$('#divAreaExcel').hide();
            //$('#divTechnicianExcel').hide();

            $('#job-main-technician-table').hide();
            $('#job-main-area-table').hide();
            $('#JobMainAreaExcel').hide();
            $('#JobMainTechnicianExcel').hide();

            $('#job-technician-table').empty();
            $('#job-area-table').empty();
        }

    });

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

//Storage
$(document).ready(function () {


    try {

        $('#load-category').val(0);
        $('#load-jobtype').val(1);
        $('#categoryDiv').show();
        $('.selectpicker').selectpicker('refresh')

        var getAsset = $("#load-assets").val();
        var getCompany = $("#load-company").val();
        var getReseller = $("#load-reseller").val();

        localStorage.setItem("setLocalstorageValueAsset", getAsset);
        localStorage.setItem("setLocalstorageValueCompany", getCompany);
        localStorage.setItem("setLocalstorageValueReseller", getReseller);

        var getLocalstorageValueAsset = localStorage.getItem('setLocalstorageValueAsset');
        var getLocalstorageValueCompany = localStorage.getItem('setLocalstorageValueCompany');
        var getLocalstorageValueReseller = localStorage.getItem('setLocalstorageValueReseller');

    } catch (e) {

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
        window.location.href = 'https://portal.systempest.com/'; //Login URL
        //window.location.href = '/'; //Login URL

    } else {


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
            } else if (filetype == "css") { //if filename is an external CSS file
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



$(function () {

    $('.tgl-menu-btn').click(function () {

        setTimeout(function () {
            $('#jobs-editable').bootstrapTable('resetView');

        }, 500);


    });



});


window.onresize = function (event) {
    setTimeout(function () {
        $('#jobs-editable').bootstrapTable('resetView');

    }, 500);
};

//Translation of Forms
if (getSessionstorageValueLanguage == "en") {
    $("#job").text("Jobs");
    $("#clickGenerateEN").text("Generate");
    $("#JobExportWordEN").text("Word");
    $("#JobExportPDFEN").text("PDF");
    $("#JobExportExcelEN").text("Excel");
    $("#job-confirm-deleteEN").text("Delete");
    $("#add").text("Add Job");
    $("#edit").text("Edit Jobs");

    $("#scheduletime").text("Schedule Time");
    $("#jobNumber").text("Job Number");
    $("#addressName").text("Address");
    $("#unitName").text("Unit");
    $("#postalCode").text("Postal");
    $("#companyName").text("Company");
    $("#picName").text("Person In Charge");
    $("#contactNumber").text("Contact Number");
    $("#remarksCo").text("Remarks");
    $("#jobAmount").text("Amount");
    $("#resellerName").text("Reseller");

    $('#destination').attr('placeholder', 'Destination');
    $('#unit').attr('placeholder', 'Unit Nos.');
    $('#postal').attr('placeholder', 'Postal Code');
    $('#company-destination').attr('placeholder', 'Company');
    $('#pic').attr('placeholder', 'Person In Charge');
    $('#phone').attr('placeholder', 'Contact Number');
    $('#remarks').attr('placeholder', 'Remarks');

    $("#submit-job").text("Submit");
    $("#cancel-job").text("Cancel");
    $("#new").text("New Jobs");
    $("#inprogress").text("In Progress");
    $("#completed").text("Completed");

} else if (getSessionstorageValueLanguage == "th") {
    $("#job").text("งาน");
    $("#clickGenerateEN").text("ตั้งค่าใหม่");
    $("#JobExportWordEN").text("ไมโครซอฟท์ คำ");
    $("#JobExportPDFEN").text("รูปแบบไฟล์ PDF");
    $("#JobExportExcelEN").text("ไมโครซอฟท์ Excel");
    $("#job-confirm-deleteEN").text("ลบ");
    $("#add").text("เพิ่ม");
    $("#edit").text("แก้ไข");

    $("#scheduletime").text("กำหนดเวลา");
    $("#jobNumber").text("หมายเลขงาน");
    $("#addressName").text("ที่อยู่");
    $("#unitName").text("หน่วย");
    $("#postalCode").text("ไปรษณีย์");
    $("#companyName").text("บริษัท");
    $("#picName").text("ผู้รับผิดชอบในการปฎิบัติหน้าที่");
    $("#contactNumber").text("เบอร์ติดต่อ");
    $("#remarksCo").text("หมายเหตุ");
    $("#jobAmount").text("จำนวนเงิน");
    $("#resellerName").text("ผู้ค้าปลีกc");

    $('#destination').attr('placeholder', 'ที่อยู่');
    $('#unit').attr('placeholder', 'หน่วย.');
    $('#postal').attr('placeholder', 'ไปรษณีย์');
    $('#company-destination').attr('placeholder', 'บริษัท');
    $('#pic').attr('placeholder', 'ผู้รับผิดชอบในการปฎิบัติหน้าที่');
    $('#phone').attr('placeholder', 'เบอร์ติดต่อ');
    $('#remarks').attr('placeholder', 'หมายเหตุ');

    $("#submit-job").text("ส่ง");
    $("#cancel-job").text("ยกเลิก");
    $("#new").text("ใหม่");
    $("#inprogress").text("กำลังดำเนินการ");
    $("#completed").text("เสร็จ");

} else if (getSessionstorageValueLanguage == "vn") {
    $("#job").text("Việc Làm");
    $("#clickGenerateEN").text("Đặt Lại");
    $("#JobExportWordEN").text("Xuất Word");
    $("#JobExportPDFEN").text("Xuất PDF");
    $("#JobExportExcelEN").text("Xuất Excel");
    $("#job-confirm-deleteEN").text("Xóa");
    $("#add").text("Thêm Vào");
    $("#edit").text("Diều Khiển");

    $("#scheduletime").text("Lịch Trình");
    $("#jobNumber").text("Công Việc Số");
    $("#addressName").text("Địa Chỉ");
    $("#unitName").text("Đơn Vị Nos");
    $("#postalCode").text("Mã Postal");
    $("#companyName").text("Công Ty");
    $("#picName").text("Người Phụ Trách");
    $("#contactNumber").text("Số ĐT Liên Hệ");
    $("#remarksCo").text("Nhận Xét");
    $("#jobAmount").text("Số Lượng");
    $("#resellerName").text("Người Bán Lại");

    $('#destination').attr('placeholder', 'Địa Chỉ');
    $('#postal').attr('placeholder', 'Mã Postal');
    $('#company-destination').attr('placeholder', 'Công Ty');
    $('#pic').attr('placeholder', 'Người Phụ Trách');
    $('#phone').attr('placeholder', 'Số ĐT Liên Hệ');
    $('#remarks').attr('placeholder', 'Nhận Xét');

    $("#submit-job").text("Lưu");
    $("#cancel-job").text("Hủy");
    $("#new").text("Mới");
    $("#inprogress").text("Trong Tiến Trình");
    $("#completed").text("Đã Hoàn Thành");
} else if (getSessionstorageValueLanguage == "id") {
    $("#job").text("Kerja");
    $("#clickGenerateEN").text("Semula");
    $("#JobExportWordEN").text("Ekspor ke Word");
    $("#JobExportPDFEN").text("Ekspor ke PDF");
    $("#JobExportExcelEN").text("Ekspor ke Excel");
    $("#job-confirm-deleteEN").text("Hapus Rekor");
    $("#add").text("Tambahan Kerja");
    $("#edit").text("Mengedit");

    $("#scheduletime").text("Jadwal Waktu");
    $("#jobNumber").text("Nomor Kerja");
    $("#addressName").text("Alamat");
    $("#unitName").text("Unit Nos");
    $("#postalCode").text("Pos Kode");
    $("#companyName").text("Perusahaan");
    $("#picName").text("Orang In Charge");
    $("#contactNumber").text("Nomor Kontak");
    $("#remarksCo").text("Keterangan");
    $("#jobAmount").text("Jumlah");
    $("#resellerName").text("Pengecer");

    $('#destination').attr('placeholder', 'Alamat');
    $('#unit').attr('placeholder', 'Unit Nos.');
    $('#postal').attr('placeholder', 'Pos Kode');
    $('#company-destination').attr('placeholder', 'Perusahaan');
    $('#personInChanrge').attr('placeholder', 'Orang In Charge');
    $('#phone').attr('placeholder', 'Nomor Kontak');
    $('#remarks').attr('placeholder', 'Keterangan');

    $("#submit-job").text("Serah");
    $("#cancel-job").text("Batal");
    $("#new").text("Kerja Baru");
    $("#inprogress").text("Sedang Berlangsung");
    $("#completed").text("Selesai");
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
        error: function () {
            alert('error');
        }
    });


    //Then retrieve
    var version = localStorage.getItem('setLocalstorageValueSoftware');

    document.getElementById("software").innerHTML = version;
    document.getElementById("softwareEN").innerHTML = version;


});

function reloadCalendar() {

    var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');
    var getAsset = $("#load-assets").val(); //the value of the selected option
    var getCompany = $("#load-company").val();
    var getReseller = $("#load-reseller").val();
    var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
    var getTimestamp = $("#dateFrom").val();
    var getRxTime = $("#dateTo").val();

    var convertTimestamp = moment(getTimestamp, dateFormat);
    var convertRxtime = moment(getRxTime, dateFormat);
    var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
    var rxtime = moment(convertRxtime).subtract('hours', 8).format(dateFormat);
    var jobApi = 'https://webapi.systempest.com/api/jobinfo?AssetResellerID=' + getReseller + '&AssetCompanyID=' + getCompany + '&AssetID=' + getAsset + '&Timestamp=' + timestamp + '&RxTime=' + rxtime;

    //Load Calendar
    $.ajax({
        url: jobApi,
        type: "GET",
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
        success: function (data) {

            switch (getSessionstorageValueLanguage) {
                case "en":
                    language = "en"
                    break;

                case "th":
                    language = "th"
                    break;

                case "vn":
                    language = "vi"
                    break;

                case "id":
                    language = "id"
                    break;

            }


            $('div[id*=fullcal]').fullCalendar('destroy');

            $('div[id*=fullcal]').fullCalendar({
                eventColor: "#feb811",
                locale: language,
                customButtons: {
                    printButton: {
                        text: titlePrint,
                        click: function () {
                            console.log('clicked the custom button!');
                            window.print();
                        }
                    }
                },
                theme: true,
                windowResize: true,
                header: {
                    left: 'prev,next today printButton',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                eventLimit: true, // allow "more" link when too many events
                eventMouseover: function (data, event, view) {

                    var timestamp = moment.utc(data.start).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss');
                    //alert(data.jobstatus);
                    if (data.jobstatus == "Scheduled" || data.jobstatus == "New" || data.jobstatus == "Transferred") {
                        tooltip = '<div class="tooltiptopicevent" style="width:auto;height:auto;background:#3A87AD;position:absolute;z-index:10001;padding:10px 10px 10px 10px ;  line-height: 200%;">' + titleJobNumber + ' :' + data.jn + '</br>' + titlePhone + ' :' + data.phone + '</br>' + titlePhoneUser + ' :' + data.user + '</br>' + titleCompany + ' :' + data.company + '</br>' + titleAddress + ' :' + data.address + '</br>' + titleUnit + ' :' + data.unit + '</br>' + titlePostal + ' :' + data.postal + '</br>' + titlePersonInCharge + ' :' + data.pic + '</br>' + titleStart + ' :' + timestamp + '</br>' + titleRemarks + ' :' + data.remarks + '</br>' + titleJobStatus + ' :' + data.jobstatus + '</div>';
                    } else if (data.jobstatus == "In Progress" || data.jobstatus == "Scheduled In Progress") {
                        tooltip = '<div class="tooltiptopicevent" style="width:auto;height:auto;background:#feab34;position:absolute;z-index:10001;padding:10px 10px 10px 10px ;  line-height: 200%;">' + titleJobNumber + ' :' + data.jn + '</br>' + titlePhone + ' :' + data.phone + '</br>' + titlePhoneUser + ' :' + data.user + '</br>' + titleCompany + ' :' + data.company + '</br>' + titleAddress + ' :' + data.address + '</br>' + titleUnit + ' :' + data.unit + '</br>' + titlePostal + ' :' + data.postal + '</br>' + titlePersonInCharge + ' :' + data.pic + '</br>' + titleStart + ' :' + timestamp + '</br>' + titleRemarks + ' :' + data.remarks + '</br>' + titleJobStatus + ' :' + data.jobstatus + '</div>';
                    } else if (data.jobstatus == "Completed") {
                        tooltip = '<div class="tooltiptopicevent" style="width:auto;height:auto;background:#8CC152;position:absolute;z-index:10001;padding:10px 10px 10px 10px ;  line-height: 200%;">' + titleJobNumber + ' :' + data.jn + '</br>' + titlePhone + ' :' + data.phone + '</br>' + titlePhoneUser + ' :' + data.user + '</br>' + titleCompany + ' :' + data.company + '</br>' + titleAddress + ' :' + data.address + '</br>' + titleUnit + ' :' + data.unit + '</br>' + titlePostal + ' :' + data.postal + '</br>' + titlePersonInCharge + ' :' + data.pic + '</br>' + titleStart + ' :' + timestamp + '</br>' + titleRemarks + ' :' + data.remarks + '</br>' + titleJobStatus + ' :' + data.jobstatus + '</div>';
                    } else if (data.jobstatus == "Incomplete") {
                        tooltip = '<div class="tooltiptopicevent" style="width:auto;height:auto;background:#b70000;position:absolute;z-index:10001;padding:10px 10px 10px 10px ;  line-height: 200%;">' + titleJobNumber + ' :' + data.jn + '</br>' + titlePhone + ' :' + data.phone + '</br>' + titlePhoneUser + ' :' + data.user + '</br>' + titleCompany + ' :' + data.company + '</br>' + titleAddress + ' :' + data.address + '</br>' + titleUnit + ' :' + data.unit + '</br>' + titlePostal + ' :' + data.postal + '</br>' + titlePersonInCharge + ' :' + data.pic + '</br>' + titleStart + ' :' + timestamp + '</br>' + titleRemarks + ' :' + data.remarks + '</br>' + titleJobStatus + ' :' + data.jobstatus + '</div>';
                    }

                    $("body").append(tooltip);
                    $(this).mouseover(function (e) {
                        $(this).css('z-index', 10000);
                        $('.tooltiptopicevent').fadeIn('500');
                        $('.tooltiptopicevent').fadeTo('10', 1.9);
                    }).mousemove(function (e) {
                        $('.tooltiptopicevent').css('top', e.pageY + 10);
                        $('.tooltiptopicevent').css('left', e.pageX + 20);
                    });


                },
                eventDrop: function (data, event, view) {

                    if (data.flag == 1 || data.flag == 2) {
                        $('#TableFormCalender').modal("show");
                        $('#cal-date').val(data.start.format("DD-MMM-YYYY, hh.mm.ss"));
                        $('#cal-jobid').val(data.jobid);
                        $('#cal-case').val(data.jn);
                        $('#cal-destination').val(data.address);
                        $('#cal-unit').val(data.unit);
                        $('#cal-postal').val(data.unit);
                        $('#cal-company-destination').val(data.company);
                        $('#cal-pic').val(data.pic);
                        $('#cal-phone').val(data.phone);
                        $('#cal-remarks').val(data.remarks);
                        $('#cal-amount').val(data.amount);
                        $('#cal-driver').val(data.user);
                        $('#cal-jobStatus').val(data.jobstatus);
                        $('.selectpicker').selectpicker('refresh');
                    } else {
                        alert('Job cannot be edited!');
                        reloadCalendar();
                    }


                },
                eventMouseout: function (data, event, view) {
                    $(this).css('z-index', 8);

                    $('.tooltiptopicevent').remove();

                },
                dayClick: function () {
                    tooltip.hide()
                },
                eventResizeStart: function () {
                    tooltip.hide()
                },
                eventDragStart: function () {
                    tooltip.hide()
                },
                viewDisplay: function () {
                    tooltip.hide()
                },
                events: $.map(data, function (item, i) {
                    var event = new Object();
                    event.id = item.JobID;
                    //Add Hours
                    Date.prototype.addHours = function (h) {
                        this.setHours(this.getHours() + h);
                        return this;
                    }
                    event.start = new Date(item.Timestamp).addHours(8);
                    event.end = new Date(item.RxTime).addHours(8);
                    event.title = item.Asset + " (" + item.JobUser + ")";
                    event.jn = item.JobNumber;
                    event.jobid = item.JobID;
                    event.phone = item.Phone;
                    event.user = item.JobUser;
                    event.company = item.CompanyDestination;
                    event.address = item.Destination;
                    event.unit = item.Unit;
                    event.postal = item.Postal;
                    event.pic = item.PIC;
                    event.remarks = item.Remarks;
                    event.jobstatus = item.JobStatus;
                    event.amount = item.Amount;
                    event.flag = item.Flag;

                    return event;
                }),
                eventRender: function (data, element, view) {
                    if (data.jobstatus == "Scheduled") {
                        element.addClass("scheduled");
                        element.children().addClass("scheduled");
                    } else if (data.jobstatus == "In Progress") {
                        element.addClass("inprogress");
                        element.children().addClass("inprogress");
                    } else if (data.jobstatus == "New") {
                        element.addClass("new");
                        element.children().addClass("new");
                    } else if (data.jobstatus == "Scheduled In Progress") {
                        element.addClass("schedinprogress");
                        element.children().addClass("schedinprogress");
                    } else if (data.jobstatus == "Transferred") {
                        element.addClass("transferred");
                        element.children().addClass("transferred");
                    } else if (data.jobstatus == "Completed") {
                        element.addClass("completed");
                        element.children().addClass("completed");
                    } else if (data.jobstatus == "Incomplete") {
                        element.addClass("incomplete");
                        element.children().addClass("incomplete");
                    }
                },
                eventClick: function (data, event, view) {

                    var timestamp = moment.utc(data.start).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss');

                    $("<div>").dialog({
                        modal: true,
                        title: data.jn,
                        width: 350,
                        height: 350,
                        open: function () {
                            $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
                            $(".ui-dialog-titlebar-close").hide(); //hide close button
                            var markup = '<div style="position:absolute;">' + titleJobNumber + ' :' + data.jn + '</br>' + titlePhone + ' :' + data.phone + '</br>' + titlePhoneUser + ' :' + data.user + '</br>' + titleCompany + ' :' + data.company + '</br>' + titleAddress + ' :' + data.address + '</br>' + titleUnit + ' :' + data.unit + '</br>' + titlePostal + ' :' + data.postal + '</br>' + titlePersonInCharge + data.pic + '</br>' + titleStart + ' :' + timestamp + '</br>' + titleRemarks + ' :' + data.remarks + '</div>';
                            $(this).html(markup);
                        },
                        buttons: {
                            Close: function () {
                                $(this).dialog("close");
                            },
                        }
                    });
                    // change the border color just for fun
                    $(this).css('border-color', 'red');

                }
            });
            $("div[id=loading]").hide();
            $("div[id=fullcal]").show();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            debugger;
        }
    });
}

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
