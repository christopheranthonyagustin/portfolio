

var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
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

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + '&ResellerID=' + "1" + '&CompanyID=' + "1", function (data) {
        $.each(data, function (index, item) {
            $('#load-assets').append(
                 $('<option></option>').val(item.AssetID).html(item.Name)
             );

        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {

            $('#load-assets').append(
                 $('<option></option>').val(item.AssetID).html(item.Name)
             );

        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#load-assets').append(
                 $('<option></option>').val(item.AssetID).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}


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
        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

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

        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getReseller, function (data) {

            $.each(data, function (index, item) {

                if (item.CompanyID == selectedCompany) {
                    $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                }
                else {
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

        $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + "&ResellerID=" + userReseller + "&CompanyID=" + selectedCompany, function (data) {

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

        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getMobileReseller, function (data) {

            $.each(data, function (index, item) {

                if (item.CompanyID == selectedCompany) {
                    $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                }
                else {
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

        $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + "&ResellerID=" + userReseller + "&CompanyID=" + selectedCompany, function (data) {

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
        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedJobReseller, function (data) {

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

        $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + "&ResellerID=" + jobReseller + "&CompanyID=" + selectedJobCompany, function (data) {

            $.each(data, function (index, item) {
                $('#jobAssets').append($('<option></option>').val(item.AssetID).html(item.Name));
            });
            $("#jobAssets").selectpicker('refresh');
        });

    });
});


//modal
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + '&ResellerID=' + "1" + '&CompanyID=' + "1", function (data) {
        $.each(data, function (index, item) {
            $('#jobAssets').append(
                 $('<option></option>').val(item.AssetID).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {

            $('#jobAssets').append(
                 $('<option></option>').val(item.AssetID).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#jobAssets').append(
                 $('<option></option>').val(item.AssetID).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}


$(document).ready(function () {

    var WebAPI = "";
    var dateFormat = "D-MMM-YYYY, HH:mm:ss A";
    var getTimestampDate = moment().format();
    var Timestamp = moment.tz(getTimestampDate, 'Asia/Singapore');
    var getTimestamp = moment.utc(Timestamp.format()).subtract('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');
    var getAssets = $("#load-assets").val();


    var getDate = moment().format();
    var RxTime = moment.tz(getDate, 'Asia/Singapore');
    var getRxTime = moment.utc(RxTime.format()).add('month', 12).format('D-MMM-YYYY, HH:mm:ss A');

    if (getSessionstorageValueRoleID == 1) {
        WebAPI = 'http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=' + "1" + '&AssetCompanyID=' + "1" + '&AssetID=' + "" + '&Timestamp=' + getTimestamp + '&RxTime=' + getRxTime;
    }
    else if (getSessionstorageValueRoleID == 2) {
        WebAPI = 'http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=' + getSessionstorageValueUserResellerID + '&AssetCompanyID=' + "" + '&AssetID=' + "" + '&Timestamp=' + getTimestamp + '&RxTime=' + getRxTime;
    }
    else if (getSessionstorageValueRoleID >= 3) {
        WebAPI = 'http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=' + '&AssetCompanyID=' + getSessionstorageValueCompanyID + '&AssetID=' + getAssets + '&Timestamp=' + getTimestamp + '&RxTime=' + getRxTime;
    }


    $('#jobs-editable').bootstrapTable({
        idField: 'id',
        url: WebAPI,
        columns: [{
            field: 'state',
            checkbox: 'true'
        }, {
            field: 'JobNumber',
            title: 'Job Number',
            sortable: 'true'
        }, {
            field: 'Company',
            title: 'Company Name',
            sortable: 'true'
        }, {
            field: 'Asset',
            title: 'Vehicle',
            sortable: 'true'
        }, {
            field: 'Timestamp',
            title: 'Delivery Date',
            sortable: 'true',
            formatter: 'timestampFormatter'
        }, {
            field: 'DriverInfo.Remarks',
            title: 'Driver ID',
            sortable: 'true',
            formatter: 'driveridFormatter'
        }, {
            field: 'DriverInfo.Image',
            title: 'Driver Profile',
            formatter: 'nameFormatter',
            sortable: 'true'
        }],
        onCheck: function (row) {

            $("#buttonNew").hide();
            $("#buttonEdit").show();
            $("#addform").hide();
            $("#editform").show();
            var jobID = $('#jobid').val(row.JobID);
            var jobNumber = $('#jobNumber').val(row.JobNumber);
            var jobName = $('#jobCustomerCompany').val(row.Company);
            var jobReseller = $('#jobReseller').val(row.AssetResellerID);
            var jobCompany = $('#jobCompany').val(row.AssetCompanyID);
            var jobAssets = $('#jobAssets').val(row.AssetID);

            var deliveryDate = row.Timestamp;
            var Singapore = moment.tz(deliveryDate, 'Asia/Singapore');
            //Format UTC
            var timestamp = moment(Singapore.format()).add('hours', 0).format("D-MMM-YYYY, HH:mm:ss A");
            $('#deliveryDate').val(timestamp);


            $('.selectpicker').selectpicker('refresh');
        },

        onUncheck: function (row) {

            window.location.reload(true);
        },

        onLoadSuccess: function (row) {
            $("#buttonEdit").hide();

            var rows = document.getElementById('jobs-editable').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
            if (rows < 1)
            {
                alert('No Jobs!');
            }


        }
    });



});


//Delete Row
var $table = $('#jobs-editable'), $remove = $('#job-confirm-delete'), $removeEN = $('#job-confirm-deleteEN');



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

function driveridFormatter(value, row) {

    if (value == null) {

        return '<a class="btn-link" id="showVehicle">' + '#' + 'No Driver ID' + '</a>';
    }
    else {
        return '<a class="btn-link" id="showVehicle">' + '#' + value + '</a>';
    }
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
    var timestamp = moment.utc(Singapore.format()).add('hours', 0).format('D-MMM-YYYY, HH:mm:ss A');


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
        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.DriverInfo.Name + '" data-footer="' + "<strong>Address: </strong>" + driverAddress + "\n" + "<strong>Phone: </strong>" + driverPhone + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

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



var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {

        //$('#load-reseller').append(
        //$('<option></option>').val(0).html("-------")
        //);

        $.each(data, function (index, item) {
            if (item.ResellerID == 1) {
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));

                $('#jobReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
            } else {
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#jobReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            }
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#jobReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#formsReseller').remove();
    $('#modalReseller').remove();
}


//Desktop
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + "1", function (data) {

        $.each(data, function (index, item) {

            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));

        });
        $(".selectpicker").selectpicker('refresh');
    });

}

else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID) {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
            }
            else
            {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            }
        });


        $('.selectpicker').selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


        $.each(data, function (index, item) {

            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            $('#jobCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
        });


        $('.selectpicker').selectpicker('refresh');

    });
}


//OnChange Jobs
$(function () {

document.getElementById("clickGenerateEN").onclick = GenerateEN;


function GenerateEN() {

        $("#load-assets :selected").text(); //the text content of the selected option
        var getAsset = $("#load-assets").val(); //the value of the selected option
        var getCompany = $("#load-company").val();
        var getReseller = $("#load-reseller").val();
        var dateFormat = "D-MMM-YYYY, hh:mm:ss A";

        var getTimestampDate = moment().format();
        var Timestamp = moment.tz(getTimestampDate, 'Asia/Singapore');
        var getTimestamp = moment.utc(Timestamp.format()).subtract('hours', 8).format('D-MMM-YYYY, HH:mm:ss A');

        var getDate = moment().format();
        var RxTime = moment.tz(getDate, 'Asia/Singapore');
        var getRxTime = moment.utc(RxTime.format()).add('month', 12).format('D-MMM-YYYY, HH:mm:ss A');

        var jobApi = 'http://117.120.7.119/spwebapi/api/jobinfo?AssetResellerID=' + getReseller + '&AssetCompanyID=' + getCompany + '&AssetID=' + getAsset + '&Timestamp=' + getTimestamp + '&RxTime=' + getRxTime;
       

            $('#jobs-editable').bootstrapTable('destroy');

            $('#jobs-editable').bootstrapTable({
                idField: 'id',
                url: jobApi,
                columns: [{
                    field: 'state',
                    checkbox: 'true'
                }, {
                    field: 'JobNumber',
                    title: 'Job Number',
                    sortable: 'true'
                }, {
                    field: 'Company',
                    title: 'Company Name',
                    sortable: 'true'
                }, {
                    field: 'Asset',
                    title: 'Vehicle',
                    sortable: 'true'
                }, {
                    field: 'Timestamp',
                    title: 'Delivery Date',
                    sortable: 'true',
                    formatter: 'timestampFormatter'
                }, {
                    field: 'DriverInfo.Remarks',
                    title: 'Driver ID',
                    sortable: 'true',
                    formatter: 'driveridFormatter'
                }, {
                    field: 'DriverInfo.Image',
                    title: 'Driver Profile',
                    formatter: 'nameFormatter',
                    sortable: 'true'
                }],
                onCheck: function (row) {

                    $("#buttonNew").hide();
                    $("#buttonEdit").show();
                    $("#addform").hide();
                    $("#editform").show();
                    var jobID = $('#jobID').val(row.JobID);
                    var jobNumber = $('#jobNumber').val(row.JobNumber);
                    var jobName = $('#jobCustomerCompany').val(row.Company);
                    var jobReseller = $('#jobReseller').val(row.AssetResellerID);
                    var jobCompany = $('#jobCompany').val(row.AssetCompanyID);
                    var jobAssets = $('#jobAssets').val(row.AssetID);


                    var deliveryDate = row.Timestamp;
                    var Singapore = moment.tz(deliveryDate, 'Asia/Singapore');
                    //Format UTC
                    var timestamp = moment(Singapore.format()).subtract('hours', 0).format("D-MMM-YYYY, HH:mm:ss A");
                    $('#deliveryDate').val(timestamp);


                    $('.selectpicker').selectpicker('refresh');
                },

                onUncheck: function (row) {

                    window.location.reload(true);
                },

                onLoadSuccess: function (row) {
                    $("#buttonEdit").hide();

                    var rows = document.getElementById('jobs-editable').getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
                    if (rows < 1) {
                        alert('No Jobs!');
                    }
                }
            });
      

    }


});



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


});

//Storage
$(document).ready(function () {


    try {

        var getAsset = $("#load-assets").val();
        var getCompany = $("#load-company").val();
        var getReseller = $("#load-reseller").val();

        localStorage.setItem("setLocalstorageValueAsset", getAsset);
        localStorage.setItem("setLocalstorageValueCompany", getCompany);
        localStorage.setItem("setLocalstorageValueReseller", getReseller);

        var getLocalstorageValueAsset = localStorage.getItem('setLocalstorageValueAsset');
        var getLocalstorageValueCompany = localStorage.getItem('setLocalstorageValueCompany');
        var getLocalstorageValueReseller = localStorage.getItem('setLocalstorageValueReseller');

    }
    catch (e) {

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
