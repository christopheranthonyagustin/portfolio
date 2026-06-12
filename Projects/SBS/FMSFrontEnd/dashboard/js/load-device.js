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
		url: 'http://103.237.168.119/sbswebapi/api/deviceinfo',
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
		    field: 'APN',
		    title: 'APN',
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
		    //var deviceisSentOutEN = $('#isSentOutEN').val(row.isSentOutEN);


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


$.getJSON("http://track.asiacom.co.th/sbswebapi/api/devicetypeinfo", function (data) {
    $.each(data, function (index, item) {
        if (item.DeviceTypeID == 7)
        $('#load-type').append(
             $('<option></option>').val(item.DeviceTypeID).html(item.Name)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});
