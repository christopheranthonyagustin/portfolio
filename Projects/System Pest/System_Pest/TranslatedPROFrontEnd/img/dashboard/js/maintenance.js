var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');
var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');
sessionStorage.setItem("setSessionstorageValueRegenerateMaintenance", true);
var titleJobNumber, titlePhone, titlePersonInCharge, titleScheduleTime, titleAddressTo, titleContactNumber, titleTo, titleAlertTime, titleCallCenter, titlePhoneUser, titleLocation, titleStart, titleEnd, titleSpeed, titleDeviceStatus, titlePhonePower, titleTimestamp, titleEvent, titleRemarks, titleLastKnown, titleJobStatus, titleCustomerCompany, titleUnit, titlePostal, titleAmount, titleSignature, titleEmail, titlePhoneUserAddress, titlePhoneUserProfile, titleJobType;
var titleItemNo, titleWeight, titleWidth, titleHeight, titleLength, titleVolWeight, titlePrice;
var titleEnterAddressPostal, titleEnterAddress, titleGeoCodeFail, titleError, titleSelected, titleCannotEditSchedule, titleJobCompletedCannotLoad, titleJobLoaded, titleJobNumberNotFound, titleCannotTransfer;
var titleAreYouSureDelete, titleDeleteSuccess, titleDeleteCancel;
var jobsCreatedInterval;

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
titleCustomerCompany = "Company";
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
titleAlertTime = "Alert Time";
titleTo = "To"
titleEnterAddressPostal = "You must enter Address or Postal code";
titleEnterAddress = "You must enter Address";
titleGeoCodeFail = "Geocode was not successful for the following reason: ";
titleError = "Error was: ";
titleSelected = "You have selected: ";
titleCannotEditSchedule = "Cannot edit Scheduled Job here";
titleJobCompletedCannotLoad = "Job is completed & cannot be loaded here!";
titleJobLoaded = "Job Loaded";
titleJobNumberNotFound = "Job Number not Found";
titleItemNo = "Item No.";
titleWeight = "Weight";
titleWidth = "Width";
titleHeight = "Height";
titleLength = "Length";
titleVolWeight = "Vol. Weight";
titlePrice = "Price";
titleCannotTransfer = "Job Cannot be Transfer or edit";
titleAreYouSureDelete = "Are you sure you wish to delete ?";
titleDeleteSuccess = "Deleted Successfully";
titleDeleteCancel = "Delete Canceled";


//$('#TableLoader').modal('show');

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

//Show Default forms
$('#newJobForm').show();
$('#scheduledJobForm').hide();
$('#apptForm').hide();
$('#purchaseForm').hide();
$('#warrantyForm').hide();
$('#apptForm-scheduled').hide();
$('#purchaseForm-scheduled').hide();
$('#warrantyForm-scheduled').hide();

$('#jobsCreatedMaintenance-cancel').prop('disabled', true);
$('#jobsCreatedMaintenance-edit').prop('disabled', true);

function initialize() {

    SearchPlacesTo();
    loadPestsTreatment();
}

google.maps.event.addDomListener(window, 'load', initialize);

//Web Api Pest
$(function () {

    //Populate phone user
    var WebAPIPest = "https://api.systempest.com/api/pestinfo";

    $('#jobPests').append($('<option selected="selected"></option>').val(0).html("No Pests Selected"));

    $.getJSON(WebAPIPest, function (data) {
        $.each(data, function (index, item) {

            $('#jobPests').append($('<option></option>').val(item.PestDesc).html(item.PestDesc));
        });

        $('.selectpicker').selectpicker('refresh');
    });

    //Populate phone user
    var WebAPIDriver = "";

    if (getSessionstorageValueRoleID == 1) {
        WebAPIDriver = 'https://api.systempest.com/api/driverinfo?ResellerID=' + '1' + '&CompanyID=' + '1';
    } else if (getSessionstorageValueRoleID == 2) {
        WebAPIDriver = 'https://api.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {
        WebAPIDriver = 'https://api.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }

    //alert(WebAPIDriver)

    $('#jobTechnician').append($('<option selected="selected"></option>').val(0).html("No Phone Users Selected"));
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

});

//Web Api Treatments
$(function () {

    //Populate phone user
    var WebAPITreatment = "https://api.systempest.com/api/treatmentinfo";

    $.getJSON(WebAPITreatment, function (data) {
        $.each(data, function (index, item) {

            $('#jobTreatments').append($('<option></option>').val(item.TreatmentDesc).html(item.TreatmentDesc));
        });

        $('.selectpicker').selectpicker('refresh');
    });

});


var $table = $('#pestsTreatment'),
    $button = $('#addItem');
$buttonClear = $('#clearItem');
var rows = [];
var itemNo = 1;


//Delete Row
var $tableItem = $('#pestsTreatment'),
    $removeItem = $('#deleteItem'),
    $editItem = $('#editItem');

//Disable cancel button by default
$removeItem.prop("disabled", true);
$editItem.prop("disabled", true);

$tableItem.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $removeItem.prop('disabled', !$tableItem.bootstrapTable('getSelections').length);
    $editItem.prop('disabled', !$tableItem.bootstrapTable('getSelections').length);

});




$(document).ready(function () {

    $('#reference').prop('disabled', true);

    $('#deleteItem').on('click', function () {


        var ids = $.map($tableItem.bootstrapTable('getSelections'), function (row) {

            return row.Index;
        });

        console.log(ids);



        $tableItem.bootstrapTable('remove', {
            field: 'Index',
            values: ids
        });




        $removeItem.prop('disabled', true);



    });
});

$(function () {


    $button.click(function (e) {
        e.preventDefault();
        // if ($("#jobPests").val() == 0 && $("#jobTreatments").val() == null) {
        //     alert("Item cannot be Added - Select Pest and Treatment")
        // }
        // else if ($("#jobPests").val() == 0) {
        //     alert("Item cannot be Added - Select Pest")
        // }
        // else if ($("#jobTreatments").val() == null) {
        //     alert("Item cannot be Added - Select Treatment")
        // }
        // else {
        //     insertData();
        // }

        if ($("#jobPests").val() != 0 || $("#jobOtherPest").val() != '') {
            if ($("#jobTreatments").val() != null || $("#jobOtherTreatment").val() != '') {
                insertData();
            } else {

                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-exclamation-triangle',
                    message: "Item cannot be Added - Select Treatment",
                    container: 'floating',
                    timer: 3000
                });
            }
        } else {

            $.niftyNoty({
                type: 'danger',
                icon: 'fa fa-exclamation-triangle',
                message: 'Item cannot be Added - Select Pest',
                container: 'floating',
                timer: 3000
            });
        }

    });

    $buttonClear.click(function (e) {
        $table.bootstrapTable('removeAll');
    });

    $('#clearForm').click(function (e) {
        $table.bootstrapTable('removeAll');
        clearJobForms();
    });

    $('#downloadTemplate').click(function (e) {
        window.location.href = 'SPMaintenanceTest.xlsx';
    });


});



function serialnoFormatter(value, row, index) {

    return index + 1;
}


function snFormatter(value, row, index) {

    return index + 1;
}

function serialFormatter(value) {

    return value + 1;
}


//  Format for Timestamp Column.
// =================================================================
function timeFormatter(value, row) {


    //Convert Timezone
    //var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    //var Singapore = moment.tz(value, Asia);

    //Format UTC
    var timestamp = moment(value).add('hours', 8).format('HH:mm');


    return '<div>' + '<span>' + timestamp + '</span>' + '</div>';


}

function timeFunction(value) {


    //Convert Timezone
    //var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    //var Singapore = moment.tz(value, Asia);

    //Format UTC
    var timestamp = moment(value).add('hours', 8).format('HH:mm');


    return timestamp;


}

function dateFormatter(value) {

    if (value <= '2001-01-01 00:00:00' || value == null || value == "" || value == 'undefined') {
        return;
    } else {

        //Format UTC
        var timestamp = moment(value).add('hours', 8).format('DD-MMM, YYYY HH:mm');

        return '<div>' + '<span>' + timestamp + '</span>' + '</div>';
    }



}

function inputdateFormatter(value) {

    if (value <= '2001-01-01 00:00:00' || value == null || value == "" || value == 'undefined') {
        return;
    } else {

        //Format UTC
        var timestamp = moment(value).add('hours', 8).format('DD-MMMM, YYYY HH:mm');

        return timestamp;
    }



}




function jobtypeFormatter(value, row) {

    //Format UTC
    var text;
    switch (value) {
        case 1:
            text = "T & C";
            break;
        case 2:
            text = "Maintenance";
            break;
        case 3:
            text = "SRF";
            break;
        case 4:
            text = "Delivery";
            break;
    }

    return '<div>' + '<span>' + text + '</span>' + '</div>';


}

function bpFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[0] + '</span>' + '</div>';

}

function tpFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[1] + '</span>' + '</div>';

}

function ospFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[2] + '</span>' + '</div>';

}

function spFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[3] + '</span>' + '</div>';

}

function rpFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[4] + '</span>' + '</div>';

}

function epFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[5] + '</span>' + '</div>';

}

function cspFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[6] + '</span>' + '</div>';

}

function othersFormatter(value, row) {

    var parseValue = value.split(',');

    return '<div>' + '<span>' + parseValue[7] + '</span>' + '</div>';

}

function signFormatter(value, fill, referenceno) {
    var labelColor;
    var text;
    //alert(value)
    if (fill == "Uniform") {
        //alert(value)
        text = value;
        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + referenceno + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="50" width="50"></a></div></center>';
    } else if (fill != "Uniform") {
        labelColor = "dark";
        if (getSessionstorageValueLanguage == "en") {
            text = "No Signature Photo";
        } else if (getSessionstorageValueLanguage == "th") {
            text = "ไม่มีรูป";
        } else if (getSessionstorageValueLanguage == "vn") {
            text = "Không có hình ảnh";
        } else if (getSessionstorageValueLanguage == "id") {
            text = "Tidak ada gambar";
        }
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }

}

function formFormatter(value, fill, referenceno) {
    var labelColor;
    var text;
    if (fill == "Uniform") {
        text = value;
        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="" data-title="' + referenceno + '"><i class="fa fa-file-pdf-o fa-lg" style="color:black;"></i></a></div></center>';

    } else if (fill != "Uniform") {
        labelColor = "dark";
        if (getSessionstorageValueLanguage == "en") {
            text = "No PDF";
        } else if (getSessionstorageValueLanguage == "th") {
            text = "ไม่มีรูป";
        } else if (getSessionstorageValueLanguage == "vn") {
            text = "Không có hình ảnh";
        } else if (getSessionstorageValueLanguage == "id") {
            text = "Tidak ada gambar";
        }
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }

}

$(function () {
    // if (getSessionstorageValueLanguage == "en") {
    //     $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("Maintenance Created by " + getSessionstorageValueUser + " (" + moment().format('D-MMM-YYYY') + ")"));
    // }
    // else if (getSessionstorageValueLanguage == "th") {
    //     $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("งานสร้างโดย " + getSessionstorageValueUser + " (" + moment().format('D-MMM-YYYY') + ")"));
    // }
    // else if (getSessionstorageValueLanguage == "vn") {
    //     $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("Jobs Tạo bởi " + getSessionstorageValueUser + " (" + moment().format('D-MMM-YYYY') + ")"));
    // }
    // else if (getSessionstorageValueLanguage == "id") {
    //     $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("Kerja Dicipta oleh " + getSessionstorageValueUser + " (" + moment().format('D-MMM-YYYY') + ")"));
    // }

    $('#getUserAgent').append($('<div></div>').val(getSessionstorageValueUser).html("Maintenance"));
    clearJobForms();

    reloadJobsCreated();

    // jobsCreatedInterval = setInterval(function () {
    //     reloadJobsCreated();
    //     //$('#jobsCreated').bootstrapTable('refresh');
    // }, '5000');

});


function reloadJobsCreated() {

    $('#SearchCompanyName').val('');
    $('#SearchPersonInCharge').val('');
    $('#SearchPostal').val('');
    $('#SearchAddress').val('');
    var timestamp = moment().format('D-MMM-YYYY');
    var rxtime = moment().add('days', 1).format('D-MMM-YYYY');

    var WebAPIJobs;
    if (getSessionstorageValueRoleID == 1) {

        WebAPIJobs = 'https://api.systempest.com/api/maintenanceinfo?CompanyID=' + getSessionstorageValueCompanyID;
    } else if (getSessionstorageValueRoleID == 2) {

        WebAPIJobs = 'https://api.systempest.com/api/maintenanceinfo?CompanyID=' + getSessionstorageValueCompanyID;
    } else if (getSessionstorageValueRoleID == 3) {

        WebAPIJobs = 'https://api.systempest.com/api/maintenanceinfo?CompanyID=' + getSessionstorageValueCompanyID;
    } else if (getSessionstorageValueRoleID >= 4) {

        WebAPIJobs = 'https://api.systempest.com/api/maintenanceinfo?CompanyID=' + getSessionstorageValueCompanyID;
    }


    //    alert(WebAPIJobs);


    $(document).ready(function () {


        $.ajax({
            url: WebAPIJobs,
            type: 'GET',
            success: function (res) {
                //console.log(res);
                $("#jobsCreated").empty();

                document.getElementById('total-jobsCreated').innerHTML = res.length;

                var outputDiv = document.getElementById('jobsCreated');

                outputDiv.innerHTML += "<table id='jobsCreated' border='1'>" +
                    "<thead>" +
                    "<tr>" +
                    "<th style='padding: 5px;'>SN</th>" +
                    "<th style='padding: 5px;'>" + "ID" + "</th>" +
                    "<th style='padding: 5px;'>" + "Address" + "</th>" +
                    "<th style='padding: 5px;'>" + "Postal" + "</th>" +
                    "<th style='padding: 5px;'>" + "Unit" + "</th>" +
                    "<th style='padding: 5px;'>Company</th>" +
                    "<th style='padding: 5px;'>Person In Charge</th>" +
                    "<th style='padding: 5px;'>" + "Phone" + "</th>" +
                    "<th style='padding: 5px;'>" + "Email" + "</th>" +
                    "<th style='padding: 5px;'>" + "Site" + "</th>" +
                    "<th style='padding: 5px;'>" + "Contract Start" + "</th>" +
                    "<th style='padding: 5px;'>" + "Contract End" + "</th>" +
                    "<th style='padding: 5px;'>" + "Maintenance Interval" + "</th>" +
                    "<th style='padding: 5px;'>" + "Notification Interval" + "</th>" +
                    "<th style='padding: 5px;'>" + "Remarks" + "</th>" +
                    "<th style='padding: 5px;'>Action</th>" +
                    "</tr>" +
                    "</thead>" +
                    "</table>";

                for (k = 0; k < res.length; k++) {

                    if (res[k] != undefined || res[k]) {

                        outputDiv.innerHTML += "<table id='jobsCreated' border='1'>" +
                            "<tbody>" +
                            "<tr>" +
                            "<td style='padding: 5px;'>" +
                            serialFormatter(k) +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            res[k].MaintenanceID +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            res[k].Address +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            res[k].Postal +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            res[k].Unit +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            res[k].CusCompany +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            res[k].PIC +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            res[k].Phone +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            res[k].Email +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            res[k].Site +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            dateFormatter(res[k].ContractStart) +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            dateFormatter(res[k].ContractEnd) +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            res[k].MaintenanceInterval +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            res[k].NotificationInterval +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            res[k].Remarks +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            "<strong><a href='javascript:viewjob(" + res[k].MaintenanceID + ")' style='color:#458FD2;'>" + "View" + '</a></strong>' +
                            "&nbsp;&nbsp;&nbsp;&nbsp;<strong><a href='javascript:loadMaintenanceInfo(" + res[k].MaintenanceID + ")' style='color:#458FD2;'>" + "Edit" + '</a></strong>' +
                            "&nbsp;&nbsp;&nbsp;&nbsp;<strong><a href='javascript:loadMaintenance(" + res[k].MaintenanceID + ")' style='color:#458FD2;'>" + "Recalculate" + '</a></strong>' +
                            "&nbsp;&nbsp;&nbsp;&nbsp;<strong><a href='javascript:deletejob(" + res[k].MaintenanceID + ")' style='color:#458FD2;'>" + "Delete" + '</a></strong>' +
                            "</td>" +
                            "</tr>" +
                            "</tbody>"; +
                        "</table>";


                    }


                }

            },
            error: function (xhr, ajaxOptions, thrownError) {
                console.log("error: " + xhr.status);
                console.log("error: " + thrownError);
            }

        });

    });

}

function searchJobFilter() {
    $('#LoadingForm').modal('show');

    var WebAPIJobs;
    var companyName = $('#SearchCompanyName').val();
    var personInCharge = $('#SearchPersonInCharge').val();
    var postalCode = $('#SearchPostal').val();
    var address = $('#SearchAddress').val();

    WebAPIJobs = 'https://api.systempest.com/api/maintenancefilterinfo?CompanyID=' + getSessionstorageValueCompanyID + '&CusCompany=' + companyName + '&PIC=' + personInCharge + '&Postal=' + postalCode + '&Address=' + address;

    //alert(WebAPIJobs);

    $(document).ready(function () {

        $.ajax({
            url: WebAPIJobs,
            type: 'GET',
            success: function (res) {
                if (res.length <= 0) {
                    document.getElementById('total-jobsCreated').innerHTML = '';
                    $("#jobsCreated").empty();
                    $('#LoadingForm').modal('hide');

                    var outputDiv = document.getElementById('jobsCreated');

                    outputDiv.innerHTML += "<table id='jobsCreated' border='1'>" +
                        "<thead>" +
                        "<tr>" +
                        "<th style='padding: 5px;'>SN</th>" +
                        "<th style='padding: 5px;'>" + "ID" + "</th>" +
                        "<th style='padding: 5px;'>" + "Address" + "</th>" +
                        "<th style='padding: 5px;'>" + "Postal" + "</th>" +
                        "<th style='padding: 5px;'>" + "Unit" + "</th>" +
                        "<th style='padding: 5px;'>Company</th>" +
                        "<th style='padding: 5px;'>Person In Charge</th>" +
                        "<th style='padding: 5px;'>" + "Phone" + "</th>" +
                        "<th style='padding: 5px;'>" + "Email" + "</th>" +
                        "<th style='padding: 5px;'>" + "Site" + "</th>" +
                        "<th style='padding: 5px;'>" + "Contract Start" + "</th>" +
                        "<th style='padding: 5px;'>" + "Contract End" + "</th>" +
                        "<th style='padding: 5px;'>" + "Maintenance Interval" + "</th>" +
                        "<th style='padding: 5px;'>" + "Notification Interval" + "</th>" +
                        "<th style='padding: 5px;'>" + "Remarks" + "</th>" +
                        "<th style='padding: 5px;'>Action</th>" +
                        "</tr>" +
                        "</thead>" +
                        "</table>";

                    $.niftyNoty({
                        type: 'danger',
                        icon: 'fa fa-exclamation-triangle',
                        message: 'No matching records found',
                        container: 'floating',
                        timer: 3000
                    });

                } else {

                    //console.log(res);
                    document.getElementById('total-jobsCreated').innerHTML = '';
                    $("#jobsCreated").empty();

                    document.getElementById('total-jobsCreated').innerHTML = res.length;

                    var outputDiv = document.getElementById('jobsCreated');

                    outputDiv.innerHTML += "<table id='jobsCreated' border='1'>" +
                        "<thead>" +
                        "<tr>" +
                        "<th style='padding: 5px;'>SN</th>" +
                        "<th style='padding: 5px;'>" + "ID" + "</th>" +
                        "<th style='padding: 5px;'>" + "Address" + "</th>" +
                        "<th style='padding: 5px;'>" + "Postal" + "</th>" +
                        "<th style='padding: 5px;'>" + "Unit" + "</th>" +
                        "<th style='padding: 5px;'>Company</th>" +
                        "<th style='padding: 5px;'>Person In Charge</th>" +
                        "<th style='padding: 5px;'>" + "Phone" + "</th>" +
                        "<th style='padding: 5px;'>" + "Email" + "</th>" +
                        "<th style='padding: 5px;'>" + "Site" + "</th>" +
                        "<th style='padding: 5px;'>" + "Contract Start" + "</th>" +
                        "<th style='padding: 5px;'>" + "Contract End" + "</th>" +
                        "<th style='padding: 5px;'>" + "Maintenance Interval" + "</th>" +
                        "<th style='padding: 5px;'>" + "Notification Interval" + "</th>" +
                        "<th style='padding: 5px;'>" + "Remarks" + "</th>" +
                        "<th style='padding: 5px;'>Action</th>" +
                        "</tr>" +
                        "</thead>" +
                        "</table>";

                    for (k = 0; k < res.length; k++) {

                        if (res[k] != undefined || res[k]) {

                            outputDiv.innerHTML += "<table id='jobsCreated' border='1'>" +
                                "<tbody>" +
                                "<tr>" +
                                "<td style='padding: 5px;'>" +
                                serialFormatter(k) +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                res[k].MaintenanceID +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                res[k].Address +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                res[k].Postal +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                res[k].Unit +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                res[k].CusCompany +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                res[k].PIC +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                res[k].Phone +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                res[k].Email +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                res[k].Site +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                dateFormatter(res[k].ContractStart) +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                dateFormatter(res[k].ContractEnd) +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                res[k].MaintenanceInterval +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                res[k].NotificationInterval +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                res[k].Remarks +
                                "</td>" +
                                "<td style='padding: 5px;'>" +
                                "<strong><a href='javascript:viewjob(" + res[k].MaintenanceID + ")' style='color:#458FD2;'>" + "View" + '</a></strong>' +
                                "&nbsp;&nbsp;&nbsp;&nbsp;<strong><a href='javascript:loadMaintenanceInfo(" + res[k].MaintenanceID + ")' style='color:#458FD2;'>" + "Edit" + '</a></strong>' +
                                "&nbsp;&nbsp;&nbsp;&nbsp;<strong><a href='javascript:loadMaintenance(" + res[k].MaintenanceID + ")' style='color:#458FD2;'>" + "Recalculate" + '</a></strong>' +
                                "&nbsp;&nbsp;&nbsp;&nbsp;<strong><a href='javascript:deletejob(" + res[k].MaintenanceID + ")' style='color:#458FD2;'>" + "Delete" + '</a></strong>' +
                                "</td>" +
                                "</tr>" +
                                "</tbody>"; +
                            "</table>";


                        }

                        if (res.length == k + 1) {
                            $('#LoadingForm').modal('hide');
                            $.niftyNoty({
                                type: 'success',
                                icon: 'fa fa-check',
                                message: 'Success',
                                container: 'floating',
                                timer: 3000
                            });
                        }

                    }

                }

            },
            error: function (xhr, ajaxOptions, thrownError) {
                console.log("error: " + xhr.status);
                console.log("error: " + thrownError);
                $('#LoadingForm').modal('hide');
            }

        });

    });

}


function viewjob(job_id) {
    $('#LoadingForm').modal('show');

    var WebAPI = 'https://api.systempest.com/api/maintenancejobinfo?MaintenanceID=' + job_id;
    $.ajax({
        type: 'GET',
        url: WebAPI,
        async: false,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (data) {
            $("<div id='viewForms'>").dialog({
                modal: true,
                title: "Maintenance Job",
                width: '100%',
                position: 'absolute',
                height: 'auto',
                open: function () {
                    $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
                    $(".ui-dialog-titlebar-close").hide(); //hide close button

                    var markup = "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto;' class=''>" +
                        "<table id='maintenancejobTable' class='table table-bordered' cellspacing='0' width='100%'>" +
                        "<thead>" +
                        "<tr>" +
                        "<th style='color: blue;'>SN</th>" +
                        "<th style='color: blue;'>Maintenance Job ID</th>" +
                        "<th style='color: blue;'>Alert Date</th>" +
                        "<th style='color: blue;'>Alert Day</th>" +
                        "<th style='color: blue;'>Scheduled Date</th>" +
                        "<th style='color: blue;'>Scheduled Day</th>" +
                        "<th style='color: blue;'>Phone Users</th>" +
                        "<th style='color: blue;'>Technicians</th>" +
                        "<th style='color: blue;'>Status</th>" +
                        "<th style='color: blue;'>Findings</th>" +
                        "<th style='color: blue;'>Date of Cancellation</th>" +
                        "<th style='color: blue;'>Cancel Remarks</th>" +
                        "<th style='color: blue;'>Reference No.</th>" +
                        "<th style='color: blue;'>Technician Signature</th>" +
                        "<th style='color: blue;'>Client Signature</th>" +
                        "<th style='color: blue;'>Forms</th>" +
                        "<th style='color: blue;'>Action</th>" +
                        "</tr>" +
                        "</thead>" +
                        "<tbody>"

                    for (k = 0; k < data.length; k++) {

                        if (data[k] != undefined || data[k]) {

                            var itemno, pest, aoc, findings;
                            var strRtn = "";
                            var value = data[k].Findings
                            if (value != "") {
                                for (j = 0; j < value.length; j++) {

                                    if (value[j] != undefined || value[j]) {

                                        itemno = value[j].ItemNo;
                                        pest = value[j].PestDesc;
                                        aoc = value[j].AocDesc;
                                        findings = value[j].Findings;
                                    }

                                    strRtn += '<div>' +
                                        '<span>' +
                                        'No.: ' + itemno +
                                        '</br>' +
                                        'Pest: ' + pest +
                                        '</br>' +
                                        'Area of Concerned: ' + aoc +
                                        '</br>' +
                                        'Findings: ' + findings +
                                        '</br>' +
                                        '</span>' +
                                        '</div>';


                                    if (j + 1 == value.length) {
                                        markup += "<tr>" +
                                            "<td style='padding: 5px;'>" +
                                            serialFormatter(k) +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            data[k].MaintenanceJobID +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            dateFormatter(data[k].AlertDate) +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            dayFormatter(data[k].AlertDate) +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            dateFormatter(data[k].Timestamp) +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            dayFormatter(data[k].Timestamp) +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            data[k].DriverName +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            data[k].Technician +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            data[k].FlagValue +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            strRtn +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            dateFormatter(data[k].JobCancelled) +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            data[k].CancelRemarks +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            data[k].ReferenceNo +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            signFormatter(data[k].MainTechSignatures, data[k].MainTechFillSignatures, data[k].ReferenceNo) +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            signFormatter(data[k].MainClientSignatures, data[k].MainClientFillSignatures, data[k].ReferenceNo) +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            formFormatter(data[k].MainForms, data[k].MainFormsFill, data[k].ReferenceNo) +
                                            "</td>" +
                                            "<td style='padding: 5px;'>" +
                                            editactionFormatter(data[k].MaintenanceJobID) +
                                            "</td>" +
                                            "</tr>"
                                    }
                                }

                            } else {
                                markup += "<tr>" +
                                    "<td style='padding: 5px;'>" +
                                    serialFormatter(k) +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    data[k].MaintenanceJobID +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    dateFormatter(data[k].AlertDate) +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    dayFormatter(data[k].AlertDate) +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    dateFormatter(data[k].Timestamp) +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    dayFormatter(data[k].Timestamp) +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    data[k].DriverName +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    data[k].Technician +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    data[k].FlagValue +
                                    "</td>" +
                                    "<td style='padding: 5px;'>"
                                    //+ JSON.stringify(data[k].Findings)
                                    +
                                    "" +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    dateFormatter(data[k].JobCancelled) +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    data[k].CancelRemarks +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    data[k].ReferenceNo +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    signFormatter(data[k].MainTechSignatures, data[k].MainTechFillSignatures, data[k].ReferenceNo) +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    signFormatter(data[k].MainClientSignatures, data[k].MainClientFillSignatures, data[k].ReferenceNo) +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    formFormatter(data[k].MainForms, data[k].MainFormsFill, data[k].ReferenceNo) +
                                    "</td>" +
                                    "<td style='padding: 5px;'>" +
                                    editactionFormatter(data[k].MaintenanceJobID) +
                                    "</td>" +
                                    "</tr>"
                            }



                        }

                        if (k + 1 == data.length) {
                            markup += "</tbody></table>" + "</div>";

                            if (markup !== undefined || markup !== null) $(this).html(markup);
                        }
                    }



                    function dateFormatter(value) {
                        if (value <= '2001-01-01 00:00:00' || value == null || value == "" || value == 'undefined') {
                            return "-";
                        } else {
                            //Format UTC
                            var timestamp = moment(value).add('hours', 8).format('DD-MMM, YYYY HH:mm');
                            return '<div>' + '<span>' + timestamp + '</span>' + '</div>';
                        }
                    }


                    function dayFormatter(value) {
                        if (value <= '2001-01-01 00:00:00' || value == null || value == "" || value == 'undefined') {
                            return "-";
                        } else {
                            //Format UTC
                            var timestamp = moment(value).add('hours', 8).format('dddd');
                            return '<div>' + '<span>' + timestamp + '</span>' + '</div>';
                        }
                    }



                    function findingFormatter(value) {

                        var itemno, pest, aoc, findings;
                        var strRtn = "";
                        if (value != "") {
                            for (k = 0; k < value.length; k++) {

                                if (value[k] != undefined || value[k]) {

                                    itemno = value[k].ItemNo;
                                    pest = value[k].PestDesc;
                                    aoc = value[k].AocDesc;
                                    findings = value[k].Findings;
                                }

                                strRtn += '<div>' +
                                    '<span>' +
                                    'No.: ' + itemno +
                                    '</br>' +
                                    'Pest: ' + pest +
                                    '</br>' +
                                    'Area of Concerned: ' + aoc +
                                    '</br>' +
                                    'Findings: ' + findings +
                                    '</br>' +
                                    '</span>' +
                                    '</div>';


                            }

                            return strRtn;

                        } else {
                            return '<div>' + '<span>' + "No Findings" + '</span>' + '</div>';
                        }




                    }

                    function editactionFormatter(value) {

                        return "<div>" + "<span>" + "<a href='javascript:editmaintenancejob(" + value + ")' style='color:#458FD2;'>" + "Edit" + "</a>" + "</span>" + "</div>";
                        //return "<button type='button' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#MaintenanceJobForm'>Launch demo modal</button>";

                    }

                },
                buttons: {
                    'Disable All Email Notification': function () {
                        disableEmailNotification(data[0].MaintenanceID);
                    },
                    'Add Maintenance': function () {

                        addmaintenancejob(data[0].MaintenanceID, data[data.length - 1].MaintenanceJobID)
                    },
                    'Export': function () {
                        $('#maintenancejobTable').tableExport({
                            type: 'excel',
                            escape: 'false',
                            htmlContent: 'false',
                            fileName: "[" + getSessionstorageValueCompany + "] Maintenance Job" + " " + moment.utc().add('hours', 8).format('D-MMM-YYYY')
                        });

                    },
                    Close: function () {
                        $(this).dialog("close");
                    },
                }
            });

            $('#LoadingForm').modal('hide');

            // change the border color just for fun
            $(this).css('border-color', 'red');


        }
    });


}

function loadDateFormatter(value) {
    if (value <= '2001-01-01 00:00:00' || value == null || value == "" || value == 'undefined') {
        return "-";
    } else {
        //Format UTC
        var timestamp = moment(value).add('hours', 8).format('DD-MMM, YYYY HH:mm');
        return timestamp;
    }
}


function datetimeFormatter(value) {

    if (value <= '2001-01-01 00:00:00' || value == null || value == "" || value == 'undefined') {
        return;
    } else {

        //Format UTC
        var timestamp = moment(value).add('hours', 8).format('DD-MMM, YYYY HH:mm');

        return timestamp;
    }



}

function deletejob(job_id) {

    if (getSessionstorageValueRoleID > 3) {

        $.niftyNoty({
            type: 'danger',
            icon: 'fa fa-exclamation-triangle',
            message: 'User Account not allowed to Delete',
            container: 'floating',
            timer: 3000
        });
    } else {
        if (getSessionstorageValueLanguage == "en") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });
        } else if (getSessionstorageValueLanguage == "th") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "th",


            });
        } else if (getSessionstorageValueLanguage == "vn") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "vi",


            });
        } else if (getSessionstorageValueLanguage == "id") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "id",


            });
        }

        bootbox.confirm("<div style='color:black'>" + titleAreYouSureDelete + "</div>", function (result) {
            if (result) {

                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: titleDeleteSuccess,
                    container: 'floating',
                    timer: 3000
                });


                var maintenance = JSON.stringify({
                    'MaintenanceID': job_id
                });
                var WebAPI = 'https://api.systempest.com/api/maintenanceinfo/' + job_id;

                var event = {
                    AssetID: 0,
                    TagID: 0,
                    Timestamp: moment().format(),
                    RxTime: moment().format(),
                    StatusID: 2,
                    Remarks: "Maintenance ID: " + job_id + " deleted successfully",
                    AlertLevel: 0,
                    AlertLevelEx: 0,
                    Flag: 1,
                    AckUserID: getSessionstorageValueRoleID,
                    CompanyID: getSessionstorageValueCompanyID
                };


                $.ajax({
                    url: "https://api.systempest.com/api/eventinfo",
                    type: "POST",
                    data: JSON.stringify(event),
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
                    success: function (event) {
                        console.log(event);


                        $.ajax({
                            url: WebAPI,
                            type: "Delete",
                            data: JSON.stringify(maintenance),
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
                            success: function (maintenance) {
                                console.log(maintenance);

                                reloadJobsCreated();
                                //window.location.reload(true);
                            }
                        });

                    }
                });


            } else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    //message: 'Delete Canceled',
                    message: titleDeleteCancel,
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    }





}

// $('#jobPests').on('change', function(e){
//     if($('#jobPests').find("option:selected").val() == "Others"){
//         $('#divOtherPest').show();
//     }else{
//         $('#divOtherPest').hide();
//     }

//   });

function disableEmailNotification(maintenance_id) {
    if (getSessionstorageValueLanguage == "en") {
        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });
    } else if (getSessionstorageValueLanguage == "th") {
        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });
    } else if (getSessionstorageValueLanguage == "vn") {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "vi",


        });
    } else if (getSessionstorageValueLanguage == "id") {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "id",


        });
    }

    bootbox.confirm("<div style='color:black'>" + "Are you sure you wish to disable all email notification?" + "</div>", function (result) {
        if (result) {

            $('#LoadingForm').modal('show');
            var WebAPI = 'https://api.systempest.com/api/maintenancejobinfo?MaintenanceID=' + maintenance_id;

            $.ajax({
                type: 'GET',
                url: WebAPI,
                async: false,
                data: {
                    get_param: 'value'
                },
                dataType: 'json',
                success: function (data) {

                    for (var i = 0; i < data.length; i++) {

                        if (data[i].Flag > 0) {
                            //Update Maintenance Job
                            var maintenancejob = {
                                MaintenanceJobID: data[i].MaintenanceJobID,
                                MaintenanceID: data[i].MaintenanceID,
                                AlertDate: data[i].AlertDate,
                                Timestamp: data[i].Timestamp,
                                RxTime: data[i].RxTime,
                                Flag: data[i].Flag,
                                JobCancelled: data[i].JobCancelled,
                                CancelRemarks: data[i].CancelRemarks,
                                isSent: 0,
                                ReferenceNo: data[i].CancelRemarks,
                                AssetID: data[i].AssetID,
                                DriverID: data[i].DriverID,
                                Technician: data[i].Technician
                            }

                            var updateMaintenanceJob = 'https://api.systempest.com/api/maintenancejobinfo?id=' + data[i].MaintenanceJobID;
                            var maintenanceFinalID = data[i].MaintenanceID;
                            $.ajax({
                                url: updateMaintenanceJob,
                                type: "PUT",
                                async: false,
                                data: JSON.stringify(maintenancejob),
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
                                success: function (maintenancejob) {
                                    console.log(maintenancejob);


                                    //$('#editForms').dialog('destroy');
                                    //$(".ui-dialog-content").dialog("destroy");

                                }
                            });

                            if (i + 1 == data.length) {

                                $('#LoadingForm').modal('hide');
                                $('#viewForms').dialog('destroy');
                                viewjob(maintenanceFinalID);
                            }
                        }

                    }
                }
            });
        } else {

        }
    });
}


function addmaintenancejob(maintenance_id, maintenance_job_id) {

    $.ajax({
        type: 'GET',
        url: "https://api.systempest.com/api/maintenancejobinfo/" + maintenance_job_id,
        async: false,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (value) {

            $("<div id='addForms'>").dialog({
                modal: true,
                title: "Add Maintenance Job",
                width: '100%',
                position: 'center',
                height: 'auto',
                dialogClass: 'no-close',
                open: function () {



                    $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
                    $(".ui-dialog-titlebar-close").hide(); //hide close button

                    var top = Math.max(jQuery(window).height() / 2 - jQuery(this)[0].offsetHeight / 2, 0) - 300;
                    var left = Math.max(jQuery(window).width() / 2 - jQuery(this)[0].offsetWidth / 2, 0);

                    jQuery(this).parent().css('top', top + "px");
                    jQuery(this).parent().css('left', left + "px");
                    jQuery(this).parent().css('position', 'fixed');

                    var markup = "<div class='col-sm-3'><div class='form-group'>" +
                        "<label class='control-label'>Maintenance ID</label>" +
                        "<input id='maintenanceID' type='text' placeholder='Maintenance ID' class='form-control' disabled='disabled'>" +
                        "</div></div>" +
                        "<div class='col-sm-3'><div class='form-group'>" +
                        "<label class='control-label'>Notification Interval</label>" +
                        "<input id='notificationInterval' type='text' placeholder='Notification Interval' class='form-control' disabled='disabled'>" +
                        "</div></div>" +
                        "<div class='col-sm-3'><div class='form-group'>" +
                        "<label class='control-label'>Alert Date</label>" +
                        "<input id='alertDate' type='text' placeholder='Alert Date' class='form-control' disabled='disabled'>" +
                        "</div></div>" +
                        "<div class='col-sm-3'><div class='form-group'>" +
                        "<label class='control-label'>Scheduled Date</label>" +
                        "<input id='scheduledDate' type='text' placeholder='Scheduled Date' class='form-control'>" +
                        "</div></div>" +
                        "<div class='col-sm-4' style='height: 32px;'><div class='form-group'>" +
                        "<label class='control-label'>Phone Users</label>" +
                        "<select class='selectpicker' data-live-search='true' data-width='100%' data-style='btn-asiacomDropdown' id='maintenanceJobTechinician' name='maintenanceJobTechinician' data-table='searchable' ></select>" +
                        "</div></div>" +
                        "<div class='col-sm-4'><div class='form-group'>" +
                        "<label class='control-label'>Technicians</label>" +
                        "<input id='maintechnicians' type='text' placeholder='Technicians' class='form-control'>" +
                        "</div></div>" +
                        "<div class='col-sm-4'><div class='form-group'>" +
                        "<label class='control-label'>Reference No</label>" +
                        "<input id='referenceno' type='text' placeholder='Reference No.' disabled='disabled' class='form-control'>" +
                        "</div></div>";

                    markup +=
                        "<div class='col-sm-4'><div class='form-group'>" +
                        "<label class='control-label'>Pests</label>" +
                        "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='newpests' name='newpests' data-table='searchable'></select>" +
                        "</div></div>" +
                        "<div class='col-sm-4'><div class='form-group'>" +
                        "<label class='control-label'>Treatments</label>" +
                        "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' multiple data-width='100%' data-style='btn-asiacomDropdown' id='newTreatments' name='newTreatments' data-table='searchable'></select>" +
                        "</div></div>" +
                        "<div class='col-sm-4' style='margin-top: 26px;'><div class='form-group'>" +
                        "<button id='addItemPest' class='btn btn-info' type='submit' style='margin-right:15px;'>Add Pest</button>" +
                        "<button id='deleteItemPest' class='btn btn-danger' disabled=''>Delete Pest</button>" +
                        "<button id='clearItemPest' class='btn btn-danger' type='submit' style='margin-left:15px;'>Clear Pest</button>" +
                        "</div></div>" +
                        "<div class='col-sm-4'><div class='form-group'>" +
                        "<input id=newotherpests type=text placeholder=Other Pest class=form-control>" +
                        "</div></div>" +
                        "<div class='col-sm-4'><div class='form-group'>" +
                        "<input id=newotherTreatments type=text placeholder=Other Pest class=form-control>" +
                        "</div></div>" +
                        "<div class='col-sm-4'><div class='form-group'>" +

                        "</div></div>"

                    markup += "<div id='custom-pesttreatment'>" +
                        "</div>" +
                        "<div class='col-sm-12'>" +
                        "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto; height: 250px;' class=''>" +
                        "<table id='newpestsTreatment' class='table table-condensed table-vcenter searchable'" +
                        " data-toolbar='#custom-pesttreatment'" +
                        " data-click-to-select='true'" +
                        " data-single-select='true'" +
                        " data-search='false'" +
                        " data-show-refresh='false'" +
                        " data-show-toggle='false'" +
                        " data-show-columns='false'" +
                        " data-show-toggle='false'" +
                        " data-pagination='false'" +
                        " data-show-pagination-switch='false'" +
                        "cellspacing = '0' width = '100%' > "


                    markup += "</table>" + "</div></div>";

                    if (markup !== undefined || markup !== null) $(this).html(markup);
                    var rows = [];
                    $('#newpestsTreatment').bootstrapTable('removeAll');

                    $('#newpestsTreatment').bootstrapTable({
                        idField: 'PestItemID',
                        columns: [{
                            field: 'state',
                            checkbox: true
                        }, {
                            field: 'ItemNo',
                            title: 'Item No',
                            formatter: serialnoFormatter
                        }, {
                            field: 'PestDesc',
                            title: 'Pests'
                        }, {
                            field: 'TreatmentDesc',
                            title: 'Treatments',
                        }, {
                            field: 'Index',
                            title: 'Index',
                            class: 'hidden-xs hidden-sm hidden-md hidden-lg'
                        }],
                        onCheck: function (row, index) {
                            console.log(index)
                        },
                        onLoadSuccess: function (row) {


                        },
                        onPostBody: function () {



                        },
                        onPreBody: function (data) {


                        },
                        onCheck: function (row, $element) {

                        },
                        onUncheck: function (row) {

                        },

                    });


                    for (var i = 0; i < value.Pest.length; i++) {

                        rows.push({
                            PestDesc: value.Pest[i].PestDesc,
                            TreatmentDesc: value.Pest[i].TreatmentDesc,
                            Index: value.Pest[i].ItemNo
                        });
                    }
                    $('#newpestsTreatment').bootstrapTable('append', rows);
                    rows = [];

                    function indexFormmater(value, row) {

                        return value - 1;
                    }

                    var $tablePest = $('#newpestsTreatment'),
                        $buttonPest = $('#addItemPest');
                    var rowsPest = [];
                    var itemNoPest = 1;

                    //Delete Row
                    var $tableItemPest = $('#newpestsTreatment'),
                        $removeItemPest = $('#deleteItemPest'),
                        $editItemPest = $('#editItemPest');

                    //Disable cancel button by default
                    $removeItemPest.prop("disabled", true);
                    $editItemPest.prop("disabled", true);

                    $tableItemPest.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
                        $removeItemPest.prop('disabled', !$tableItemPest.bootstrapTable('getSelections').length);
                        $editItemPest.prop('disabled', !$tableItemPest.bootstrapTable('getSelections').length);

                    });


                    $(document).ready(function () {

                        $('#deleteItemPest').on('click', function () {

                            var ids = $.map($tableItemPest.bootstrapTable('getSelections'), function (row) {
                                return row.Index;
                            });

                            console.log(ids);

                            $tableItemPest.bootstrapTable('remove', {
                                field: 'Index',
                                values: ids
                            });


                            $removeItemPest.prop('disabled', true);

                        });

                        $('#clearItemPest').on('click', function () {

                            $tableItemPest.bootstrapTable('removeAll');

                        });
                    });


                    $(function () {

                        $buttonPest.click(function (e) {
                            e.preventDefault();
                            if ($("#newpests").val() == 0 && $("#newpests").val() == null) {

                                $.niftyNoty({
                                    type: 'danger',
                                    icon: 'fa fa-exclamation-triangle',
                                    message: 'Item cannot be Added - Select Pest and Treatment',
                                    container: 'floating',
                                    timer: 3000
                                });
                            } else if ($("#newpests").val() == 0) {

                                $.niftyNoty({
                                    type: 'danger',
                                    icon: 'fa fa-exclamation-triangle',
                                    message: 'Item cannot be Added - Select Pest',
                                    container: 'floating',
                                    timer: 3000
                                });
                            } else if ($("#newTreatments").val() == null) {

                                $.niftyNoty({
                                    type: 'danger',
                                    icon: 'fa fa-exclamation-triangle',
                                    message: 'Item cannot be Added - Select Treatment',
                                    container: 'floating',
                                    timer: 3000
                                });
                            } else {

                                insertDataPest();
                            }


                        });

                        $buttonClear.click(function (e) {
                            $tablePest.bootstrapTable('removeAll');
                        });

                        $('#clearForm').click(function (e) {
                            $tablePest.bootstrapTable('removeAll');
                            clearJobForms();
                        });


                    });


                    function insertDataPest() {

                        var rowId;

                        var boostrapTableValue = JSON.stringify($('#newpestsTreatment').bootstrapTable().bootstrapTable('getData'));

                        var stringify = JSON.parse(boostrapTableValue);
                        if (stringify.length > 0) {
                            rowId = stringify[stringify.length - 1]['Index'] + 1;
                        } else {
                            rowId = 1;
                        }

                        var getPest = $('#newpests').val();
                        if ($('#newotherpests').val() != "") {
                            getPest = $('#newotherpests').val();
                        } else {
                            getPest = $('#newpests').val();
                        }
                        var getTreatments = $('#newTreatments').val();
                        if ($('#newotherTreatments').val() != "") {
                            if ($("#newTreatments").val() == null) {
                                getTreatments = $('#newotherTreatments').val();
                            } else {
                                getTreatments = getTreatments + ", " + $('#newotherTreatments').val();
                            }

                        }
                        rowsPest.push({
                            PestDesc: getPest,
                            TreatmentDesc: getTreatments,
                            Index: rowId
                        });

                        $('#newpestsTreatment').bootstrapTable('append', rowsPest);
                        rowsPest = [];
                        itemNoPest++;

                        $('#newpests').val(0);
                        $('#newTreatments').val(0);

                        $('#newotherpests').val("");
                        $('#newotherTreatments').val("");
                        $('#newpests').selectpicker('refresh');
                        $('#newTreatments').selectpicker('refresh');


                    }


                    $.getJSON('https://api.systempest.com/api/emailflaginfo', function (data) {

                        $.each(data, function (index, item) {

                            if (item.EmailFlagID == value.Flag) {
                                $('#status').append($('<option selected="selected"></option>').val(item.EmailFlagID).html(item.FlagValue));
                            } else {
                                $('#status').append($('<option></option>').val(item.EmailFlagID).html(item.FlagValue));
                            }

                        });
                        $(".selectpicker").selectpicker('refresh');
                    });

                    //Populate phone user
                    var WebAPIDriver = "";

                    if (getSessionstorageValueRoleID == 1) {
                        WebAPIDriver = 'https://api.systempest.com/api/driverinfo?ResellerID=' + '1' + '&CompanyID=' + '1';
                    } else if (getSessionstorageValueRoleID == 2) {
                        WebAPIDriver = 'https://api.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

                    } else if (getSessionstorageValueRoleID >= 3) {
                        WebAPIDriver = 'https://api.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
                    }

                    //Popuate Pest
                    var WebAPIPest = "https://api.systempest.com/api/pestinfo";
                    $('#newpests').append($('<option selected="selected"></option>').val(0).html("No Pests Selected"));
                    $.getJSON(WebAPIPest, function (data) {
                        $.each(data, function (index, item) {
                            $('#newpests').append($('<option></option>').val(item.PestDesc).html(item.PestDesc));
                        });
                        $('.selectpicker').selectpicker('refresh');
                    });

                    var WebAPITreatment = "https://api.systempest.com/api/treatmentinfo";
                    $.getJSON(WebAPITreatment, function (data) {
                        $.each(data, function (index, item) {
                            $('#newTreatments').append($('<option></option>').val(item.TreatmentDesc).html(item.TreatmentDesc));
                        });

                        $('.selectpicker').selectpicker('refresh');
                    });

                    //$('#maintenanceJobTechinician').append($('<option selected="selected"></option>').val(0).html("No Phone Users Selected"));
                    $.getJSON(WebAPIDriver, function (data) {

                        $('#maintenanceJobTechinician').append($('<option selected="selected"></option>').val(0).html("No Phone Users Selected"));

                        $.each(data, function (index, item) {

                            $('#maintenanceJobTechinician').append($('<option data-technician="' + item.Technician + '"></option>').val(item.DriverID).html(item.Name));
                        });


                        $('.selectpicker').selectpicker('refresh');
                    });

                    //OnChange Dropdown
                    $('#status').change(function () {
                        var selected = $(this).find("option:selected").html();
                        console.log("You have selected: " + selected);
                        if (selected == "Cancelled") {

                            $('#cancelRemarks').prop("disabled", false);
                        } else if (selected == "Completed") {

                            $('#cancelRemarks').prop("disabled", true);
                        } else if (selected == "Incomplete") {

                            $('#cancelRemarks').prop("disabled", true);
                        }
                    });

                    $('#maintenanceJobTechinician').change(function () {
                        var getTechnician = $(this).find(':selected').attr('data-technician')
                        $('#maintechnicians').val(getTechnician);

                    });



                    $('#maintenanceID').val(maintenance_id);
                    $('#alertDate').val(datetimeFormatter(value.AlertDate));
                    $('#scheduledDate').val(datetimeFormatter(value.Timestamp));
                    $('#referenceno').val(value.ReferenceNo);
                    $('.selectpicker').selectpicker('refresh');

                    var dateFormat = "DD-MMM, YYYY HH:mm";
                    var timestamp = moment(value.Timestamp).subtract('hours', 0).format(dateFormat);
                    var alertdate = moment(value.AlertDate).add('hours', 0).format(dateFormat);
                    var convertTimestamp = moment(timestamp, dateFormat);
                    var convertAlertDate = moment(alertdate, dateFormat);
                    var duration = moment.duration(convertTimestamp - convertAlertDate).humanize();

                    $('#notificationInterval').val(duration);


                    var dateToday = new Date();

                    jQuery('#alertDate').datetimepicker({
                        format: 'DD-MMM, YYYY HH:mm',
                        formatTime: 'HH:mm',
                        formatDate: 'DD-MMM, YYYY HH:mm',
                        theme: 'dark',
                        minDate: dateToday,
                        autoclose: true,
                        mask: false,
                        onChangeDateTime: function (dp, $input) {
                            $(this).hide();
                            $('#alertDate').datetimepicker();
                        }
                    });

                    jQuery('#scheduledDate').datetimepicker({
                        format: 'DD-MMM, YYYY HH:mm',
                        formatTime: 'HH:mm',
                        formatDate: 'DD-MMM, YYYY HH:mm',
                        theme: 'dark',
                        autoclose: true,
                        minDate: dateToday,
                        timepicker: true,
                        todayButton: false,
                        mask: false,
                        onChangeDateTime: function (dp, $input) {

                            var now = moment($input.val(), dateFormat);

                            var parseDuration = duration.split(' ');

                            var alertDate = moment(now).subtract(parseDuration[0], parseDuration[1]).format(dateFormat);

                            $('#alertDate').val(alertDate);
                            $(this).hide();
                            $('#scheduledDate').datetimepicker();
                        }
                    });


                    //$("#scheduledDate").keyup(function () {
                    //    //alert("Warning: Pls. select date from datepicker! Settings will return to default");
                    //    //$('#alertDate').val(datetimeFormatter(value.AlertDate));
                    //    //$('#scheduledDate').val(datetimeFormatter(value.Timestamp));
                    //});

                    function pestFormatter(value, maintenancejobID) {

                        console.log(value)
                        var itemno, pest, treatment, maintenance_id;
                        var strRtn = "";
                        if (value != "") {

                            for (k = 0; k < value.length; k++) {

                                if (value[k] != undefined || value[k]) {

                                    itemno = value[k].ItemNo;
                                    pest = value[k].PestDesc;
                                    treatment = value[k].TreatmentDesc;
                                    maintenance_job_id = value[k].MaintenanceJobID;
                                    // value.Index = value[k].ItemNo;
                                    Object.assign(value[k], {
                                        Index: value[k].ItemNo
                                    });

                                    strRtn += '<div>' +
                                        '<span>' +
                                        'No.: ' + itemno +
                                        '</br>' +
                                        'Pest: ' + pest +
                                        '</br>' +
                                        'Treatment: ' + treatment +
                                        '</br>' +
                                        '</span>' +
                                        '</div>';
                                }
                            }

                            strRtn += '<br />' +
                                '<div class="form-group pull-right">' +
                                "<span>" + "<a href='javascript:editpest(" + JSON.stringify(value) + ")' style='color:#458FD2;'>" + "Edit" + "</a>" + "</span>" +
                                '</div>';


                            return strRtn;
                        } else {
                            strRtn += '<div>' + '<span>' + "No Pest & Treatments" + '</span>' + '</div>';
                            strRtn += '<br />' +
                                '<div class="form-group pull-right">' +
                                "<span>" + "<a href='javascript:editNoPest(" + maintenancejobID + ")' style='color:#458FD2;'>" + "Edit" + "</a>" + "</span>" +
                                '</div>';

                            return strRtn;
                        }




                    }

                },
                buttons: {

                    'Add Maintenance Job': function () {
                        if ($('#scheduledDate').val() == "") {

                            $.niftyNoty({
                                type: 'danger',
                                icon: 'fa fa-exclamation-triangle',
                                message: 'Warning: Pls. select date from datepicker! Date must not be empty.',
                                container: 'floating',
                                timer: 3000
                            });

                        } else {
                            var validDate = $('#scheduledDate').val();
                            if (moment(validDate).isValid()) {
                                if (moment(validDate).isSameOrAfter(moment(), "day")) {
                                    if (getSessionstorageValueLanguage == "en") {
                                        bootbox.setDefaults({
                                            /**
                                             * @optional String
                                             * @default: en
                                             * which locale settings to use to translate the three
                                             * standard button labels: OK, CONFIRM, CANCEL
                                             */
                                            locale: "en",


                                        });
                                    } else if (getSessionstorageValueLanguage == "th") {
                                        bootbox.setDefaults({
                                            /**
                                             * @optional String
                                             * @default: en
                                             * which locale settings to use to translate the three
                                             * standard button labels: OK, CONFIRM, CANCEL
                                             */
                                            locale: "th",


                                        });
                                    } else if (getSessionstorageValueLanguage == "vn") {

                                        bootbox.setDefaults({
                                            /**
                                             * @optional String
                                             * @default: en
                                             * which locale settings to use to translate the three
                                             * standard button labels: OK, CONFIRM, CANCEL
                                             */
                                            locale: "vi",


                                        });
                                    } else if (getSessionstorageValueLanguage == "id") {

                                        bootbox.setDefaults({
                                            /**
                                             * @optional String
                                             * @default: en
                                             * which locale settings to use to translate the three
                                             * standard button labels: OK, CONFIRM, CANCEL
                                             */
                                            locale: "id",


                                        });
                                    }

                                    bootbox.confirm("<div style='color:black'>" + "Are you sure you wish to update job?" + "</div>", function (result) {
                                        if (result) {
                                            $('#LoadingForm').modal('show');


                                            $.niftyNoty({
                                                type: 'success',
                                                icon: 'fa fa-check',
                                                message: titleSuccess,
                                                container: 'floating',
                                                timer: 3000
                                            });

                                            //Do task
                                            var getAlertDate = $('#alertDate').val();
                                            var getTimestamp = $('#scheduledDate').val();
                                            var dateFormat = "DD-MMM, YYYY HH:mm";
                                            var convertAlertDate = moment(getAlertDate, dateFormat);
                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                            var timestamp;
                                            var alertdate;

                                            if (getSessionstorageValueTrackVersion == "sg") {
                                                timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
                                                alertdate = moment(convertAlertDate).subtract('hours', 8).format(dateFormat);
                                            } else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id") {
                                                timestamp = moment(convertTimestamp).subtract('hours', 7).format(dateFormat);
                                                alertdate = moment(convertAlertDate).subtract('hours', 7).format(dateFormat);
                                            }

                                            //console.log('Alert Date : ' + alertdate + ', Timestamp : ' + timestamp);

                                            var jobCancelled;
                                            var cancelRemarks;

                                            if ($('#status').val() == 2) {
                                                jobCancelled = moment().format();
                                                cancelRemarks = $('#cancelRemarks').val();
                                            } else {
                                                jobCancelled = value.JobCancelled;
                                                cancelRemarks = value.CancelRemarks;
                                            }

                                            var getTechnician = $('#maintenanceJobTechinician').find(':selected').attr('data-technician');
                                            var getJobTechnician = $("#maintenanceJobTechinician").val();
                                            var checkAssetID = 'https://api.systempest.com/api/driverinfo/' + getJobTechnician;
                                            $.ajax({
                                                url: checkAssetID,
                                                type: 'GET',
                                                async: false,
                                                cache: false,
                                                dataType: 'json',
                                                success: function (json) {
                                                    console.log(JSON.stringify(json));

                                                    if (json.AssetID == '') {
                                                        getJobAssetID = 0;
                                                    } else {
                                                        getJobAssetID = json.AssetID;
                                                    }

                                                    //Update Maintenance Job
                                                    var maintenancejob = {
                                                        MaintenanceID: maintenance_id,
                                                        AlertDate: alertdate,
                                                        Timestamp: timestamp,
                                                        RxTime: moment().format(),
                                                        Flag: 1,
                                                        JobCancelled: '',
                                                        CancelRemarks: '',
                                                        isSent: 1,
                                                        ReferenceNo: $('#referenceno').val(),
                                                        AssetID: getJobAssetID,
                                                        DriverID: getJobTechnician,
                                                        Technician: $("#maintechnicians").val()
                                                    }

                                                    console.log('Maintenance Job Array : ' + JSON.stringify(maintenancejob));


                                                    var addMaintenanceJob = 'https://api.systempest.com/api/maintenancejobinfo';
                                                    var maintenanceFinalID = value.MaintenanceID;
                                                    $.ajax({
                                                        url: addMaintenanceJob,
                                                        type: "POST",
                                                        data: JSON.stringify(maintenancejob),
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
                                                        success: function (maintenancejob) {
                                                            console.log(maintenancejob);

                                                            var total_pest = $('#newpestsTreatment').bootstrapTable('getData').length;

                                                            var table = $("#newpestsTreatment tbody");
                                                            table.find('tr').each(function (i) {
                                                                var $tds = $(this).find('td'),
                                                                    itemNo = $tds.eq(1).text()
                                                                pests = $tds.eq(2).text(),
                                                                    treatments = $tds.eq(3).text()

                                                                var pests = {
                                                                    MaintenanceJobID: maintenancejob.MaintenanceJobID,
                                                                    ItemNo: itemNo,
                                                                    PestDesc: pests,
                                                                    TreatmentDesc: treatments,
                                                                }
                                                                console.log(pests);

                                                                $.ajax({
                                                                    url: "https://api.systempest.com/api/mainpesttreatmentinfo",
                                                                    type: "POST",
                                                                    async: false,
                                                                    data: JSON.stringify(pests),
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
                                                                    permissions: ["http://117.120.7.120"],
                                                                    success: function (pests) {

                                                                    }
                                                                });

                                                                if (i == total_pest - 1) {

                                                                    //console.log('end');
                                                                    $('#LoadingForm').modal('hide');

                                                                    $("#addForms").dialog("destroy");
                                                                    $('#viewForms').dialog('destroy');
                                                                    viewjob(maintenanceFinalID);
                                                                }


                                                            });

                                                            //$('#editForms').dialog('destroy');
                                                            //$(".ui-dialog-content").dialog("destroy");

                                                        }
                                                    });
                                                }
                                            });

                                        } else {
                                            $.niftyNoty({
                                                type: 'danger',
                                                icon: 'fa fa-minus',
                                                message: titleCancel,
                                                container: 'floating',
                                                timer: 3000
                                            });
                                        };

                                    });

                                } else {

                                    $.niftyNoty({
                                        type: 'danger',
                                        icon: 'fa fa-exclamation-triangle',
                                        message: "Warning : Scheduled Date cannot be before Today's Date.",
                                        container: 'floating',
                                        timer: 3000
                                    });

                                }

                            } else {

                                $.niftyNoty({
                                    type: 'danger',
                                    icon: 'fa fa-exclamation-triangle',
                                    message: 'Warning : Invalid Date.',
                                    container: 'floating',
                                    timer: 3000
                                });
                            }


                        }

                    },
                    Close: function () {

                        //$(this).dialog("close");
                        $(this).dialog('destroy');
                    },
                }
            });

        }
    });
}

function editmaintenancejob(id) {

    $.ajax({
        type: 'GET',
        url: "https://api.systempest.com/api/maintenancejobinfo/" + id,
        async: false,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (value) {

            $("<div id='editForms'>").dialog({
                modal: true,
                title: "Edit Maintenance Job",
                width: '100%',
                position: 'center',
                height: 'auto',
                dialogClass: 'no-close',
                open: function () {


                    if (value.Flag == 0 && getSessionstorageValueRoleID > 4) {
                        $(this).dialog('destroy');

                        $.niftyNoty({
                            type: 'danger',
                            icon: 'fa fa-exclamation-triangle',
                            message: 'Completed Job cannot be edited',
                            container: 'floating',
                            timer: 3000
                        });

                    } else {

                        $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
                        $(".ui-dialog-titlebar-close").hide(); //hide close button

                        //var top = Math.max(jQuery(window).height() / 2 - jQuery(this)[0].offsetHeight / 2, 0) - 150;
                        //var left = Math.max(jQuery(window).width() / 2 - jQuery(this)[0].offsetWidth / 2, 0);

                        //jQuery(this).parent().css('top', top + "px");
                        //jQuery(this).parent().css('left', left + "px");
                        //jQuery(this).parent().css('position', 'fixed');

                        var markup = "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto;' class=''>" +
                            "<table id='maintenancejobTable' class='table table-bordered' cellspacing='0' width='100%' height='150'>" +
                            "<thead>" +
                            "<tr>" +
                            "<th style='color: blue;'>Maintenance Job ID</th>" +
                            "<th style='color: blue;'>Notification Interval</th>" +
                            "<th style='color: blue;'>Alert Date</th>" +
                            "<th style='color: blue;'>Scheduled Date</th>" +
                            "<th style='color: blue;'>Phone Users</th>" +
                            "<th style='color: blue;'>Technicians</th>" +
                            "<th style='color: blue;'>Cancel Remarks</th>" +
                            "<th style='color: blue;'>Reference No.</th>" +
                            "<th style='color: blue;'>Pests & Treatments</th>" +
                            "<th style='color: blue;'>Email Notification</th>" +
                            "<th style='color: blue;'>Status</th>" +
                            "</tr>" +
                            "</thead>" +
                            "<tbody>"

                        markup += "<tr>" +
                            "<td style='padding: 5px;'>" +
                            "<input id='maintenancejobID' type='text' placeholder='Maintenance ID' class='form-control' disabled='disabled'>" +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            "<input id='notificationInterval' type='text' placeholder='Notification Interval' class='form-control' disabled='disabled'>" +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            "<input id='alertDate' type='text' placeholder='Alert Date' class='form-control' disabled='disabled'>" +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            "<input id='scheduledDate' type='text' placeholder='Scheduled Date' class='form-control'>" +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            "<select class='selectpicker' data-live-search='true' data-width='100%' data-style='btn-asiacomDropdown' id='maintenanceJobTechinician' name='maintenanceJobTechinician' data-table='searchable'></select>" +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            "<textarea rows='16' class='form-control' placeholder='Technicians' name='maintechnicians' id='maintechnicians' data-by-field='maintechnicians'></textarea>" +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            "<textarea rows='16' class='form-control' placeholder='Cancel Remarks' name='cancelRemarks' id='cancelRemarks' data-by-field='cancelRemarks'></textarea>" +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            "<input id='referenceno' type='text' placeholder='Reference No.' disabled='disabled' class='form-control'>" +
                            "</td>" +
                            "<td style='padding: 5px;'>" +
                            pestFormatter(value.Pest, value.MaintenanceJobID) +
                            "</td>" +
                            "<td style='padding: 5px;' align='center'>" +
                            "<input type='checkbox' id='issent'>"
                        "</td>" +
                        "<td style='padding: 5px;'>" +
                        "<select id='status' class='selectpicker form-control' data-width='100%' data-style='btn-asiacomDropdown'></select>" +
                        "</td>" +
                        "</tr>"


                        markup += "</tbody></table>" + "</div>";

                        if (markup !== undefined || markup !== null) $(this).html(markup);

                        $.getJSON('https://api.systempest.com/api/emailflaginfo', function (data) {

                            $.each(data, function (index, item) {

                                if (item.EmailFlagID == value.Flag) {
                                    $('#status').append($('<option selected="selected"></option>').val(item.EmailFlagID).html(item.FlagValue));
                                } else {
                                    $('#status').append($('<option></option>').val(item.EmailFlagID).html(item.FlagValue));
                                }

                            });
                            $(".selectpicker").selectpicker('refresh');
                        });

                        //Populate phone user
                        var WebAPIDriver = "";

                        if (getSessionstorageValueRoleID == 1) {
                            WebAPIDriver = 'https://api.systempest.com/api/driverinfo?ResellerID=' + '1' + '&CompanyID=' + '1';
                        } else if (getSessionstorageValueRoleID == 2) {
                            WebAPIDriver = 'https://api.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

                        } else if (getSessionstorageValueRoleID >= 3) {
                            WebAPIDriver = 'https://api.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
                        }

                        //$('#maintenanceJobTechinician').append($('<option selected="selected"></option>').val(0).html("No Phone Users Selected"));
                        $.getJSON(WebAPIDriver, function (data) {

                            if (value.DriverID == 0) {
                                $('#maintenanceJobTechinician').append($('<option selected="selected"></option>').val(0).html("No Phone Users Selected"));

                                $.each(data, function (index, item) {

                                    $('#maintenanceJobTechinician').append($('<option data-technician="' + item.Technician + '"></option>').val(item.DriverID).html(item.Name));
                                });

                            } else {
                                $('#maintenanceJobTechinician').append($('<option></option>').val(0).html("No Phone Users Selected"));

                                $.each(data, function (index, item) {

                                    if (item.DriverID == value.DriverID) {
                                        $('#maintenanceJobTechinician').append($('<option data-technician="' + item.Technician + '" selected="selected"></option>').val(item.DriverID).html(item.Name));

                                    } else {
                                        $('#maintenanceJobTechinician').append($('<option data-technician="' + item.Technician + '"></option>').val(item.DriverID).html(item.Name));
                                    }
                                });
                            }


                            $('.selectpicker').selectpicker('refresh');
                        });

                        //OnChange Dropdown
                        $('#status').change(function () {
                            var selected = $(this).find("option:selected").html();
                            console.log("You have selected: " + selected);
                            if (selected == "Cancelled") {

                                $('#cancelRemarks').prop("disabled", false);
                            } else if (selected == "Completed") {

                                $('#cancelRemarks').prop("disabled", true);
                            } else if (selected == "Incomplete") {

                                $('#cancelRemarks').prop("disabled", true);
                            }
                        });

                        $('#maintenanceJobTechinician').change(function () {
                            var getTechnician = $(this).find(':selected').attr('data-technician')
                            $('#maintechnicians').val(getTechnician);

                        });

                        $('#maintenancejobID').val(value.MaintenanceJobID);
                        $('#alertDate').val(datetimeFormatter(value.AlertDate));
                        $('#scheduledDate').val(datetimeFormatter(value.Timestamp));
                        $('#referenceno').val(value.ReferenceNo);
                        if (value.isSent == 1) {
                            $('#issent').prop('checked', true);
                        } else {
                            $('#issent').prop('checked', false);
                        }

                        $('#maintechnicians').val(value.Technician);
                        $('.selectpicker').selectpicker('refresh');

                        var dateFormat = "DD-MMM, YYYY HH:mm";
                        var timestamp = moment(value.Timestamp).subtract('hours', 0).format(dateFormat);
                        var alertdate = moment(value.AlertDate).add('hours', 0).format(dateFormat);
                        var convertTimestamp = moment(timestamp, dateFormat);
                        var convertAlertDate = moment(alertdate, dateFormat);
                        var duration = moment.duration(convertTimestamp - convertAlertDate).humanize();

                        $('#notificationInterval').val(duration);

                        $('#cancelRemarks').val(value.CancelRemarks);



                        var dateToday = new Date();

                        jQuery('#alertDate').datetimepicker({
                            format: 'DD-MMM, YYYY HH:mm',
                            formatTime: 'HH:mm',
                            formatDate: 'DD-MMM, YYYY HH:mm',
                            theme: 'dark',
                            minDate: dateToday,
                            autoclose: true,
                            mask: false,
                            onChangeDateTime: function (dp, $input) {
                                $(this).hide();
                                $('#alertDate').datetimepicker();
                            }
                        });

                        jQuery('#scheduledDate').datetimepicker({
                            format: 'DD-MMM, YYYY HH:mm',
                            formatTime: 'HH:mm',
                            formatDate: 'DD-MMM, YYYY HH:mm',
                            theme: 'dark',
                            autoclose: true,
                            minDate: dateToday,
                            timepicker: true,
                            todayButton: false,
                            mask: false,
                            onChangeDateTime: function (dp, $input) {

                                var now = moment($input.val(), dateFormat);

                                var parseDuration = duration.split(' ');

                                var alertDate = moment(now).subtract(parseDuration[0], parseDuration[1]).format(dateFormat);

                                $('#alertDate').val(alertDate);
                                $(this).hide();
                                $('#scheduledDate').datetimepicker();
                            }
                        });


                        //$("#scheduledDate").keyup(function () {
                        //    //alert("Warning: Pls. select date from datepicker! Settings will return to default");
                        //    //$('#alertDate').val(datetimeFormatter(value.AlertDate));
                        //    //$('#scheduledDate').val(datetimeFormatter(value.Timestamp));
                        //});
                    }

                    //Filter Cancel Remarks
                    if (value.Flag == 2) {
                        $('#cancelRemarks').prop("disabled", false);
                    } else {
                        $('#cancelRemarks').prop("disabled", true);
                    }

                    function pestFormatter(value, maintenancejobID) {

                        console.log(value)
                        var itemno, pest, treatment, maintenance_id;
                        var strRtn = "";
                        if (value != "") {

                            for (k = 0; k < value.length; k++) {

                                if (value[k] != undefined || value[k]) {

                                    itemno = value[k].ItemNo;
                                    pest = value[k].PestDesc;
                                    treatment = value[k].TreatmentDesc;
                                    maintenance_job_id = value[k].MaintenanceJobID;
                                    // value.Index = value[k].ItemNo;
                                    Object.assign(value[k], {
                                        Index: value[k].ItemNo
                                    });

                                    strRtn += '<div>' +
                                        '<span>' +
                                        'No.: ' + itemno +
                                        '</br>' +
                                        'Maintenance Job ID: ' + maintenance_job_id +
                                        '</br>' +
                                        'Pest: ' + pest +
                                        '</br>' +
                                        'Treatment: ' + treatment +
                                        '</br>' +
                                        '</span>' +
                                        '</div>';
                                }
                            }

                            strRtn += '<br />' +
                                '<div class="form-group pull-right">' +
                                "<span>" + "<a href='javascript:editpest(" + JSON.stringify(value) + ")' style='color:#458FD2;'>" + "Edit" + "</a>" + "</span>" +
                                '</div>';


                            return strRtn;
                        } else {
                            strRtn += '<div>' + '<span>' + "No Pest & Treatments" + '</span>' + '</div>';
                            strRtn += '<br />' +
                                '<div class="form-group pull-right">' +
                                "<span>" + "<a href='javascript:editNoPest(" + maintenancejobID + ")' style='color:#458FD2;'>" + "Edit" + "</a>" + "</span>" +
                                '</div>';

                            return strRtn;
                        }




                    }

                },
                buttons: {

                    'Update Maintenance Job': function () {
                        if ($('#scheduledDate').val() == "") {

                            $.niftyNoty({
                                type: 'danger',
                                icon: 'fa fa-exclamation-triangle',
                                message: 'Warning: Pls. select date from datepicker! Date must not be empty.',
                                container: 'floating',
                                timer: 3000
                            });

                        } else {
                            var validDate = $('#scheduledDate').val();
                            if (moment(validDate).isValid()) {
                                if (moment(validDate).isSameOrAfter(moment(), "day")) {
                                    if (getSessionstorageValueLanguage == "en") {
                                        bootbox.setDefaults({
                                            /**
                                             * @optional String
                                             * @default: en
                                             * which locale settings to use to translate the three
                                             * standard button labels: OK, CONFIRM, CANCEL
                                             */
                                            locale: "en",


                                        });
                                    } else if (getSessionstorageValueLanguage == "th") {
                                        bootbox.setDefaults({
                                            /**
                                             * @optional String
                                             * @default: en
                                             * which locale settings to use to translate the three
                                             * standard button labels: OK, CONFIRM, CANCEL
                                             */
                                            locale: "th",


                                        });
                                    } else if (getSessionstorageValueLanguage == "vn") {

                                        bootbox.setDefaults({
                                            /**
                                             * @optional String
                                             * @default: en
                                             * which locale settings to use to translate the three
                                             * standard button labels: OK, CONFIRM, CANCEL
                                             */
                                            locale: "vi",


                                        });
                                    } else if (getSessionstorageValueLanguage == "id") {

                                        bootbox.setDefaults({
                                            /**
                                             * @optional String
                                             * @default: en
                                             * which locale settings to use to translate the three
                                             * standard button labels: OK, CONFIRM, CANCEL
                                             */
                                            locale: "id",


                                        });
                                    }

                                    bootbox.confirm("<div style='color:black'>" + "Are you sure you wish to update job?" + "</div>", function (result) {
                                        if (result) {

                                            $.niftyNoty({
                                                type: 'success',
                                                icon: 'fa fa-check',
                                                message: titleSuccess,
                                                container: 'floating',
                                                timer: 3000
                                            });

                                            //Do task
                                            var getAlertDate = $('#alertDate').val();
                                            var getTimestamp = $('#scheduledDate').val();
                                            var dateFormat = "DD-MMM, YYYY HH:mm";
                                            var convertAlertDate = moment(getAlertDate, dateFormat);
                                            var convertTimestamp = moment(getTimestamp, dateFormat);
                                            var timestamp;
                                            var alertdate;

                                            if (getSessionstorageValueTrackVersion == "sg") {
                                                timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
                                                alertdate = moment(convertAlertDate).subtract('hours', 8).format(dateFormat);
                                            } else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id") {
                                                timestamp = moment(convertTimestamp).subtract('hours', 7).format(dateFormat);
                                                alertdate = moment(convertAlertDate).subtract('hours', 7).format(dateFormat);
                                            }

                                            //console.log('Alert Date : ' + alertdate + ', Timestamp : ' + timestamp);

                                            var jobCancelled;
                                            var cancelRemarks;

                                            if ($('#status').val() == 2) {
                                                jobCancelled = moment().format();
                                                cancelRemarks = $('#cancelRemarks').val();
                                            } else {
                                                jobCancelled = value.JobCancelled;
                                                cancelRemarks = value.CancelRemarks;
                                            }

                                            var getTechnician = $('#maintenanceJobTechinician').find(':selected').attr('data-technician');
                                            var getJobTechnician = $("#maintenanceJobTechinician").val();
                                            var checkAssetID = 'https://api.systempest.com/api/driverinfo/' + getJobTechnician;
                                            $.ajax({
                                                url: checkAssetID,
                                                type: 'GET',
                                                async: false,
                                                cache: false,
                                                dataType: 'json',
                                                success: function (json) {
                                                    console.log(JSON.stringify(json));

                                                    if (json.AssetID == '') {
                                                        getJobAssetID = 0;
                                                    } else {
                                                        getJobAssetID = json.AssetID;
                                                    }

                                                    var isSent = 0;
                                                    if ($('#checkbox').prop('checked')) {
                                                        isSent = 1;
                                                    } else {
                                                        isSent = 0
                                                    }

                                                    //Update Maintenance Job
                                                    var maintenancejob = {
                                                        MaintenanceJobID: value.MaintenanceJobID,
                                                        MaintenanceID: value.MaintenanceID,
                                                        AlertDate: alertdate,
                                                        Timestamp: timestamp,
                                                        RxTime: moment().format(),
                                                        Flag: $('#status').val(),
                                                        JobCancelled: jobCancelled,
                                                        CancelRemarks: cancelRemarks,
                                                        isSent: isSent,
                                                        ReferenceNo: $('#referenceno').val(),
                                                        AssetID: getJobAssetID,
                                                        DriverID: getJobTechnician,
                                                        Technician: $("#maintechnicians").val()
                                                    }

                                                    console.log('Maintenance Job Array : ' + JSON.stringify(maintenancejob));


                                                    var updateMaintenanceJob = 'https://api.systempest.com/api/maintenancejobinfo?id=' + maintenancejob.MaintenanceJobID;
                                                    var maintenanceFinalID = value.MaintenanceID;
                                                    $.ajax({
                                                        url: updateMaintenanceJob,
                                                        type: "PUT",
                                                        data: JSON.stringify(maintenancejob),
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
                                                        success: function (maintenancejob) {
                                                            console.log(maintenancejob);


                                                            //$('#editForms').dialog('destroy');
                                                            $("#editForms").dialog("destroy");
                                                            $('#viewForms').dialog('destroy');
                                                            viewjob(maintenanceFinalID);
                                                            //$(".ui-dialog-content").dialog("destroy");

                                                        }
                                                    });
                                                }
                                            });

                                        } else {
                                            $.niftyNoty({
                                                type: 'danger',
                                                icon: 'fa fa-minus',
                                                message: titleCancel,
                                                container: 'floating',
                                                timer: 3000
                                            });
                                        };

                                    });

                                } else {

                                    $.niftyNoty({
                                        type: 'danger',
                                        icon: 'fa fa-exclamation-triangle',
                                        message: "Warning : Scheduled Date cannot be before Today's Date. ",
                                        container: 'floating',
                                        timer: 3000
                                    });

                                }

                            } else {

                                $.niftyNoty({
                                    type: 'danger',
                                    icon: 'fa fa-exclamation-triangle',
                                    message: 'Warning : Invalid Date.',
                                    container: 'floating',
                                    timer: 3000
                                });
                            }


                        }

                    },
                    Close: function () {

                        //$(this).dialog("close");
                        $(this).dialog('destroy');
                    },
                }
            });

        }
    });




}

function editpest(value) {

    $("<div id='pestForms'>").dialog({
        modal: true,
        title: "Edit Pests",
        width: '100%',
        position: 'center',
        height: 'auto',
        dialogClass: 'no-close',
        open: function () {

            var maintenance_job_id = "";

            if (value.Flag == 0 && getSessionstorageValueRoleID > 4) {
                $(this).dialog('destroy');

                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-exclamation-triangle',
                    message: 'Completed Job cannot be edited',
                    container: 'floating',
                    timer: 3000
                });

            } else {


                var markup =
                    "<div class='col-sm-4'><div class='form-group'>" +
                    "<label class='control-label'>Pests</label>" +
                    "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='newpests' name='newpests' data-table='searchable'></select>" +
                    "</div></div>" +
                    "<div class='col-sm-4'><div class='form-group'>" +
                    "<label class='control-label'>Treatments</label>" +
                    "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' multiple data-width='100%' data-style='btn-asiacomDropdown' id='newTreatments' name='newTreatments' data-table='searchable'></select>" +
                    "</div></div>" +
                    "<div class='col-sm-4' style='margin-top: 26px;'><div class='form-group'>" +
                    "<button id='addItemPest' class='btn btn-info' type='submit' style='margin-right:15px;'>Add Pest</button>" +
                    "<button id='deleteItemPest' class='btn btn-danger' disabled=''>Delete Pest</button>" +
                    "<button id='clearItemPest' class='btn btn-danger' type='submit' style='margin-left:15px;'>Clear Pest</button>" +
                    "</div></div>" +
                    "<div class='col-sm-4'><div class='form-group'>" +
                    "<input id=newotherpests type=text placeholder=Other Pest class=form-control>" +
                    "</div></div>" +
                    "<div class='col-sm-4'><div class='form-group'>" +
                    "<input id=newotherTreatments type=text placeholder=Other Pest class=form-control>" +
                    "</div></div>"

                markup += "<div id='custom-pesttreatment'>" +
                    "</div>" +
                    "<div class='col-sm-12'>" +
                    "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto; height: 450px;' class=''>" +
                    "<table id='newpestsTreatment' class='table table-condensed table-vcenter searchable'" +
                    " data-toolbar='#custom-pesttreatment'" +
                    " data-click-to-select='true'" +
                    " data-single-select='true'" +
                    " data-search='false'" +
                    " data-show-refresh='false'" +
                    " data-show-toggle='false'" +
                    " data-show-columns='false'" +
                    " data-show-toggle='false'" +
                    " data-pagination='false'" +
                    " data-show-pagination-switch='false'" +
                    "cellspacing = '0' width = '100%' > "

                markup += "</table>" + "</div></div>";

                if (markup !== undefined || markup !== null) $(this).html(markup);

                maintenance_job_id = value[0].MaintenanceJobID;
                //Popuate Pest
                var WebAPIPest = "https://api.systempest.com/api/pestinfo";
                $('#newpests').append($('<option selected="selected"></option>').val(0).html("No Pests Selected"));
                $.getJSON(WebAPIPest, function (data) {
                    $.each(data, function (index, item) {
                        $('#newpests').append($('<option></option>').val(item.PestDesc).html(item.PestDesc));
                    });
                    $('.selectpicker').selectpicker('refresh');
                });

                var WebAPITreatment = "https://api.systempest.com/api/treatmentinfo";
                $.getJSON(WebAPITreatment, function (data) {
                    $.each(data, function (index, item) {
                        $('#newTreatments').append($('<option></option>').val(item.TreatmentDesc).html(item.TreatmentDesc));
                    });

                    $('.selectpicker').selectpicker('refresh');
                });

                $('#newpestsTreatment').bootstrapTable({
                    data: value,
                    idField: 'PestItemID',
                    columns: [{
                        field: 'state',
                        checkbox: true
                    }, {
                        field: 'ItemNo',
                        title: 'Item No',
                        formatter: serialnoFormatter
                    }, {
                        field: 'PestDesc',
                        title: 'Pests'
                    }, {
                        field: 'TreatmentDesc',
                        title: 'Treatments',
                    }, {
                        field: 'Index',
                        title: 'index',
                        class: 'hidden-xs hidden-sm hidden-md hidden-lg'
                    }],
                    onCheck: function (row, index) {
                        console.log(index)
                    },
                    onLoadSuccess: function (row) {


                    },
                    onPostBody: function () {



                    },
                    onPreBody: function (data) {


                    },
                    onCheck: function (row, $element) {

                    },
                    onUncheck: function (row) {

                    },

                });

                var $tablePest = $('#newpestsTreatment'),
                    $buttonPest = $('#addItemPest');
                var rowsPest = [];
                var itemNoPest = 1;

                //Delete Row
                var $tableItemPest = $('#newpestsTreatment'),
                    $removeItemPest = $('#deleteItemPest'),
                    $editItemPest = $('#editItemPest');

                //Disable cancel button by default
                $removeItemPest.prop("disabled", true);
                $editItemPest.prop("disabled", true);

                $tableItemPest.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
                    $removeItemPest.prop('disabled', !$tableItemPest.bootstrapTable('getSelections').length);
                    $editItemPest.prop('disabled', !$tableItemPest.bootstrapTable('getSelections').length);

                });


                $(document).ready(function () {

                    $('#deleteItemPest').on('click', function () {

                        var ids = $.map($tableItemPest.bootstrapTable('getSelections'), function (row) {

                            return row.Index;
                        });

                        console.log(ids);

                        $tableItemPest.bootstrapTable('remove', {
                            field: 'Index',
                            values: ids
                        });


                        $removeItemPest.prop('disabled', true);

                    });

                    $('#clearItemPest').on('click', function () {

                        $tableItemPest.bootstrapTable('removeAll');

                    });
                });


                $(function () {

                    $buttonPest.click(function (e) {
                        e.preventDefault();
                        if ($("#newpests").val() == 0 && $("#newpests").val() == null) {
                            $.niftyNoty({
                                type: 'danger',
                                icon: 'fa fa-exclamation-triangle',
                                message: 'Item cannot be Added - Select Pest and Treatment',
                                container: 'floating',
                                timer: 3000
                            });
                        } else if ($("#newpests").val() == 0) {
                            $.niftyNoty({
                                type: 'danger',
                                icon: 'fa fa-exclamation-triangle',
                                message: 'Item cannot be Added - Select Pest',
                                container: 'floating',
                                timer: 3000
                            });
                        } else if ($("#newTreatments").val() == null) {
                            $.niftyNoty({
                                type: 'danger',
                                icon: 'fa fa-exclamation-triangle',
                                message: 'Item cannot be Added - Select Treatment',
                                container: 'floating',
                                timer: 3000
                            });
                        } else {

                            insertDataPest();
                        }


                    });

                    $buttonClear.click(function (e) {
                        $tablePest.bootstrapTable('removeAll');
                    });

                    $('#clearForm').click(function (e) {
                        $tablePest.bootstrapTable('removeAll');
                        clearJobForms();
                    });


                });


                function insertDataPest() {

                    var rowId;

                    var boostrapTableValue = JSON.stringify($('#newpestsTreatment').bootstrapTable().bootstrapTable('getData'));

                    var stringify = JSON.parse(boostrapTableValue);
                    if (stringify.length > 0) {
                        rowId = stringify[stringify.length - 1]['Index'] + 1;
                    } else {
                        rowId = 1;
                    }

                    var getPest = $('#newpests').val();
                    if ($('#newotherpests').val() != "") {
                        getPest = $('#newotherpests').val();
                    } else {
                        getPest = $('#newpests').val();
                    }
                    var getTreatments = $('#newTreatments').val();
                    if ($('#newotherTreatments').val() != "") {
                        if ($("#newTreatments").val() == null) {
                            getTreatments = $('#newotherTreatments').val();
                        } else {
                            getTreatments = getTreatments + ", " + $('#newotherTreatments').val();
                        }

                    }
                    rowsPest.push({
                        PestDesc: getPest,
                        TreatmentDesc: getTreatments,
                        Index: rowId
                    });

                    $('#newpestsTreatment').bootstrapTable('append', rowsPest);
                    rowsPest = [];
                    itemNoPest++;

                    $('#newpests').val(0);
                    $('#newTreatments').val(0);

                    $('#newotherpests').val("");
                    $('#newotherTreatments').val("");
                    $('#newpests').selectpicker('refresh');
                    $('#newTreatments').selectpicker('refresh');


                }
            }



        },
        buttons: {
            'Submit': function () {

                if (getSessionstorageValueLanguage == "en") {
                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "en",



                    });
                } else if (getSessionstorageValueLanguage == "th") {
                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "th",



                    });
                } else if (getSessionstorageValueLanguage == "vn") {

                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "vi",

                    });
                } else if (getSessionstorageValueLanguage == "id") {

                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "id",


                    });
                }

                bootbox.confirm("<div style='color:black'>" + "Are you sure you wish to update pest?" + "</div>", function (result) {
                    if (result) {

                        $.niftyNoty({
                            type: 'success',
                            icon: 'fa fa-check',
                            message: titleSuccess,
                            container: 'floating',
                            timer: 3000
                        });

                        var maintenancejobID = {
                            MaintenanceJobID: maintenance_job_id
                        };
                        var deletePestTreatment = 'https://api.systempest.com/api/deletemainpesttreatment';
                        //console.log(deletePestTreatment);

                        $.ajax({
                            url: deletePestTreatment,
                            type: "POST",
                            data: JSON.stringify(maintenancejobID),
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
                            success: function (deletePestTreatment) {
                                console.log(deletePestTreatment);

                                var total_pest = $('#newpestsTreatment').bootstrapTable('getData').length;
                                //console.log(total_pest);
                                var table = $("#newpestsTreatment tbody");
                                table.find('tr').each(function (i) {
                                    var $tds = $(this).find('td'),
                                        itemNo = $tds.eq(1).text()
                                    pests = $tds.eq(2).text(),
                                        treatments = $tds.eq(3).text()

                                    var pests = {
                                        MaintenanceJobID: maintenance_job_id,
                                        ItemNo: itemNo,
                                        PestDesc: pests,
                                        TreatmentDesc: treatments,
                                    }
                                    console.log(pests);

                                    $.ajax({
                                        url: "https://api.systempest.com/api/mainpesttreatmentinfo",
                                        type: "POST",
                                        data: JSON.stringify(pests),
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
                                        permissions: ["http://117.120.7.120"],
                                        success: function (pests) {

                                        }
                                    });

                                    if (i === total_pest - 1) {

                                        //console.log('end');

                                        $("#pestForms").dialog("destroy");
                                        $("#editForms").dialog("destroy");
                                        // $(".ui-dialog-content").dialog("destroy");
                                    }


                                });

                            }
                        });

                    }
                });


            },
            Close: function () {

                $('#newpestsTreatment').bootstrapTable('destroy');
                $(this).dialog('destroy');
            },
        }
    });


}

function editNoPest(value) {
    // alert(JSON.stringify(value));
    $("<div id='noPestForms'>").dialog({
        modal: true,
        title: "Edit Pests",
        width: '100%',
        position: 'center',
        height: 'auto',
        dialogClass: 'no-close',
        open: function () {

            var maintenance_job_id = value;



            var markup = "<div class='col-sm-4'><div class='form-group'>" +
                "<label class='control-label'>Pests</label>" +
                "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='newpests' name='newpests' data-table='searchable'></select>" +
                "</div></div>" +
                "<div class='col-sm-4'><div class='form-group'>" +
                "<label class='control-label'>Treatments</label>" +
                "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' multiple data-width='100%' data-style='btn-asiacomDropdown' id='newTreatments' name='newTreatments' data-table='searchable'></select>" +
                "</div></div>" +
                "<div class='col-sm-4' style='margin-top: 26px;'><div class='form-group'>" +
                "<button id='addItemPest' class='btn btn-info' type='submit' style='margin-right:15px;'>Add Pest</button>" +
                "<button id='deleteItemPest' class='btn btn-danger' disabled=''>Delete Pest</button>" +
                "<button id='clearItemPest' class='btn btn-danger' type='submit' style='margin-left:15px;'>Clear Pest</button>" +
                "</div></div>" +
                "<div class='col-sm-4'><div class='form-group'>" +
                "<input id=newotherpests type=text placeholder=Other Pest class=form-control>" +
                "</div></div>" +
                "<div class='col-sm-4'><div class='form-group'>" +
                "<input id=newotherTreatments type=text placeholder=Other Pest class=form-control>" +
                "</div></div>"

            markup += "<div id='custom-pesttreatment'>" +
                "</div>" +
                "<div class='col-sm-12'>" +
                "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto; height: 450px;' class=''>" +
                "<table id='newpestsTreatment' class='table table-condensed table-vcenter searchable'" +
                " data-toolbar='#custom-pesttreatment'" +
                " data-click-to-select='true'" +
                " data-single-select='true'" +
                " data-search='false'" +
                " data-show-refresh='false'" +
                " data-show-toggle='false'" +
                " data-show-columns='false'" +
                " data-show-toggle='false'" +
                " data-pagination='false'" +
                " data-show-pagination-switch='false'" +
                "cellspacing = '0' width = '100%' > "

            markup += "</table>" + "</div></div>";

            if (markup !== undefined || markup !== null) $(this).html(markup);

            maintenance_job_id = maintenance_job_id;
            //Popuate Pest
            var WebAPIPest = "https://api.systempest.com/api/pestinfo";
            $('#newpests').append($('<option selected="selected"></option>').val(0).html("No Pests Selected"));
            $.getJSON(WebAPIPest, function (data) {
                $.each(data, function (index, item) {
                    $('#newpests').append($('<option></option>').val(item.PestDesc).html(item.PestDesc));
                });
                $('.selectpicker').selectpicker('refresh');
            });

            var WebAPITreatment = "https://api.systempest.com/api/treatmentinfo";
            $.getJSON(WebAPITreatment, function (data) {
                $.each(data, function (index, item) {
                    $('#newTreatments').append($('<option></option>').val(item.TreatmentDesc).html(item.TreatmentDesc));
                });

                $('.selectpicker').selectpicker('refresh');
            });

            $('#newpestsTreatment').bootstrapTable({
                data: value,
                idField: 'PestItemID',
                columns: [{
                    field: 'state',
                    checkbox: true
                }, {
                    field: 'ItemNo',
                    title: 'Item No',
                    formatter: serialnoFormatter
                }, {
                    field: 'PestDesc',
                    title: 'Pests'
                }, {
                    field: 'TreatmentDesc',
                    title: 'Treatments',
                }, {
                    field: 'Index',
                    title: 'index',
                    class: 'hidden-xs hidden-sm hidden-md hidden-lg'
                }],
                onCheck: function (row, index) {
                    console.log(index)
                },
                onLoadSuccess: function (row) {


                },
                onPostBody: function () {



                },
                onPreBody: function (data) {


                },
                onCheck: function (row, $element) {

                },
                onUncheck: function (row) {

                },

            });

            var $tablePest = $('#newpestsTreatment'),
                $buttonPest = $('#addItemPest');
            var rowsPest = [];
            var itemNoPest = 1;

            //Delete Row
            var $tableItemPest = $('#newpestsTreatment'),
                $removeItemPest = $('#deleteItemPest'),
                $editItemPest = $('#editItemPest');

            //Disable cancel button by default
            $removeItemPest.prop("disabled", true);
            $editItemPest.prop("disabled", true);

            $tableItemPest.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
                $removeItemPest.prop('disabled', !$tableItemPest.bootstrapTable('getSelections').length);
                $editItemPest.prop('disabled', !$tableItemPest.bootstrapTable('getSelections').length);

            });


            $(document).ready(function () {

                $('#deleteItemPest').on('click', function () {

                    var ids = $.map($tableItemPest.bootstrapTable('getSelections'), function (row) {

                        return row.Index;
                    });

                    console.log(ids);

                    $tableItemPest.bootstrapTable('remove', {
                        field: 'Index',
                        values: ids
                    });


                    $removeItemPest.prop('disabled', true);

                });

                $('#clearItemPest').on('click', function () {

                    $tableItemPest.bootstrapTable('removeAll');

                });
            });


            $(function () {

                $buttonPest.click(function (e) {
                    e.preventDefault();
                    if ($("#newpests").val() == 0 && $("#newpests").val() == null) {

                        $.niftyNoty({
                            type: 'danger',
                            icon: 'fa fa-exclamation-triangle',
                            message: 'Item cannot be Added - Select Pest and Treatment',
                            container: 'floating',
                            timer: 3000
                        });
                    } else if ($("#newpests").val() == 0) {
                        $.niftyNoty({
                            type: 'danger',
                            icon: 'fa fa-exclamation-triangle',
                            message: 'Item cannot be Added - Select Pest',
                            container: 'floating',
                            timer: 3000
                        });
                    } else if ($("#newTreatments").val() == null) {
                        $.niftyNoty({
                            type: 'danger',
                            icon: 'fa fa-exclamation-triangle',
                            message: 'Item cannot be Added - Select Treatment',
                            container: 'floating',
                            timer: 3000
                        });
                    } else {

                        insertDataPest();
                    }


                });

                $buttonClear.click(function (e) {
                    $tablePest.bootstrapTable('removeAll');
                });

                $('#clearForm').click(function (e) {
                    $tablePest.bootstrapTable('removeAll');
                    clearJobForms();
                });


            });


            function insertDataPest() {

                var rowId;

                var boostrapTableValue = JSON.stringify($('#newpestsTreatment').bootstrapTable().bootstrapTable('getData'));

                var stringify = JSON.parse(boostrapTableValue);
                if (stringify.length > 0) {
                    rowId = stringify[stringify.length - 1]['Index'] + 1;
                } else {
                    rowId = 1;
                }

                var getPest = $('#newpests').val();
                if ($('#newotherpests').val() != "") {
                    getPest = $('#newotherpests').val();
                } else {
                    getPest = $('#newpests').val();
                }
                var getTreatments = $('#newTreatments').val();
                if ($('#newotherTreatments').val() != "") {
                    if ($("#newTreatments").val() == null) {
                        getTreatments = $('#newotherTreatments').val();
                    } else {
                        getTreatments = getTreatments + ", " + $('#newotherTreatments').val();
                    }

                }
                rowsPest.push({
                    PestDesc: getPest,
                    TreatmentDesc: getTreatments,
                    Index: rowId
                });

                $('#newpestsTreatment').bootstrapTable('append', rowsPest);
                rowsPest = [];
                itemNoPest++;

                $('#newpests').val(0);
                $('#newTreatments').val(0);

                $('#newotherpests').val("");
                $('#newotherTreatments').val("");
                $('#newpests').selectpicker('refresh');
                $('#newTreatments').selectpicker('refresh');


            }




        },
        buttons: {
            'Submit': function () {

                if (getSessionstorageValueLanguage == "en") {
                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "en",



                    });
                } else if (getSessionstorageValueLanguage == "th") {
                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "th",



                    });
                } else if (getSessionstorageValueLanguage == "vn") {

                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "vi",

                    });
                } else if (getSessionstorageValueLanguage == "id") {

                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "id",


                    });
                }

                bootbox.confirm("<div style='color:black'>" + "Are you sure you wish to update pest?" + "</div>", function (result) {
                    if (result) {

                        $.niftyNoty({
                            type: 'success',
                            icon: 'fa fa-check',
                            message: titleSuccess,
                            container: 'floating',
                            timer: 3000
                        });

                        var maintenancejobID = {
                            MaintenanceJobID: value
                        };
                        var deletePestTreatment = 'https://api.systempest.com/api/deletemainpesttreatment';
                        //console.log(deletePestTreatment);

                        $.ajax({
                            url: deletePestTreatment,
                            type: "POST",
                            data: JSON.stringify(maintenancejobID),
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
                            success: function (deletePestTreatment) {
                                console.log(deletePestTreatment);

                                var total_pest = $('#newpestsTreatment').bootstrapTable('getData').length;
                                //console.log(total_pest);
                                var table = $("#newpestsTreatment tbody");
                                table.find('tr').each(function (i) {
                                    var $tds = $(this).find('td'),
                                        itemNo = $tds.eq(1).text()
                                    pests = $tds.eq(2).text(),
                                        treatments = $tds.eq(3).text()

                                    var pests = {
                                        MaintenanceJobID: value,
                                        ItemNo: itemNo,
                                        PestDesc: pests,
                                        TreatmentDesc: treatments,
                                    }
                                    console.log(pests);

                                    $.ajax({
                                        url: "https://api.systempest.com/api/mainpesttreatmentinfo",
                                        type: "POST",
                                        data: JSON.stringify(pests),
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
                                        permissions: ["http://117.120.7.120"],
                                        success: function (pests) {

                                        }
                                    });

                                    if (i === total_pest - 1) {

                                        //console.log('end');
                                        $(".ui-dialog-content").dialog("destroy");
                                    }


                                });

                            }
                        });

                    }
                });


            },
            Close: function () {

                $('#newpestsTreatment').bootstrapTable('destroy');
                $(this).dialog('destroy');
            },
        }
    });


}


function editmaintenance(value) {

    $("<div id='editMaintenance'>").dialog({
        modal: true,
        title: "Edit Maintenance",
        width: '100%',
        position: 'center',
        height: 'auto',
        dialogClass: 'no-close',
        open: function () {

            $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
            $(".ui-dialog-titlebar-close").hide(); //hide close button

            //var top = Math.max(jQuery(window).height() / 2 - jQuery(this)[0].offsetHeight / 2, 0) - 150;
            //var left = Math.max(jQuery(window).width() / 2 - jQuery(this)[0].offsetWidth / 2, 0);

            //jQuery(this).parent().css('top', top + "px");
            //jQuery(this).parent().css('left', left + "px");
            //jQuery(this).parent().css('position', 'fixed');

            var markup = "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto;' class=''>" +
                "<table id='maintenancejobTable' class='table table-bordered' cellspacing='0' width='100%' height='150'>" +
                "<thead>" +
                "<tr>" +
                "<th style='color: blue;' class=''>Maintenance ID</th>" +
                "<th style='color: blue;'>Driver</th>" +
                "<th style='color: blue;'>Technicians</th>" +
                "<th style='color: blue;' class='hidden-xs hidden-sm hidden-md hidden-lg'>Asset ID</th>" +
                "<th style='color: blue;'>Reference No.</th>" +
                "<th style='color: blue;'>Address</th>" +
                "<th style='color: blue;'>Postal</th>" +
                "<th style='color: blue;'>Unit</th>" +
                "<th style='color: blue;'>Company</th>" +
                "<th style='color: blue;'>Person In Charge</th>" +
                "<th style='color: blue;'>Phone</th>" +
                "<th style='color: blue;'>Email</th>" +
                "<th style='color: blue;'>Site</th>" +
                "<th style='color: blue;'>Contract Start</th>" +
                "<th style='color: blue;'>Contract End</th>" +
                "<th style='color: blue;'>Maintenance Interval</th>" +
                "<th style='color: blue;'>Notification Interval</th>" +
                "<th style='color: blue;'>Remarks</th>" +
                "</tr>" +
                "</thead>" +
                "<tbody>"

            markup += "<tr>" +
                "<td style='padding: 5px;' class=''>" +
                "<input id='maintenanceID' type='text' placeholder='Maintenance ID' class='form-control' disabled='disabled'>" +
                "</td>" +
                "<td style='padding: 5px;'>" +
                "<select class='selectpicker' data-live-search='true' data-width='100%' data-style='btn-asiacomDropdown' id='maintenanceTechinician' name='maintenanceTechinician' data-table='searchable'></select>" +
                "</td>" +
                "<td style='padding: 5px;'>" +
                "<textarea rows='16' class='form-control' placeholder='Technicians' name='maintech' id='maintech' data-by-field='maintech'></textarea>" +
                "</td>" +
                "<td style='padding: 5px;' class='hidden-xs hidden-sm hidden-md hidden-lg'>" +
                "<input id='assetID' type='text' placeholder='Asset ID' class='form-control' disabled='disabled'>" +
                "</td>" +
                "<td style='padding: 5px;'>"
                //+ "<input id='reference_no' type='text' placeholder='Reference No.' class='form-control'>"
                +
                "<textarea rows='2' class='form-control' placeholder='Reference No.' name='reference_no' id='reference_no' data-by-field='reference_no'></textarea>" +
                "</td>" +
                "<td style='padding: 5px;'>"
                //+ "<input id='address' type='text' placeholder='Address' class='form-control'>"
                +
                "<textarea rows='16' class='form-control' placeholder='Address' name='address' id='address' data-by-field='address'></textarea>" +
                "</td>" +
                "<td style='padding: 5px;'>"
                //+ "<input id='postal' type='text' placeholder='Postal' class='form-control'>"
                +
                "<textarea rows='2' class='form-control' placeholder='Postal' name='postal' id='postal' data-by-field='postal'></textarea>" +
                "</td>" +
                "<td style='padding: 5px;'>"
                //+ "<input id='unit' type='text' placeholder='Unit' class='form-control'>"
                +
                "<textarea rows='2' class='form-control' placeholder='Unit' name='unit' id='unit' data-by-field='unit'></textarea>" +
                "</td>" +
                "<td style='padding: 5px;'>"
                //+ "<input id='company' type='text' placeholder='Company' class='form-control'>"
                +
                "<textarea rows='2' class='form-control' placeholder='Company' name='company' id='company' data-by-field='company'></textarea>" +
                "</td>" +
                "<td style='padding: 5px;'>"
                //+ "<input id='pic' type='text' placeholder='Person In Charge' class='form-control'>"
                +
                "<textarea rows='2' class='form-control' placeholder='Person In Charge' name='pic' id='pic' data-by-field='pic'></textarea>" +
                "</td>" +
                "<td style='padding: 5px;'>"
                //+ "<input id='phone' type='text' placeholder='Phone' class='form-control'>"
                +
                "<textarea rows='2' class='form-control' placeholder='Phone' name='phone' id='phone' data-by-field='phone'></textarea>" +
                "</td>" +
                "<td style='padding: 5px;'>"
                //+ "<input id='email' type='text' placeholder='Email' class='form-control'>"
                +
                "<textarea rows='2' class='form-control' placeholder='Email' name='email' id='email' data-by-field='email'></textarea>" +
                "</td>" +
                "<td style='padding: 5px;'>"
                //+ "<input id='site' type='text' placeholder='Site' class='form-control'>"
                +
                "<textarea rows='2' class='form-control' placeholder='Site' name='site' id='site' data-by-field='site'></textarea>" +
                "</td>" +
                "<td style='padding: 5px;'>" +
                "<input id='contract_start' type='text' placeholder='Contract Start' class='form-control'>" +
                "</td>" +
                "<td style='padding: 5px;'>" +
                "<input id='contract_end' type='text' placeholder='Contract End' class='form-control'>" +
                "</td>" +
                "<td style='padding: 5px;'>" +
                "<select class='selectpicker form-control' data-live-search='true' data-width='100%' data-style='btn-asiacomDropdown' id='maintenance_interval' name='maintenance_interval' data-table='searchable'>" +
                "<option value='Daily'>Daily</option>" +
                "<option value='Weekly'>Weekly</option>" +
                "<option value='Fornightly'>Fornightly</option>" +
                "<option value='Monthly'>Monthly</option>" +
                "<option class='hidden-xs hidden-sm hidden-md hidden-lg' value='Yearly'>Yearly</option>" +
                "<option value='Annually'>Annually</option>" +
                "<option value='Half Yearly'>Half Yearly</option>" +
                "<option value='Quarterly'>Quarterly</option>" +
                "<option class='hidden-xs hidden-sm hidden-md hidden-lg' value='Tri-Monthly'>Tri-Monthly</option>" +
                "<option value='Bi-Monthly'>Bi-Monthly</option>" +
                "</select>" +
                "</td>" +
                "<td style='padding: 5px;'>" +
                "<input id='notification_interval' type='text' placeholder='Notification Interval' class='form-control'>" +
                "</td>" +
                "<td style='padding: 5px;'>"
                //+ "<input id='remarks' type='text' placeholder='Remarks' class='form-control'>"
                +
                "<textarea rows='16' class='form-control' placeholder='Remarks' name='remarks' id='remarks' data-by-field='remarks'></textarea>" +
                "</td>" +
                "</tr>"


            markup += "</tbody></table>" + "</div>";

            if (markup !== undefined || markup !== null) $(this).html(markup);


            //Populate phone user
            var WebAPIDriver = "";

            if (getSessionstorageValueRoleID == 1) {
                WebAPIDriver = 'https://api.systempest.com/api/driverinfo?ResellerID=' + '1' + '&CompanyID=' + '1';
            } else if (getSessionstorageValueRoleID == 2) {
                WebAPIDriver = 'https://api.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

            } else if (getSessionstorageValueRoleID >= 3) {
                WebAPIDriver = 'https://api.systempest.com/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
            }

            //$('#maintenanceJobTechinician').append($('<option selected="selected"></option>').val(0).html("No Phone Users Selected"));
            $.getJSON(WebAPIDriver, function (data) {

                if (value.DriverID == 0) {
                    $('#maintenanceTechinician').append($('<option selected="selected"></option>').val(0).html("No Phone Users Selected"));

                    $.each(data, function (index, item) {

                        $('#maintenanceTechinician').append($('<option data-technician="' + item.Technician + '" data-asset="' + item.AssetID + '"></option>').val(item.DriverID).html(item.Name));
                    });

                } else {
                    $('#maintenanceTechinician').append($('<option></option>').val(0).html("No Phone Users Selected"));

                    $.each(data, function (index, item) {

                        if (item.DriverID == value.DriverID) {
                            $('#maintenanceTechinician').append($('<option data-technician="' + item.Technician + '" data-asset="' + item.AssetID + '" selected="selected"></option>').val(item.DriverID).html(item.Name));

                        } else {
                            $('#maintenanceTechinician').append($('<option data-technician="' + item.Technician + '" data-asset="' + item.AssetID + '"></option>').val(item.DriverID).html(item.Name));
                        }
                    });
                }


                $('.selectpicker').selectpicker('refresh');
            });


            $('#maintenanceID').val(value.MaintenanceID);
            $('#address').val(value.Address);
            $('#postal').val(value.Postal);
            $('#unit').val(value.Unit);
            $('#company').val(value.CusCompany);
            $('#pic').val(value.PIC);
            $('#phone').val(value.Phone);
            $('#email').val(value.Email);
            $('#site').val(value.Site);
            $('#contract_start').val(inputdateFormatter(value.ContractStart));
            $('#contract_end').val(inputdateFormatter(value.ContractEnd));
            $('#maintenance_interval').val(value.MaintenanceInterval);
            $('#notification_interval').val(value.NotificationInterval);
            $('#remarks').val(value.Remarks);


            Date.parseDate = function (input, format) {
                return moment(input, format).toDate();
            };
            Date.prototype.dateFormat = function (format) {
                return moment(this).format(format);
            };

            var dateToday = new Date();

            jQuery('#contract_start').datetimepicker({
                format: 'DD-MMM, YYYY HH:mm',
                formatTime: 'HH:mm',
                formatDate: 'DD-MMM, YYYY HH:mm',
                theme: 'dark',
                autoclose: true,
                mask: false,
                timepicker: true,
                todayButton: false,
                onChangeDateTime: function (dp, $input) {
                    $(this).hide();
                    $('#contract_start').datetimepicker();
                }
            });

            jQuery('#contract_end').datetimepicker({
                format: 'DD-MMM, YYYY HH:mm',
                formatTime: 'HH:mm',
                formatDate: 'DD-MMM, YYYY HH:mm',
                theme: 'dark',
                autoclose: true,
                mask: false,
                timepicker: true,
                todayButton: false,
                onChangeDateTime: function (dp, $input) {
                    $(this).hide();
                    $('#contract_end').datetimepicker();
                }
            });

            $('#maintenanceTechinician').change(function () {
                var getTechnician = $(this).find(':selected').attr('data-technician')
                var getAsset = $(this).find(':selected').attr('data-asset')
                $('#maintech').val(getTechnician);
                $('#assetID').val(getAsset);

            });

        },
        buttons: {
            'Update Maintenance': function () {

                if (getSessionstorageValueLanguage == "en") {
                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "en",


                    });
                } else if (getSessionstorageValueLanguage == "th") {
                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "th",


                    });
                } else if (getSessionstorageValueLanguage == "vn") {

                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "vi",


                    });
                } else if (getSessionstorageValueLanguage == "id") {

                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "id",


                    });
                }

                bootbox.confirm("<div style='color:black'>" + "WARNING: Maintenance Jobs will recalculate once you update the job. Proceed?" + "</div>", function (result) {
                    if (result) {

                        $.niftyNoty({
                            type: 'success',
                            icon: 'fa fa-check',
                            message: titleSuccess,
                            container: 'floating',
                            timer: 3000
                        });

                        //Do task
                        var datetimeFormat = "DD-MMM, YYYY HH:mm";

                        //Do action
                        var enumerateDaysBetweenDates = function (startDate, endDate, interval) {
                            var now = startDate,
                                dates = [];

                            var main_num = 1;
                            var main_interval;
                            switch (interval) {
                                case "Daily":
                                    main_interval = "days";
                                    break;
                                case "Weekly":
                                    main_interval = "weeks";
                                    break;
                                case "Fornightly":
                                    main_num = 14;
                                    main_interval = "days";
                                    break;
                                case "Monthly":
                                    main_num = 28;
                                    main_interval = "days";
                                    break;
                                case "Yearly":
                                    main_interval = "years";
                                    break;
                                case "Annually":
                                    main_interval = "years";
                                    break;
                                case "Half Yearly":
                                    main_num = 6;
                                    main_interval = "months";
                                    break;
                                case "Quarterly":
                                    main_num = 3;
                                    main_interval = "months";
                                    break;
                                case "Tri-Monthly":
                                    main_num = 3;
                                    main_interval = "months";
                                    break;
                                case "Bi-Monthly":
                                    main_num = 2;
                                    main_interval = "months";
                                    break;
                                default:
                                    main_interval = "error";
                                    break;
                            }
                            var n = 0;
                            while (now.isSameOrBefore(endDate)) {

                                if (n == 0) {
                                    console.log('First Maintenance');
                                } else {
                                    if (now < endDate) dates.push(moment(now).subtract(8, 'hours').format('M/D/YYYY HH:mm'));
                                }

                                now.add(main_num, main_interval);
                                n++;
                            }

                            return dates;
                        };

                        var startDate = moment($('#contract_start').val());
                        var endDate = moment($('#contract_end').val());
                        var results = enumerateDaysBetweenDates(startDate, endDate, $('#maintenance_interval').val());

                        var maintenance = {
                            MaintenanceID: $('#maintenanceID').val(),
                            CompanyID: sessionStorage.getItem('setSessionstorageValueCompanyID'),
                            Timestamp: moment.utc().format(datetimeFormat),
                            RxTime: moment.utc().format(datetimeFormat),
                            UserID: sessionStorage.getItem('setSessionstorageValueUserID'),
                            Address: $('#address').val(),
                            Postal: $('#postal').val(),
                            Unit: $('#unit').val(),
                            CusCompany: $('#company').val(),
                            PIC: $('#pic').val(),
                            Phone: $('#phone').val(),
                            Email: $('#email').val(),
                            Site: $('#site').val(),
                            ContractStart: moment.utc($('#contract_start').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                            ContractEnd: moment.utc($('#contract_end').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                            MaintenanceInterval: $('#maintenance_interval').val(),
                            NotificationInterval: $('#notification_interval').val(),
                            Remarks: $('#remarks').val()
                        };

                        $.ajax({
                            url: "https://api.systempest.com/api/maintenanceinfo?id=" + maintenance.MaintenanceID,
                            type: "PUT",
                            async: false,
                            data: JSON.stringify(maintenance),
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
                            permissions: ["http://117.120.7.120"],
                            success: function (maintenance) {
                                console.log(maintenance);

                                $.ajax({
                                    url: "https://api.systempest.com/api/maintenancejobinfoex/" + $('#maintenanceID').val(),
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
                                    permissions: ["http://117.120.7.120"],
                                    success: function (res) {
                                        console.log(res);

                                        if (res.MaintenanceID > 0) {

                                            //DELETE Maintenance Jobs
                                            var deletemaintenance = JSON.stringify({
                                                'MaintenanceID': $('#maintenanceID').val()
                                            });

                                            $.ajax({
                                                url: 'https://api.systempest.com/api/maintenancejobinfo/' + $('#maintenanceID').val(),
                                                type: "Delete",
                                                async: false,
                                                data: JSON.stringify(deletemaintenance),
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
                                                success: function (deletemaintenance) {
                                                    console.log(deletemaintenance);

                                                    //ADD Maintenance Jobs
                                                    for (var i = 0; i < results.length; i++) {

                                                        var getIntervalDates = function (dates, interval) {

                                                            var arrDates = interval.split(' ');

                                                            var notif_interval;
                                                            switch (arrDates[1]) {
                                                                case "day":
                                                                    notif_interval = 'days';
                                                                    break;
                                                                case "days":
                                                                    notif_interval = 'days';
                                                                    break;
                                                                case "week":
                                                                    notif_interval = 'weeks';
                                                                    break;
                                                                case "weeks":
                                                                    notif_interval = 'weeks';
                                                                    break;
                                                                case "year":
                                                                    notif_interval = 'years';
                                                                    break;
                                                                case "years":
                                                                    notif_interval = 'years';
                                                                    break;
                                                                case "month":
                                                                    notif_interval = 'months';
                                                                    break;
                                                                case "months":
                                                                    notif_interval = 'months';
                                                                    break;
                                                                case "hour":
                                                                    notif_interval = 'hours';
                                                                    break;
                                                                case "hours":
                                                                    notif_interval = 'hours';
                                                                    break;
                                                                default:
                                                                    notif_interval = 'weeks';
                                                            }

                                                            var intervaldates = moment(dates).subtract(notif_interval, arrDates[0]).format('M/D/YYYY HH:mm');

                                                            return intervaldates;
                                                        };

                                                        var notifInterval = getIntervalDates(results[i], $('#notification_interval').val());

                                                        var maintenancejob = {
                                                            MaintenanceJobID: "",
                                                            MaintenanceID: $('#maintenanceID').val(),
                                                            AlertDate: notifInterval,
                                                            Timestamp: results[i],
                                                            RxTime: moment.utc().format(datetimeFormat),
                                                            Flag: 1,
                                                            JobCancelled: "",
                                                            CancelRemarks: "",
                                                            isSent: 1,
                                                            ReferenceNo: $('#reference_no').val(),
                                                            DriverID: $('#maintenanceTechinician').val(),
                                                            AssetID: $('#assetID').val(),
                                                            Technician: $('#maintech').val()
                                                        };


                                                        $.ajax({
                                                            url: "https://api.systempest.com/api/maintenancejobinfo",
                                                            type: "POST",
                                                            async: false,
                                                            data: JSON.stringify(maintenancejob),
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
                                                            permissions: ["http://117.120.7.120"],
                                                            success: function (maintenancejob) {
                                                                console.log(maintenancejob);

                                                                //$('#editMaintenance').dialog('destroy');
                                                            }
                                                        });

                                                        if (i + 1 == results.length) {
                                                            $('#editMaintenance').dialog('destroy');
                                                        }
                                                    }
                                                }
                                            });

                                        } else {

                                            //Add Maintenance Job
                                            for (var i = 0; i < results.length; i++) {

                                                var getIntervalDates = function (dates, interval) {

                                                    var arrDates = interval.split(' ');

                                                    var notif_interval;
                                                    switch (arrDates[1]) {
                                                        case "day":
                                                            notif_interval = 'days';
                                                            break;
                                                        case "days":
                                                            notif_interval = 'days';
                                                            break;
                                                        case "week":
                                                            notif_interval = 'weeks';
                                                            break;
                                                        case "weeks":
                                                            notif_interval = 'weeks';
                                                            break;
                                                        case "year":
                                                            notif_interval = 'years';
                                                            break;
                                                        case "years":
                                                            notif_interval = 'years';
                                                            break;
                                                        case "month":
                                                            notif_interval = 'months';
                                                            break;
                                                        case "months":
                                                            notif_interval = 'months';
                                                            break;
                                                        case "hour":
                                                            notif_interval = 'hours';
                                                            break;
                                                        case "hours":
                                                            notif_interval = 'hours';
                                                            break;
                                                        default:
                                                            notif_interval = 'weeks';
                                                    }

                                                    var intervaldates = moment(dates).subtract(notif_interval, arrDates[0]).format('M/D/YYYY HH:mm');

                                                    return intervaldates;
                                                };

                                                var notifInterval = getIntervalDates(results[i], $('#notification_interval').val());

                                                var maintenancejob = {
                                                    MaintenanceJobID: "",
                                                    MaintenanceID: $('#maintenanceID').val(),
                                                    AlertDate: notifInterval,
                                                    Timestamp: results[i],
                                                    RxTime: moment.utc().format(datetimeFormat),
                                                    Flag: 1,
                                                    JobCancelled: "",
                                                    CancelRemarks: "",
                                                    isSent: 1,
                                                    ReferenceNo: $('#reference_no').val(),
                                                    DriverID: $('#maintenanceTechinician').val(),
                                                    AssetID: $('#assetID').val(),
                                                    Technician: $('#maintech').val()
                                                };

                                                $.ajax({
                                                    url: "https://api.systempest.com/api/maintenancejobinfo",
                                                    type: "POST",
                                                    async: false,
                                                    data: JSON.stringify(maintenancejob),
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
                                                    permissions: ["http://117.120.7.120"],
                                                    success: function (maintenancejob) {
                                                        console.log(maintenancejob);

                                                        //$('#editMaintenance').dialog('destroy');
                                                    }
                                                });

                                                if (i + 1 == results.length) {
                                                    $('#editMaintenance').dialog('destroy');
                                                }


                                            }
                                        }

                                    }
                                });
                            }
                        });


                    } else {
                        $.niftyNoty({
                            type: 'danger',
                            icon: 'fa fa-minus',
                            message: titleCancel,
                            container: 'floating',
                            timer: 3000
                        });
                    };

                });


            },
            Close: function () {

                //$(this).dialog("close");
                $(this).dialog('destroy');
            },
        }
    });


}

function loadMaintenance(job_id) {

    $('#LoadingForm').modal('show');
    var WebAPI = 'https://api.systempest.com/api/maintenancejobinfo?MaintenanceID=' + job_id;
    $.ajax({
        type: 'GET',
        url: WebAPI,
        async: false,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (value) {
            rows = [];
            $('#pestsTreatment').bootstrapTable('removeAll');
            for (var i = 0; i < value[0].Pest.length; i++) {
                rows.push({
                    Pests: value[0].Pest[i].PestDesc,
                    Treatments: value[0].Pest[i].TreatmentDesc,
                    Index: value[0].Pest[i].ItemNo
                });
            }
            $('#pestsTreatment').bootstrapTable('append', rows);
            rows = [];

            var WebAPI = 'https://api.systempest.com/api/maintenanceinfo/' + value[0].MaintenanceID;
            $.ajax({
                type: 'GET',
                url: WebAPI,
                async: false,
                data: {
                    get_param: 'value'
                },
                dataType: 'json',
                success: function (value) {

                    $.niftyNoty({
                        type: 'success',
                        icon: 'fa fa-exclamation-triangle',
                        message: 'Warning : This action might affect the existing Maintenance Jobs. \n\nPlease add in Driver and Pests & Treatments',
                        container: 'floating',
                        timer: 3000
                    });
                    sessionStorage.setItem("setSessionstorageValueRegenerateMaintenance", true);
                    $('#jobMaintenanceID').val(value.MaintenanceID);
                    $('#jobPIC').val(value.PIC);
                    $('#jobDestination').val(value.Address);
                    $('#jobPostal').val(value.Postal);
                    $('#jobUnit').val(value.Unit);
                    $('#companyName').val(value.CusCompany);
                    $('#jobContactNumber').val(value.Phone);
                    // if(value.MaintenanceJob[0]){
                    // 	$('#jobReferenceNo').val(value.MaintenanceJob[0].ReferenceNo);
                    // }
                    if (value.ReferenceNo == "No Reference No.") {

                        $.niftyNoty({
                            type: 'danger',
                            icon: 'fa fa-exclamation-triangle',
                            message: 'No Reference no. Please add Reference No.',
                            container: 'floating',
                            timer: 3000
                        });
                        $('#jobReferenceNo').val('');
                    } else {
                        $('#jobReferenceNo').val(value.ReferenceNo);
                    }

                    $('#customerEmail').val(value.Email);
                    $('#jobTechnician').val(0);
                    $('#jobSite').val(value.Site);

                    $('#contract_start_html').val(loadDateFormatter(value.ContractStart));
                    $('#contract_end_html').val(loadDateFormatter(value.ContractEnd));

                    $('#maintenance_interval_html').val(value.MaintenanceInterval);
                    $('#notification_interval_html').val(value.NotificationInterval);

                    $('#jobRemarks').val(value.Remarks);

                    $('.selectpicker').selectpicker('refresh');


                    $('#LoadingForm').modal('hide');
                    $('html, body').animate({
                        scrollTop: $("#clearForm").offset().top
                    }, 2000);
                }
            });

        }
    });


}

function loadMaintenanceInfo(job_id) {

    $('#LoadingForm').modal('show');
    var WebAPI = 'https://api.systempest.com/api/maintenanceinfo/' + job_id;
    $.ajax({
        type: 'GET',
        url: WebAPI,
        async: false,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (value) {
            //alert(JSON.stringify(value))
            sessionStorage.setItem("setSessionstorageValueRegenerateMaintenance", false);
            $('#jobMaintenanceID').val(value.MaintenanceID);
            $('#jobPIC').val(value.PIC);
            $('#jobDestination').val(value.Address);
            $('#jobPostal').val(value.Postal);
            $('#jobUnit').val(value.Unit);
            $('#companyName').val(value.CusCompany);
            $('#jobContactNumber').val(value.Phone);
            // if(value.MaintenanceJob[0]){
            // 	    $('#jobReferenceNo').val(value.MaintenanceJob[0].ReferenceNo);
            // }

            if (value.ReferenceNo == "No Reference No.") {

                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-exclamation-triangle',
                    message: 'No Reference no. Please add Reference No.',
                    container: 'floating',
                    timer: 3000
                });
                $('#jobReferenceNo').val('');
            } else {
                $('#jobReferenceNo').val(value.ReferenceNo);
            }
            $('#customerEmail').val(value.Email);
            $('#jobTechnician').val(0);
            $('#jobSite').val(value.Site);

            $('#contract_start_html').val(loadDateFormatter(value.ContractStart));
            $('#contract_end_html').val(loadDateFormatter(value.ContractEnd));

            $('#maintenance_interval_html').val(value.MaintenanceInterval);
            $('#notification_interval_html').val(value.NotificationInterval);

            $('#jobRemarks').val(value.Remarks);

            $('.selectpicker').selectpicker('refresh');

            $.niftyNoty({
                type: 'success',
                icon: 'fa fa-exclamation-triangle',
                message: 'Customer Details Loaded!',
                container: 'floating',
                timer: 3000
            });

            $('#LoadingForm').modal('hide');
            $('html, body').animate({
                scrollTop: $("#clearForm").offset().top
            }, 2000);
        }
    });

}

////Disable cancel button by default
//$('#jobsCreatedProject-cancel').prop("disabled", true);
//$('#jobsCreatedProject-edit').prop("disabled", true);

////Delete Row
//var $table = $('#jobsCreated'), $removeEN = $('#jobsCreatedProject-cancel');
//var $editEN = $('#jobsCreatedProject-edit');

//$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
//    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);
//    $editEN.prop('disabled', !$table.bootstrapTable('getSelections').length);

//});


//Translation of Forms
if (getSessionstorageValueLanguage == "en") {
    $("#newjob").text("New Customer");
    $("#company").text("Company");
    $("#addressTo").text("Address To");
    $("#unit2").text("Unit Nos.");
    $("#postal2").text("Postal Code");
    $("#scheduleTime").text("Schedule Time");
    $("#amount").text("Amount");
    $("#person").text("Person In Charge");
    $("#contactNumber").text("Contact Number");
    $("#remarks2").text("Remarks");
    $("#phone-remarks").text("Phone User Remarks");
    $('#company-destination').attr('placeholder', 'Company');
    $('#destination').attr('placeholder', 'Address To');
    $('#unit').attr('placeholder', 'Unit Nos.');
    $('#postal').attr('placeholder', 'Postal Code');
    $('#date').attr('placeholder', 'Date & Time');
    $('#amount2').attr('placeholder', 'Amount');
    $('#pic').attr('placeholder', 'Person In Charge');
    $('#phone').attr('placeholder', 'Contact Number');
    $('#remarks').attr('placeholder', 'Remarks');
    $('#phoneremarks').attr('placeholder', 'Phone User Remarks');
    $("#viewmap").text("View Map");
    $("#nearestDevice").text("Nearest Device");
    $("#total").text("Total");
    $("#available-Device").text("Available");
    $("#submit-call").text("Assign");
    $('#reference').attr('placeholder', 'Search Job Number');
    $("#jobOverview").text("Jobs Overview");
    $("#avaiableFooter").text("Available");
    $("#inProgressFooter").text("In Progress");
    $("#logoutFooter").text("Logout");
    $(".selectPhone").text("Select Phone");
    $(".acceptedFooter").text("Accepted");
    $(".pickUpFooter").text("Pick Up");
    $(".transferredFooter").text("Transferred");
    $(".editedFooter").text("Edited");
    $("#totaljobs").text("Maintenance: ");
} else if (getSessionstorageValueLanguage == "th") {
    $("#newjob").text("งานใหม่");
    $("#company").text("บริษัท");
    $("#addressTo").text("ที่อยู่");
    $("#unit2").text("หน่วย.");
    $("#postal2").text("ไปรษณีย์");
    $("#scheduleTime").text("ตารางเวลา");
    $("#amount").text("จำนวนเงิน");
    $("#person").text("ผู้รับผิดชอบในการปฎิบัติหน้าที่");
    $("#contactNumber").text("เบอร์ติดต่อ");
    $("#remarks2").text("หมายเหตุ");
    $("#phone-remarks").text("หมายเหตุผู้ใช้โทรศัพท์");
    $('#company-destination').attr('placeholder', 'บริษัท');
    $('#destination').attr('placeholder', 'ปลายทาง');
    $('#unit').attr('placeholder', 'หน่วย.');
    $('#postal').attr('placeholder', 'ไปรษณีย์');
    $('#date').attr('placeholder', 'วันเวลา');
    $('#amount2').attr('placeholder', 'จำนวนเงิน');
    $('#pic').attr('placeholder', 'ผู้รับผิดชอบในการปฎิบัติหน้าที่');
    $('#phone').attr('placeholder', 'เบอร์ติดต่อ');
    $('#remarks').attr('placeholder', 'หมายเหตุ');
    $('#phoneremarks').attr('placeholder', 'หมายเหตุผู้ใช้โทรศัพท์');
    $("#viewmap").text("ดูแผนที่");
    $("#nearestDevice").text("อุปกรณ์ที่ใกล้ที่สุด");
    $("#total").text("ทั้งหมด");
    $("#available-Device").text("มีให้บริการ");
    $("#submit-call").text("กำหนด");
    $('#reference').attr('placeholder', 'หมายเลขงาน');
    $("#jobOverview").text("ภาพรวมงาน");
    $("#avaiableFooter").text("มีให้บริการ");
    $("#inProgressFooter").text("กำลังดำเนินการ");
    $("#logoutFooter").text("ออกจากระบบ");
    $(".selectPhone").text("เลือกโทรศัพท์");
    $(".acceptedFooter").text("ได้รับการยืนยัน");
    $(".pickUpFooter").text("รับ");
    $(".transferredFooter").text("โอน");
    $(".editedFooter").text("แก้ไข");
    $("#totaljobs").text("งานทั้งหมด: ");
} else if (getSessionstorageValueLanguage == "vn") {
    $("#newjob").text("Công Việc Mới");
    $("#company").text("Công Ty");
    $("#addressTo").text("Địa Chỉ Tới");
    $("#unit2").text("Đơn Vị Nos.");
    $("#postal2").text("Mã Postal");
    $("#scheduleTime").text("Lịch Trình");
    $("#amount").text("Số Lượng");
    $("#person").text("Người Phụ Trách");
    $("#contactNumber").text("Số ĐT Liên Hệ");
    $("#remarks2").text("Nhận Xét");
    $("#phone-remarks").text("Diện Thoại Nhận Xét");
    $('#company-destination').attr('placeholder', 'Công Ty');
    $('#destination').attr('placeholder', 'Địa Chỉ');
    $('#unit').attr('placeholder', 'Đơn Vị Nos.');
    $('#postal').attr('placeholder', 'Mã Postal');
    $('#date').attr('placeholder', 'Ngày giờ');
    $('#amount2').attr('placeholder', 'Số Lượng');
    $('#pic').attr('placeholder', 'Người Phụ Trách');
    $('#phone').attr('placeholder', 'Số ĐT Liên Hệ');
    $('#remarks').attr('placeholder', 'Nhận Xét');
    $('#phoneremarks').attr('placeholder', 'Nhận Xét');
    $("#viewmap").text("Xem Bản Đồ");
    $("#nearestDevice").text("Thiết Bị Gần Nhất");
    $("#total").text("Tổng Cộng");
    $("#available-Device").text("Thực Thi");
    $("#submit-call").text("Phân Công");
    $('#reference').attr('placeholder', 'Công Việc Số');
    $("#jobOverview").text("Liệt kê công việc");
    $("#avaiableFooter").text("Có Sẵn");
    $("#inProgressFooter").text("Trong Tiến Trình");
    $("#logoutFooter").text("Đăng Xuất");
    $(".selectPhone").text("Chọn Điện Thoại");
    $(".acceptedFooter").text("Được chấp nhận");
    $(".pickUpFooter").text("Nhặt lên");
    $(".transferredFooter").text("Chuyển");
    $(".editedFooter").text("Đã chỉnh sửa");
    $("#totaljobs").text("Tổng số việc làm");
} else if (getSessionstorageValueLanguage == "id") {
    $("#newjob").text("Kerja Baru");
    $("#company").text("Perusahaan");
    $("#addressTo").text("Dialamatkan ke");
    $("#unit2").text("Unit Nos");
    $("#postal2").text("Pos Kode");
    $("#scheduleTime").text("Jadwal Waktu");
    $("#amount").text("Jumlah");
    $("#person").text("Orang In Charge");
    $("#contactNumber").text("Nomor Kontak");
    $("#remarks2").text("Keterangan");
    $("#phone-remarks").text("Keterangan Pengguna Ponsel");
    $('#company-destination').attr('placeholder', 'Perusahaan');
    $('#destination').attr('placeholder', 'Tempat Tujuan');
    $('#unit').attr('placeholder', 'Unit Nos.');
    $('#postal').attr('placeholder', 'Pos Kode');
    $('#date').attr('placeholder', 'Tanggal Waktu');
    $('#amount2').attr('placeholder', 'Jumlah');
    $('#person2').attr('placeholder', 'Orang In Charge');
    $('#phone').attr('placeholder', 'Nomor Kontak');
    $('#remarks').attr('placeholder', 'Keterangan');
    $('#phoneremarks').attr('placeholder', 'Keterangan Pengguna Ponsel');
    $("#viewmap").text("Lihat Peta");
    $("#nearestDevice").text("Perangkat Terdekat");
    $("#total").text("Jumlah");
    $("#available-Device").text("Sedia");
    $("#submit-call").text("Serah");
    $('#reference').attr('placeholder', 'Cari Nomor Kerja');
    $("#jobOverview").text("Ikhtisar Pekerjaan");
    $("#avaiableFooter").text("Sedia");
    $("#inProgressFooter").text("Sedang Berlangsung");
    $("#logoutFooter").text("Sudah Keluar");
    $(".selectPhone").text("Pilih Telepon");
    $(".acceptedFooter").text("Diterima");
    $(".pickUpFooter").text("Ambil");
    $(".transferredFooter").text("Ditransfer");
    $(".editedFooter").text("Diedit");
    $("#totaljobs").text("Jumlah Kerja: ");
}

$(function () {

    //Populate phone user
    var WebAPIDriver = "";

    if (getSessionstorageValueRoleID == 1) {
        WebAPIDriver = 'https://api.systempest.com/api/driverinfoex?ResellerID=' + '1' + '&CompanyID=' + '1';
    } else if (getSessionstorageValueRoleID == 2) {
        WebAPIDriver = 'https://api.systempest.com/api/driverinfoex?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {
        WebAPIDriver = 'https://api.systempest.com/api/driverinfoex?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }


    $('#driver').append($('<option selected="selected"></option>').val("0").html("No Phone User"));

    $.getJSON(WebAPIDriver, function (data) {
        $.each(data, function (index, item) {

            if (item.AssetID > 0) {
                $('#driver').append($('<option></option>').val(item.Name).html(item.Name));

            } else {
                $('#driver').append($('<option></option>').val(item.Name).html(item.Name));
            }
        });

        $('.selectpicker').selectpicker('refresh');
    });

});



function ExportToTable() {

    $('#submit-project').show();

    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xlsx|.xls)$/;
    /*Checks whether the file is a valid excel file*/
    if (regex.test($("#excelfile").val().toLowerCase())) {
        var xlsxflag = false; /*Flag for checking whether excel is .xls format or .xlsx format*/
        if ($("#excelfile").val().toLowerCase().indexOf(".xlsx") > 0) {
            xlsxflag = true;
        }
        /*Checks whether the browser supports HTML5*/
        if (typeof (FileReader) != "undefined") {
            var reader = new FileReader();
            reader.onload = function (e) {
                var data = e.target.result;
                /*Converts the excel data in to object*/
                if (xlsxflag) {
                    var workbook = XLSX.read(data, {
                        type: 'binary'
                    });
                } else {
                    var workbook = XLS.read(data, {
                        type: 'binary'
                    });
                }
                /*Gets all the sheetnames of excel in to a variable*/
                var sheet_name_list = workbook.SheetNames;
                console.log(workbook.SheetNames)

                var cnt = 0;
                var cntPest = 1;
                /*This is used for restricting the script to consider only first sheet of excel*/
                sheet_name_list.forEach(function (y) { /*Iterate through all sheets*/
                    /*Convert the cell value to Json*/
                    if (xlsxflag) {
                        var exceljson = XLSX.utils.sheet_to_json(workbook.Sheets[y]);
                    } else {
                        var exceljson = XLS.utils.sheet_to_row_object_array(workbook.Sheets[y]);
                    }
                    if (exceljson.length > 0 && cnt == 0) {

                        BindTable(exceljson);
                        cnt++;
                    } else if (exceljson.length > 0 && cntPest == 1) {
                        BindTablePest(exceljson);
                        cntPest++;
                    }
                });

                $('#exceltable').show();
                $('#exceltablePest').show();
            }
            if (xlsxflag) { /*If excel file is .xlsx extension than creates a Array Buffer from excel*/
                reader.readAsArrayBuffer($("#excelfile")[0].files[0]);
            } else {
                reader.readAsBinaryString($("#excelfile")[0].files[0]);
            }
        } else {

            $.niftyNoty({
                type: 'danger',
                icon: 'fa fa-exclamation-triangle',
                message: 'Sorry! Your browser does not support HTML5!',
                container: 'floating',
                timer: 3000
            });
        }
    } else {

        $.niftyNoty({
            type: 'danger',
            icon: 'fa fa-exclamation-triangle',
            message: 'Please upload a valid Excel file!',
            container: 'floating',
            timer: 3000
        });
    }
}

function BindTable(jsondata) { /*Function used to convert the JSON array to Html Table*/

    $('#exceltable').bootstrapTable('destroy');

    var filterData = [];

    for (var i = 0; i < jsondata.length; ++i) {

        var data = jsondata[i];

        if (data.MAINTENANCE_INTERVAL == "Daily" ||
            data.MAINTENANCE_INTERVAL == "Weekly" ||
            data.MAINTENANCE_INTERVAL == "Fornightly" ||
            data.MAINTENANCE_INTERVAL == "Monthly" ||
            data.MAINTENANCE_INTERVAL == "Yearly" ||
            data.MAINTENANCE_INTERVAL == "Annually" ||
            data.MAINTENANCE_INTERVAL == "Half Yearly" ||
            data.MAINTENANCE_INTERVAL == "Quaterly" ||
            data.MAINTENANCE_INTERVAL == "Bi-Monthly" ||
            data.MAINTENANCE_INTERVAL == "Tri-Monthly") {
            filterData.push(data);
        } else {

            $.niftyNoty({
                type: 'danger',
                icon: 'fa fa-exclamation-triangle',
                message: "Person In Charge : " + data.PERSON_IN_CHARGE + " is not added, incorrect format.",
                container: 'floating',
                timer: 3000
            });
        }

    }

    $('#exceltable').bootstrapTable({
        idField: 'ID',
        data: filterData,
        columns: [{
            field: 'SN',
            title: 'SN',
            formatter: snFormatter
        }, {
            field: 'DRIVER',
            title: 'DRIVER'
        }, {
            field: 'REFERENCE_NO',
            title: 'REFERENCE_NO'
        }, {
            field: 'ADDRESS',
            title: 'ADDRESS'
        }, {
            field: 'POSTAL',
            title: 'POSTAL'
        }, {
            field: 'UNIT',
            title: 'UNIT'
        }, {
            field: 'COMPANY',
            title: 'COMPANY'
        }, {
            field: 'PERSON_IN_CHARGE',
            title: 'PERSON_IN_CHARGE'
        }, {
            field: 'PHONE',
            title: 'PHONE'
        }, {
            field: 'EMAIL',
            title: 'EMAIL'
        }, {
            field: 'SITE',
            title: 'SITE'
        }, {
            field: 'CONTRACT_START',
            title: 'CONTRACT START'
        }, {
            field: 'CONTRACT_END',
            title: 'CONTRACT END'
        }, {
            field: 'MAINTENANCE_INTERVAL',
            title: 'MAINTENANCE INTERVAL'
        }, {
            field: 'NOTIFICATION_INTERVAL',
            title: 'NOTIFICATION INTERVAL'
        }, {
            field: 'REMARKS',
            title: 'REMARKS'
        }],
        onLoadSuccess: function (row) {


        },
        onPostBody: function () {



        },
        onPreBody: function (data) {


        },

    });

}

function BindTablePest(jsondata) { /*Function used to convert the JSON array to Html Table*/

    $('#exceltablePest').bootstrapTable('destroy');

    var filterData = [];

    $('#exceltablePest').bootstrapTable({
        idField: 'ID',
        data: jsondata,
        columns: [{
            field: 'PESTS',
            title: 'PESTS',
            align: 'center'
        }, {
            field: 'TREATMENTS',
            title: 'TREATMENTS'
        }],
        onLoadSuccess: function (row) {


        },
        onPostBody: function () {



        },
        onPreBody: function (data) {


        },

    });

}


//Storage
$(document).ready(function () {

    //Then retrieve
    var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
    var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
    var getSessionstorageValueEmail = sessionStorage.getItem('setSessionstorageValueEmail');
    var getSessionstorageValueName = sessionStorage.getItem('setSessionstorageValueName');
    var getSessionstorageValueRoleDesc = sessionStorage.getItem('setSessionstorageValueRoleDesc');
    var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');

    if (getSessionstorageValueUser == null | getSessionstorageValueUser == "undefined" | getSessionstorageValueUser == "") {

        window.location.href = 'http://117.120.7.120/systempest/'; //Login URL
        sessionStorage.clear();
        //window.location.href = '/';
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

        if (getSessionstorageValueCompanyID == 0) $('#titleCompany').append($('<div></div>').val("Calpeda").html("Calpeda"));
        else $('#titleCompany').append($('<div></div>').val(getSessionstorageValueCompany).html(getSessionstorageValueCompany));


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


//Session Storage
$(document).ready(function () {



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


//OnLoad Version Number
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
            console.log('error');
        }
    });

    var version;
    //Then retrieve
    version = localStorage.getItem('setLocalstorageValueVersion');

    if (getSessionstorageValueLanguage == "th") document.getElementById("verNum").innerHTML = version;
    if (getSessionstorageValueLanguage == "en") document.getElementById("verNumEN").innerHTML = version;
    if (getSessionstorageValueLanguage == "vn") document.getElementById("verNumVN").innerHTML = version;
    if (getSessionstorageValueLanguage == "id") document.getElementById("verNumID").innerHTML = version;

});




//Search Places AutoComplete
function SearchPlacesTo() {

    var defaultBounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(1.3000, 103.8000),
        new google.maps.LatLng(1.3000, 103.5710));


    var input = document.getElementById('jobDestination');

    var options = {
        bounds: defaultBounds,
        types: ['establishment'],
        //componentRestrictions: {
        //    country: 'SG'
        //}
    };

    var autocomplete = new google.maps.places.Autocomplete(input, options);


    autocomplete.setTypes();


}

$(function () {


    $('#companyName').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: 'https://api.systempest.com/api/autocompletecompany?CompanyID=' + getSessionstorageValueCompanyID,
                type: 'GET',
                cache: false,
                data: {
                    term: $("#companyName").val()
                },
                dataType: 'json',
                success: function (json) {

                    var array = $.map(json, function (item) {
                        return {
                            label: item.CusCompany,
                            address: item.Address,
                            postal: item.Postal,
                            unit: item.Unit,
                            pic: item.PIC,
                            phone: item.Phone,
                            email: item.Email,
                            site: item.Site,
                            cuscompany: item.CusCompany
                        };
                    });

                    //call the filter here
                    response($.ui.autocomplete.filter(array, request.term));
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    //alert('error - ' + textStatus);
                    console.log('error', textStatus, errorThrown);
                }
            });
        },
        minLength: 0,
        focus: function (event, ui) {

        },
        select: function (event, ui) {
            $("#companyName").val(ui.item.cuscompany);
            $("#jobPIC").val(ui.item.pic);
            $("#jobDestination").val(ui.item.address);
            $("#jobPostal").val(ui.item.postal);
            $("#jobUnit").val(ui.item.unit);
            $("#jobContactNumber").val(ui.item.phone);
            $("#customerEmail").val(ui.item.email);
            $("#jobSite").val(ui.item.site);
            //alert('You have selected: ' + ui.item.label);
            //$('#companyName').val(ui.item.CusCompany);
            return false;
        }
    });

    $('#jobDestination').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: 'https://api.systempest.com/api/autocompleteaddress?CompanyID=' + getSessionstorageValueCompanyID,
                type: 'GET',
                cache: false,
                data: {
                    term: $("#jobDestination").val()
                },
                dataType: 'json',
                success: function (json) {

                    var array = $.map(json, function (item) {
                        return {
                            label: item.Address,
                            address: item.Address,
                            postal: item.Postal,
                            unit: item.Unit,
                            pic: item.PIC,
                            phone: item.Phone,
                            email: item.Email,
                            site: item.Site,
                            cuscompany: item.CusCompany
                        };
                    });

                    //call the filter here
                    response($.ui.autocomplete.filter(array, request.term));
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    //alert('error - ' + textStatus);
                    console.log('error', textStatus, errorThrown);
                }
            });
        },
        minLength: 0,
        focus: function (event, ui) {

        },
        select: function (event, ui) {
            $("#companyName").val(ui.item.cuscompany);
            $("#jobPIC").val(ui.item.pic);
            $("#jobDestination").val(ui.item.address);
            $("#jobPostal").val(ui.item.postal);
            $("#jobUnit").val(ui.item.unit);
            $("#jobContactNumber").val(ui.item.phone);
            $("#customerEmail").val(ui.item.email);
            $("#jobSite").val(ui.item.site);
            //alert('You have selected: ' + ui.item.label);
            //$('#companyName').val(ui.item.CusCompany);
            return false;
        }
    });



});


function loadPestsTreatment() {

    $('#pestsTreatment').bootstrapTable('destroy');

    $('#pestsTreatment').bootstrapTable({
        idField: 'PestItemID',
        columns: [{
            field: 'state',
            checkbox: true
        }, {
            field: 'ItemNo',
            title: 'Item No',
            formatter: serialnoFormatter
        }, {
            field: 'Pests',
            title: 'Pests'
        }, {
            field: 'Treatments',
            title: 'Treatments',
        }, {
            field: 'Index',
            title: 'index',
            class: 'hidden-xs hidden-sm hidden-md hidden-lg'
        }],
        onCheck: function (row, index) {
            console.log(index)
        },
        onLoadSuccess: function (row) {


        },
        onPostBody: function () {



        },
        onPreBody: function (data) {


        },

    });

}

function insertData() {

    var rowId;
    var boostrapTableValue = JSON.stringify($('#pestsTreatment').bootstrapTable().bootstrapTable('getData'));

    var stringify = JSON.parse(boostrapTableValue);
    if (stringify.length > 0) {
        rowId = stringify[stringify.length - 1]['Index'] + 1;
    } else {
        rowId = 1;
    }

    var getPest = $('#jobPests').val();

    if ($('#jobOtherPest').val() != "") {
        getPest = $('#jobOtherPest').val();
    } else {
        getPest = $('#jobPests').val();
    }

    var getTreatments = $('#jobTreatments').val();
    if ($('#jobOtherTreatment').val() != "") {
        if ($("#jobTreatments").val() == null) {
            getTreatments = $('#jobOtherTreatment').val();
        } else {
            getTreatments = getTreatments + ", " + $('#jobOtherTreatment').val();
        }

    }

    rows.push({
        Pests: getPest,
        Treatments: getTreatments,
        Index: rowId
    });


    $('#pestsTreatment').bootstrapTable('append', rows);
    rows = [];
    itemNo++;

    $('#jobPests').val(0);
    $('#jobTreatments').val(0);
    $('#jobOtherPest').val("");
    $('#jobOtherTreatment').val("");
    //$('#jobOtherPest').hide();
    $('#jobPests').selectpicker('refresh');
    $('#jobTreatments').selectpicker('refresh');


}

function clearJobForms() {
    $('#isSent').prop('checked', true);
    $('#jobMaintenanceID').val('');
    $('#maintenanceid').val('');
    $('#companyName').val('');
    $('#jobDestination').val('');
    $('#jobPostal').val('');
    $('#jobUnit').val('');
    $('#jobPIC').val('');
    $('#jobContactNumber').val('');
    $('#jobTime').val('');
    $('#jobCharges').val('');
    $('#customerEmail').val('');
    $('#jobSite').val('');
    $('#jobPest').val('');
    $('#jobReportEmail').val('');
    $('#jobMaintenanceInterval').val('');
    $('#jobRecheckDate').val('');
    $('#jobReferenceNo').val('');
    $("#jobMaintenanceInterval").val(0);
    $('#jobRemarks').val('');
    $('#phoneremarks').val('');
    $("#jobTechnician").val(0);
    $("#availAmbulance tr").remove();

    $('.selectpicker').selectpicker('refresh');

    $('#contract_start_html').val('');
    $('#contract_end_html').val('');
    $('#notification_interval_html').val('3 days');
    $('#maintenance_interval_html').val('');
    $('.selectpicker').selectpicker('refresh');

}

$(function () {

    $("#isSent").change(function () {
        if (this.checked) {
            //Do stuff
            $('#notification_interval_html').val('3 days');
            $('#notification_interval_html').attr('disabled', false);
        } else {
            $('#notification_interval_html').val('');
            $('#notification_interval_html').attr('disabled', true);
        }
    });

    $('#SearchMaintenance').keyup(function () {

        var val = '^(?=.\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.\\b') + ').*$';
        var rex = new RegExp($(this).val(), 'i');
        $('.searchable tbody tr').hide();


        $('.searchable tr').filter(function () {
            text = $(this).text().replace(/\s+/g, ' ');
            return rex.test($(this).text());

        }).show();


    });

});

$("#SearchMaintenance").keyup(function () {
    if ($('#SearchMaintenance').val().length != 0) {
        clearInterval(jobsCreatedInterval);
    } else {
        // jobsCreatedInterval = setInterval(function () {
        //     reloadJobsCreated();
        //     //$('#jobsCreated').bootstrapTable('refresh');
        // }, '5000');
    }
});



//var $rows = $('#jobsCreated tr');
//$('#SearchMaintenance').keyup(debounce(function () {

//    var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$',
//        reg = RegExp(val, 'i'),
//        text;

//    $rows.show().filter(function () {
//        text = $(this).text().replace(/\s+/g, ' ');
//        return !reg.test(text);
//    }).hide();
//}, 300));

//function debounce(func, wait, immediate) {
//    var timeout;
//    return function () {
//        var context = this,
//            args = arguments;
//        var later = function () {
//            timeout = null;
//            if (!immediate) func.apply(context, args);
//        };
//        var callNow = immediate && !timeout;
//        clearTimeout(timeout);
//        timeout = setTimeout(later, wait);
//        if (callNow) func.apply(context, args);
//    };
//};