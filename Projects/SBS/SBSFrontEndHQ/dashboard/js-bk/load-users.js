var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueResellerID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
//var getSessionstorageValueRoleID = 1;


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


    $("#users-confirm-deleteEN").hide();
    $("#userImage").hide();

    var WebAPI = "";

    if (getSessionstorageValueRoleID == 1) {

        WebAPI = 'http://172.16.10.110/sbswebapi/api/userinfo';

    } else if (getSessionstorageValueRoleID == 2) {
        WebAPI = 'http://172.16.10.110/sbswebapi/api/userinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&RoleID=' + getSessionstorageValueRoleID;

    } else if (getSessionstorageValueRoleID >= 3) {

        WebAPI = 'http://172.16.10.110/sbswebapi/api/userinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&RoleID=' + getSessionstorageValueRoleID;
    }

	$('#users-editable').bootstrapTable({
		idField: 'id',
		url: WebAPI,
		columns: [{
			field: 'state',
			title: '',
			checkbox: 'true'
		}, {
		    field: 'Name',
		    title: 'Full Name'
		}, {
			field: 'User',
			title: 'User Name'
		}, {
		    field: 'Email',
		    title: 'Email Address'
		}, {
		    field: 'RoleDesc',
		    title: 'User Role'
		},  {
		    field: 'LoginRetry',
		    title: 'Status',
		    formatter: 'statusFormatter'
		}, {
		    field: 'Image',
		    title: 'User Profile',
		    formatter: 'nameFormatter'
		}],

		
		onCheck: function (row) {

		    $("#buttonNew").text(function () {
		        var edit = ' Edit';
		        return edit;
		    });

		    $("#addform").hide();
		    $("#editform").show();
		    $("#users-confirm-deleteEN").show();
		    $("#userImage").show();

		    if (row.ImageFill == "Uniform") {
		        $("#showImage").attr("src", row.Image);
		    }

		    var userID = $('#userID').val(row.UserID);
		    var userCompany = $('#userCompany').val(row.CompanyID);
		    var userLanguage = $('#getLanguage').val(row.LanguageID);
		    var userRoleDesc = $('#getRoles').val(row.RoleID);
		    var userFullName = $('#fname').val(row.Name);
		    var UserName = $('#username').val(row.User);
		    var userPassword = $('#password').val(row.Password);
		    var confirmPassword = $('#pwordagain').val(row.Password);
		    var userEmail = $('#email').val(row.Email);
		    var userPhone = $('#phone').val(row.Phone);
		    var userImage = $('#userImage').val(row.Image);

		
		    //Convert String to Array
		    var Notifications = row.Notifications;
		    var AssignedNotifications = new Array();
		    AssignedNotifications = Notifications.split(",");
		    var getNotification = new Array();
		    var getNotificationType = new Array();

		    var afterColon = AssignedNotifications[0].substr(AssignedNotifications[0].indexOf(":") + 1);
		    var Email = afterColon.substring(0,1) + "E";

		    getNotificationType.push(Email);

		    for (var n = 0; n < AssignedNotifications.length; n++)
		    {
		        var arrNotification = AssignedNotifications[n].substring(0, 2);
		        var desired = arrNotification.replace(/[^\w\s]/gi, '')
		        getNotification.push(desired);

		    }

		    var userNotifications = $('#getNotification').val(getNotification);
		    var userNotificationsType = $('#notification-type').val(getNotificationType);

		    //Convert String to Array
		    var Assets = row.Assets;
		    var AssignedAssets = new Array();
		    AssignedAssets = Assets.split(",");
		    for (a in AssignedAssets) {
		        AssignedAssets[a] = parseInt(AssignedAssets[a], 10);
		    }


		    if (isNaN(AssignedAssets) == true)
		    {
		        $('#getAssets').empty();
		        $.getJSON("http://172.16.10.110/sbswebapi/api/assetinfo", function (data) {
		            $.each(data, function (index, item) {

		                $('#getAssets').append(
                                 $('<option selected="selected"></option>').val(item.AssetID).html(item.Name)
                             );
		            });
		            $(".selectpicker").selectpicker('refresh');
		        });

		    }
		    else if (isNaN(AssignedAssets) == false)
		    {
		        var userAssets = $('#getAssets').val(AssignedAssets);
		    }
		    
		    //Convert String to Array
		    var Reports = row.Reports;
		    var AssignedReports = new Array();
		    AssignedReports = Reports.split(",");
		    for (a in AssignedReports) {
		        AssignedReports[a] = parseInt(AssignedReports[a], 10);
		    }

		    var userReports = $('#getReport').val(AssignedReports);

		    $("#password").change(function () {
		        delete hashPassword;
		        var getPassword = $('#password').val();
		        var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
		        var hashPassword = hash;
		    });


		    $('.selectpicker').selectpicker('refresh');
		},

		onUncheck: function (row) {
		    clearUserForms();
		    $("#addform").show();
		    $("#editform").hide();
		    $("#users-confirm-deleteEN").hide();
		    $("#userImage").hide();
		    $("#buttonNew").text(function () {
		        var add = ' Add';
		        return add;
		    });
		    //window.location.reload(true);
		},

		onLoadSuccess: function (row) {

		}



	});


    


	
});

//Delete Row
var $table = $('#users-editable'), $remove = $('#users-confirm-delete'), $removeEN = $('#users-confirm-deleteEN');

$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);
});



// format for Vehicle Column.
// =================================================================
function userFormatter(value, row) {
	return '<a href="#" class="btn-link" > Vehicle #' + value + '</a>';
}




// Format for User Name Column.
// =================================================================
function nameFormatter(value, row) {
    var labelColor;
    var text;

    if (row.ImageFill == "Uniform") {
        text = value;

        var userEmail;
        if (row.Email == '') {
            userEmail = "No Email";
        } else {
            userEmail = row.Email;
        }

        var userPhone;
        if (row.Phone == '') {
            userPhone = "No Phone";
        } else {
            userPhone = row.Phone;
        }


        return '<center><div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.Name + '" data-footer="' + "<strong>Email: </strong>" + userEmail + "\n" + "<strong>Phone: </strong>" + userPhone + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div></center>';

    } else if (row.ImageFill != "Uniform") {
        labelColor = "danger";
        text = "No User Photo";
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }

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
	if (value == "Active") {
		labelColor = "success";
	}else if(value == "Locked"){
		labelColor = "dark";
	}
	var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
	return '<div class="label label-table label-'+ labelColor+'"> ' + value + '</div>';
}



// Format for Tracking Number Column.
// =================================================================
function trackFormatter(value, row) {
	if (value) return '<i class="fa fa-truck"></i> ' + value;
}

$.getJSON("http://172.16.10.110/sbswebapi/api/companyinfo", function (data) {
    $.each(data, function (index, item) {
        if (item.CompanyID == 1)
            $('#userCompany').append(
                 $('<option></option>').val(item.CompanyID).html(item.Name)
             );
    });
    $(".selectpicker").selectpicker('refresh');
});


$.getJSON("http://172.16.10.110/sbswebapi/api/roleinfo?RoleID=" + getSessionstorageValueRoleID, function (data) {
    $.each(data, function (index, item) {
      
        $('#getRoles').append($('<option></option>').val(item.RoleID).html(item.RoleDesc));

    });
    $(".selectpicker").selectpicker('refresh');
});

$.getJSON("http://172.16.10.110/sbswebapi/api/assetinfo", function (data) {
    $.each(data, function (index, item) {

        $('#getAssets').append(
                 $('<option selected="selected"></option>').val(item.AssetID).html(item.Name)
             );
    });
    $(".selectpicker").selectpicker('refresh');
});

$.getJSON("http://172.16.10.110/sbswebapi/api/languageinfo", function (data) {
    $.each(data, function (index, item) {

        if (item.LanguageID == 1)
        $('#getLanguage').append(
                 $('<option selected="selected"></option>').val(item.LanguageID).html(item.Name)
             );
    });

    $(".selectpicker").selectpicker('refresh');
});

$.getJSON("http://172.16.10.110/sbswebapi/api/statusinfo", function (data) {
    $.each(data, function (index, item) {

        $('#getNotification').append($('<option selected="selected"></option>').val(item.StatusID).html(item.StatusDesc));
    });
    $(".selectpicker").selectpicker('refresh');
});

$.getJSON("http://172.16.10.110/sbswebapi/api/reportinfo", function (data) {
    $.each(data, function (index, item) {

        if (item.ReportID > 4)
        $('#getReport').append(
                     $('<option></option>').val(item.ReportID).html(item.Name)
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


function clearUserForms() {
    $('#TableFormNew').modal('hide');

    $('#userID').val('');
    $('#fname').val('');
    $('#username').val('');
    $('#password').val('');
    $('#pwordagain').val('');
    $('#email').val('');
    $('#phone').val('');
    $('#userImage').val('');

    $('#users-editable').bootstrapTable('refresh');
}

window.onresize = function (event) {
    setTimeout(function () {
        $('#users-editable').bootstrapTable('resetView');
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
                $('#users-editable').bootstrapTable('resetView', { height: 365 });
            } else {
                // not Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 400 });
            }

        }, 500);
    }
    else if (screen.height == 720) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 250 });
            } else {
                // not Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 285 });
            }

        }, 500);
    }
    else if (screen.height == 786) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 338 });
            } else {
                // not Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 353 });
            }

        }, 500);
    }
    else if (screen.height == 800) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 365 });
            } else {
                // not Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 410 });
            }

        }, 500);
    }
    else if (screen.height == 864) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 435 });
            } else {
                // not Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 425 });
            }

        }, 500);
    }
    else if (screen.height == 900) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 495 });
            } else {
                // not Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 505 });
            }

        }, 500);
    }
    else if (screen.height == 960) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 525 });
            } else {
                // not Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 570 });
            }

        }, 500);
    }
    else if (screen.height == 1024) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 590 });
            } else {
                // not Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 750 });
            }

        }, 500);
    }
    else if (screen.height == 1080) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 646 });
            } else {
                // not Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 636 });
            }

        }, 500);
    }
    else if (screen.height == 1050) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 615 });
            } else {
                // not Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 605 });
            }

        }, 500);
    }
    else if (screen.height == 1200) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 760 });
            } else {
                // not Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 755 });
            }

        }, 500);
    }
    else if (screen.height == 1344) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 900 });
            } else {
                // not Google chrome 
                $('#users-editable').bootstrapTable('resetView', { height: 895 });
            }

        }, 500);
    }
    else {
        setTimeout(function () {
            $('#users-editable').bootstrapTable('resetView', { height: 400 });
        }, 500);
    }
}