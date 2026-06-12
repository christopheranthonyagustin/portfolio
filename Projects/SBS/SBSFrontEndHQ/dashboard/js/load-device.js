var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
//var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueRoleID = 1;
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');



$(document).ready(function() {

    $("#device-confirm-deleteEN").hide();
    $("#buttonEdit").hide();
    $("#addform").show();
    $("#editform").hide();

	$('#devices-editable').bootstrapTable({
		idField: 'id',
		url: 'http://172.16.10.110/sbswebapi/api/deviceinfo',
		columns: [{
		    field: 'state',
		    title: '',
		    checkbox: 'true'
		},   {
		    field: 'DeviceID',
		    title: 'ID',
		    class: 'hidden-xs hidden-sm hidden-md hidden-lg',
		    formatter: 'deviceFormatter'
		},   {
		    field: 'Name',
		    title: 'ID',
            sortable: 'true'
		}, {
			field: 'Imei',
			title: 'IMEI Code',
			sortable: 'true'
		},  {
		    field: 'Port',
		    title: 'Port',
		    sortable: 'true'
		}, {
		    field: 'IP',
		    title: 'Server IP',
		    sortable: 'true'
		}, {
		    field: 'SSID',
		    title: 'SSID',
		    sortable: 'true'
		}, {
		    field: 'Username',
		    title: 'Username',
		    sortable: 'true'
		}, {
		    field: 'Password',
		    title: 'Password',
		    sortable: 'true'
		}, {
		    field: 'SecurityType',
		    title: 'Security Type',
		    sortable: 'true'
		}, {
		    field: 'Mode',
		    title: 'Mode',
		    sortable: 'true'
		}, {
		    field: 'IPAddress',
		    title: 'IP Address',
		    sortable: 'true'
		}, {
		    field: 'IPMask',
		    title: 'IP Mask',
		    sortable: 'true'
		}, {
		    field: 'IPGateway',
		    title: 'IP Gateway',
		    sortable: 'true'
		}, {
		    field: 'Interval',
		    title: 'Time Interval',
		    sortable: 'true'
		}, {
		    field: 'Remarks',
		    title: 'Remarks',
		    sortable: 'true'
		}, {
		    field: 'InstallDate',
		    title: 'Install Date',
		    formatter: 'dateFormatter',
		    sortable: 'true'
		}, {
		    field: 'ModifiedTimestamp',
		    title: 'Last Modified',
		    formatter: 'dateFormatter',
		    sortable: 'true'
		}, {
		    field: 'isSentOut',
		    title: 'OTA',
		    sortable: 'true',
		    formatter: 'otaFormatter',
		}],

		

		onCheck: function (row) {

		    $("#buttonNew").text(function () {
		        var edit = ' Edit';
		        return edit;
		    });

		    $("#addform").hide();
		    $("#editform").show();
		    $("#device-confirm-deleteEN").show();


		    var deviceID = $('#deviceID').val(row.DeviceID);
		    var deviceNameEN = $('#deviceNameEN').val(row.Name);
		    var deviceIMEIEN = $('#deviceIMEIEN').val(row.Imei);
		    var devicePhoneEN = $('#devicePhoneEN').val(row.Phone);
		    var devicePollingIntervalEN = $('#devicePollingIntervalEN').val(row.Interval);
		    var devicePortEN = $('#devicePortEN').val(row.Port);
		    var deviceAPNEN = $('#deviceAPNEN').val(row.APN);
		    var deviceRemarksEN = $('#deviceRemarksEN').val(row.Remarks);
		    var deviceUsername = $('#deviceUsername').val(row.Username);
		    var devicePassword = $('#devicePassword').val(row.Password);
		    var deviceSecurity = $('#deviceSecurity').val(row.SecurityType);
		    var deviceMode = $('#deviceMode').val(row.Mode);
		    var deviceIPAddress = $('#deviceIPAddress').val(row.IPAddress);
		    var deviceIPMask = $('#deviceIPMask').val(row.IPMask);
		    var deviceIPGateway = $('#deviceIPGateway').val(row.IPGateway);

		    //var deviceisSentOutEN = $('#isSentOutEN').val(row.isSentOutEN);
		    var deviceIP = $('#deviceIP').val(row.IP);
		    var deviceSSID = $('#deviceSSID').val(row.SSID);
		    if (row.isSentOut == 1)   $('.js-check-change-filter').prop('checked', true);
		    else if (row.isSentOut == 0) $('.js-check-change-filter').prop('checked', false);

		    var InstallDate = row.InstallDate;
		    var Singapore = moment.tz(InstallDate, 'Asia/Singapore');
		    //Format UTC
		    var timestamp = moment(Singapore.format()).add('hours', 8).format("D-MMM-YYYY, hh:mm:ss A");
		    $('#deviceInstallDateEN').val(timestamp);



		    $(".selectpicker").selectpicker('refresh');
		},

		onUncheck: function (row) {

		    $("#addform").show();
		    $("#editform").hide();
		    window.location.reload(true);
		},

		onLoadSuccess: function (row) {

		

		}


	});



});


//Delete Row
var $table = $('#devices-editable'), $remove = $('#device-confirm-delete'), $removeEN = $('#device-confirm-deleteEN');

$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);
});



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




// Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {

    //Convert Timezone
    var Asia = moment.tz.add('Asia/Bangkok|ICT|-70|0|');

    var Bangkok = moment.tz(value, Asia);

    //Format UTC
    var timestamp = moment(Bangkok.format()).format("D-MMM-YYYY, hh:mm:ss A");

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

function otaFormatter(value, row) {
    var labelColor;
    var text;
    if (value == 1) {
        labelColor = "success";
        text = "On";
    } else if (value == 0) {
        labelColor = "danger";
        text = "Off";
    }
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
}


$.getJSON("http://172.16.10.110/sbswebapi/api/devicetypeinfo", function (data) {
    $.each(data, function (index, item) {
        if (item.DeviceTypeID == 7)
        $('#load-type').append(
             $('<option></option>').val(item.DeviceTypeID).html(item.Name)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});

window.onresize = function (event) {
    setTimeout(function () {
        $('#devices-editable').bootstrapTable('resetView');
        AutoAdjustScreen();
    }, 500);
};

function AutoAdjustScreen() {

    $(window).height();   // returns height of browser viewport
    $(document).height(); // returns height of HTML document
    $(window).width();   // returns width of browser viewport
    $(document).width(); // returns width of HTML document

    //alert(screen.height);
    var isChromium = window.chrome,
                vendorName = window.navigator.vendor,
                isOpera = window.navigator.userAgent.indexOf("OPR") > -1,
                isIEedge = window.navigator.userAgent.indexOf("Edge") > -1;

    if (screen.height == 768) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 365 });
            } else {
                // not Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 400 });
            }

        }, 500);
    }
    else if (screen.height == 720) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 250 });
            } else {
                // not Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 285 });
            }

        }, 500);
    }
    else if (screen.height == 786) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 338 });
            } else {
                // not Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 353 });
            }

        }, 500);
    }
    else if (screen.height == 800) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 365 });
            } else {
                // not Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 410 });
            }

        }, 500);
    }
    else if (screen.height == 864) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 435 });
            } else {
                // not Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 425 });
            }

        }, 500);
    }
    else if (screen.height == 900) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 495 });
            } else {
                // not Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 505 });
            }

        }, 500);
    }
    else if (screen.height == 960) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 525 });
            } else {
                // not Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 570 });
            }

        }, 500);
    }
    else if (screen.height == 1024) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 590 });
            } else {
                // not Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 700 });
            }

        }, 500);
    }
    else if (screen.height == 1080) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 646 });
            } else {
                // not Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 636 });
            }

        }, 500);
    }
    else if (screen.height == 1050) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 615 });
            } else {
                // not Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 605 });
            }

        }, 500);
    }
    else if (screen.height == 1200) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 760 });
            } else {
                // not Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 755 });
            }

        }, 500);
    }
    else if (screen.height == 1344) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 900 });
            } else {
                // not Google chrome 
                $('#devices-editable').bootstrapTable('resetView', { height: 895 });
            }

        }, 500);
    }
    else {
        setTimeout(function () {
            $('#devices-editable').bootstrapTable('resetView', { height: 400 });
        }, 500);
    }
}

//Set Checkbox Value
$(function () {
    $('#otaFilter').on('change', function (e) {
        e.stopPropagation();
        this.value = this.checked ? 1 : 0;
    });
})