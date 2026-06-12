
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
//var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueRoleID = 1;

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

//OnLoad Table
$(document).ready(function () {
  
    $("#vehicle-confirm-deleteEN").hide();

    var WebAPI = "";

    if (getSessionstorageValueRoleID == 1) {

        WebAPI = 'http://103.237.168.119/sbswebapi/api/assetinfo';
    }
    else if (getSessionstorageValueRoleID == 2)
    {

        WebAPI = 'http://103.237.168.119/sbswebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }
    else if (getSessionstorageValueRoleID >= 3)
    {

        WebAPI = 'http://103.237.168.119/sbswebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }

    $('#vehicles-editable').bootstrapTable({
        idField: 'id',      
        url: WebAPI,
        columns: [{
            field: 'state',
            title: '',
            checkbox: 'true'
        },
        {
            field: 'Name',
            title: 'Vehicle',
            sortable: 'true',
        }, {
            field: 'Category',
            title: 'Category',
            sortable: 'true',
            formatter: 'assetFormatter'
        }, {
            field: 'Tag',
            title: 'Device',
            sortable: 'true',
        }, {
            field: 'InstallDate',
            title: 'Install Date',
            sortable: 'true',
            formatter: 'dateFormatter'
        }],


        onCheck: function (row) {

            $("#buttonNew").text(function () {
                var edit = ' Edit';
                return edit;
            });
            $("#editform").show();
            $("#addform").hide();
            $("#vehicle-confirm-deleteEN").show();
            $("#space").show();

            var assetID = $('#assetID').val(row.AssetID);
            var getCheckbox = $('table input[type=checkbox]:checked').length;

            if (getCheckbox == 1) {
                var assetDevice = $("#getDevices").append('<option value="' + row.Tag + '" selected="selected">' + row.Tag + '</option>');
            }

            var assetNameEN = $('#assetNameEN').val(row.Name);
            var assetCategoryEN = $('#getCategories').val(row.Category);
            var assetCompany = $('#getCompanies').val(row.CompanyID);
            var InstallDate = row.InstallDate;
            var Singapore = moment.tz(InstallDate, 'Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
            //Format UTC
            var timestamp = moment(Singapore.format()).add('hours', 8).format("D-MMM-YYYY, hh:mm:ss A");
            $('#installDate').val(timestamp);

            
            $('.selectpicker').selectpicker('refresh');
        },

        onUncheck: function (row) {
           
            //window.location.reload(true);    
            $("#buttonNew").text(function () {
                var add = ' Add';
                return add;
            });
            $("#editform").hide();
            $("#addform").show();
            $("#vehicle-confirm-deleteEN").hide();
            $("#getDevices > option[value=" + row.Tag + "]").remove();
            $('.selectpicker').selectpicker('refresh');
            $('#vehicles-editable').bootstrapTable('refresh');
        },

        onLoadSuccess: function (row) {

            $("#space").hide();
        }

    });


	    
});



//Delete Row
var $table = $('#vehicles-editable'), $remove = $('#vehicle-confirm-delete'), $removeEN = $('#vehicle-confirm-deleteEN');



$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);


});





var url = 'http://track.asiacom.co.th/sbswebapi/api/assetinfo';
//Total Vehicles
$.getJSON(url, function (assets) {

    var $result = $('#total-vehicles');
    $result.text(assets.length);


});


// FORMAT COLUMN
// Use "data-formatter" on HTML to format the display of bootstrap table column.
// =================================================================


// format for Vehicle Column.
// =================================================================
function vehicleFormatter(value, row) {
	return '<a href="#" class="btn-link" > Vehicle #' + value + '</a>';
}





// Format for User Name Column.
// =================================================================
function nameFormatter(value, row) {
    var labelColor;
    var text;

    var getDriverID = row.DriverID;

    var driverAddress;
    if (row.Driver.Address == '') {
        driverAddress = "No Name";
    } else {
        driverAddress = row.Driver.Address;
    }

    var driverPhone;
    if (row.Driver.Phone == '') {
        driverPhone = "No Phone";
    } else {
        driverPhone = row.Driver.Phone;
    }


    if (row.DriverID != "0" && row.ImageFill == "Uniform") {
        text = value;
        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.Driver.Name + '" data-footer="' + "<strong>Address: </strong>" + driverAddress + "\n" + "<strong>Phone: </strong>" + driverPhone + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

    } else if (row.DriverID != "0" && row.ImageFill == "None") {
        labelColor = "success";
        text = row.Driver.Name;
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';

    } else if (row.DriverID == "0") {
        labelColor = "dark";
        text = "No Driver";

        return '<center><div style="color:#333333;" class="label label-table label-' + labelColor + '">' + text + '</div></center>';

    } 
   

}




// Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {
	

    //Convert Timezone

    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    var Singapore = moment.tz(value, Asia);

    //Format UTC
    //var timestamp = moment(Singapore.format()).local().format("D-MMM-YYYY, hh:mm:ss A");
    var timestamp = moment(Singapore.format()).format("D-MMM-YYYY, HH:mm:ss A");
   
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



// Format for Vehicle Icon Column.
// =================================================================
function assetFormatter(value, row) {
    if (value == "Scania") return '<i class="fa fa-bus fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Volvo") return '<i class="fa fa-bus fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Citaro") return '<i class="fa fa-bus fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
}

$.getJSON("http://track.asiacom.co.th/sbswebapi/api/companyinfo", function (data) {
    $.each(data, function (index, item) {
        if (item.CompanyID == 1)
            $('#getCompanies').append(
                 $('<option></option>').val(item.CompanyID).html(item.Name)
             );
    });
    $(".selectpicker").selectpicker('refresh');
});



$.getJSON("http://103.237.168.119/sbswebapi/api/deviceinfo", function (data) {
    $.each(data, function (index, item) {

        if (item.AssetID == 0) {

            $('#getDevices').append(
            $('<option data-installDate="' + item.InstallDate + '"></option>').val(item.Name).html(item.Name));

        }

    });

    $('.selectpicker').selectpicker('refresh');
});

$.getJSON("http://103.237.168.119/sbswebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#getCategories').append(
             $('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc)
         );
    });

    $('.selectpicker').selectpicker('refresh');
});


$(function () {

    $.getJSON("http://103.237.168.119/sbswebapi/api/depotinfo", function (data) {

        $.each(data, function (index, item) {
            $('#depot').append($('<option></option>').val(item.DepotID).html(item.Name));
        });

        $('.selectpicker').selectpicker('refresh');

    });


    var selectedDepot = "";
    $('.SelectDepotFilter').on('change', function () {

        selectedDepot = $(this).find("option:selected");
        var arrSelected = [];
        selectedDepot.each(function () {
            arrSelected.push($(this).val());
        });

        if (arrSelected == "" || arrSelected == null) {
            $('#interchange').empty();

            $('.selectpicker').selectpicker('refresh');
        }
        else {
            $('#interchange').empty();

            $.getJSON("http://103.237.168.119/sbswebapi/api/interchangeinfo?Depot=" + arrSelected, function (data) {

                $.each(data, function (index, item) {

                    $('#interchange').append($('<option></option>').val(item.InterchangeID).html(item.Desc));

                });

                //Remove Duplicate values
                $(".SelectInterchangeFilter option").each(function () {
                    $(this).siblings("[value='" + this.value + "']").remove();
                });

                $('.selectpicker').selectpicker('refresh');
            });
        }


    });

    var selectedInterchange = "";
    $('.SelectInterchangeFilter').on('change', function () {

        selectedInterchange = $(this).find("option:selected");
        var arrSelectedInterchange = [];
        selectedInterchange.each(function () {
            arrSelectedInterchange.push($(this).val());
        });

        var getDepot = $('#depot').val();
        var ObjDepot = JSON.stringify(getDepot);
        var parseObjDepot = ObjDepot.replace(/\[|\"|\]/g, "");

    });



});