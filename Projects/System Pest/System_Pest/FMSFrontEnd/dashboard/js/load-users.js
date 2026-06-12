var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

var titleFullName, titleUserName, titlePhoneNumber, titleEmailAddress, titleUserRole, titleCompany, titleReseller, titleStatus, titleUserProfile;

if (getSessionstorageValueLanguage == "en") {
    titleFullName = "Full Name";
    titleUserName = "User Name";
    titlePhoneNumber = "Phone Number";
    titleEmailAddress = "Email Address";
    titleUserRole = "User Role";
    titleCompany = "Company";
    titleReseller = "Reseller";
    titleStatus = "Status";
    titleUserProfile = "User Profile";
} else if (getSessionstorageValueLanguage == "th") {
    titleFullName = "ใส่ ชื่อเต็ม";
    titleUserName = "ชื่อผู้ใช้";
    titlePhoneNumber = "ป้อนหมายเลขโทรศัพท์";
    titleEmailAddress = "ใส่ ที่อยู่อีเมล";
    titleUserRole = "บทบาทของผู้ใช้";
    titleCompany = "บริษัท";
    titleReseller = "ผู้ค้าปลีก";
    titleStatus = "สถานะ";
    titleUserProfile = "โปรไฟล์ของผู้ใช้";
} else if (getSessionstorageValueLanguage == "vn") {
    titleFullName = "Họ Tên";
    titleUserName = "Tên Người Dùng";
    titlePhoneNumber = "Số ĐT";
    titleEmailAddress = "Email";
    titleUserRole = "Vai Trò Người Dùng";
    titleCompany = "Công Ty";
    titleReseller = "Dại Lý Bán Lẻ";
    titleStatus = "Trạng Thái";
    titleUserProfile = "Tiểu Sử Người Dùng";
} else if (getSessionstorageValueLanguage == "id") {
    titleFullName = "Nama Penuh";
    titleUserName = "Nama Pengguna";
    titlePhoneNumber = "Nomor Telepon";
    titleEmailAddress = "Alamat Email";
    titleUserRole = "Peran Pengguna";
    titleCompany = "Perusahaan";
    titleReseller = "Pengecer";
    titleStatus = "Status";
    titleUserProfile = "Profil Pengguna";
}

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

//Onload Notifications
$.getJSON("http://117.120.7.119/spwebapi/api/statusinfo", function (data) {
    $.each(data, function (index, item) {

        if (item.StatusID != 4 || item.StatusID != 20 || item.StatusID != 21)
        {

            if (getSessionstorageValueLanguage == "en") {
                $('#userNotifications').append($('<option></option>').val(item.StatusID).html(item.StatusDesc));
            }
            else if (getSessionstorageValueLanguage == "th")
            {
                switch (item.StatusDesc) {
                    case "User Logout":
                        text = "ผู้ใช้ออกจากระบบ";
                        break;
                    case "User Login":
                        text = "เข้าสู่ระบบผู้ใช้";
                        break;
                    case "Zone Enter":
                        text = "ป้อนโซน";
                        break;
                    case "Zone Exit":
                        text = "โซนออก";
                        break;
                }

                $('#userNotifications').append($('<option></option>').val(item.StatusID).html(text));
            }
            else if (getSessionstorageValueLanguage == "vn") {
                switch (item.StatusDesc) {
                    case "User Logout":
                        text = "Đăng Xuất Người Dùng";
                        break;
                    case "User Login":
                        text = "Đăng Nhập Người Dùng";
                        break;
                    case "Zone Enter":
                        text = "Vùng Đi Vào";
                        break;
                    case "Zone Exit":
                        text = "Vùng Lối Ra";
                        break;
                }

                $('#userNotifications').append($('<option></option>').val(item.StatusID).html(text));
            }
            else if (getSessionstorageValueLanguage == "id") {
                switch (item.StatusDesc) {
                    case "User Logout":
                        text = "Pengguna Log Out";
                        break;
                    case "User Login":
                        text = "Pengguna Log In";
                        break;
                    case "Zone Enter":
                        text = "Masuk Zona";
                        break;
                    case "Zone Exit":
                        text = "Keluar Zona";
                        break;
                }

                $('#userNotifications').append($('<option></option>').val(item.StatusID).html(text));
            }

            $('#mobile-userNotifications').append($('<option></option>').val(item.StatusID).html(item.StatusDesc));
        }
    });
    $(".selectpicker").selectpicker('refresh');
});


//OnLoad User Role
$.getJSON("http://117.120.7.119/spwebapi/api/roleinfo?RoleID=" + getSessionstorageValueRoleID, function (data) {
    $.each(data, function (index, item) {
        if (item.RoleID == 1 || item.RoleID == 3 || item.RoleID == 5)


            if (getSessionstorageValueLanguage == "en") {
                $('#userRoleDesc').append($('<option data-icon="fa fa-user fa-lg"></option>').val(item.RoleID).html(item.RoleDesc));
            }
            else if (getSessionstorageValueLanguage == "th") {

                switch (item.RoleDesc) {
                    case "Super User":
                        text = "ผู้ใช้";
                        break;

                    case "Master User":
                        text = "ผู้ใช้หลัก";
                        break;

                    case "Administrator":
                        text = "ผู้บริหาร";
                        break;
                }
                $('#userRoleDesc').append($('<option data-icon="fa fa-user fa-lg"></option>').val(item.RoleID).html(text));


            }
            else if (getSessionstorageValueLanguage == "vn") {

                switch (item.RoleDesc) {
                    case "Super User":
                        text = "Đăng Xuất Người Dùng";
                        break;

                    case "Master User":
                        text = "Người Dùng Cấp Cao";
                        break;

                    case "Administrator":
                        text = "Người Quản Trị";
                        break;
                }
                $('#userRoleDesc').append($('<option data-icon="fa fa-user fa-lg"></option>').val(item.RoleID).html(text));

            }
            else if (getSessionstorageValueLanguage == "id") {

                switch (item.RoleDesc) {
                    case "Super User":
                        text = "Super Pengguna";
                        break;

                    case "Master User":
                        text = "Master Pengguna";
                        break;

                    case "Administrator":
                        text = "Administrator";
                        break;
                }
                $('#userRoleDesc').append($('<option data-icon="fa fa-user fa-lg"></option>').val(item.RoleID).html(text));
            }


        $('#mobile-userRoleDesc').append($('<option data-icon="fa fa-user fa-lg"></option>').val(item.RoleID).html(item.RoleDesc));
    });
    $(".selectpicker").selectpicker('refresh');
});

//On Load Reseller
var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {


        $.each(data, function (index, item) {
            if (item.ResellerID == 1) {
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#userReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#mobile-load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
            } else {
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#userReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#mobile-load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            }
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#userReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#mobile-load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#modal-load-reseller').remove();
    $('#formsReseller').remove();
    $('#userFormReseller').remove(); 
}

//On Load assets
var WebAPIAsset = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIAsset = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '&ResellerID=' + '1' + '&CompanyID=' + '1';

    $.getJSON(WebAPIAsset, function (data) {

        $.each(data, function (index, item) {
            $('#userAssets').append($('<option></option>').val(item.AssetID).html(item.Name));
            $('#mobile-userAssets').append($('<option></option>').val(item.AssetID).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    WebAPIAsset = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '' + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    $.getJSON(WebAPIAsset, function (data) {
        $.each(data, function (index, item) {
            $('#userAssets').append($('<option></option>').val(item.AssetID).html(item.Name));
            $('#mobile-userAssets').append($('<option></option>').val(item.AssetID).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 3) {

    WebAPIAsset = 'http://117.120.7.119/spwebapi/api/assetinfo?UserID=' + '' + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    $.getJSON(WebAPIAsset, function (data) {
        $.each(data, function (index, item) {
            $('#userAssets').append($('<option></option>').val(item.AssetID).html(item.Name));
            $('#mobile-userAssets').append($('<option></option>').val(item.AssetID).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });
}


var selectedReseller = "";

/*** Function to filter reseller and companies*/
$(function () {

    $('.select-reseller-filter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();

        $('#load-company').empty();
        $("#load-company").selectpicker('refresh');

        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#load-company').append($('<option></option>').val(0).html("-----"));

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
        $('.activateUser').hide();
        selectedReseller = getSessionstorageValueUserResellerID;

    }
    else if (getSessionstorageValueRoleID >= 3) {

        $(".reseller-filter").hide();
        $('#submit-filter').hide();
        $('.activateUser').hide();     
        selectedReseller = getSessionstorageValueUserResellerID;

    }

    $(".select-company-filter").change(function () {
        selectedCompany = $(this).find("option:selected").val();


    });


    $("#submit-filter").click(function () {

        $('#users-editable').bootstrapTable('destroy');

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

        var WebAPI = 'http://117.120.7.119/spwebapi/api/userinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany + '&RoleID=' + getSessionstorageValueRoleID;


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
                field: 'RoleDesc',
                title: 'User Role'
            }, {
                field: 'Phone',
                title: 'Phone Number'
            }, {
                field: 'Email',
                title: 'Email Address'
            }, {
                field: 'Company',
                title: 'Company',
                class: 'userCompanyColumn'
            }, {
                field: 'ResellerDesc',
                title: 'Reseller',
                class: 'userResellerColumn'
            }, {
                field: 'LoginRetry',
                title: 'Status',
                formatter: 'statusFormatter'
            }],


            onCheck: function (row) {

                $("#toggle-aside").hide();
                $("#toggle-aside2").show();
                //$("#edit-toggle-button").show();
                //$("#add-toggle-button").hide();

                var userID = $('#userID').val(row.UserID);
                var userReseller = $('#userReseller').val(row.ResellerID);

                //var userCompany = $('#userCompany').val(row.Company);
                var userCompany = $('#userCompany').val(row.CompanyID);
                var userRoleDesc = $('#userRoleDesc').val(row.RoleID);
                var userFullName = $('#userFullName').val(row.Name);
                var userFullNameEN = $('#userFullNameEN').val(row.Name);
                var UserName = $('#UserName').val(row.User);
                var UserNameEN = $('#UserNameEN').val(row.User);
                var userPassword = $('#userPassword').val(row.Password);
                var userPasswordEN = $('#userPasswordEN').val(row.Password);
                var confirmPassword = $('#confirmPassword').val(row.Password);
                var confirmPasswordEN = $('#confirmPasswordEN').val(row.Password);
                var userEmail = $('#userEmail').val(row.Email);
                var userEmailEN = $('#userEmailEN').val(row.Email);
                var userPhone = $('#userPhone').val(row.Phone);
                var userPhoneEN = $('#userPhoneEN').val(row.Phone);
                var userImage = $('#userImage').val(row.Image);
                var userLanguage = $('#load-language').val(row.Language);


                //Convert String to Array
                var Notifications = row.Notifications;
                var AssignedNotifications = new Array();
                AssignedNotifications = Notifications.split(",");
                var getNotification = new Array();
                var getNotificationType = new Array();


                var Email = AssignedNotifications[0].substring(3, 4) + "E";
                var SMS = AssignedNotifications[0].substring(4, 5) + "S";
                var UI = AssignedNotifications[0].substring(5, 6) + "U";
                getNotificationType.push(Email, SMS, UI);


                for (var n = 0; n < AssignedNotifications.length; n++) {

                    var arrNotification = AssignedNotifications[n].substring(0, 2);

                    getNotification.push(arrNotification);


                }

                var userNotifications = $('#userNotifications').val(getNotification);
                var userNotificationsType = $('#userNotificationsType').val(getNotificationType);


                //Convert String to Array
                var Assets = row.Assets;
                var AssignedAssets = new Array();
                AssignedAssets = Assets.split(",");
                for (a in AssignedAssets) {
                    AssignedAssets[a] = parseInt(AssignedAssets[a], 10);
                }

                var userAssets = $('#userAssets').val(AssignedAssets);



                var arrAssets = [];

                if (getSessionstorageValueRoleID == 1) {

                    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo", function (data) {

                        for (var i = 0; i < data.length; i++) {

                            var asset = data[i];
                            var assignedAsset = asset.Name;
                            var currAsset = JSON.stringify(asset.Name);

                            arrAssets.push(currAsset);
                        }

                        var ObjAssets = JSON.stringify(arrAssets);
                        var parseObjAssets = ObjAssets.replace(/\[|\"|\\|\]/g, "");
                        var SplitObjAssets = parseObjAssets.split(",");


                        $('#userAssignAssets').val(parseObjAssets);

                    });

                }
                else if (getSessionstorageValueRoleID == 2) {

                    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                        for (var i = 0; i < data.length; i++) {

                            var asset = data[i];
                            var assignedAsset = asset.Name;
                            var currAsset = JSON.stringify(asset.Name);

                            arrAssets.push(currAsset);
                        }

                        var ObjAssets = JSON.stringify(arrAssets);
                        var parseObjAssets = ObjAssets.replace(/\[|\"|\\|\]/g, "");
                        var SplitObjAssets = parseObjAssets.split(",");


                        $('#userAssignAssets').val(parseObjAssets);

                    });
                }
                else if (getSessionstorageValueRoleID >= 3) {

                    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + "&ResellerID=" + getSessionstorageValueUserResellerID + "&CompanyID=" + getSessionstorageValueCompanyID, function (data) {

                        for (var i = 0; i < data.length; i++) {

                            var asset = data[i];
                            var assignedAsset = asset.Name;
                            var currAsset = JSON.stringify(asset.Name);

                            arrAssets.push(currAsset);
                        }

                        var ObjAssets = JSON.stringify(arrAssets);
                        var parseObjAssets = ObjAssets.replace(/\[|\"|\\|\]/g, "");
                        var SplitObjAssets = parseObjAssets.split(",");


                        $('#userAssignAssets').val(parseObjAssets);

                    });

                }

                $("#userPasswordEN").change(function () {
                    delete hashPassword;
                    var getPassword = $('#userPasswordEN').val();
                    var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
                    var hashPassword = hash;
                });


                $('.selectpicker').selectpicker('refresh');
            },

            onUncheck: function (row) {
                $("#toggle-aside").hide();
                $("toggle-aside2").hide();
                //$("#add-toggle-button").show();
                //$("#edit-toggle-button").hide();
                window.location.reload(true);
            },

            onLoadSuccess: function (row) {
                $("#toggle-aside2").hide();
                //$("#edit-toggle-button").hide();
                //$result.text('Event: onLoadSuccess, data: ' + data);

            }

            //onLoadError: function () {

            //    alert('Event: onLoadError, data: ' + alert('error'));
            //}

        });



    });


});


$(document).ready(function() {

    var WebAPI = "";

    if (getSessionstorageValueRoleID == 1) {

        WebAPI = 'http://117.120.7.119/spwebapi/api/userinfo?ResellerID=' + '1' + '&CompanyID=' + '1' + '&RoleID=' + getSessionstorageValueRoleID;

    } else if (getSessionstorageValueRoleID == 2) {
        WebAPI = 'http://117.120.7.119/spwebapi/api/userinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&RoleID=' + getSessionstorageValueRoleID;

    } else if (getSessionstorageValueRoleID >= 3) {

        WebAPI = 'http://117.120.7.119/spwebapi/api/userinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID + '&RoleID=' + getSessionstorageValueRoleID;
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
		    title: titleFullName
		}, {
			field: 'User',
			title: titleUserName
		},  {
			field: 'Phone',
			title: titlePhoneNumber
		}, {
		    field: 'Email',
		    title: titleEmailAddress
		}, {
		    field: 'RoleDesc',
		    title: titleUserRole
		}, {
		    field: 'Company',
		    title: titleCompany,
            class: 'userCompanyColumn'
		}, {
		    field: 'ResellerDesc',
		    title: titleReseller,
		    class: 'userResellerColumn'
		}, {
		    field: 'LoginRetry',
		    title: titleStatus,
		    formatter: 'statusFormatter'
		}, {
		    field: 'Image',
		    title: titleUserProfile,
		    formatter: 'nameFormatter'
		}],

		
		onCheck: function (row) {

		    $("#userImage").show();
		    $("#toggle-aside").hide();
		    $("#toggle-aside2").show();
		    //$("#edit-toggle-button").show();
		    //$("#add-toggle-button").hide();
		    if (row.ImageFill == "Uniform") {
		       // document["showImage"].src = row.Image;
		        $("#showImage").attr("src", row.Image);
		    }

		    var userID = $('#userID').val(row.UserID);
		    //var userCompany = $('#userCompany').val(row.Company);
		    var userCompany = $('#userCompany').val(row.CompanyID);
		    var userReseller = $('#userReseller').val(row.ResellerID);
		    var userRoleDesc = $('#userRoleDesc').val(row.RoleID);
		    //var userRoleDescAdmin = $('#userRoleDescReseller').val(row.RoleID);
		    //var userRoleDescAdmin = $('#userRoleDescMaster').val(row.RoleID);
		    //var userRoleDescAdmin = $('#userRoleDescAdmin').val(row.RoleID);
		    var userFullName = $('#userFullName').val(row.Name);
		    var userFullNameEN = $('#userFullNameEN').val(row.Name);
		    var UserName = $('#UserName').val(row.User);
		    var UserNameEN = $('#UserNameEN').val(row.User);
		    var userPassword = $('#userPassword').val(row.Password);
		    var userPasswordEN = $('#userPasswordEN').val(row.Password);
		    var confirmPassword = $('#confirmPassword').val(row.Password);
		    var confirmPasswordEN = $('#confirmPasswordEN').val(row.Password);
		    var userEmail = $('#userEmail').val(row.Email);
		    var userEmailEN = $('#userEmailEN').val(row.Email);
		    var userPhone = $('#userPhone').val(row.Phone);
		    var userPhoneEN = $('#userPhoneEN').val(row.Phone);
		    var userImage = $('#userImage').val(row.Image);

		    var userLanguage = $('#load-language').val(row.Language);

		    //Convert String to Array
		    var Notifications = row.Notifications;
		    var AssignedNotifications = new Array();
		    AssignedNotifications = Notifications.split(",");
		    var getNotification = new Array();
		    var getNotificationType = new Array();


		    var Email = AssignedNotifications[0].substring(3, 4) + "E";
		    var SMS = AssignedNotifications[0].substring(4, 5) + "S";
		    var UI = AssignedNotifications[0].substring(5, 6) + "U";
		    getNotificationType.push(Email, SMS, UI);


		    for (var n = 0; n < AssignedNotifications.length; n++) {

		        var arrNotification = AssignedNotifications[n].substring(0, 2);

		        getNotification.push(arrNotification);


		    }

		    var userNotifications = $('#userNotifications').val(getNotification);
		    var userNotificationsType = $('#userNotificationsType').val(getNotificationType);

   
		    //Convert String to Array
		    var Assets = row.Assets;           
		    var AssignedAssets = new Array();
		    AssignedAssets = Assets.split(",");
		    for (a in AssignedAssets) {
		        AssignedAssets[a] = parseInt(AssignedAssets[a], 10);
		    }

		    var userAssets = $('#userAssets').val(AssignedAssets);



		    var arrAssets = [];

		    if (getSessionstorageValueRoleID == 1) {

		        $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo", function (data) {

		            for (var i = 0; i < data.length; i++) {

		                var asset = data[i];
		                var assignedAsset = asset.Name;
		                var currAsset = JSON.stringify(asset.Name);

		                arrAssets.push(currAsset);
		            }

		            var ObjAssets = JSON.stringify(arrAssets);
		            var parseObjAssets = ObjAssets.replace(/\[|\"|\\|\]/g, "");
		            var SplitObjAssets = parseObjAssets.split(",");


		            $('#userAssignAssets').val(parseObjAssets);

		        });

		    }
		    else if (getSessionstorageValueRoleID == 2) {

		        $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

		            for (var i = 0; i < data.length; i++) {

		                var asset = data[i];
		                var assignedAsset = asset.Name;
		                var currAsset = JSON.stringify(asset.Name);

		                arrAssets.push(currAsset);
		            }

		            var ObjAssets = JSON.stringify(arrAssets);
		            var parseObjAssets = ObjAssets.replace(/\[|\"|\\|\]/g, "");
		            var SplitObjAssets = parseObjAssets.split(",");


		            $('#userAssignAssets').val(parseObjAssets);

		        });
		    }
		    else if (getSessionstorageValueRoleID >= 3) {

		      $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + "&ResellerID=" + getSessionstorageValueUserResellerID + "&CompanyID=" + getSessionstorageValueCompanyID, function (data) {

		            for (var i = 0; i < data.length; i++) {

		                var asset = data[i];
		                var assignedAsset = asset.Name;
		                var currAsset = JSON.stringify(asset.Name);

		                arrAssets.push(currAsset);
		            }

		            var ObjAssets = JSON.stringify(arrAssets);
		            var parseObjAssets = ObjAssets.replace(/\[|\"|\\|\]/g, "");
		            var SplitObjAssets = parseObjAssets.split(",");


		            $('#userAssignAssets').val(parseObjAssets);

		        });

		    }

		    $("#userPasswordEN").change(function () {
		        delete hashPassword;
		        var getPassword = $('#userPasswordEN').val();
		        var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
		        var hashPassword = hash;
		    });
 

		    $('.selectpicker').selectpicker('refresh');
		},

		onUncheck: function (row) {
		    $("#toggle-aside").hide();
		    $("toggle-aside2").hide();
		    //$("#add-toggle-button").show();
		    //$("#edit-toggle-button").hide();
		    window.location.reload(true);
		},

		onLoadSuccess: function (row) {
		    $("#toggle-aside2").hide();
		    $("#userImage").hide();
		    //$("#edit-toggle-button").hide();
		    //$result.text('Event: onLoadSuccess, data: ' + data);
		}

		//onLoadError: function () {

		//    alert('Event: onLoadError, data: ' + alert('error'));
		//}

	});


    


	
});

//Delete Row
var $table = $('#users-editable'), $remove = $('#users-confirm-delete'), $removeEN = $('#users-confirm-deleteEN');

$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);
});




//Total Users
var url = 'http://117.120.7.119/spwebapi/api/userinfo';

$.getJSON(url, function (users) {


    var $result = $('#total-users');
    $result.text(users.length)

});


// FORMAT COLUMN
// Use "data-formatter" on HTML to format the display of bootstrap table column.
// =================================================================


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
        labelColor = "dark";
        if (getSessionstorageValueLanguage == "en") {
            text = "No User Photo";
        }
        else if (getSessionstorageValueLanguage == "th") {
            text = "ไม่มีรูปภาพของผู้ใช้";
        } else if (getSessionstorageValueLanguage == "vn") {
            text = "Không Có Tài Ảnh";
        } else if (getSessionstorageValueLanguage == "id") {
            text = "Tidak Ada Foto Pengguna";
        }

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

	if (getSessionstorageValueLanguage == "en") {
	    return '<div class="label label-table label-' + labelColor + '"> ' + value + '</div>';
	}
	else if (getSessionstorageValueLanguage == "th") {
	    switch (value) {
	        case "Active":
	            text = "คล่องแคล่ว";
	            break;

	        case "Locked":
	            text = "ถูกล็อก";
	            break;
	    }

	    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';

	}
	else if (getSessionstorageValueLanguage == "vn")
	{
	    switch (value) {
	        case "Active":
	            text = "Hoạt động";
	            break;

	        case "Locked":
	            text = "Đã khóa";
	            break;
	    }

	    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
	}
	else if (getSessionstorageValueLanguage == "id")
	{
	    switch (value) {
	        case "Active":
	            text = "Aktif";
	            break;

	        case "Locked":
	            text = "Terkunci";
	            break;
	    }

	    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
	}

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


//populate the Drop Down List
$.getJSON("http://117.120.7.119/spwebapi/api/languageinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-language').append(
             $('<option></option>').val(item.Name).html(item.Name)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});




//OnChange Session Storage
$(document).ready(function () {

    $('#load-company').change(function () {
        setTimeout(function () {
            $('#users-editable').bootstrapTable('resetView');

        }, 500);

    });


});


//<!--Filter-Company-->
//(function (document) {
//    'use strict';

//    var CompanyTableFilter = (function (Arr) {


//        var _select;


//        function _onSelectEvent(e) {
//            _select = e.target;
//            var tables = document.getElementsByClassName(_select.getAttribute('data-table'));
//            Arr.forEach.call(tables, function (table) {
//                Arr.forEach.call(table.tBodies, function (tbody) {
//                    Arr.forEach.call(tbody.rows, _filterSelect);
//                });
//            });
//        }

//        function _filter(row) {

//            var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
//            row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';

//        }

//        function _filterSelect(row) {

//            var text_select = row.textContent.toLowerCase(), val_select = _select.options[_select.selectedIndex].value.toLowerCase();
//            row.style.display = text_select.indexOf(val_select) === -1 ? 'none' : 'table-row';

//        }


//        return {
//            init: function () {
//                var selects = document.getElementsByClassName('select-company-filter');
//                Arr.forEach.call(selects, function (select) {
//                    select.onchange = _onSelectEvent;


//                });
//            }
//        };
//    })(Array.prototype);

//    document.addEventListener('readystatechange', function () {
//        if (document.readyState === 'complete') {
//            CompanyTableFilter.init();

//        }
//    });

//})(document);




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


var changeCheckbox = document.querySelector('.userStatus');

changeCheckbox.onchange = function () {

    var val;

    if (changeCheckbox.checked == true) {
        val = 10;
    }

    else if (changeCheckbox.checked == false) {
        val = 0;
    }

    return val;

};




//Table Header Filter
if (getSessionstorageValueRoleID == 1)
{

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + "1", function (data) {


        $.each(data, function (index, item) {


            if (item.CompanyID == 1)
            {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#userCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));

            }
            else
            {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#userCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            }

        });


        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2)
{

    var select = document.getElementById('userCompany');

    for (i = 0; i < select.length; i++) {
        if (select.options[i].value == '0') {
            select.remove(i);
        }
    }


    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {
        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID) {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#userCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
            }
            else
            {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#userCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            }

        });

        $(".selectpicker").selectpicker('refresh');

    });
}
else if (getSessionstorageValueRoleID >= 3){

    var select = document.getElementById('userCompany');

    for (i = 0; i < select.length; i++) {
        if (select.options[i].value == '0') {
            select.remove(i);
        }
    }

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            $('#userCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));

        });

        $(".selectpicker").selectpicker('refresh');

    });

}



/*** Function to filter reseller and companies*/
$(function () {

    var selectedReseller = "";
    var selectedCompany = "";

    $('.select-reseller-filter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();

        var userReseller = $('#userReseller').val(selectedReseller);

        $("#userReseller").selectpicker('refresh');

        $('#userCompany').empty();

        $("#userCompany").selectpicker('refresh');

        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            if (getSessionstorageValueRoleID == 1)
            {
            $('#userCompany').append($('<option selected="selected"></option>').val(0).html("-----"));
            }

            $.each(data, function (index, item) {

                $('#userCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $(".select-company-filter").selectpicker('refresh');
        });

    });


    $('.select-company-filter').on('change', function () {
        selectedCompany = $(this).find("option:selected").val();

        $('#userAssets').empty();

        $("#userAssets").selectpicker('refresh');

        var userReseller;
        if (selectedReseller == '' || selectedReseller == null) {
            userReseller = $("#userReseller").val();
        } else {
            userReseller = selectedReseller;
        }

        $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + "&ResellerID=" + userReseller + "&CompanyID=" + selectedCompany, function (data) {

            $.each(data, function (index, item) {
                $('#userAssets').append(
                     $('<option></option>').val(item.AssetID).html(item.Name)
                 );
            });

            $("#userAssets").selectpicker('refresh');
        });

    });
});


$(function () {

    $('.tgl-menu-btn').click(function () {

        setTimeout(function () {
            $('#users-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.add-user').click(function () {

        setTimeout(function () {
            $('#users-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.add-userEN').click(function () {

        setTimeout(function () {
            $('#users-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.edit-user').click(function () {

        setTimeout(function () {
            $('#users-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.edit-userEN').click(function () {

        setTimeout(function () {
            $('#users-editable').bootstrapTable('resetView');

        }, 500);


    });


});


window.onresize = function (event) {
    setTimeout(function () {
        $('#users-editable').bootstrapTable('resetView');

    }, 500);
};


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
//Onload
document.getElementById("userStatus").checked = true;

//Translation of Forms
if (getSessionstorageValueLanguage == "en") {
    $("#enableDisable").text("Enable/Disable");
    $('#userFullNameEN').attr('placeholder', 'Full Name');
    $("#userFullName").text("Full Name");
    $('#UserNameEN').attr('placeholder', 'Username');
    $("#userName").text("Log In Name");
    $('#userPasswordEN').attr('placeholder', 'Password');
    $("#userPassword").text("Password");
    $('#confirmPasswordEN').attr('placeholder', 'Confirm Password');
    $("#confirmPassword").text("Re-enter Password");
    $("#previous").text("Previous");
    $("#next").text("Next");
    $("#submit-userEN").text("Submit");
    $('#userEmailEN').attr('placeholder', 'Email Address');
    $("#userEmail").text("Email Address");
    $('#userPhoneEN').attr('placeholder', 'Phone Number');
    $("#phoneNumber").text("Phone Number");
    $("#resellerName").text("Reseller");
    $("#companyName").text("Company");
    $("#assignPhone").text("Assign Phone");
    $("#userRole").text("User Role");
    $("#notification").text("Notifications");
    $("#type").text("Type");
    $("#clickLogoutEN").text("OK");
    $("#users-confirm-deleteEN").text("Delete");
    $("#UsersExportWordEN").text("Word");
    $("#UsersExportPDFEN").text("PDF");
    $("#UsersExportExcelEN").text("Excel");

}
else if (getSessionstorageValueLanguage == "th") {
    $("#enableDisable").text("ทำให้สามารถ/ปิดการใช้งาน");
    $('#userFullNameEN').attr('placeholder', 'ใส่ ชื่อเต็ม');
    $("#userFullName").text("ชื่อเต็ม");
    $('#UserNameEN').attr('placeholder', 'ชื่อผู้ใช้');
    $("#userName").text("เข้าสู่ระบบชื่อ");
    $('#userPasswordEN').attr('placeholder', 'รหัสผ่าน');
    $("#userPassword").text("รหัสผ่าน");
    $('#confirmPasswordEN').attr('placeholder', 'ป้อน รหัสผ่าน');
    $("#confirmPassword").text("ป้อนรหัสผ่าน");
    $("#previous").text("ก่อน");
    $("#next").text("ถัดไป");
    $("#submit-userEN").text("เสนอ");
    $('#userEmailEN').attr('placeholder', 'ใส่ ที่อยู่อีเมล');
    $("#userEmail").text("ที่อยู่อีเมล์");
    $('#userPhoneEN').attr('placeholder', 'ป้อนหมายเลขโทรศัพท์');
    $("#phoneNumber").text("หมายเลขโทรศัพท์");
    $("#resellerName").text("ผู้ค้าปลีก");
    $("#companyName").text("บริษัท");
    $("#assignPhone").text("กำหนดยานพาหนะ");
    $("#userRole").text("บทบาทของผู้ใช้");
    $("#notification").text("การแจ้งเตือน");
    $("#type").text("ชนิด");
    $("#clickLogoutEN").text("ตกลง");
    $("#users-confirm-deleteEN").text("ลบ");
    $("#UsersExportWordEN").text("ไมโครซอฟท์ คำ");
    $("#UsersExportPDFEN").text("รูปแบบไฟล์ PDF");
    $("#UsersExportExcelEN").text("ไมโครซอฟท์ Excel");
}
else if (getSessionstorageValueLanguage == "vn") {
    $("#enableDisable").text("Cho Phép/Vô Hiệu Hóa");
    $('#userFullNameEN').attr('placeholder', 'Họ Và Tên');
    $("#userFullName").text("Họ Và Tên");
    $('#UserNameEN').attr('placeholder', 'Tên Người Dùng');
    $("#userName").text("Tên Đăng Nhập");
    $('#userPasswordEN').attr('placeholder', 'Mật Khẩu');
    $("#userPassword").text("Mật Khẩu");
    $('#confirmPasswordEN').attr('placeholder', 'Xác Nhận Mật Khẩu');
    $("#confirmPassword").text("Nhập Lại Mật Khẩu");
    $("#previous").text("Lùi");
    $("#next").text("Tới");
    $("#submit-userEN").text("Gửi Đi");
    $('#userEmailEN').attr('placeholder', 'Địa Chỉ Email');
    $("#userEmail").text("Địa Chỉ Email");
    $('#userPhoneEN').attr('placeholder', 'Số Điện Thoại');
    $("#phoneNumber").text("Số Điện Thoại");
    $("#resellerName").text("Dại Lý Bán Lẻ");
    $("#companyName").text("Công Ty");
    $("#assignPhone").text("Gán Điện Thoại");
    $("#userRole").text("Vai Trò Người Sử Dụng");
    $("#notification").text("Thông Báo");
    $("#type").text("Loại");
    $("#clickLogoutEN").text("Đồng Ý");
    $("#users-confirm-deleteEN").text("Xóa");
    $("#UsersExportWordEN").text("Xuất Word");
    $("#UsersExportPDFEN").text("Xuất PDF");
    $("#UsersExportExcelEN").text("Xuất Excel");
}
else if (getSessionstorageValueLanguage == "id") {
    $("#enableDisable").text("Pasangkan/Padamkan");
    $('#userFullNameEN').attr('placeholder', 'Nama Penuh');
    $("#userFullName").text("Nama Penuh");
    $('#UserNameEN').attr('placeholder', 'Nama Pengguna');
    $("#userName").text("Nama Log in");
    $('#userPasswordEN').attr('placeholder', 'Kata Sandi');
    $("#userPassword").text("Kata Sandi");
    $('#confirmPasswordEN').attr('placeholder', 'Konfirmasi Sandi');
    $("#confirmPassword").text("Masukkan Sandi");
    $("#previous").text("Sebelum");
    $("#next").text("Berikut");
    $("#submit-userEN").text("Serah");
    $('#userEmailEN').attr('placeholder', 'Alamat Email');
    $("#userEmail").text("Alamat Email");
    $('#userPhoneEN').attr('placeholder', 'Nomor Telepon');
    $("#phoneNumber").text("Nomor Telepon");
    $("#resellerName").text("Pengecer");
    $("#companyName").text("Perusahaan");
    $("#assignPhone").text("Telepon Digunakan");
    $("#userRole").text("Peran Pengguna");
    $("#notification").text("Pemberitahuan");
    $("#type").text("Jenis");
    $("#clickLogoutEN").text("Baik");
    $("#users-confirm-deleteEN").text("Hapus Rekor");
    $("#UsersExportWordEN").text("Ekspor ke Word");
    $("#UsersExportPDFEN").text("Ekspor ke PDF");
    $("#UsersExportExcelEN").text("Ekspor ke Excel");
}