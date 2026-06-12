var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');
var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');

var titleKey, titleDeviceName, titleIMEI, titlePhoneNumber, titlePollingInterval, titlePort, titleAPN, titleRemarks, titleInstallDate, titleLastModified;

if (getSessionstorageValueLanguage == "en") {
    titleKey = "Activation Key";
    titleDeviceName = "Device Name";
    titleIMEI = "IMEI Code";
    titlePhoneNumber = "Phone Number";
    titlePollingInterval = "Polling Interval";
    titlePort = "Port";
    titleAPN = "APN";
    titleRemarks = "Remarks";
    titleInstallDate = "Install Date";
    titleLastModified = "Last Modified";
} else if (getSessionstorageValueLanguage == "th") {
    titleKey = "คีย์การเปิดใช้งาน";
    titleDeviceName = "ชื่ออุปกรณ์";
    titleIMEI = "ใส่รหัส IMEI";
    titlePhoneNumber = "ป้อนหมายเลขโทรศัพท์";
    titlePollingInterval = "ใส่ช่วงเลือกตั้ง";
    titlePort = "ใส่พอร์ต";
    titleAPN = "APN";
    titleRemarks = "ข้อคิดเห็น";
    titleInstallDate = "วันที่ติดตั้ง";
    titleLastModified = "แก้ไขล่าสุด";
} else if (getSessionstorageValueLanguage == "vn") {
    titleKey = "Mã Kích Hoạt";
    titleDeviceName = "Tên Thiết Bị";
    titleIMEI = "Mã IMEI";
    titlePhoneNumber = "Số Điện Thoại";
    titlePollingInterval = "Khoảng Thời Gian Bỏ Phiếu";
    titlePort = "Cổng Thiết Bị";
    titleAPN = "APN";
    titleRemarks = "Nhận Xét";
    titleInstallDate = "Ngày Tạo";
    titleLastModified = "Sửa Đổi Lần Cuối";
} else if (getSessionstorageValueLanguage == "id") {
    titleKey = "Kunci aktivasi";
    titleDeviceName = "Nama Perangkat";
    titleIMEI = "Kode IMEI";
    titlePhoneNumber = "Nomor Telepon";
    titlePollingInterval = "Waktu Jeda Polling";
    titlePort = "Port Perangkat";
    titleAPN = "APN";
    titleRemarks = "Keterangan";
    titleInstallDate = "Tanggal Instal";
    titleLastModified = "Ubahan Terakhir";
}


var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {

        $('#load-reseller').append(
        $('<option></option>').val(0).html("All")
        );

        $.each(data, function (index, item) {
            if (item.ResellerID == 1){
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

}


//populate the Drop Down List
if (getSessionstorageValueRoleID == 1)
{
    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + "1", function (data) {
        $.each(data, function (index, item) {
        $('#load-company').append($('<option></option>').val(item.CompanyID).html(item.Name));
    });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID == 2)
{
    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {
            $.each(data, function (index, item) {

                if (item.CompanyID == getSessionstorageValueCompanyID)
                {
                   $('#load-company').append($('<option selected="selected"></option>').val(item.CompanyID).html(item.Name));
                } else
                {
                    $('#load-company').append($('<option></option>').val(item.CompanyID).html(item.Name));
                }
            
            });
            $(".selectpicker").selectpicker('refresh');
    });
}




var selectedReseller = "";

/*** Function to filter reseller and companies*/
$(function () {

    $('.select-reseller-filter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();

        $('#load-company').empty();

        //document.getElementById("select-company-filter").innerHTML = "";

        $("#load-company").selectpicker('refresh');

        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#load-company').append(
                $('<option></option>').val(0).html("All")
            );

            $.each(data, function (index, item) {

                $('#load-company').append(
                     $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                 );
            });

            $(".select-company-filter").selectpicker('refresh');
        });

    });



});


$(document).ready(function () {

    var selectedCompany;
    var selectedReseller;

    if (getSessionstorageValueRoleID == 1) {
        // $(".select-company-filter").hide();
        $(".select-reseller-filter").change(function () {

            selectedReseller = $(this).find("option:selected").val();

        });

    }
    else if (getSessionstorageValueRoleID == 2) {

        //$(".select-reseller-filter").hide();
        selectedReseller = getSessionstorageValueUserResellerID;

    }
    else if (getSessionstorageValueRoleID >= 3) {

        $(".select-reseller-filter").hide();
        selectedReseller = getSessionstorageValueUserResellerID;

    }

    $(".select-company-filter").change(function () {
        selectedCompany = $(this).find("option:selected").val();


    });


    $("#submit-filter").click(function () {

        $('#devices-editable').bootstrapTable('destroy');

        var getReseller = "";

        if (selectedReseller == "" || selectedReseller == undefined) {

            getReseller = $('#load-reseller').val();         
        } else {

            getReseller = selectedReseller;
        }

        var getCompany = "";

        if (selectedCompany == "" || selectedCompany == undefined) {

            getCompany = $('#load-company').val();
        } else {

            getCompany = selectedCompany;
        }

        if (getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "id")
        {
            var WebAPI = 'http://117.120.7.119/spwebapi/api/devicetaginfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany;
        }
        else if (getSessionstorageValueTrackVersion == "sg")
        {
            var WebAPI = 'http://117.120.7.119/spwebapi/api/deviceinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany;
        }

        if (getSessionstorageValueUserID == 0) {
            var columns = [{
                field: 'state',
                title: 'ID',
                checkbox: 'true'
            }, {
                field: 'DeviceID',
                title: 'ID',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg',
                formatter: 'deviceFormatter'
            }, {
                field: 'Key',
                title: titleKey,
                sortable: 'true',
                formatter: 'keyFormatter'
            }, {
                field: 'Name',
                title: titleDeviceName,
                sortable: 'true'
                //title: 'ชื่ออุปกรณ์'
            }, {
                field: 'Imei',
                title: titleIMEI,
                sortable: 'true'
                //title: 'รหัส IMEI'
            }, {
                field: 'Phone',
                title: titlePhoneNumber,
                sortable: 'true'
                //title: 'หมายเลข โทรศัพท์'
            }, {
                field: 'Interval',
                title: titlePollingInterval,
                sortable: 'true'
                //title: 'ช่วง เลือกตั้ง'
            }, {
                field: 'Port',
                title: titlePort,
                sortable: 'true'
                //title: 'พอร์ต'
            }, {
                field: 'APN',
                title: titleAPN,
                sortable: 'true'
                //title: 'APN'
            }, {
                field: 'Remarks',
                title: titleRemarks,
                sortable: 'true'
                //title: 'ข้อคิดเห็น'
            }, {
                field: 'InstallDate',
                title: titleInstallDate,
                //title: 'วันที่ ติดตั้ง',
                formatter: 'dateFormatter',
                sortable: 'true'
            }, {
                field: 'ModifiedTimestamp',
                title: titleLastModified,
                //title: 'แก้ไขล่าสุด',
                formatter: 'dateFormatter',
                sortable: 'true'
            }];
        }
        else {
            var columns = [{
                field: 'state',
                title: 'ID',
                checkbox: 'true'
            }, {
                field: 'DeviceID',
                title: 'ID',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg',
                formatter: 'deviceFormatter'
            }, {
                field: 'Key',
                title: titleKey,
                sortable: 'true',
                formatter: 'keyFormatter'
            }, {
                field: 'Phone',
                title: titlePhoneNumber,
                sortable: 'true'
                //title: 'หมายเลข โทรศัพท์'
            }, {
                field: 'Interval',
                title: titlePollingInterval,
                sortable: 'true'
                //title: 'ช่วง เลือกตั้ง'
            }, {
                field: 'Port',
                title: titlePort,
                sortable: 'true'
                //title: 'พอร์ต'
            }, {
                field: 'APN',
                title: titleAPN,
                sortable: 'true'
                //title: 'APN'
            }, {
                field: 'Remarks',
                title: titleRemarks,
                sortable: 'true'
                //title: 'ข้อคิดเห็น'
            }, {
                field: 'InstallDate',
                title: titleInstallDate,
                //title: 'วันที่ ติดตั้ง',
                formatter: 'dateFormatter',
                sortable: 'true'
            }, {
                field: 'ModifiedTimestamp',
                title: titleLastModified,
                //title: 'แก้ไขล่าสุด',
                formatter: 'dateFormatter',
                sortable: 'true'
            }];
        }

        $('#devices-editable').bootstrapTable({
            idField: 'id',
            url: WebAPI,
            columns: columns,
            onCheck: function (row) {
                $("#toggle-aside").hide();
                if (getSessionstorageValueUserID == 0)
                {
                    $("#toggle-aside2").show();
                    //$("#edit-toggle-button").show();
                    //$("#add-toggle-button").hide();

                    var deviceID = $('#deviceID').val(row.DeviceID);
                    var deviceName = $('#deviceName').val(row.Name);
                    var deviceNameEN = $('#deviceNameEN').val(row.Name);
                    var deviceIMEI = $('#deviceIMEI').val(row.Imei);
                    var deviceIMEIEN = $('#deviceIMEIEN').val(row.Imei);
                    var devicePhone = $('#devicePhone').val(row.Phone);
                    var devicePhoneEN = $('#devicePhoneEN').val(row.Phone);
                    var devicePollingInterval = $('#devicePollingInterval').val(row.Interval);
                    var devicePollingIntervalEN = $('#devicePollingIntervalEN').val(row.Interval);
                    var devicePort = $('#devicePort').val(row.Port);
                    var devicePortEN = $('#devicePortEN').val(row.Port);
                    var deviceAPN = $('#deviceAPN').val(row.APN);
                    var deviceAPNEN = $('#deviceAPNEN').val(row.APN);
                    //var deviceInstallDate = $('#deviceInstallDate').val(row.InstallDate);
                    var deviceRemarks = $('#deviceRemarks').val(row.Remarks);
                    var deviceRemarksEN = $('#deviceRemarksEN').val(row.Remarks);

                    var deviceisSentOut = $('#isSentOut').val(row.isSentOutEN);
                    var deviceisSentOutEN = $('#isSentOutEN').val(row.isSentOutEN);

                    var value = row.InstallDate;
                    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
                    var Singapore = moment.tz(value, Asia);

                    if (getSessionstorageValueTrackVersion == "sg") {
                        var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
                    }
                    else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id") {
                        var timestamp = moment.utc(Singapore.format()).add('hours', 7).format('D-MMM-YYYY, hh:mm:ss A');
                    }

                    $('#deviceInstallDate').val(timestamp);


                    $(".selectpicker").selectpicker('refresh');
                } 
            },

            onUncheck: function (row) {
                $("#toggle-aside").hide();
                $("toggle-aside2").hide();
                //$("#add-toggle-button").show();
                //$("#edit-toggle-button").hide();
                window.location.reload(true);
            },

            onLoadSuccess: function (row) {
                $("#toggle-aside2").hide();
                //$("#edit-toggle-button").hide();

            }

            //onLoadError: function () {
            //    alert('Event: onLoadError, data: ' + alert('error'));
            //}
        });


    });


});


$(document).ready(function () {

    var DeviceAPI = "";

    if (getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "id")
    {
        if (getSessionstorageValueRoleID == 1)
        {
            DeviceAPI = "http://117.120.7.119/spwebapi/api/devicetaginfo?ResellerID=" + "1" + "&CompanyID=" + "1";
        }
        else if (getSessionstorageValueRoleID == 2)
        {
            DeviceAPI = "http://117.120.7.119/spwebapi/api/devicetaginfo?ResellerID=" + getSessionstorageValueUserResellerID + "&CompanyID=" + getSessionstorageValueCompanyID;
        }
    }
    else if (getSessionstorageValueTrackVersion == "sg")
    {
        if (getSessionstorageValueRoleID == 1)
        {
            DeviceAPI = "http://117.120.7.119/spwebapi/api/deviceinfo?ResellerID=" + "1" + "&CompanyID=" + "1";
        }
        else if (getSessionstorageValueRoleID == 2) {
            DeviceAPI = "http://117.120.7.119/spwebapi/api/deviceinfo?ResellerID=" + getSessionstorageValueUserResellerID + "&CompanyID=" + getSessionstorageValueCompanyID;
        }
    }

    if (getSessionstorageValueUserID == 0)
    {
        var columns = [{
            field: 'state',
            title: 'ID',
            checkbox: 'true'
        }, {
            field: 'DeviceID',
            title: 'ID',
            class: 'hidden-xs hidden-sm hidden-md hidden-lg',
            formatter: 'deviceFormatter'
        }, {
            field: 'Key',
            title: titleKey,
            sortable: 'true',
            formatter: 'keyFormatter'
        }, {
            field: 'Name',
            title: titleDeviceName,
            sortable: 'true'
            //title: 'ชื่ออุปกรณ์'
        }, {
            field: 'Imei',
            title: titleIMEI,
            sortable: 'true'
            //title: 'รหัส IMEI'
        }, {
            field: 'Phone',
            title: titlePhoneNumber,
            sortable: 'true'
            //title: 'หมายเลข โทรศัพท์'
        }, {
            field: 'Interval',
            title: titlePollingInterval,
            sortable: 'true'
            //title: 'ช่วง เลือกตั้ง'
        }, {
            field: 'Port',
            title: titlePort,
            sortable: 'true'
            //title: 'พอร์ต'
        }, {
            field: 'APN',
            title: titleAPN,
            sortable: 'true'
            //title: 'APN'
        }, {
            field: 'Remarks',
            title: titleRemarks,
            sortable: 'true'
            //title: 'ข้อคิดเห็น'
        }, {
            field: 'InstallDate',
            title: titleInstallDate,
            //title: 'วันที่ ติดตั้ง',
            formatter: 'dateFormatter',
            sortable: 'true'
        }, {
            field: 'ModifiedTimestamp',
            title: titleLastModified,
            //title: 'แก้ไขล่าสุด',
            formatter: 'dateFormatter',
            sortable: 'true'
        }];
    }
    else
    {
        var columns = [{
            field: 'state',
            title: 'ID',
            checkbox: 'true'
        }, {
            field: 'DeviceID',
            title: 'ID',
            class: 'hidden-xs hidden-sm hidden-md hidden-lg',
            formatter: 'deviceFormatter'
        }, {
            field: 'Key',
            title: titleKey,
            sortable: 'true',
            formatter: 'keyFormatter'
        }, {
            field: 'Phone',
            title: titlePhoneNumber,
            sortable: 'true'
            //title: 'หมายเลข โทรศัพท์'
        }, {
            field: 'Interval',
            title: titlePollingInterval,
            sortable: 'true'
            //title: 'ช่วง เลือกตั้ง'
        }, {
            field: 'Port',
            title: titlePort,
            sortable: 'true'
            //title: 'พอร์ต'
        }, {
            field: 'APN',
            title: titleAPN,
            sortable: 'true'
            //title: 'APN'
        }, {
            field: 'Remarks',
            title: titleRemarks,
            sortable: 'true'
            //title: 'ข้อคิดเห็น'
        }, {
            field: 'InstallDate',
            title: titleInstallDate,
            //title: 'วันที่ ติดตั้ง',
            formatter: 'dateFormatter',
            sortable: 'true'
        }, {
            field: 'ModifiedTimestamp',
            title: titleLastModified,
            //title: 'แก้ไขล่าสุด',
            formatter: 'dateFormatter',
            sortable: 'true'
        }];
    }


	$('#devices-editable').bootstrapTable({
		idField: 'id',
		url: DeviceAPI,
		columns: columns,
		onCheck: function (row) {
		    $("#toggle-aside").hide();
		    if (getSessionstorageValueUserID == 0)
		    {
		        $("#toggle-aside2").show();
		        //$("#edit-toggle-button").show();
		        //$("#add-toggle-button").hide();

		        var deviceID = $('#deviceID').val(row.DeviceID);
		        var deviceName = $('#deviceName').val(row.Name);
		        var deviceNameEN = $('#deviceNameEN').val(row.Name);
		        var deviceIMEI = $('#deviceIMEI').val(row.Imei);
		        var deviceIMEIEN = $('#deviceIMEIEN').val(row.Imei);
		        var devicePhone = $('#devicePhone').val(row.Phone);
		        var devicePhoneEN = $('#devicePhoneEN').val(row.Phone);
		        var devicePollingInterval = $('#devicePollingInterval').val(row.Interval);
		        var devicePollingIntervalEN = $('#devicePollingIntervalEN').val(row.Interval);
		        var devicePort = $('#devicePort').val(row.Port);
		        var devicePortEN = $('#devicePortEN').val(row.Port);
		        var deviceAPN = $('#deviceAPN').val(row.APN);
		        var deviceAPNEN = $('#deviceAPNEN').val(row.APN);
		        //var deviceInstallDate = $('#deviceInstallDate').val(row.InstallDate);
		        var deviceRemarks = $('#deviceRemarks').val(row.Remarks);
		        var deviceRemarksEN = $('#deviceRemarksEN').val(row.Remarks);

		        var deviceisSentOut = $('#isSentOut').val(row.isSentOutEN);
		        var deviceisSentOutEN = $('#isSentOutEN').val(row.isSentOutEN);

		        var value = row.InstallDate;
		        var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
		        var Singapore = moment.tz(value, Asia);

		        if (getSessionstorageValueTrackVersion == "sg") {
		            var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
		        }
		        else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id") {
		            var timestamp = moment.utc(Singapore.format()).add('hours', 7).format('D-MMM-YYYY, hh:mm:ss A');
		        }

		        $('#deviceInstallDate').val(timestamp);
		        $(".selectpicker").selectpicker('refresh');
		    }
		   
		},

		onUncheck: function (row) {
		    $("#toggle-aside").hide();
		    $("toggle-aside2").hide();
		    //$("#add-toggle-button").show();
		    //$("#edit-toggle-button").hide();
		    window.location.reload(true);
		},

		onLoadSuccess: function (row) {
		    $("#toggle-aside2").hide();
		    //$("#edit-toggle-button").hide();

		}

		//onLoadError: function () {
		//    alert('Event: onLoadError, data: ' + alert('error'));
		//}
	});



});


//Delete Row
var $table = $('#devices-editable'), $remove = $('#device-confirm-delete'), $removeEN = $('#device-confirm-deleteEN');

$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);
});



//Total Users
var url = 'http://117.120.7.119/spwebapi/api/deviceinfo';

$.getJSON(url, function (devices) {

    var $result = $('#total-devices');
    $result.text(devices.length)

});

// FORMAT COLUMN
// Use "data-formatter" on HTML to format the display of bootstrap table column.
// =================================================================


// format for Device Column.
// =================================================================
function vehicleFormatter(value, row) {
	return '<a href="#" class="btn-link" > Device #' + value + '</a>';
}




// Format for Device ID Column.
// =================================================================
function nameFormatter(value, row) {
	return '<a href="#" class="btn-link" > ' + value + '</a>';
}

function keyFormatter(value, row) {
    var txt;
    if (value == 0) {
        txt = row.Name;
    } else if (value > 0) {
        txt = value;
    } 

    return txt;

}


// Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {

    //Convert Timezone
    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
    var Singapore = moment.tz(value, Asia);

    if (getSessionstorageValueTrackVersion == "sg") {
        var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
    }
    else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id") {
        var timestamp = moment.utc(Singapore.format()).add('hours', 7).format('D-MMM-YYYY, hh:mm:ss A');
    }

    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';

}



//  Format for Status Column.
// =================================================================
function statusFormatter(value, row) {
	var labelColor;
	if (value == "Move") {
		labelColor = "success";
	}else if(value == "Idle"){
		labelColor = "warning";
	}else if(value == "Stop"){
		labelColor = "danger";
	}
	var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
	return '<div class="label label-table label-'+ labelColor+'"> ' + value + '</div>';
}



// Format for Tracking Number Column.
// =================================================================
function trackFormatter(value, row) {
	if (value) return '<i class="fa fa-truck"></i> ' + value;
}



// Sort Price Column
// =================================================================
function priceSorter(a, b) {
	a = +a.substring(1); // remove $
	b = +b.substring(1);
	if (a > b) return 1;
	if (a < b) return -1;
	return 0;
}


$(document).ready(function () {

    //Then retrieve
    var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
    var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
    var getSessionstorageValueEmail = sessionStorage.getItem('setSessionstorageValueEmail');
    var getSessionstorageValueName = sessionStorage.getItem('setSessionstorageValueName');
    var getSessionstorageValueRoleDesc = sessionStorage.getItem('setSessionstorageValueRoleDesc');
    var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');

    if (getSessionstorageValueUser == null | getSessionstorageValueUser == undefined | getSessionstorageValueUser == "") {

        window.location.href = 'http://track-asia.com/systempest/'; //Login URL

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


$(function () {

    $('.tgl-menu-btn').click(function () {

        setTimeout(function () {
            $('#devices-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.add-device').click(function () {

        setTimeout(function () {
            $('#devices-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.add-deviceEN').click(function () {

        setTimeout(function () {
            $('#devices-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.edit-device').click(function () {

        setTimeout(function () {
            $('#devices-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.edit-deviceEN').click(function () {

        setTimeout(function () {
            $('#devices-editable').bootstrapTable('resetView');

        }, 500);


    });


});


window.onresize = function (event) {
    setTimeout(function () {
        $('#devices-editable').bootstrapTable('resetView');

    }, 500);
};

//Translation of Forms
if (getSessionstorageValueLanguage == "en") {
    $("#device-confirm-deleteEN").text("Delete");
    $("#add-device").text("Add Device");
    $("#edit-device").text("Edit Device");

    $('#deviceIDEN').attr('placeholder', 'Device ID');
    $("#deviceID").text("Device ID");
    $('#deviceNameEN').attr('placeholder', 'Device Name');
    $("#deviceName").text("Device Name");
    $('#deviceIMEIEN').attr('placeholder', 'IMEI Code');
    $("#deviceIMEI").text("IMEI Code");
    $('#devicePhoneEN').attr('placeholder', 'Phone Number');
    $("#devicePhone").text("Phone Number");
    $('#devicePollingIntervalEN').attr('placeholder', 'Polling Interval');
    $("#devicePollingInterval").text("Polling Interval");

    $("#previous").text("Previous");
    $("#next").text("Next");
    $("#submit-deviceEN").text("Submit");

    $("#installDate").text("Install Date");
    $('#deviceRemarksEN').attr('placeholder', 'Remarks');
    $("#deviceRemarks").text("Remarks");
    $('#devicePortEN').attr('placeholder', 'Device Port');
    $("#devicePort").text("Port");
    $('#deviceAPNEN').attr('placeholder', 'Device APN');
    $("#deviceAPN").text("APN");
    $('#isSentOutEN').attr('placeholder', 'APN');

    $("#clickLogoutEN").text("OK");

    $("#DeviceExportWordEN").text("MS Word");
    $("#DeviceExportPDFEN").text("PDF");
    $("#DeviceExportExcelEN").text("Excel");
}
else if (getSessionstorageValueLanguage == "th") {
    $("#device-confirm-deleteEN").text("ลบ");
    $("#add-device").text("เพิ่ม ยานพาหนะ");
    $("#edit-device").text("แก้ไข ยานพาหนะ");


    $('#deviceIDEN').attr('placeholder', 'หมายเลขอุปกรณ์');
    $("#deviceID").text("หมายเลขอุปกรณ์");
    $('#deviceNameEN').attr('placeholder', 'ชื่ออุปกรณ์');
    $("#deviceName").text("ชื่ออุปกรณ์");
    $('#deviceIMEIEN').attr('placeholder', 'ใส่รหัส IMEI');
    $("#deviceIMEI").text("รหัส IMEI");
    $('#devicePhoneEN').attr('placeholder', 'ป้อนหมายเลขโทรศัพท์');
    $("#devicePhone").text("ป้อนหมายเลขโทรศัพท์");
    $('#devicePollingIntervalEN').attr('placeholder', 'ใส่ช่วงเลือกตั้ง');
    $("#devicePollingInterval").text("ช่วงเลือกตั้ง");

    $("#previous").text("ก่อน");
    $("#next").text("ถัดไป");
    $("#submit-deviceEN").text("เสนอ");

    $("#installDate").text("วันที่ติดตั้ง");
    $('#deviceRemarksEN').attr('placeholder', 'ข้อคิดเห็น');
    $("#deviceRemarks").text("ข้อคิดเห็น");
    $('#devicePortEN').attr('placeholder', 'ใส่พอร์ต');
    $("#devicePort").text("พอร์ต");
    $('#deviceAPNEN').attr('placeholder', 'ใส่ APN');
    $("#deviceAPN").text("APN");
    $('#isSentOutEN').attr('placeholder', 'APN');
    $("#clickLogoutEN").text("ตกลง");

    $("#DeviceExportWordEN").text("การส่งออกในรูปแบบ Word");
    $("#DeviceExportPDFEN").text("การส่งออกในรูปแบบ PDF");
    $("#DeviceExportExcelEN").text("การส่งออกในรูปแบบ Excel");
}
else if (getSessionstorageValueLanguage == "vn") {
    $("#device-confirm-deleteEN").text("Xóa");
    $("#add-device").text("Thêm Thiết Bị");
    $("#edit-device").text("Chỉnh Sửa Thiết Bị");

    $('#deviceIDEN').attr('placeholder', 'ID Thiết Bị');
    $("#deviceID").text("ID Thiết Bị");
    $('#deviceNameEN').attr('placeholder', 'Tên Thiết Bị');
    $("#deviceName").text("Tên Thiết Bị");
    $('#deviceIMEIEN').attr('placeholder', 'Mã IMEI');
    $("#deviceIMEI").text("Mã IMEI");
    $('#devicePhoneEN').attr('placeholder', 'Số Diện Thoại');
    $("#devicePhone").text("Số Diện Thoại");
    $('#devicePollingIntervalEN').attr('placeholder', 'Khoảng Thời Gian Bỏ Phiếu');
    $("#devicePollingInterval").text("Khoảng Thời Gian Bỏ Phiếu");

    $("#previous").text("Lùi");
    $("#next").text("Tới");
    $("#submit-deviceEN").text("Gửi Đi");

    $("#installDate").text("Ngày Cài Dặt");
    $('#deviceRemarksEN').attr('placeholder', 'Nhận Xét');
    $("#deviceRemarks").text("Nhận Xét");
    $('#devicePortEN').attr('placeholder', 'Cổng Thiết Bị');
    $("#devicePort").text("Cổng Thiết Bị");
    $('#deviceAPNEN').attr('placeholder', 'Thiết Bị APN');
    $("#deviceAPN").text("APN");
    $('#isSentOutEN').attr('placeholder', 'APN');
    $("#clickLogoutEN").text("Đồng Ý");

    $("#DeviceExportWordEN").text("Xuất Word");
    $("#DeviceExportPDFEN").text("Xuất PDF");
    $("#DeviceExportExcelEN").text("Xuất Excel");
}
else if (getSessionstorageValueLanguage == "id") {
    $("#device-confirm-deleteEN").text("Hapus Rekor");
    $("#add-device").text("Tambahan Perangkat");
    $("#edit-device").text("Edit Perangkat");

    $('#deviceIDEN').attr('placeholder', 'Perangkat ID');
    $("#deviceID").text("Perangkat ID");
    $('#deviceNameEN').attr('placeholder', 'Nama Perangkat');
    $("#deviceName").text("Nama Perangkat");
    $('#deviceIMEIEN').attr('placeholder', 'Kode IMEI');
    $("#deviceIMEI").text("Kode IMEI");
    $('#devicePhoneEN').attr('placeholder', 'Nomor Telepon');
    $("#devicePhone").text("Nomor Telepon");
    $('#devicePollingIntervalEN').attr('placeholder', 'Waktu Jeda Polling');
    $("#devicePollingInterval").text("Waktu Jeda Polling");

    $("#previous").text("Sebelum");
    $("#next").text("Berikut");
    $("#submit-deviceEN").text("Serah");

    $("#installDate").text("Tanggal Instal");
    $('#deviceRemarksEN').attr('placeholder', 'Keterangan');
    $("#deviceRemarks").text("Keterangan");
    $('#devicePortEN').attr('placeholder', 'Port Perangkat');
    $("#devicePort").text("Port Perangkat");
    $('#deviceAPNEN').attr('placeholder', 'Perangkat APN');
    $("#deviceAPN").text("APN");
    $('#isSentOutEN').attr('placeholder', 'APN');
    $("#clickLogoutEN").text("Baik");

    $("#DeviceExportWordEN").text("Ekspor ke Word");
    $("#DeviceExportPDFEN").text("Ekspor ke PDF");
    $("#DeviceExportExcelEN").text("Ekspor ke Excel");
}