
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

var titleCompany, titleAddress, titleEmail, titlePhone, titleReseller, titleEnableDisable;

if (getSessionstorageValueLanguage == "en") {
    titleCompany = "Company Name";
    titleAddress = "Address";
    titleEmail = "Email";
    titlePhone = "Phone";
    titleReseller = "Reseller";
    titleEnableDisable = "Enabled/Disabled";
}
else if (getSessionstorageValueLanguage == "th") {
    titleCompany = "กรุณาใส่ชื่อ บริษัท";
    titleAddress = "ที่อยู่ บริษัท";
    titleEmail = "ที่อยู่อีเมล์";
    titlePhone = "หมายเลขโทรศัพท์";
    titleReseller = "ผู้ค้าปลีก";
    titleEnableDisable = "ทำให้สามารถ/ปิดการใช้งาน";
} else if (getSessionstorageValueLanguage == "vn") {
    titleCompany = "Tên Công ty";
    titleAddress = "Địa Chỉ";
    titleEmail = "E-Mail";
    titlePhone = "Điện Thoại";
    titleReseller = "Dại Lý Bán Lẻ";
    titleEnableDisable = "Cho Phép/Vô Hiệu Hóa";
} else if (getSessionstorageValueLanguage == "id") {
    titleCompany = "Nama Perusahaan";
    titleAddress = "Alamat Perusahaan";
    titleEmail = "E-Mail Perusahaan";
    titlePhone = "Nomor Telepon Perusahaan";
    titleReseller = "Pengecer";
    titleEnableDisable = "Pasangkan/Padamkan";
}

//Onload
document.getElementById("companyStatus").checked = true;

var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {

        $('#load-reseller').append($('<option></option>').val(0).html("All"));

        $.each(data, function (index, item) {
            if (item.ResellerID == 1) {
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#mobile-companyResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#companyReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
            } else {
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#mobile-companyResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#companyReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            }
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#mobile-companyResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#companyReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {

    $('#modal-companyResellerEN').remove();
    $('.select-reseller-filter').remove();
    $('#submit-filter').remove();
}



var selectedReseller = "";

//Reseller Forms
/*** Function to filter reseller and companies*/
$(function () {

    $('.SelectResellerFilter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();


        $('#mobile-companyResellerEN').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        $('#load-reseller').empty();
        $('.select-reseller-filter').selectpicker('refresh');


        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#mobile-companyResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#mobile-companyResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#companyReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-companyResellerEN').selectpicker('refresh');
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-companyResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#companyReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-companyResellerEN').selectpicker('refresh');
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#mobile-companyResellerEN').remove();
            $('#load-reseller').remove();
        }

    });

});

//Reseller Filter
/*** Function to filter reseller and companies*/
$(function () {

    $('.select-reseller-filter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();

        $('#mobile-companyResellerEN').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        $('#companyReseller').empty();
        $('.SelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#companyReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#mobile-companyResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#mobile-companyResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                        $('#companyReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-companyResellerEN').selectpicker('refresh');
                $('#companyReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-companyResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#companyReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-companyResellerEN').selectpicker('refresh');
                $('#companyReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#mobile-companyResellerEN').remove();
            $('#companyReseller').remove();
        }


    });
});

//Mobile Reseller
/*** Function to filter reseller and companies*/
$(function () {

    $('.MobileSelectResellerFilter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();

        $('#load-reseller').empty();
        $('.select-reseller-filter').selectpicker('refresh');

        $('#companyReseller').empty();
        $('.SelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#companyReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                        $('#companyReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#mobile-companyResellerEN").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
                $('#companyReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#companyReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#mobile-companyResellerEN").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
                $('#companyReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#load-reseller').remove();
            $('#companyReseller').remove();
        }



    });
});

$(document).ready(function () {

    var selectedReseller;

    if (getSessionstorageValueRoleID == 1) {
        // $(".select-company-filter").hide();
        $(".select-reseller-filter").change(function () {
            selectedReseller = $(this).find("option:selected").val();

        });

    }
    else if (getSessionstorageValueRoleID == 2) {

        //$(".select-reseller-filter").hide();
        $('.activateCompany').hide();
        $('#submit-filter').hide();
        selectedReseller = getSessionstorageValueUserResellerID;

    }
    else if (getSessionstorageValueRoleID >= 3) {
        $('.activateCompany').hide();
        $(".select-reseller-filter").hide();
        selectedReseller = getSessionstorageValueUserResellerID;

    }



    $("#submit-filter").click(function () {

        $('#companies-editable').bootstrapTable('destroy');

        var WebAPI = 'http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=' + selectedReseller;

        $('#companies-editable').bootstrapTable({
            idField: 'id',
            url: WebAPI,
            columns: [{
                field: 'state',
                title: 'ID',
                checkbox: 'true'
            }, {
                field: 'CompanyID',
                title: 'ID',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg',
                formatter: 'companyFormatter'
            }, {
                field: 'Name',
                title: 'Company Name',
                sortable: 'true'
            }, {
                field: 'Address',
                title: 'Address',
                sortable: 'true'
            }, {
                field: 'Email',
                title: 'Email',
                sortable: 'true'
            }, {
                field: 'Phone',
                title: 'Phone',
                sortable: 'true'
            }, {
                field: 'Reseller',
                title: 'Reseller',
                class: 'companyResellerColumn',
                sortable: 'true'
            }, {
                field: 'Flag',
                title: 'Enabled/Disabled',
                formatter: 'statusFormatter'
            }],


            onCheck: function (row) {

                //$("#edit-toggle-button").show();
                //$("#add-toggle-button-company").hide();
                $("#toggle-aside").hide();
                $("#toggle-aside2").show();

                var companyID = $('#companyID').val(row.CompanyID);
                var companyStatus = $('#companyStatus').val(row.Flag);
                var companyName = $('#companyName').val(row.Name);
                var companyNameEN = $('#companyNameEN').val(row.Name);
                var companyReseller = $('#companyReseller').val(row.ResellerID);
                //var companyUserLimit = $('#companyUserLimit').val(row.UserLimit);
                //var companyUserLimitEN = $('#companyUserLimitEN').val(row.UserLimit);
                //var companyZoneLimit = $('#companyZoneLimit').val(row.ZoneLimit);
                //var companyZoneLimitEN = $('#companyZoneLimitEN').val(row.ZoneLimit);
                //var companyVehicleLimit = $('#companyVehicleLimit').val(row.AssetLimit);
                //var companyVehicleLimitEN = $('#companyVehicleLimitEN').val(row.AssetLimit);
                //var companySmsLimit = $('#companySmsLimit').val(row.SmsLimit);
                //var companySmsLimitEN = $('#companySmsLimitEN').val(row.SmsLimit);
                var companyAddress = $('#companyAddress').val(row.Address);
                var companyAddressEN = $('#companyAddressEN').val(row.Address);
                var companyEmail = $('#companyEmail').val(row.Email);
                var companyEmailEN = $('#companyEmailEN').val(row.Email);
                var companyPhone = $('#companyPhone').val(row.Phone);
                var companyPhoneEN = $('#companyPhoneEN').val(row.Phone);
                var companyCategory = $('#companyCategory').val(row.Categories);
                var companyCategoryEN = $('#companyCategoryEN').val(row.Categories);
                var companyImage = $('#companyImage').val(row.Image);

                //Convert String to Array
                var Reports = row.Reports;
                var AssignedReports = new Array();
                AssignedReports = Reports.split(",");
                for (a in AssignedReports) {
                    AssignedReports[a] = parseInt(AssignedReports[a], 10);
                }
                var companyReport = $('#companyReport').val(AssignedReports);
                var companyReportEN = $('#companyReportEN').val(AssignedReports);

                $(".selectpicker").selectpicker('refresh');



            },

            onUncheck: function (row) {

                //$("#add-toggle-button").show();
                //$("#edit-toggle-button").hide();
                $("#toggle-aside").hide();
                $("toggle-aside2").hide();
                window.location.reload(true);
            },

            onLoadSuccess: function (row) {

                if (getSessionstorageValueRoleID >= 3) {
                    $("#toggle-aside").hide();

                }


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

    var WebAPI = "";

    if (getSessionstorageValueRoleID == 1)
    {
        WebAPI = 'http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=' + '1';
    }
    else if (getSessionstorageValueRoleID == 2)
    {
        WebAPI = 'http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=' + getSessionstorageValueUserResellerID;
    }
    else if (getSessionstorageValueRoleID >= 3)
    {
        WebAPI = 'http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=' + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID;

        $('#exportMsword').hide();
        $('#exportMswordEN').hide();
        $('#exportImage').hide();
        $('#exportImageEN').hide();
        $('#exportPDF').hide();
        $('#exportPDFEN').hide();
        $('#exportExcel').hide();
        $('#exportExcelEN').hide();
    }


	$('#companies-editable').bootstrapTable({
		idField: 'id',
		url: WebAPI,
		columns: [{
		    field: 'state',
		    title: 'ID',
		    checkbox: 'true'
		}, {
			field: 'CompanyID',
			title: 'ID',
			class: 'hidden-xs hidden-sm hidden-md hidden-lg',
			formatter: 'companyFormatter'
		}, {
		    field: 'Name',
		    title: titleCompany,
		    sortable: 'true'
		}, {
			field: 'Address',
			title: titleAddress,
			sortable: 'true'
		}, {
		    field: 'Email',
		    title: titleEmail,
		    sortable: 'true'
		}, {
		    field: 'Phone',
		    title: titlePhone,
		    sortable: 'true'
		}, {
		    field: 'Reseller',
		    title: titleReseller,
		    class: 'companyResellerColumn',
		    sortable: 'true'
		}, {
		    field: 'Flag',
		    title: titleEnableDisable,
		    formatter: 'statusFormatter'
		}],

		
		onCheck: function (row) {

		    //$("#edit-toggle-button").show();
		    //$("#add-toggle-button-company").hide();
		    $("#toggle-aside").hide();
		    $("#toggle-aside2").show();

		    var companyID = $('#companyID').val(row.CompanyID);
		    var companyStatus = $('#companyStatus').val(row.Flag);
		    var companyName = $('#companyName').val(row.Name);
		    var companyNameEN = $('#companyNameEN').val(row.Name);
		    var companyReseller = $('#companyReseller').val(row.ResellerID);
		    //var companyUserLimit = $('#companyUserLimit').val(row.UserLimit);
		    //var companyUserLimitEN = $('#companyUserLimitEN').val(row.UserLimit);
		    //var companyZoneLimit = $('#companyZoneLimit').val(row.ZoneLimit);
		    //var companyZoneLimitEN = $('#companyZoneLimitEN').val(row.ZoneLimit);
		    //var companyVehicleLimit = $('#companyVehicleLimit').val(row.AssetLimit);
		    //var companyVehicleLimitEN = $('#companyVehicleLimitEN').val(row.AssetLimit);
		    //var companySmsLimit = $('#companySmsLimit').val(row.SmsLimit);
		    //var companySmsLimitEN = $('#companySmsLimitEN').val(row.SmsLimit);
		    var companyAddress = $('#companyAddress').val(row.Address);
		    var companyAddressEN = $('#companyAddressEN').val(row.Address);
		    var companyEmail = $('#companyEmail').val(row.Email);
		    var companyEmailEN = $('#companyEmailEN').val(row.Email);
		    var companyPhone = $('#companyPhone').val(row.Phone);
		    var companyPhoneEN = $('#companyPhoneEN').val(row.Phone);
		    var companyCategory = $('#companyCategory').val(row.Categories);
		    var companyCategoryEN = $('#companyCategoryEN').val(row.Categories);
		    var companyImage = $('#companyImage').val(row.Image);
		    
		     //Convert String to Array
		    var Reports = row.Reports;
		    var AssignedReports = new Array();
		    AssignedReports = Reports.split(",");
		    for (a in AssignedReports) {
		        AssignedReports[a] = parseInt(AssignedReports[a], 10);
		    }
		    var companyReport = $('#companyReport').val(AssignedReports);
		    var companyReportEN = $('#companyReportEN').val(AssignedReports);

		    $(".selectpicker").selectpicker('refresh');



		},

		onUncheck: function (row) {

		    //$("#add-toggle-button").show();
		    //$("#edit-toggle-button").hide();
		    $("#toggle-aside").hide();
		    $("toggle-aside2").hide();
		    window.location.reload(true);
		},

		onLoadSuccess: function (row) {

		    if (getSessionstorageValueRoleID >= 3) {
		        $("#toggle-aside").hide();

		    }


		    $("#toggle-aside2").hide();
		    //$("#edit-toggle-button").hide();
	
		}

		//onLoadError: function () {
		//    alert('Event: onLoadError, data: ' + alert('error'));
		//}
	});



});

//Delete Row
var $table = $('#companies-editable'), $remove = $('#company-confirm-delete'), $removeEN = $('#company-confirm-deleteEN');

$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);
});



// FORMAT COLUMN
// Use "data-formatter" on HTML to format the display of bootstrap table column.
// =================================================================


// format for Vehicle Column.
// =================================================================
function companyFormatter(value, row) {
	return '<a href="#" class="btn-link" > Company #' + value + '</a>';
}




// Format for User Name Column.
// =================================================================
function nameFormatter(value, row) {
	return '<a href="#" class="btn-link" > ' + value + '</a>';
}




// Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {
	var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
	return '<span class="text-muted"><i class="fa fa-clock-o"></i> ' + value + '</span>';
}



//  Format for Status Column.
// =================================================================
function statusFormatter(value, row) {
    var labelColor;
    var text;
    //if (value == "Enabled") {
	if (value == 0) {
	    labelColor = "success";
	    if (getSessionstorageValueLanguage == "en") {
	        text = "Enabled";
	    }
	    else if (getSessionstorageValueLanguage == "th") {
	        text = "ทำให้สามารถ";
	    } else if (getSessionstorageValueLanguage == "vn") {
	        text = "Cho Phép";
	    } else if (getSessionstorageValueLanguage == "id") {
	        text = "Pasangkan";
	    }
	}else if(value == 1){
	    labelColor = "dark";
	    if (getSessionstorageValueLanguage == "en") {
	    text = "Disabled";
	    }
	    else if (getSessionstorageValueLanguage == "th") {
	        text = "ปิดการใช้งาน";
	    } else if (getSessionstorageValueLanguage == "vn") {
	        text = "Vô Hiệu Hóa";
	    } else if (getSessionstorageValueLanguage == "id") {
	        text = "Padamkan";
	    }
	}
	var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
	return '<div class="label label-table label-'+ labelColor+'"> ' + text + '</div>';
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

//Total Companies
var url = 'http://117.120.7.119/spwebapi/api/companyinfo';

$.getJSON(url, function (company) {


    var $result = $('#total-company');
    $result.text(company.length)

});


//populate the Drop Down List
$.getJSON("http://117.120.7.119/spwebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#companyCategory').append(
             $('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});

$.getJSON("http://117.120.7.119/spwebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#companyCategoryEN').append(
             $('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});


$.getJSON("http://117.120.7.119/spwebapi/api/reportinfo", function (data) {
    $.each(data, function (index, item) {
        $('#companyReport').append(
             $('<option></option>').val(item.ReportID).html(item.Name)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});

$.getJSON("http://117.120.7.119/spwebapi/api/reportinfo", function (data) {

    $.each(data, function (index, item) {
         if(getSessionstorageValueLanguage == "en")
        {
             $('#companyReportEN').append($('<option></option>').val(item.ReportID).html(item.Name));
         }
         else if (getSessionstorageValueLanguage == "th")
         {
             switch (item.Name) {
                 case "Barlight":
                     text = "บาร์แสง";
                     break;
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
                 case "Messages":
                     text = "ข่าวสาร";
                     break;
                 case "Milleage":
                     text = "ไมล์";
                     break;
                 case "Paramedic":
                     text = "แพทย์";
                     break;
                 case "Payment":
                     text = "การชำระเงิน";
                     break;
                 case "Phone User":
                     text = "ผู้ใช้โทรศัพท์";
                     break;
                 case "Position":
                     text = "ที่";
                     break;
                 case "Speed":
                     text = "ผู้ใช้โทรศัพท์";
                     break;
                 case "Trip":
                     text = "เที่ยว";
                     break;
                 case "Type":
                     text = "ประเภท";
                     break;
             }

             $('#companyReportEN').append($('<option></option>').val(item.ReportID).html(text));

         }
         else if (getSessionstorageValueLanguage == "vn")
         {
             switch (item.Name) {
                 case "Barlight":
                     text = "Thanh Anh Sáng";
                     break;
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
                     text = "Việc Làm";
                     break;
                 case "Messages":
                     text = "Tin Nhắn";
                     break;
                 case "Milleage":
                     text = "Cước Phí";
                     break;
                 case "Paramedic":
                     text = "Người Phụ Trách";
                     break;
                 case "Payment":
                     text = "Thanh Toán";
                     break;
                 case "Phone User":
                     text = "Điện Thoại Người Dùng";
                     break;
                 case "Position":
                     text = "Vị Trí";
                     break;
                 case "Speed":
                     text = "Tốc Dộ";
                     break;
                 case "Trip":
                     text = "Chuyến";
                     break;
                 case "Type":
                     text = "Kiểu";
                     break;
             }

             $('#companyReportEN').append($('<option></option>').val(item.ReportID).html(text));

         }
         else if (getSessionstorageValueLanguage == "id")
         {
             switch (item.Name) {
                 case "Barlight":
                     text = "Lampu Bar";
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
                 case "Messages":
                     text = "Pesanan";
                     break;
                 case "Milleage":
                     text = "Mil";
                     break;
                 case "Paramedic":
                     text = "Paramedis";
                     break;
                 case "Payment":
                     text = "Pembayaran";
                     break;
                 case "Phone User":
                     text = "Telepon Pengguna";
                     break;
                 case "Position":
                     text = "Posisi";
                     break;
                 case "Speed":
                     text = "Kecepatan";
                     break;
                 case "Trip":
                     text = "Perjalanan";
                     break;
                 case "Type":
                     text = "Jenis";
                     break;
             }

             $('#companyReportEN').append($('<option></option>').val(item.ReportID).html(text));

         }
        $('#mobile-companyReportEN').append($('<option></option>').val(item.ReportID).html(item.Name));
    });
    $(".selectpicker").selectpicker('refresh');
});



var changeCheckbox = document.querySelector('.companyStatus');

changeCheckbox.onchange = function () {
    
    var val;

    if (changeCheckbox.checked == true) {
        val = 0;
    }

    else if (changeCheckbox.checked == false) {
        val = 1;
    }

    return val;

};


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
            $('#companies-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.add-company').click(function () {

        setTimeout(function () {
            $('#companies-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.add-companyEN').click(function () {

        setTimeout(function () {
            $('#companies-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.edit-company').click(function () {

        setTimeout(function () {
            $('#companies-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.edit-companyEN').click(function () {

        setTimeout(function () {
            $('#companies-editable').bootstrapTable('resetView');

        }, 500);


    });


});


window.onresize = function (event) {
    setTimeout(function () {
        $('#companies-editable').bootstrapTable('resetView');

    }, 500);
};

//Translation of Forms
if (getSessionstorageValueLanguage == "en") {
    $("#enableDisable").text("Enable/Disable");
    $('#companyNameEN').attr('placeholder', 'Company Name');
    $("#companyName").text("Company Name");
    $('#companyAddressEN').attr('placeholder', 'Address');
    $("#companyAddress").text("Address");
    $('#companyEmailEN').attr('placeholder', 'E-Mail');
    $("#companyEmail").text("E-Mail");
    $('#companyPhoneEN').attr('placeholder', 'Phone Number');
    $("#companyPhone").text("Phone Number");
    $("#previous").text("Previous");
    $("#next").text("Next");
    $("#submit-companyEN").text("Submit");
    $("#resellerName").text("Reseller");
    $("#enableReport").text("Enable Report");
    $("#clickLogoutEN").text("OK");
    $("#company-confirm-deleteEN").text("Delete");
    $("#CompaniesExportWordEN").text("Word");
    $("#CompaniesExportPDFEN").text("PDF");
    $("#CompaniesExportExcelEN").text("Excel");
    $("#companyReportEN").text("SELECT REPORT");


}
else if (getSessionstorageValueLanguage == "th") {
    $("#enableDisable").text("ทำให้สามารถ/ปิดการใช้งาน");
    $('#companyAddressEN').attr('placeholder', 'กรุณาใส่ชื่อ บริษัท');
    $("#companyName").text("กรุณาใส่ชื่อ บริษัท");
    $('#companyAddressEN').attr('placeholder', 'ที่อยู่ บริษัท');
    $("#companyAddress").text("ที่อยู่ บริษัท");
    $('#companyEmailEN').attr('placeholder', 'ที่อยู่อีเมล์');
    $("#companyEmail").text("ที่อยู่อีเมล์");
    $('#companyPhoneEN').attr('placeholder', 'หมายเลขโทรศัพท์');
    $("#companyPhone").text("หมายเลขโทรศัพท์");
    $("#previous").text("ก่อน");
    $("#next").text("ถัดไป");
    $("#submit-companyEN").text("เสนอ");
    $("#resellerName").text("ผู้ค้าปลีก");
    $("#enableReport").text("เปิดใช้งานการรายงาน");
    $("#clickLogoutEN").text("ตกลง");
    $("#company-confirm-deleteEN").text("ลบ");
    $("#CompaniesExportWordEN").text("ไมโครซอฟท์ คำ<");
    $("#CompaniesExportPDFEN").text("รูปแบบไฟล์ PDF");
    $("#CompaniesExportExcelEN").text("ไมโครซอฟท์ Excel");
    $("#companyReportEN").text("เลือกรายงาน");

}
else if (getSessionstorageValueLanguage == "vn") {
    $("#enableDisable").text("Cho Phép/Vô Hiệu Hóa");
    $('#companyNameEN').attr('placeholder', 'Tên Công Ty');
    $("#companyName").text("Tên Công Ty");
    $('#companyAddressEN').attr('placeholder', 'Địa Chỉ Công Ty');
    $("#companyAddress").text("Địa Chỉ Công Ty");
    $('#companyEmailEN').attr('placeholder', 'Công Ty E-Mail');
    $("#companyEmail").text("Công Ty E-Mail");
    $('#companyPhoneEN').attr('placeholder', 'Công Ty Số Điện Thoại');
    $("#companyPhone").text("Công Ty Số Điện Thoại");
    $("#previous").text("Lùi");
    $("#next").text("Tới");
    $("#submit-companyEN").text("Gửi Đi");
    $("#resellerName").text("Dại Lý Bán Lẻ");
    $("#enableReport").text("Kích Hoạt Tính Năng Báo Cáo");
    $("#clickLogoutEN").text("Đồng Ý");
    $("#company-confirm-deleteEN").text("Xóa");
    $("#CompaniesExportWordEN").text("Xuất Word");
    $("#CompaniesExportPDFEN").text("Xuất PDF");
    $("#CompaniesExportExcelEN").text("Xuất Excel");
    $("#companyReportEN").text("CHỌN BÁO CÁO");

}
else if (getSessionstorageValueLanguage == "id") {
    $("#enableDisable").text("Pasangkan/Padamkan");
    $('#companyNameEN').attr('placeholder', 'Nama Perusahaan');
    $("#companyName").text("Nama Perusahaan");
    $('#companyAddressEN').attr('placeholder', 'Alamat Perusahaan');
    $("#companyAddress").text("Alamat Perusahaan");
    $('#companyEmailEN').attr('placeholder', 'E-Mail Perusahaan');
    $("#companyEmail").text("E-Mail Perusahaan");
    $('#companyPhoneEN').attr('placeholder', 'Nomor Telepon Perusahaan');
    $("#companyPhone").text("Nomor Telepon Perusahaan");
    $("#previous").text("Sebelum");
    $("#next").text("Berikut");
    $("#submit-companyEN").text("Serah");
    $("#resellerName").text("Pengecer");
    $("#enableReport").text("Aktif Report");
    $("#clickLogoutEN").text("Baik");
    $("#company-confirm-deleteEN").text("Hapus Rekor");
    $("#CompaniesExportWordEN").text("Ekspor ke Word");
    $("#CompaniesExportPDFEN").text("Ekspor ke PDF");
    $("#CompaniesExportExcelEN").text("Ekspor ke Excel");
    $("#companyReportEN").text("PILIH LAPORAN");

}
