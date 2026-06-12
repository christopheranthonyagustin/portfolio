var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');



var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {

        $('#load-reseller').append(
        $('<option></option>').val(0).html("All")
        );

        $.each(data, function (index, item) {
            if (item.ResellerID == 4){
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

    WebAPIReseller = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

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
$.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?ResellerID=" + "4", function (data) {
    $.each(data, function (index, item) {
        $('#load-company').append(
             $('<option></option>').val(item.CompanyID).html(item.Name)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});


var selectedReseller = "";

/*** Function to filter reseller and companies*/
$(function () {

    $('.select-reseller-filter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();
        $("#devices-editable").empty();
        $('#load-company').empty();

        //document.getElementById("select-company-filter").innerHTML = "";

        $("#load-company").selectpicker('refresh');

        $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

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

        var WebAPI = 'http://track.asiacom.co.th/tracksgwebapi/api/deviceinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany;

        $('#devices-editable').bootstrapTable({
            idField: 'id',
            url: WebAPI,
            columns: [{
                field: 'state',
                title: 'ID',
                checkbox: 'true'
            }, {
                field: 'DeviceID',
                title: 'ID',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg',
                formatter: 'deviceFormatter'
            }, {
                field: 'Name',
                title: 'Device Name',
                sortable: 'true'
                //title: 'ชื่ออุปกรณ์'
            }, {
                field: 'Imei',
                title: 'IMEI Code',
                sortable: 'true'
                //title: 'รหัส IMEI'
            }, {
                field: 'Phone',
                title: 'Phone Number',
                sortable: 'true'
                //title: 'หมายเลข โทรศัพท์'
            }, {
                field: 'Interval',
                title: 'Polling Interval',
                sortable: 'true'
                //title: 'ช่วง เลือกตั้ง'
            }, {
                field: 'Port',
                title: 'Port',
                sortable: 'true'
                //title: 'พอร์ต'
            }, {
                field: 'APN',
                title: 'APN',
                sortable: 'true'
                //title: 'APN'
            }, {
                field: 'Remarks',
                title: 'Remarks',
                sortable: 'true'
                //title: 'ข้อคิดเห็น'
            }, {
                field: 'InstallDate',
                title: 'Install Date',
                //title: 'วันที่ ติดตั้ง',
                formatter: 'dateFormatter',
                sortable: 'true'
            }, {
                field: 'ModifiedTimestamp',
                title: 'Last Modified',
                //title: 'แก้ไขล่าสุด',
                formatter: 'dateFormatter',
                sortable: 'true'
            }],



            onCheck: function (row) {
                $("#toggle-aside").hide();
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


                var InstallDate = row.InstallDate;

                var Bangkok = moment.tz(InstallDate, 'Asia/Bangkok');

                //Format UTC
                var timestamp = moment(Bangkok.format()).add('hours', 7).format("D-MMM-YYYY, hh:mm:ss A");

                $('#deviceInstallDate').val(timestamp);


                $(".selectpicker").selectpicker('refresh');
            },

            onUncheck: function (row) {
                $("#toggle-aside").show();
                $("#toggle-aside2").hide();
                clearDeviceForms();
                //$("#add-toggle-button").show();
                //$("#edit-toggle-button").hide();
                //window.location.reload(true);
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


$(document).ready(function() {


	$('#devices-editable').bootstrapTable({
		idField: 'id',
		url: 'http://103.237.168.119/tracksgwebapi/api/deviceinfo?ResellerID=' + '4' + '&CompanyID=' + '2',
		columns: [{
		    field: 'state',
		    title: 'ID',
		    checkbox: 'true'
		},   {
		    field: 'DeviceID',
		    title: 'ID',
		    class: 'hidden-xs hidden-sm hidden-md hidden-lg',
		    formatter: 'deviceFormatter'
		},   {
		    field: 'Name',
		    title: 'Device Name',
            sortable: 'true'
		    //title: 'ชื่ออุปกรณ์'
		}, {
			field: 'Imei',
			title: 'IMEI Code',
			sortable: 'true'
			//title: 'รหัส IMEI'
		}, {
			field: 'Phone',
			title: 'Phone Number',
			sortable: 'true'
			//title: 'หมายเลข โทรศัพท์'
		}, {
			field: 'Interval',
			title: 'Polling Interval',
			sortable: 'true'
			//title: 'ช่วง เลือกตั้ง'
		}, {
		    field: 'Port',
		    title: 'Port',
		    sortable: 'true'
		    //title: 'พอร์ต'
		}, {
		    field: 'APN',
		    title: 'APN',
		    sortable: 'true'
		    //title: 'APN'
		}, {
		    field: 'Remarks',
		    title: 'Remarks',
		    sortable: 'true'
		    //title: 'ข้อคิดเห็น'
		}, {
		    field: 'InstallDate',
		    title: 'Install Date',
		    //title: 'วันที่ ติดตั้ง',
		    formatter: 'dateFormatter',
		    sortable: 'true'
		}, {
		    field: 'ModifiedTimestamp',
		    title: 'Last Modified',
		    //title: 'แก้ไขล่าสุด',
		    formatter: 'dateFormatter',
		    sortable: 'true'
		}],

		

		onCheck: function (row) {
		    $("#toggle-aside").hide();
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


		    var InstallDate = row.InstallDate;

		    var Bangkok = moment.tz(InstallDate, 'Asia/Bangkok');

		    //Format UTC
		    var timestamp = moment(Bangkok.format()).add('hours', 7).format("D-MMM-YYYY, hh:mm:ss A");

		    $('#deviceInstallDate').val(timestamp);


		    $(".selectpicker").selectpicker('refresh');
		},

		onUncheck: function (row) {
		    $("#toggle-aside").show();
		    $("#toggle-aside2").hide();
		    clearDeviceForms();
		    //$("#add-toggle-button").show();
		    //$("#edit-toggle-button").hide();
		    //window.location.reload(true);
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
var url = 'http://103.237.168.119/tracksgwebapi/api/deviceinfo';

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

        window.location.href = 'http://track.asiacom.co.th/sg/'; //Login URL

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

function clearDeviceForms() {

    $('#deviceID').val('');
    $('#deviceNameEN').val('');
    $('#deviceIMEIEN').val('');
    $('#devicePhoneEN').val('');
    $('#devicePollingIntervalEN').val('');
    $('#devicePortEN').val('');
    $('#deviceAPNEN').val('');
    $('#deviceInstallDate').val('');
    $('#deviceRemarksEN').val('');
    $('#isSentOutEN').val('');
    $('#devices-editable').bootstrapTable('refresh');
}

function returnToTab1() {
    $('#main-wz').bootstrapWizard('first');
}