
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
//var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueRoleID = 1;
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');


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



$(document).ready(function () {

    $("#driver-confirm-deleteEN").hide();
    $("#driverImage").hide();

    var WebAPI;

    if (getSessionstorageValueRoleID == 1) {
        WebAPI = 'http://172.16.10.110/sbswebapi/api/scsinfo';
    } else if (getSessionstorageValueRoleID == 2) {
        WebAPI = 'http://172.16.10.110/sbswebapi/api/scsinfo';
        //WebAPI = 'http://172.16.10.110/sbswebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    } else if (getSessionstorageValueRoleID >= 3) {
        WebAPI = 'http://172.16.10.110/sbswebapi/api/scsinfo';
        //WebAPI = 'http://172.16.10.110/sbswebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }


        $('#scs-editable').bootstrapTable({
            idField: 'id',      
            url: WebAPI,
            columns: [{
                field: 'state',
                title: '',
                checkbox: 'true'
            }, 
            {
                field: 'Company',
                title: 'Company Name',          
                class: 'hidden-xs hidden-sm hidden-md hidden-lg'
            },
            {
                field: 'OP_DATE',
                title: 'OP_DATE',
                sortable: 'true',
                formatter: 'dateFormatter'
            }, {
                field: 'BUS_NO',
                title: 'BUS_NO',
            }, {
                field: 'SVC_NO',
                title: 'SVC_NO',
            }, {
                field: 'DRV_NO',
                title: 'DRV_NO',
            }, {
                field: 'DUTY_NO',
                title: 'DUTY_NO',
            }, {
                field: 'ACT_DEP_TIME',
                title: 'ACT_DEP_TIME',
            }, {
                field: 'ACT_ARR_TIME',
                title: 'ACT_ARR_TIME',
            }, {
                field: 'RESN_CODE_FOR_DEP',
                title: 'RESN_CODE_FOR_DEP',
            }, {
                field: 'RESN_DESC',
                title: 'RESN_DESC',
            }, {
                field: 'REMARKS_FOR_DEP',
                title: 'REMARKS_FOR_DEP',
            }],

            onCheck: function (row) {


                $("#buttonNew").text(function () {
                    var edit = ' Edit';
                    return edit;
                });

                $("#addform").hide();
                $("#editform").show();
                $("#driver-confirm-deleteEN").show();
                $("#driverImage").show();

                if (row.ImageFill == "Uniform") {
                    $("#showImage").attr("src", row.Image);
                }

                var driverID = $('#driverID').val(row.DriverID);
                var driverCompanyEN = $('#driverCompanyEN').val(row.CompanyID);
                var driverNameEN = $('#driverNameEN').val(row.Name);
                var driverEmailEN = $('#driverEmailEN').val(row.Email);
                var driverPhoneEN = $('#driverPhoneEN').val(row.Phone);
                var driverAddressEN = $('#driverAddressEN').val(row.Address);
                var driverRemarksEN = $('#driverRemarksEN').val(row.Remarks);

                var DateOfBirth = row.DateOfBirth;
                if (DateOfBirth == "0001-01-01T00:00:00") {
                    $('#driverDateOfBirth').val('');
                }
                else {
                    var Bangkok = moment.tz(DateOfBirth, 'Asia/Bangkok');
                    //Format UTC
                    var timestamp = moment(Bangkok.format()).add('hours', 8).format("D-MMM-YYYY");
                    $('#driverDateOfBirth').val(timestamp);
                }

                $('.selectpicker').selectpicker('refresh');

            },

            onUncheck: function (row) {
        

                window.location.reload(true);
            },

            onLoadSuccess: function (row) {

                $('#buttonNew').hide();
     
            }
        });

    


});

function driveridFormatter(value, row) {

    if (value == null) {

        return '<a class="btn-link" id="showVehicle">' + '#' + 'No Driver ID' + '</a>';
    }
    else
    {
     return '<a class="btn-link" id="showVehicle">' + '#' + value + '</a>';
    }
}


function rowStyle(row, index) {
    var classes = ['stripe'];

    if (index % 2 === 0 && index / 2 < classes.length) {
        return {
            classes: classes[index / 2]
        };
    }
    return {};
}


//Delete Row
var $table = $('#scs-editable'), $remove = $('#driver-confirm-delete'), $removeEN = $('#driver-confirm-deleteEN');
$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);


});


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
    if (row.ImageFill == "Uniform") {
        text = value;

        var driverAddress;
        if (row.Address == '') {
            driverAddress = "No Name";
        } else {
            driverAddress = row.Address;
        }

        var driverPhone;
        if (row.Phone == '') {
            driverPhone = "No Phone";
        } else {
            driverPhone = row.Phone;
        }

        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.Name + '" data-footer="' + "<strong>Address: </strong>" + driverAddress + "\n" + "<strong>Phone: </strong>" + driverPhone + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

    } else if (row.ImageFill != "Uniform") {
        labelColor = "dark";
        text = "No Driver Photo";
        return '<center><div style="color:#333333;" class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }
    
}


// Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {
	
    if (value == "0001-01-01T00:00:00") {

        timestamp = "No Birthday Record"

    }
    else {
        //Convert Timezone
        var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
        var Singapore = moment.tz(value, Asia);
        //Format UTC
        var timestamp = moment(Singapore.format()).format("D-MMM-YYYY");
    }


   
    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';

}



//  Format for Status Column.
// =================================================================
function vehicleFormatter(value, row) {
    var labelColor;
    var text;
	if (value != "") {
	    labelColor = "success";
	    text = value;
	}else if(value == null | value == "" | value == 0){
	    labelColor = "danger";
	    text = "No Vehicle Assigned";
	}
	var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
	return '<div class="label label-table label-'+ labelColor+'"> ' + text + '</div>';
}

$.getJSON("http://172.16.10.110/sbswebapi/api/companyinfo", function (data) {
    $.each(data, function (index, item) {
        if (item.CompanyID == 1)
            $('#driverCompanyEN').append(
                 $('<option></option>').val(item.DeviceTypeID).html(item.Name)
             );
    });
    $(".selectpicker").selectpicker('refresh');
});

function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#showImage')
                .attr('src', e.target.result)
                .width(110)
                .height(110);
        };

        reader.readAsDataURL(input.files[0]);
    }
}