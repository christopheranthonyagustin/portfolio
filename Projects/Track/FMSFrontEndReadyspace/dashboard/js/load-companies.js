
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');

//Onload
document.getElementById("companyStatus").checked = true;

var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'https://track-asia.com/tracksgwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {

        $('#load-reseller').append($('<option></option>').val(0).html("All"));

        $.each(data, function (index, item) {
            if (item.ResellerID == 4) {
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

    WebAPIReseller = 'https://track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

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
        $("#companies-editable").empty();

        $('#mobile-companyResellerEN').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        $('#load-reseller').empty();
        $('.select-reseller-filter').selectpicker('refresh');


        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("https://track-asia.com/tracksgwebapi/api/resellerinfo", function (data) {
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
            $.getJSON("https://track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
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
        $("#companies-editable").empty();
        $('#mobile-companyResellerEN').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        $('#companyReseller').empty();
        $('.SelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("https://track-asia.com/tracksgwebapi/api/resellerinfo", function (data) {
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
            $.getJSON("https://track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
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
        $("#companies-editable").empty();
        $('#load-reseller').empty();
        $('.select-reseller-filter').selectpicker('refresh');

        $('#companyReseller').empty();
        $('.SelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("https://track-asia.com/tracksgwebapi/api/resellerinfo", function (data) {
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
            $.getJSON("https://track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
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

        var WebAPI = 'https://track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=' + selectedReseller;

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
                $("#toggle-aside").show();
                $("#toggle-aside2").hide();
                clearCompanyForms();
                //window.location.reload(true);
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
        WebAPI = 'https://track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=' + '4';
    }
    else if (getSessionstorageValueRoleID == 2)
    {
        WebAPI = 'https://track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=' + getSessionstorageValueUserResellerID;
    }
    else if (getSessionstorageValueRoleID >= 3)
    {
        WebAPI = 'https://track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=' + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID;

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
		    $("#toggle-aside").show();
		    $("#toggle-aside2").hide();
		    clearCompanyForms();
		    //window.location.reload(true);
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
	    text = "Enabled";
	}else if(value == 1){
	    labelColor = "dark";
	    text = "Disabled";
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
var url = 'https://track-asia.com/tracksgwebapi/api/companyinfo';

$.getJSON(url, function (company) {


    var $result = $('#total-company');
    $result.text(company.length)

});


//populate the Drop Down List
$.getJSON("https://track-asia.com/tracksgwebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#companyCategory').append(
             $('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});

$.getJSON("https://track-asia.com/tracksgwebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#companyCategoryEN').append(
             $('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});


$.getJSON("https://track-asia.com/tracksgwebapi/api/reportinfo", function (data) {
    $.each(data, function (index, item) {
        $('#companyReport').append(
             $('<option></option>').val(item.ReportID).html(item.Name)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});

$.getJSON("https://track-asia.com/tracksgwebapi/api/reportinfo", function (data) {
    $.each(data, function (index, item) {
        $('#companyReportEN').append($('<option></option>').val(item.ReportID).html(item.Name));
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

        window.location.href = 'https://track-asia.com/sg/'; //Login URL

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

function clearCompanyForms() {

    $('#companyID').val('');
    $('#companyNameEN').val('');
    $('#companyAddressEN').val('');
    $('#companyEmailEN').val('');
    $('#companyPhoneEN').val('');
    $('#companies-editable').bootstrapTable('refresh');
}

function returnToTab1() {
    $('#main-wz').bootstrapWizard('first');
}