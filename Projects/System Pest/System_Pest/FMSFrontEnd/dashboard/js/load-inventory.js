
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

var titleCompany, titlePhoneUser, titleEmail, titlePhone, titleAddress, titleBirthday, titleRemarks, titleAssignedPhone, titlePhoneUserProfil, titleNoPhoneAssigned;

if (getSessionstorageValueLanguage == "en") {
    titleCompany = "Company Name";
    titlePhoneUser = "Phone User Name";
    titleEmail = "E-mail";
    titlePhone = "Phone";
    titleAddress = "Address";
    titleBirthday = "Date of Birth";
    titleRemarks = "Remarks";
    titleAssignedPhone = "Assigned Phone";
    titlePhoneUserProfile = "Phone User Profile";
    titleNoPhoneAssigned = "No Phone Assigned";
}
else if (getSessionstorageValueLanguage == "th") {
    titleCompany = "ชื่อ บริษัท";
    titlePhoneUser = "ชื่อผู้ใช้งานโทรศัพท์";
    titleEmail = "อีเมล์";
    titlePhone = "โทรศัพท์";
    titleAddress = "ที่อยู่";
    titleBirthday = "วันเกิด";
    titleRemarks = "หมายเหตุ";
    titleAssignedPhone = "ประเภทยานพาหนะ";
    titlePhoneUserProfile = "รายละเอียด คนขับ";
    titleNoPhoneAssigned = "ไม่มีโทรศัพท์ที่ได้รับมอบหมาย";

} else if (getSessionstorageValueLanguage == "vn") {
    titleCompany = "Tên công ty";
    titlePhoneUser = "Điện Thoại    ";
    titleEmail = "Email";
    titlePhone = "Số ĐT Liên Hệ";
    titleAddress = "Địa Chỉ";
    titleBirthday = "Ngày sinh";
    titleRemarks = "Các chú thích";
    titleAssignedPhone = "Chuyển Nhượng ĐT";
    titlePhoneUserProfile = "Tiểu Sử ĐT Người Dùng";
    titleNoPhoneAssigned = "Không có điện thoại được chỉ định";

} else if (getSessionstorageValueLanguage == "id") {
    titleCompany = "Nama Perusahaan";
    titlePhoneUser = "Nama Pengguna Telepon ";
    titleEmail = "E-mail";
    titlePhone = "Telepon";
    titleAddress = "Alamat";
    titleBirthday = "Tanggal lahir";
    titleRemarks = "Keterangan";
    titleAssignedPhone = "Telepon Diguna";
    titlePhoneUserProfile = "Profil Pengguna Telepon ";
    titleNoPhoneAssigned = "Tidak ada Telepon";

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


//Forms
var WebAPIReseller = "";

//Onload Reseller
if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {

        $.each(data, function (index, item) {

            if (item.ResellerID == "1") {
                $('#driverReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#mobile-driverResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
            } else {

                $('#driverReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#mobile-driverResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            }

        });


        $('#driverReseller').selectpicker('refresh');
        $('#mobile-driverResellerEN').selectpicker('refresh');
        $('#load-reseller').selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#driverReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#mobile-driverResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
            $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
        });

        $('#driverReseller').selectpicker('refresh');
        $('#mobile-driverResellerEN').selectpicker('refresh');
        $('#load-reseller').selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#formsReseller').remove();
}


//OnLoad Company
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + "1", function (data) {

        $.each(data, function (index, item) {

            if (item.CompanyID == 1) {
                $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
            }
            else {
                $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            }



        });


        $('.selectpicker').selectpicker('refresh');
    });

}

else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID)
            {
                $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
            }
            else
            {
                $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            }
        });

        $('.selectpicker').selectpicker('refresh');
    });

}

else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
        });

        $('.selectpicker').selectpicker('refresh');

    });

}



var selectedReseller = "";

//Reseller Forms
/*** Function to filter reseller and companies*/
$(function () {

    $('.SelectResellerFilter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();


        $('#mobile-driverResellerEN').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        $('#load-reseller').empty();
        $('.select-reseller-filter').selectpicker('refresh');


        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#mobile-driverResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#mobile-driverResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#driverReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-driverResellerEN').selectpicker('refresh');
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-driverResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#driverReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-driverResellerEN').selectpicker('refresh');
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#mobile-driverResellerEN').remove();
            $('#load-reseller').remove();
        }

        $('#driverCompany').empty();
        $(".SelectCompanyFilter").selectpicker('refresh');

        $('#mobile-driverCompanyEN').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#load-company').empty();
        $(".select-company-filter").selectpicker('refresh');


        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#mobile-driverCompanyEN').append($('<option></option>').val(0).html("-------"));
            $('#driverCompany').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));

            $.each(data, function (index, item) {

                $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $(".MobileSelectCompanyFilter").selectpicker('refresh');
            $(".SelectCompanyFilter").selectpicker('refresh');
            $(".select-company-filter").selectpicker('refresh');
        });

    });

});

//Reseller Filter
/*** Function to filter reseller and companies*/
$(function () {

    $('.select-reseller-filter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();

        $('#mobile-driverResellerEN').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        $('#driverReseller').empty();
        $('.SelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#driverReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#mobile-driverResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#mobile-driverResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                        $('#driverReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-driverResellerEN').selectpicker('refresh');
                $('#driverReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-driverResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#driverReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-driverResellerEN').selectpicker('refresh');
                $('#driverReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#mobile-driverResellerEN').remove();
            $('#driverReseller').remove();
        }

        $('#load-company').empty();
        $(".select-company-filter").selectpicker('refresh');

        $('#mobile-driverCompanyEN').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#driverCompany').empty();
        $(".SelectCompanyFilter").selectpicker('refresh');

        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#mobile-driverCompanyEN').append($('<option></option>').val(0).html("-------"));
            $('#driverCompany').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));


            $.each(data, function (index, item) {

                $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $(".MobileSelectCompanyFilter").selectpicker('refresh');
            $(".SelectCompanyFilter").selectpicker('refresh');
            $(".select-company-filter").selectpicker('refresh');
        });

    });
});

//Mobile Reseller
/*** Function to filter reseller and companies*/
$(function () {

    $('.MobileSelectResellerFilter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();

        $('#load-reseller').empty();
        $('.select-reseller-filter').selectpicker('refresh');

        $('#driverReseller').empty();
        $('.SelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#driverReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                        $('#driverReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#mobile-driverResellerEN").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
                $('#driverReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-driverResellerEN').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#mobile-driverResellerEN").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
                $('#driverReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#load-reseller').selectpicker('refresh');
            $('#driverReseller').remove();
        }

        $('#load-company').empty();
        $(".select-company-filter").selectpicker('refresh');

        $('#mobile-driverCompanyEN').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#driverCompany').empty();
        $(".SelectCompanyFilter").selectpicker('refresh');

        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#mobile-driverCompanyEN').append($('<option></option>').val(0).html("-------"));
            $('#driverCompany').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));


            $.each(data, function (index, item) {

                $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $(".MobileSelectCompanyFilter").selectpicker('refresh');
            $(".SelectCompanyFilter").selectpicker('refresh');
            $(".select-company-filter").selectpicker('refresh');
        });

    });
});


var selectedCompany = "";

//Company Forms
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.SelectCompanyFilter').on('change', function () {
        selectedCompany = $(this).find("option:selected").val();

        if (selectedCompany != 0) {

            //Select New Company
            $('#mobile-driverCompanyEN').empty();
            $(".MobileSelectCompanyFilter").selectpicker('refresh');

            $('#load-company').empty();
            $(".select-company-filter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }
                    });
                    var getCompany = $("#driverCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".select-company-filter").selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });
                    var getCompany = $("#driverCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".select-company-filter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });

                    var getCompany = $("#driverCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".select-company-filter").selectpicker('refresh');

                });
            }

        }

    });


});

//Company Filter
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.select-company-filter').on('change', function () {
        selectedCompany = $(this).find("option:selected").val();

        if (selectedCompany != 0) {

            //Select New Company
            $('#mobile-driverCompanyEN').empty();
            $(".MobileSelectCompanyFilter").selectpicker('refresh');

            $('#driverCompany').empty();
            $(".SelectCompanyFilter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }
                    });
                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".SelectCompanyFilter").selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });
                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".SelectCompanyFilter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-driverCompanyEN').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });

                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".SelectCompanyFilter").selectpicker('refresh');

                });
            }

        }

    });


});

//Mobile Company
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.MobileSelectCompanyFilter').on('change', function () {
        selectedCompany = $(this).find("option:selected").val();

        if (selectedCompany != 0) {

            //Select New Company
            $('#load-company').empty();
            $(".select-company-filter").selectpicker('refresh');

            $('#driverCompany').empty();
            $(".SelectCompanyFilter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }
                    });
                    var getCompany = $("#mobile-driverCompanyEN").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".select-company-filter").selectpicker('refresh');
                    $(".SelectCompanyFilter").selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });
                    var getCompany = $("#mobile-driverCompanyEN").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".select-company-filter").selectpicker('refresh');
                    $(".SelectCompanyFilter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#driverCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });

                    var getCompany = $("#mobile-driverCompanyEN").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".select-company-filter").selectpicker('refresh');
                    $(".SelectCompanyFilter").selectpicker('refresh');

                });
            }

        }

    });


});


$(document).ready(function () {
    clearInputFields();

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

        $(".driver-filter").remove();
        $('#submit-filter').hide();
        selectedReseller = getSessionstorageValueUserResellerID;
    }

    $(".select-company-filter").change(function () {
        selectedCompany = $(this).find("option:selected").val();
    });


    $("#submit-filter").click(function () {

        $('#inventory-editable').bootstrapTable('destroy');

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

        var WebAPI = 'http://117.120.7.119/spwebapi/api/inventoryinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany;
   
        $('#inventory-editable').bootstrapTable({
            idField: 'id',
            url: WebAPI,
            columns: [{
                field: 'state',
                title: 'ID',
                checkbox: 'true'
            },
            {
                field: 'Company',
                title: titleCompany,
                class: 'hidden-xs hidden-sm hidden-md hidden-lg'
            },
            {
                field: 'Name',
                title: titlePhoneUser,
                sortable: 'true',
            }, {
                field: 'Email',
                title: titleEmail,
                sortable: 'true',
            }, {
                field: 'Phone',
                title: titlePhone,
                sortable: 'true',
            }, {
                field: 'Address',
                title: 'Address',
                sortable: 'true',
            }, {
                field: 'DateOfBirth',
                title: titleBirthday,
                sortable: 'true',
                formatter: 'dateFormatter'
            }, {
                field: 'Remarks',
                title: titleRemarks,
            }, {
                field: 'Asset',
                title: titleAssignedPhone,
                formatter: 'vehicleFormatter'
            }, {
                field: 'Image',
                title: titlePhoneUserProfile,
                formatter: 'nameFormatter'
            }],

            onCheck: function (row) {

                $("#toggle-aside").hide();
                $("#toggle-aside2").show();
                $("#driverImage").show();
                if (row.ImageFill == "Uniform") {
                    $("#showImage").attr("src", row.Image);
                }

                var driverID = $('#driverID').val(row.DriverID);
                var driverName = $('#driverName').val(row.Name);
                var driverNameEN = $('#driverNameEN').val(row.Name);
                var driverPassword = $('#driverPassword').val(row.Password);
                var driverPasswordEN = $('#driverPasswordEN').val(row.Password);
                var confirmPassword = $('#confirmPassword').val(row.Password);
                var confirmPasswordEN = $('#confirmPasswordEN').val(row.Password);
                var driverCompanyID = $('#driverCompanyID').val(row.Company);
                var driverCompany = $('#driverCompany').val(row.Company);
                var driverEmail = $('#driverEmail').val(row.Email);
                var driverEmailEN = $('#driverEmailEN').val(row.Email);
                var driverPhone = $('#driverPhone').val(row.Phone);
                var driverPhoneEN = $('#driverPhoneEN').val(row.Phone);
                var driverAddress = $('#driverAdress').val(row.Address);
                var driverAddressEN = $('#driverAddressEN').val(row.Address);
                var driverRemarks = $('#driverRemarks').val(row.Remarks);
                var driverRemarksEN = $('#driverRemarksEN').val(row.Remarks);


                var DateOfBirth = row.DateOfBirth;

                var Bangkok = moment.tz(DateOfBirth, 'Asia/Bangkok');

                //Format UTC
                var timestamp = moment(Bangkok.format()).add('hours', 8).format("D-MMM-YYYY, hh:mm:ss A");

                $('#driverDateOfBirth').val(timestamp);


                $("#driverPasswordEN").change(function () {
                    delete hashPassword;
                    var getPassword = $('#driverPasswordEN').val();
                    var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
                    var hashPassword = hash;
                });

                $('.selectpicker').selectpicker('refresh');

            },

            onUncheck: function (row) {


                $("#toggle-aside").hide();
                $("toggle-aside2").hide();

                window.location.reload(true);
            },

            onLoadSuccess: function (row) {

                $("#driverImage").hide();
                $("#toggle-aside2").hide();

                //$("#edit-toggle-button").hide();
                //$result.text('Event: onLoadSuccess, data: ' + data);


                //$('#vehicles-editable').bootstrapTable(); // init via javascript

                //$(window).resize(function () {
                //    $('#vehicles-editable').bootstrapTable('resetView');
                //});
            }

        });
      
    });
});

$(document).ready(function () {

    var WebAPI;

    if (getSessionstorageValueRoleID == 1) {

       WebAPI = 'http://117.120.7.119/spwebapi/api/inventoryinfo?CompanyID=' + '1';

    } else if (getSessionstorageValueRoleID == 2) {

        WebAPI = 'http://117.120.7.119/spwebapi/api/inventoryinfo?CompanyID=' + getSessionstorageValueCompanyID;
    } else if (getSessionstorageValueRoleID >= 3) {

        WebAPI = 'http://117.120.7.119/spwebapi/api/inventoryinfo?CompanyID=' + getSessionstorageValueCompanyID;
    }

    console.log(WebAPI)

        $('#inventory-editable').bootstrapTable({
            idField: 'id',      
            url: WebAPI,
            columns: [{
                field: 'state',
                title: 'ID',
                checkbox: 'true'
            }, 
            {
                field: 'Company',
                title: titleCompany,          
                class: 'hidden-xs hidden-sm hidden-md hidden-lg'
            },
            {
                field: 'Name',
                title: 'Name',
                sortable: 'true',
                align: 'center'
            }, {
                field: 'Reference',
                title: 'Reference',
                sortable: 'true',
                align: 'center'
            }, {
                field: 'Unit',
                title: 'Unit',
                sortable: 'true',
                formatter: unitFormatter,
                align: 'center'
            }, {
                field: 'Quantity',
                title: 'Quantity',
                sortable: 'true',
                align: 'center'
            }, {
                field: 'Price',
                title: 'Price',
                sortable: 'true',
                align: 'center'
            }],

            onCheck: function (row) {
         
                $("#toggle-aside").hide();
                $("#toggle-aside2").show();

                $("#stockType").show();
                $("#stockTypeQuantity").show();
                $("#itemQuantity").prop('disabled', true);

                var itemID = $('#inventoryID').val(row.InventoryID);
                var itemName = $('#itemName').val(row.Name);
                var itemReference = $('#itemReference').val(row.Reference);
                var itemQuantity = $('#itemQuantity').val(row.Quantity);
                var itemPrice = $('#itemPrice').val(row.Price);
                var itemUnit = $('#itemUnit').val(row.Unit);

                //var itemID = $('#inventoryID').val(row.InventoryID);

                 
                // $("#driverImage").show();
                // if (row.ImageFill == "Uniform") {
                   
                //     $("#showImage").attr("src", row.Image);
                // }

                // var driverID = $('#driverID').val(row.DriverID);
                // var driverName = $('#driverName').val(row.Name);
                // var driverNameEN = $('#driverNameEN').val(row.Name);
                // var driverPassword = $('#driverPassword').val(row.Password);
                // var driverPasswordEN = $('#driverPasswordEN').val(row.Password);
                // var confirmPassword = $('#confirmPassword').val(row.Password);
                // var confirmPasswordEN = $('#confirmPasswordEN').val(row.Password);
                // var driverCompanyID = $('#driverCompanyID').val(row.Company);
                // var driverCompany = $('#driverCompany').val(row.Company);
                // var driverEmail = $('#driverEmail').val(row.Email);
                // var driverEmailEN = $('#driverEmailEN').val(row.Email);
                // var driverPhone = $('#driverPhone').val(row.Phone);
                // var driverPhoneEN = $('#driverPhoneEN').val(row.Phone);
                // var driverAddress = $('#driverAdress').val(row.Address);
                // var driverAddressEN = $('#driverAddressEN').val(row.Address);
                // var driverRemarks = $('#driverRemarks').val(row.Remarks);
                // var driverRemarksEN = $('#driverRemarksEN').val(row.Remarks);


                // var DateOfBirth = row.DateOfBirth;

                // var Bangkok = moment.tz(DateOfBirth, 'Asia/Bangkok');

                // //Format UTC
                // var timestamp = moment(Bangkok.format()).add('hours', 8).format("D-MMM-YYYY, hh:mm:ss A");

                // $('#driverDateOfBirth').val(timestamp);


                // $("#driverPasswordEN").change(function () {
                //     delete hashPassword;
                //     var getPassword = $('#driverPasswordEN').val();
                //     var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
                //     var hashPassword = hash;
                // });

                $('.selectpicker').selectpicker('refresh');

            },

            onUncheck: function (row) {
        
                $("#toggle-aside").hide();
                $("toggle-aside2").hide();
                $("#stockType").hide();
                $("#stockTypeQuantity").hide();
                $("#itemQuantity").prop('disabled', false);


                window.location.reload(true);
            },

            onLoadSuccess: function (row) {

                $("#driverImage").hide();
                $("#toggle-aside2").hide();
                $("#stockType").hide();
                $("#stockTypeQuantity").hide();
                $("#itemQuantity").prop('disabled', false);
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
var $table = $('#inventory-editable'), $remove = $('#inventory-confirm-delete'), $removeEN = $('#inventory-confirm-deleteEN');
$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);

});


var url = 'http://117.120.7.119/spwebapi/api/inventoryinfo';
//Total Vehicles
$.getJSON(url, function (assets) {

    var $result = $('#total-drivers');
    $result.text(assets.length);
});



// format for Vehicle Column.
// =================================================================
function vehicleFormatter(value, row) {
	return '<a href="#" class="btn-link" > Vehicle #' + value + '</a>';
}

// format for Vehicle Column.
// =================================================================
function unitFormatter(value, row) {
    var labelColor;
    if(value == ""){
        labelColor = "dark";
        return '<center><div class="label label-table label-' + labelColor + '">' + 'No Unit' + '</div></center>';
    }else{
        return value;
    }

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
            driverAddress = "No Address";
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
        if (getSessionstorageValueLanguage == "en"){
            text = "No Phone User Photo";
        }
        else if (getSessionstorageValueLanguage == "th")
        {
            text = "ไม่มีภาพผู้ใช้โทรศัพท์";
        } else if (getSessionstorageValueLanguage == "vn")
        {
            text = "Không có điện thoại tài Ảnh";
        } else if (getSessionstorageValueLanguage == "id")
        {
            text = "Tidak ada Photo Pengguna Telepon";
        }
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
    }
    
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
function vehicleFormatter(value, row) {
    var labelColor;
    var text;
	if (value != "") {
	    labelColor = "success";
	    text = value;
	}else if(value == null | value == "" | value == 0){
	    labelColor = "dark";
	    text = titleNoPhoneAssigned;
	}
	var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
	return '<div class="label label-table label-'+ labelColor+'"> ' + text + '</div>';
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


//<!--Filter-Company-->
(function (document) {
    'use strict';

    var CompanyTableFilter = (function (Arr) {


        var _select;


        function _onSelectEvent(e) {
            _select = e.target;
            var tables = document.getElementsByClassName(_select.getAttribute('data-table'));
            Arr.forEach.call(tables, function (table) {
                Arr.forEach.call(table.tBodies, function (tbody) {
                    Arr.forEach.call(tbody.rows, _filterSelect);
                });
            });
        }

        function _filter(row) {

            var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
            row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';

        }

        function _filterSelect(row) {

            var text_select = row.textContent.toLowerCase(), val_select = _select.options[_select.selectedIndex].value.toLowerCase();
            row.style.display = text_select.indexOf(val_select) === -1 ? 'none' : 'table-row';

        }


        return {
            init: function () {
                var selects = document.getElementsByClassName('select-company-filter');
                Arr.forEach.call(selects, function (select) {
                    select.onchange = _onSelectEvent;


                });
            }
        };
    })(Array.prototype);

    document.addEventListener('readystatechange', function () {
        if (document.readyState === 'complete') {
            CompanyTableFilter.init();

        }
    });

})(document);


//Hide Elements
$(document).ready(function () {
    $('[visibly]').Visibly();
})


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

 
        //loadjscssfile("myscript.js", "js") //dynamically load and add this .js file
        //loadjscssfile("javascript.php", "js") //dynamically load "javascript.php" as a JavaScript file
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



//OnLoad Session Storage
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
                $('#inventory-editable').bootstrapTable('resetView');

            }, 500);


        });

        $('.add-driver').click(function () {

            setTimeout(function () {
                $('#inventory-editable').bootstrapTable('resetView');

            }, 500);


        });

        $('.add-driverEN').click(function () {

            setTimeout(function () {
                $('#inventory-editable').bootstrapTable('resetView');

            }, 500);


        });

        $('.edit-inventory').click(function () {

            setTimeout(function () {
                $('#inventory-editable').bootstrapTable('resetView');

            }, 500);


        });

        $('.edit-inventoryEN').click(function () {

            setTimeout(function () {
                $('#inventory-editable').bootstrapTable('resetView');

            }, 500);


        });

    });


    window.onresize = function(event) {
        setTimeout(function () {
        $('#inventory-editable').bootstrapTable('resetView');

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

    //Translation of Forms
    if (getSessionstorageValueLanguage == "en") {
        $('#driverNameEN').attr('placeholder', 'Enter Phone User Name');
        $("#phoneUserName").html("Phone User Name");

        $("#resellerSelection").text("Reseller");
        $("#companySelection").text("Company");
        $("#previous").text("Previous");
        $("#next").text("Next");

        $('#driverEmailEN').attr('placeholder', 'Email');
        $("#emailName").html("Email");

        $('#driverPhoneEN').attr('placeholder', 'Phone Number');
        $("#phoneNumber").html("Phone Number");

        $('#driverAddressEN').attr('placeholder', 'Address');
        $("#userAddress").html("Address");

        $('#driverDateOfBirth').attr('placeholder', 'DD-MMM-YYYY');
        $("#dateOfBirth").html("Date of Birth");

        $("#remarks").text("Remarks");
        $('#driverRemarksEN').attr('placeholder', 'Remarks');

        $("#submit-driverEN").text("Submit");

        $("#clickLogoutEN").text("OK");
        $("#driver-confirm-deleteEN").text("Delete");
        $("#add-driverEN").text("Add Phone User");
        $("#driver-modal").text("Add Phone User");
        $("#edit-driverEN").text("Edit Phone Users");
        $("#DriverExportWordEN").text("MS Word");
        $("#DriverExportPDFEN").text("PDF");
        $("#DriverExportExcelEN").text("Excel");

        $('#driverPasswordEN').attr('placeholder', 'Password');
        $('#confirmPasswordEN').attr('placeholder', 'Confirm Password');


    }
    else if (getSessionstorageValueLanguage == "th") {
        $('#driverNameEN').attr('placeholder', 'ใส่ชื่อผู้ใช้งานโทรศัพท์');
        $("#phoneUserName").html("ชื่อผู้ใช้โทรศัพท์");

        $("#resellerSelection").text("ผู้ค้าปลีก");
        $("#companySelection").text("บริษัท");
        $("#previous").text("ก่อน");
        $("#next").text("ต่อไป");

        $('#driverEmailEN').attr('placeholder', 'อีเมล์');
        $("#emailName").html("อีเมล์");

        $('#driverPhoneEN').attr('placeholder', 'หมายเลขโทรศัพท์');
        $("#phoneNumber").html("หมายเลขโทรศัพท์");

        $('#driverAddressEN').attr('placeholder', 'ที่อยู่');
        $("#userAddress").html("ที่อยู่");

        $('#driverDateOfBirth').attr('placeholder', 'DD-MMM-YYYY');
        $("#dateOfBirth").html("วันเกิด");

        $("#remarks").text("ข้อสังเกต");
        $('#driverRemarksEN').attr('placeholder', 'ข้อสังเกต');

        $("#submit-driverEN").text("เสนอ");

        $("#clickLogoutEN").text("ตกลง");
        $("#driver-confirm-deleteEN").text("บันทึก ลบ");
        $("#add-driverEN").text("เพิ่มผู้ใช้โทรศัพท์");
        $("#driver-modal").text("เพิ่มผู้ใช้โทรศัพท์");
        $("#edit-driverEN").text("แก้ไขผู้ใช้โทรศัพท์");
        $("#DriverExportWordEN").text("การส่งออกในรูปแบบ Word");
        $("#DriverExportPDFEN").text("การส่งออกในรูปแบบ PDF");
        $("#DriverExportExcelEN").text("การส่งออกในรูปแบบ Excel");

        $('#driverPasswordEN').attr('placeholder', 'ป้อนรหัสผ่าน');
        $('#confirmPasswordEN').attr('placeholder', 'ป้อน รหัสผ่าน');

    }
    else if (getSessionstorageValueLanguage == "vn") {
        $('#driverNameEN').attr('placeholder', 'Nhập Tên ĐT Người Dùng');
        $("#phoneUserName").html("Tên ĐT Người Dùng");

        $("#resellerSelection").text("Người Bán Lại");
        $("#companySelection").text("Công ty");
        $("#previous").text("Lùi");
        $("#next").text("Tới");

        $('#driverEmailEN').attr('placeholder', 'Nhập Email');
        $("#emailName").html("Email");

        $('#driverPhoneEN').attr('placeholder', 'Nhập Số ĐT');
        $("#phoneNumber").html("Số ĐT");

        $('#driverAddressEN').attr('placeholder', 'Nhập Địa Chỉ');
        $("#userAddress").html("Nhập Địa Chỉ");

        $('#driverDateOfBirth').attr('placeholder', 'DD-MMM-YYYY');
        $("#dateOfBirth").html("Ngày sinh");

        $("#remarks").text("Lưu Ý");
        $('#driverRemarksEN').attr('placeholder', 'Lưu Ý');

        $("#submit-driverEN").text("Gửi Đi");

        $("#clickLogoutEN").text("Đồng Ý");
        $("#driver-confirm-deleteEN").text("Xóa");
        $("#add-driverEN").text("Thêm Số ĐT Người Dùng");
        $("#driver-modal").text("Thêm Số ĐT Người Dùng");
        $("#edit-driverEN").text("Chỉnh Sửa ĐT Người Dùng");
        $("#DriverExportWordEN").text("Xuất Word");
        $("#DriverExportPDFEN").text("Xuất PDF");
        $("#DriverExportExcelEN").text("Xuất Excel");

        $('#driverPasswordEN').attr('placeholder', 'Mật Khẩu');
        $('#confirmPasswordEN').attr('placeholder', 'Nhập Lại Mật Khẩu');

    }
    else if (getSessionstorageValueLanguage == "id") {
        $('#driverNameEN').attr('placeholder', 'Masukkan Nama Pengguna Telepon');
        $("#phoneUserName").html("Nama Pengguna Telepon");

        $("#resellerSelection").text("Pengecer");
        $("#companySelection").text("Perusahaan");
        $("#previous").text("Sebelum");
        $("#next").text("Berikut");

        $('#driverEmailEN').attr('placeholder', 'Email');
        $("#emailName").html("Email");

        $('#driverPhoneEN').attr('placeholder', 'Nomor Telepon');
        $("#phoneNumber").html("Nomor Telepon");

        $('#driverAddressEN').attr('placeholder', 'Alamat');
        $("#userAddress").html("Alamat");

        $('#driverDateOfBirth').attr('placeholder', 'DD-MMM-YYYY');
        $("#dateOfBirth").html("Tanggal lahir");

        $("#remarks").text("Perhatian");
        $('#driverRemarksEN').attr('placeholder', 'Perhatian');

        $("#submit-driverEN").text("Serah");

        $("#clickLogoutEN").text("Baik");
        $("#driver-confirm-deleteEN").text("Hapus Rekor");
        $("#add-driverEN").text("Tambah Pengguna Telepon");
        $("#driver-modal").text("Tambah Pengguna Telepon");
        $("#edit-driverEN").text("Pengubahan Pengguna Telepon");
        $("#DriverExportWordEN").text("Ekspor ke MS Word");
        $("#DriverExportPDFEN").text("Ekspor ke PDF");
        $("#DriverExportExcelEN").text("Ekspor ke Excel");

        $('#driverPasswordEN').attr('placeholder', 'Kata Sandi');
        $('#confirmPasswordEN').attr('placeholder', 'Masukkan Kata Sandi Sama');


    }

    function clearInputFields() {
        $('#inventoryID').val('');
        $('#itemName').val('');
        $('#itemReference').val('');
        $('#itemQuantity').val('');
        $('#itemPrice').val('');
        $('#itemUnit').val('');

        $('#stockType').val('1');
        $("#stockType").selectpicker('refresh');
        $('#itemFinalQuantity').val('');
    }

    window.onresize = function(event) {
        setTimeout(function () {
        $('#inventory-editable').bootstrapTable('resetView');
        AutoAdjustScreen();
        }, 500);
    };

    AutoAdjustScreen();
    
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
                    $('#inventory-editable').bootstrapTable('resetView', { height: 365 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 375 });
                }

            }, 500);
        }
        else if (screen.height == 720) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 320 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 285 });
                }

            }, 500);
        }
        else if (screen.height == 786) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 338 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 353 });
                }

            }, 500);
        }
        else if (screen.height == 800) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 385 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 380 });
                }

            }, 500);
        }
        else if (screen.height == 864) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 435 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 470 });
                }

            }, 500);
        }
        else if (screen.height == 900) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 495 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 505 });
                }

            }, 500);
        }else if (screen.height == 1000) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 505 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 515 });
                }

            }, 500);
        }else if (screen.height == 1013) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 505 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 515 });
                }

            }, 500);
        }
        else if (screen.height == 960) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 525 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 520 });
                }

            }, 500);
        }
        else if (screen.height == 1024) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 590 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 580 });
                }

            }, 500);
        }
        else if (screen.height == 1080) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 646 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 636 });
                }

            }, 500);
        }
        else if (screen.height == 1050) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 615 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 605 });
                }

            }, 500);
        }
        else if (screen.height == 1200) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 760 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 755 });
                }

            }, 500);
        }
        else if (screen.height == 1344) {
            setTimeout(function () {

                if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                    // is Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 900 });
                } else {
                    // not Google chrome 
                    $('#inventory-editable').bootstrapTable('resetView', { height: 895 });
                }

            }, 500);
        }
        else {
            setTimeout(function () {
                $('#inventory-editable').bootstrapTable('resetView', { height: 400 });
            }, 500);
        }
    }