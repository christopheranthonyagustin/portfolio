var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

var titleCompany, titleZoneName, titleType, titleDateCreated, titleDateModified, titleModifiedBy, titleViewZones;

if (getSessionstorageValueLanguage == "en") {
    titleCompany = "Company Name";
    titleZoneName = "Zone Name";
    titleType = "Type";
    titleDateCreated = "Date Created";
    titleDateModified = "Date Modified";
    titleModifiedBy = "Modified By";
    titleViewZones = "View Zones";
}
else if (getSessionstorageValueLanguage == "th") {
    titleCompany = "ชื่อ บริษัท";
    titleZoneName = "ชื่อโซน";
    titleType = "ชนิด";
    titleDateCreated = "วันที่สร้าง";
    titleDateModified = "วันที่แก้ไข";
    titleModifiedBy = "แก้ไขโดย";
    titleViewZones = "มุมมองโซน";
} else if (getSessionstorageValueLanguage == "vn") {
    titleCompany = "Tên công ty";
    titleZoneName = "Tên Vùng";
    titleType = "Loại";
    titleDateCreated = "Ngày Tạo";
    titleDateModified = "Ngày Chỉnh Sửa";
    titleModifiedBy = "Chỉnh Sửa Bởi";
    titleViewZones = "Xem Vùng";
} else if (getSessionstorageValueLanguage == "id") {
    titleCompany = "Nama Perusahaan";
    titleZoneName = "Nama Zona";
    titleType = "Jenis";
    titleDateCreated = "Tanggal Dicipta";
    titleDateModified = "Tanggal Modifikasi";
    titleModifiedBy = "Dimodifikasi Oleh";
    titleViewZones = "Lihat Zona";
}

$(document).ready(function () {

    $('.dateCreated').hide();

});

//OnLoad Reseller
var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {

            if (item.ResellerID == "1") {
                $('#zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#mobile-zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
            }
            else {
                $('#zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#mobile-zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            }

        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    WebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#mobile-zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
        });

        $(".selectpicker").selectpicker('refresh');

    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#formsReseller').remove();
    $('#modal-zoneReseller').remove();
}



//OnLoad Company
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + "1", function (data) {


        $.each(data, function (index, item) {

            if (item.CompanyID == 1) {

                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
            } else {

                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));

            }

        });


        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {
        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID) {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
            }
            else {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            }

        });

        $(".selectpicker").selectpicker('refresh');

    });
} else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {
      
        $.each(data, function (index, item) {

            $('#load-company').append($('<option></option>').val(item.CompanyID).html(item.Name));
            $('#zoneCompany').append($('<option></option>').val(item.CompanyID).html(item.Name));

        });

        $(".selectpicker").selectpicker('refresh');

    });

}


var selectedReseller = "";

//Reseller Forms
/*** Function to filter reseller and companies*/
$(function () {

    $('.SelectFormResellerFilter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();

        $('#mobile-zoneReseller').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        $('#load-reseller').empty();
        $('.select-reseller-filter').selectpicker('refresh');


        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#mobile-zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#mobile-zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#zoneReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-zoneReseller').selectpicker('refresh');
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {


                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#zoneReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-zoneReseller').selectpicker('refresh');
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#modal-zoneReseller').remove();
            $('#load-reseller').remove();
        }

        $('#zoneCompany').empty();
        $(".SelectFormCompanyFilter").selectpicker('refresh');

        $('#mobile-zoneCompany').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#load-company').empty();
        $(".select-company-filter").selectpicker('refresh');


        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#mobile-zoneCompany').append($('<option></option>').val(0).html("-------"));
            $('#zoneCompany').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));

            $.each(data, function (index, item) {
                $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $(".MobileSelectCompanyFilter").selectpicker('refresh');
            $(".SelectFormCompanyFilter").selectpicker('refresh');
            $(".select-company-filter").selectpicker('refresh');
        });

    });

});

//Reseller Filter
/*** Function to filter reseller and companies*/
$(function () {

    $('.select-reseller-filter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();

        $('#mobile-zoneReseller').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        $('#zoneReseller').empty();
        $('.SelectFormResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#mobile-zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#mobile-zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                        $('#zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-zoneReseller').selectpicker('refresh');
                $('#zoneReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-zoneReseller').selectpicker('refresh');
                $('#zoneReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#modal-zoneReseller').remove();
            $('#zoneReseller').remove();
        }

        $('#zoneCompany').empty();
        $(".SelectFormCompanyFilter").selectpicker('refresh');

        $('#mobile-zoneCompany').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#load-company').empty();
        $(".select-company-filter").selectpicker('refresh');


        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#mobile-zoneCompany').append($('<option></option>').val(0).html("-------"));
            $('#zoneCompany').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));

            $.each(data, function (index, item) {
                $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $(".MobileSelectCompanyFilter").selectpicker('refresh');
            $(".SelectFormCompanyFilter").selectpicker('refresh');
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

        $('#zoneReseller').empty();
        $('.SelectFormResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                        $('#zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#mobile-zoneReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
                $('#zoneReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#zoneReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#mobile-zoneReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
                $('#zoneReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#load-reseller').selectpicker('refresh');
            $('#zoneReseller').remove();
            $('#mobile-zoneReseller').remove();
        }

        $('#zoneCompany').empty();
        $(".SelectFormCompanyFilter").selectpicker('refresh');

        $('#mobile-zoneCompany').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#load-company').empty();
        $(".select-company-filter").selectpicker('refresh');


        $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#mobile-zoneCompany').append($('<option></option>').val(0).html("-------"));
            $('#zoneCompany').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));

            $.each(data, function (index, item) {

                $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

            $(".MobileSelectCompanyFilter").selectpicker('refresh');
            $(".SelectFormCompanyFilter").selectpicker('refresh');
            $(".select-company-filter").selectpicker('refresh');
        });

    });
});

var selectedCompany = "";
//Company Forms
/*** Function to filter tables, markers and zones*/
$(function () {

    $('.SelectFormCompanyFilter').on('change', function () {
        selectedCompany = $(this).find("option:selected").val();

        var getReseller = $('#zoneReseller').val();

        if (selectedCompany != 0) {

            //Select New Company
            $('#mobile-zoneCompany').empty();
            $(".MobileSelectCompanyFilter").selectpicker('refresh');

            $('#load-company').empty();
            $(".select-company-filter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }
                    });
                    var getCompany = $("#zoneCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".select-company-filter").selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });
                    var getCompany = $("#zoneCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".select-company-filter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });

                    var getCompany = $("#zoneCompany").val();
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
            $('#mobile-zoneCompany').empty();
            $(".MobileSelectCompanyFilter").selectpicker('refresh');

            $('#zoneCompany').empty();
            $(".SelectFormCompanyFilter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }
                    });
                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".SelectFormCompanyFilter").selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });
                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".SelectFormCompanyFilter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });

                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".SelectFormCompanyFilter").selectpicker('refresh');

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
        var getReseller = $('#assetReseller').val();

        if (selectedCompany != 0) {

            //Select New Company
            $('#load-company').empty();
            $(".select-company-filter").selectpicker('refresh');

            $('#zoneCompany').empty();
            $(".SelectFormCompanyFilter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }
                    });
                    var getCompany = $("#mobile-zoneCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".select-company-filter").selectpicker('refresh');
                    $(".SelectFormCompanyFilter").selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });
                    var getCompany = $("#mobile-zoneCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".select-company-filter").selectpicker('refresh');
                    $(".SelectFormCompanyFilter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#zoneCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });

                    var getCompany = $("#mobile-zoneCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".select-company-filter").selectpicker('refresh');
                    $(".SelectFormCompanyFilter").selectpicker('refresh');

                });
            }
        }

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
        selectedReseller = getSessionstorageValueUserResellerID;

    }
    else if (getSessionstorageValueRoleID >= 3) {

        //$('#load-reseller').remove();
        //$(".select-reseller-filter").hide();
        $('#submit-filter').hide();
        selectedReseller = getSessionstorageValueUserResellerID;

    }

    $(".select-company-filter").change(function () {
        selectedCompany = $(this).find("option:selected").val();


    });


    $("#submit-filter").click(function () {

        $('#zones-editable').bootstrapTable('destroy');

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

        var WebAPI = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany;

        $('#zones-editable').bootstrapTable({
            idField: 'id',
            url: WebAPI,
            columns: [{
                field: 'state',
                title: 'ID',
                checkbox: 'true'
            }, {
                field: 'ZoneID',
                title: 'ID',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg',
                formatter: 'zoneFormatter'
            }, {
                field: 'Company',
                title: 'Company Name',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg'
            },
            {
                field: 'Name',
                title: 'Zone Name',
                sortable: 'true'
            }, {
                field: 'Type',
                title: 'Type',
                sortable: 'true',
                formatter: 'typeFormatter'
            }, {
                field: 'CreatedDate',
                title: 'Date Created',
                formatter: 'dateFormatter',
                sortable: 'true'
            }, {
                field: 'LastModified',
                title: 'Date Modified',
                formatter: 'dateFormatter',
                sortable: 'true'
            }, {
                field: 'Modified_User',
                title: 'Modified By',
                sortable: 'true'
            },  {
                field: 'Operate',
                title: 'View Zones',
                formatter: 'operateFormatter',
                events: 'operateEvents'
            }],


            onCheck: function (row) {

                localStorage.setItem("row", JSON.stringify(row));

                
                $("#showDrawZone").hide();
                $("#mobile-showDrawZone").hide();
                $("#editZonesEN").show();
                $("#mobile-editZonesEN").show();
                $("#showEditZone").show();
                $("#mobile-showEditZone").show();

                $("#toggle-aside").hide();
                $("#toggle-aside2").show();
                //$("#edit-toggle-button").show();
                //$("#add-toggle-button").hide();
                $("#drawZones").hide();
                $("#drawZonesEN").hide();

                var zoneID = $('#zoneID').val(row.ZoneID);
                var Perimeter = $('#Perimeter').val(row.Perimeter);
                var zoneName = $('#zoneName').val(row.Name);
                var zoneNameEN = $('#zoneNameEN').val(row.Name);
                var zoneType = $('#zoneTypeID').val(row.TypeID);
                var zoneTypeEN = $('#zoneTypeIDEN').val(row.TypeID);


                var zoneCompany = $('#zoneCompany').val(row.Company);
                //var zoneDateCreated = $('#zoneDateCreated').val(row.CreatedDate);
                var zoneColor = $('#zoneColor').val(row.Color);

                var DateCreated = row.CreatedDate;

                var Bangkok = moment.tz(DateCreated, 'Asia/Bangkok');

                //Format UTC
                var timestamp = moment(Bangkok.format()).add('hours', 7).format("D-MMM-YYYY, hh:mm:ss A");

                $('#zoneDateCreated').val(timestamp);


                $(".selectpicker").selectpicker('refresh');

            },

            onUncheck: function (row) {
                $("#toggle-aside").hide();
                $("toggle-aside2").hide();
                //$("#add-toggle-button").show();
                //$("#edit-toggle-button").hide();
                //window.location = "/th/Dashboard/zones.html"
                sessionStorage.removeItem("setSessionstorageValuePerimeterLength");
                window.location.reload(true);
            },

            onLoadSuccess: function (row) {
               // $("#editZones").hide();
                $("#editZonesEN").hide();
                $("#showEditZone").hide();

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

$(document).ready(function () {


    var WebAPI = "";

    if (getSessionstorageValueRoleID == 1) {

        WebAPI = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + '1' + '&CompanyID=' + '1';

    } else if (getSessionstorageValueRoleID == 2) {
        WebAPI = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    } else if (getSessionstorageValueRoleID >= 3) {

        WebAPI = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }


	$('#zones-editable').bootstrapTable({
		idField: 'id',
		url: WebAPI,
		columns: [{
		    field: 'state',
		    title: 'ID',
		    checkbox: 'true'
		},  {
			field: 'ZoneID',
			title: 'ID',
			class: 'hidden-xs hidden-sm hidden-md hidden-lg',
			formatter: 'zoneFormatter'
		}, {
		    field: 'Company',
		    title: titleCompany,
		    class: 'hidden-xs hidden-sm hidden-md hidden-lg'
		},
        {
            field: 'Name',
            title: titleZoneName,
            sortable: 'true'
		}, {
		    field: 'Type',
		    title: titleType,
		    sortable: 'true',
		    formatter: 'typeFormatter'
		}, {
		    field: 'CreatedDate',
		    title: titleDateCreated,
		    formatter: 'dateFormatter',
		    sortable: 'true'
		}, {
		    field: 'LastModified',
		    title: titleDateModified,
		    formatter: 'dateFormatter',
		    sortable: 'true'
		}, {
		    field: 'Modified_User',
		    title: titleModifiedBy,
		    sortable: 'true'
		}, {
	        field: 'Operate',
            title: titleViewZones,
            formatter: 'operateFormatter',
            events: 'operateEvents'
        }],

		onCheck: function (row) {

		    localStorage.setItem("row", JSON.stringify(row));
		    $("#showDrawZone").hide();
		    $("#mobile-showDrawZone").hide();
		    $("#editZonesEN").show();
		    $("#mobile-editZonesEN").show();
	        $("#showEditZone").show();
	        $("#mobile-showEditZone").show();
		    $("#toggle-aside").hide();
		    $("#toggle-aside2").show();
		    //$("#edit-toggle-button").show();
		    //$("#add-toggle-button").hide();
		    $("#drawZones").hide();
		    $("#drawZonesEN").hide();
		    $("#showDrawZone").hide();

		    var zoneID = $('#zoneID').val(row.ZoneID);
		    var Perimeter = $('#Perimeter').val(row.Perimeter);
		    var zoneName = $('#zoneName').val(row.Name);
		    var zoneNameEN = $('#zoneNameEN').val(row.Name);

		    var zoneType = $('#zoneTypeID').val(row.TypeID);
		    var zoneTypeEN = $('#zoneTypeIDEN').val(row.TypeID);


		    var zoneCompany = $('#zoneCompany').val(row.Company);
		    //var zoneDateCreated = $('#zoneDateCreated').val(row.CreatedDate);
		    var zoneColor = $('#zoneColor').val(row.Color);
		    var DateCreated = row.CreatedDate;

		    var Bangkok = moment.tz(DateCreated, 'Asia/Bangkok');

		    //Format UTC
		    var timestamp = moment(Bangkok.format()).add('hours', 7).format("D-MMM-YYYY, hh:mm:ss A");

		   $('#zoneDateCreated').val(timestamp);


		    $(".selectpicker").selectpicker('refresh');

		},

		onUncheck: function (row) {
		    $("#toggle-aside").hide();
		    $("toggle-aside2").hide();
		    //$("#add-toggle-button").show();
		    //$("#edit-toggle-button").hide();
		    //window.location = "/th/Dashboard/zones.html"
		    sessionStorage.removeItem("setSessionstorageValuePerimeterLength");
		    window.location.reload(true);
		},

		onLoadSuccess: function (row) {
		    //$("#editZones").hide();
		    $("#mobile-editZonesEN").hide();
		    $("#editZonesEN").hide();
		    $("#showEditZone").hide();

		    $("#toggle-aside2").hide();
		    //$("#edit-toggle-button").hide();
		    //$result.text('Event: onLoadSuccess, data: ' + data);

		}

		//onLoadError: function () {

		//    alert('Event: onLoadError, data: ' + alert('error'));
		//}


	});





});


//Delete Row
var $table = $('#zones-editable'), $remove = $('#zone-confirm-delete'), $removeEN = $('#zone-confirm-deleteEN');

$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);
});



// FORMAT COLUMN
// Use "data-formatter" on HTML to format the display of bootstrap table column.
// =================================================================


// format for Zone Column.
// =================================================================
function zoneFormatter(value, row) {
	return '<a href="#" class="btn-link" >Zone #' + value + '</a>';
}

function typeFormatter(value, row) {
   
    var text;

    if (getSessionstorageValueLanguage == "en") {

        switch (value) {
            case "Home":
                text = "Home";
                break;
            case "National Boundary":
                text = "National Boundary";
                break;
            case "Office":
                text = "Office";
                break;
            case "Customer Site":
                text = "Customer Site";
                break;
            case "Amenities":
                text = "Amenities";
                break;
            case "Project Site":
                text = "Project Site";
                break;
            case "Supplier Site":
                text = "Supplier Site";
                break;
            case "Customize":
                text = "Customize";
                break;
        }

    }
    else if (getSessionstorageValueLanguage == "th") {

        switch (value) {
            case "Home":
                text = "บ้าน";
                break;
            case "National Boundary":
                text = "เขตแดน แห่งชาติ";
                break;
            case "Office":
                text = "สำนักงาน";
                break;
            case "Customer Site":
                text = "เว็บไซต์ ของลูกค้า";
                break;
            case "Amenities":
                text = "สิ่งอำนวยความสะดวก";
                break;
            case "Project Site":
                text = "โครงการ เว็บไซต์";
                break;
            case "Supplier Site":
                text = "เว็บไซต์ ผู้ผลิต";
                break;
            case "Customize":
                text = "ปรับแต่ง";
                break;
        }
    } else if (getSessionstorageValueLanguage == "vn") {
        switch (value) {
            case "Home":
                text = "Nhà";
                break;
            case "National Boundary":
                text = "Ranh giới quốc gia";
                break;
            case "Office":
                text = "Văn phòng";
                break;
            case "Customer Site":
                text = "Trang web Khách hàng";
                break;
            case "Amenities":
                text = "Tiện nghi";
                break;
            case "Project Site":
                text = "Địa điểm dự án";
                break;
            case "Supplier Site":
                text = "Trang nhà cung cấp";
                break;
            case "Customize":
                text = "Tùy chỉnh";
                break;
        }
    } else if (getSessionstorageValueLanguage == "id") {
        switch (value) {
            case "Home":
                text = "Rumah";
                break;
            case "National Boundary":
                text = "Batas nasional";
                break;
            case "Office":
                text = "Kantor";
                break;
            case "Customer Site":
                text = "Situs pelanggan";
                break;
            case "Amenities":
                text = "Fasilitas";
                break;
            case "Project Site":
                text = "Situs Proyek";
                break;
            case "Supplier Site":
                text = "Situs pemasok";
                break;
            case "Customize":
                text = "Sesuaikan";
                break;
        }
    }


    return '<div> ' + text + '</div>';
}

function zoneNameFormatter(value, row) {
    return '<a href="#" class="btn-link" >' + value + '</a>';
}


// Format for User Name Column.
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



// Sort Price Column
// =================================================================
function priceSorter(a, b) {
	a = +a.substring(1); // remove $
	b = +b.substring(1);
	if (a > b) return 1;
	if (a < b) return -1;
	return 0;
}


//Total Zones
var url = 'http://117.120.7.119/spwebapi/api/zoneinfo';

$.getJSON(url, function (zones) {


    var $result = $('#total-zones');
    $result.text(zones.length)

});



$(document).ready(function () {
    $('#drawZones').click(function () {
        
        var getZoneID = $('#zoneID').val();
        var getZoneName = $('#zoneName').val();
        var getZoneNameEN = $('#zoneNameEN').val();
        var getZoneTypeID = $('#zoneTypeID').val();

        var getZoneTypeIDDesc = document.getElementById("zoneTypeID");
        var getZoneTypeIDDescText;
        if (getZoneTypeIDDesc) {
            getZoneTypeIDDescText = getZoneTypeIDDesc.options[getZoneTypeIDDesc.selectedIndex].innerHTML;
            var value = getZoneTypeIDDesc.options[getZoneTypeIDDesc.selectedIndex].value;
        }

        var getZoneTypeIDDescEN = document.getElementById("zoneTypeIDEN");
        var getZoneTypeIDDescTextEN;
        if (getZoneTypeIDDescEN) {
            getZoneTypeIDDescTextEN = getZoneTypeIDDescEN.options[getZoneTypeIDDescEN.selectedIndex].innerHTML;
            var value = getZoneTypeIDDescEN.options[getZoneTypeIDDescEN.selectedIndex].value;
        }


        var getZoneCompany = document.getElementById("zoneCompany");
        var getZoneCompanyText;
        if (getZoneCompany) {
            getZoneCompanyText = getZoneCompany.options[getZoneCompany.selectedIndex].innerHTML;
            var value = getZoneCompany.options[getZoneCompany.selectedIndex].value;
        }


        var getZoneTypeDesc = getZoneTypeIDDescText;
        var getZoneTypeIDEN = $('#zoneTypeIDEN').val();
        var getZoneTypeDescEN = getZoneTypeIDDescTextEN;
        var getCompanyID = $('#zoneCompany').val();
        var getCompany = getZoneCompanyText;
        var getDateCreated = $('#zoneDateCreated').val();


        sessionStorage.setItem("setSessionstorageValueZoneID", getZoneID);
        sessionStorage.setItem("setSessionstorageValueZoneName", getZoneName);
        sessionStorage.setItem("setSessionstorageValueZoneNameEN", getZoneNameEN);
        sessionStorage.setItem("setSessionstorageValueZoneTypeID", getZoneTypeID);
        sessionStorage.setItem("setSessionstorageValueZoneTypeDesc", getZoneTypeDesc);
        sessionStorage.setItem("setSessionstorageValueZoneTypeIDEN", getZoneTypeIDEN);
        sessionStorage.setItem("setSessionstorageValueZoneTypeDescEN", getZoneTypeDescEN);
        sessionStorage.setItem("setSessionstorageValueZoneCompanyID", getCompanyID);
        sessionStorage.setItem("setSessionstorageValueZoneCompany", getCompany);
        sessionStorage.setItem("setSessionstorageValueZoneDateCreated", getDateCreated);


        window.location.href = 'draw-zones.html';

    
        //var panel1 = $.jsPanel({
        //    iframe: {
        //        src: "draw-zones.html",
        //        id: "myFrame",
        //        style: { "display": "none", "border": "10px solid transparent" },
        //        width: '100%',
        //        height: '100%'
        //    },
      
        //    callback: function () {
        //        document.getElementById("myFrame").onload = function () {
        //            $("#myFrame").fadeIn(1000);
        //        }
        //    },
        //    size: { width: 780, height: 540 },
        //    position: { left: "center", top: 30 },
        //    title: 'วาด โซน', //Draw Zones
        //    theme: "black"
        //});




    });
});

$(document).ready(function () {
    $('#drawZonesEN').click(function () {

        var getZoneID = $('#zoneID').val();
        var getZoneName = $('#zoneName').val();
        var getZoneNameEN = $('#zoneNameEN').val();
        var getZoneTypeID = $('#zoneTypeID').val();

        var getZoneTypeIDDesc = document.getElementById("zoneTypeID");
        var getZoneTypeIDDescText;
        if (getZoneTypeIDDesc) {
            getZoneTypeIDDescText = getZoneTypeIDDesc.options[getZoneTypeIDDesc.selectedIndex].innerHTML;
            var value = getZoneTypeIDDesc.options[getZoneTypeIDDesc.selectedIndex].value;
        }

        var getZoneTypeIDDescEN = document.getElementById("zoneTypeIDEN");
        var getZoneTypeIDDescTextEN;
        if (getZoneTypeIDDescEN) {
            getZoneTypeIDDescTextEN = getZoneTypeIDDescEN.options[getZoneTypeIDDescEN.selectedIndex].innerHTML;
            var value = getZoneTypeIDDescEN.options[getZoneTypeIDDescEN.selectedIndex].value;
        }


        var getZoneCompany = document.getElementById("zoneCompany");
        var getZoneCompanyText;
        if (getZoneCompany) {
            getZoneCompanyText = getZoneCompany.options[getZoneCompany.selectedIndex].innerHTML;
            var value = getZoneCompany.options[getZoneCompany.selectedIndex].value;
        }


        var getZoneTypeDesc = getZoneTypeIDDescText;
        var getZoneTypeIDEN = $('#zoneTypeIDEN').val();
        var getZoneTypeDescEN = getZoneTypeIDDescTextEN;
        var getCompanyID = $('#zoneCompany').val();
        var getCompany = getZoneCompanyText;
        var getDateCreated = $('#zoneDateCreated').val();


        sessionStorage.setItem("setSessionstorageValueZoneID", getZoneID);
        sessionStorage.setItem("setSessionstorageValueZoneName", getZoneName);
        sessionStorage.setItem("setSessionstorageValueZoneNameEN", getZoneNameEN);
        sessionStorage.setItem("setSessionstorageValueZoneTypeID", getZoneTypeID);
        sessionStorage.setItem("setSessionstorageValueZoneTypeDesc", getZoneTypeDesc);
        sessionStorage.setItem("setSessionstorageValueZoneTypeIDEN", getZoneTypeIDEN);
        sessionStorage.setItem("setSessionstorageValueZoneTypeDescEN", getZoneTypeDescEN);
        sessionStorage.setItem("setSessionstorageValueZoneCompanyID", getCompanyID);
        sessionStorage.setItem("setSessionstorageValueZoneCompany", getCompany);
        sessionStorage.setItem("setSessionstorageValueZoneDateCreated", getDateCreated);

        window.location.href = 'draw-zones.html';

        //var panel1 = $.jsPanel({
        //    iframe: {
        //        src: "draw-zones.html",
        //        id: "myFrame",
        //        style: { "display": "none", "border": "10px solid transparent" },
        //        width: '100%',
        //        height: '100%'
        //    },

        //    callback: function () {
        //        document.getElementById("myFrame").onload = function () {
        //            $("#myFrame").fadeIn(1000);
        //        }
        //    },
        //    size: { width: 780, height: 540 },
        //    position: { left: "center", top: 30 },
        //    title: 'Draw Zones', //Draw Zones
        //    theme: "black"
        //});




    });

    $('#mobile-drawZonesEN').click(function () {

        var getZoneID = $('#zoneID').val();
        var getZoneNameEN = $('#mobile-zoneNameEN').val();
        var getZoneTypeID = $('#mobile-zoneTypeIDEN').val();

        var getZoneTypeIDDesc = document.getElementById("mobile-zoneTypeIDEN");
        var getZoneTypeIDDescText;
        if (getZoneTypeIDDesc) {
            getZoneTypeIDDescText = getZoneTypeIDDesc.options[getZoneTypeIDDesc.selectedIndex].innerHTML;
            var value = getZoneTypeIDDesc.options[getZoneTypeIDDesc.selectedIndex].value;
        }

        var getZoneTypeIDDescEN = document.getElementById("mobile-zoneTypeIDEN");
        var getZoneTypeIDDescTextEN;
        if (getZoneTypeIDDescEN) {
            getZoneTypeIDDescTextEN = getZoneTypeIDDescEN.options[getZoneTypeIDDescEN.selectedIndex].innerHTML;
            var value = getZoneTypeIDDescEN.options[getZoneTypeIDDescEN.selectedIndex].value;
        }


        var getZoneCompany = document.getElementById("mobile-zoneCompany");
        var getZoneCompanyText;
        if (getZoneCompany) {
            getZoneCompanyText = getZoneCompany.options[getZoneCompany.selectedIndex].innerHTML;
            var value = getZoneCompany.options[getZoneCompany.selectedIndex].value;
        }


        var getZoneTypeDesc = getZoneTypeIDDescText;
        var getZoneTypeIDEN = $('#mobile-zoneTypeIDEN').val();
        var getZoneTypeDescEN = getZoneTypeIDDescTextEN;
        var getCompanyID = $('#mobile-zoneCompany').val();
        var getCompany = getZoneCompanyText;
        var getDateCreated = $('#zoneDateCreated').val();


        sessionStorage.setItem("setSessionstorageValueZoneID", getZoneID);
        sessionStorage.setItem("setSessionstorageValueZoneName", getZoneName);
        sessionStorage.setItem("setSessionstorageValueZoneNameEN", getZoneNameEN);
        sessionStorage.setItem("setSessionstorageValueZoneTypeID", getZoneTypeID);
        sessionStorage.setItem("setSessionstorageValueZoneTypeDesc", getZoneTypeDesc);
        sessionStorage.setItem("setSessionstorageValueZoneTypeIDEN", getZoneTypeIDEN);
        sessionStorage.setItem("setSessionstorageValueZoneTypeDescEN", getZoneTypeDescEN);
        sessionStorage.setItem("setSessionstorageValueZoneCompanyID", getCompanyID);
        sessionStorage.setItem("setSessionstorageValueZoneCompany", getCompany);
        sessionStorage.setItem("setSessionstorageValueZoneDateCreated", getDateCreated);

        window.location.href = 'mobile-draw-zones.html';

    });
});


$(document).ready(function () {
    $('#editZones').click(function () {

        var getZoneID = $('#zoneID').val();
        var getZoneName = $('#zoneName').val();
        var getZoneNameEN = $('#zoneNameEN').val();
        var getZoneTypeID = $('#zoneTypeID').val();

        var getZoneTypeIDDesc = document.getElementById("zoneTypeID");
        var getZoneTypeIDDescText;
        if (getZoneTypeIDDesc) {
            getZoneTypeIDDescText = getZoneTypeIDDesc.options[getZoneTypeIDDesc.selectedIndex].innerHTML;
            var value = getZoneTypeIDDesc.options[getZoneTypeIDDesc.selectedIndex].value;
        }

        var getZoneTypeIDDescEN = document.getElementById("zoneTypeIDEN");
        var getZoneTypeIDDescTextEN;
        if (getZoneTypeIDDescEN) {
            getZoneTypeIDDescTextEN = getZoneTypeIDDescEN.options[getZoneTypeIDDescEN.selectedIndex].innerHTML;
            var value = getZoneTypeIDDescEN.options[getZoneTypeIDDescEN.selectedIndex].value;
        }


        var getZoneCompany = document.getElementById("zoneCompany");
        var getZoneCompanyText;
        if (getZoneCompany) {
            getZoneCompanyText = getZoneCompany.options[getZoneCompany.selectedIndex].innerHTML;
            var value = getZoneCompany.options[getZoneCompany.selectedIndex].value;
        }


        var getZoneTypeDesc = getZoneTypeIDDescText;
        var getZoneTypeIDEN = $('#zoneTypeIDEN').val();
        var getZoneTypeDescEN = getZoneTypeIDDescTextEN;
        var getCompanyID = $('#zoneCompany').val();
        var getCompany = getZoneCompanyText;
        var getDateCreated = $('#zoneDateCreated').val();


        sessionStorage.setItem("setSessionstorageValueZoneID", getZoneID);
        sessionStorage.setItem("setSessionstorageValueZoneName", getZoneName);
        sessionStorage.setItem("setSessionstorageValueZoneNameEN", getZoneNameEN);
        sessionStorage.setItem("setSessionstorageValueZoneTypeID", getZoneTypeID);
        sessionStorage.setItem("setSessionstorageValueZoneTypeDesc", getZoneTypeDesc);
        sessionStorage.setItem("setSessionstorageValueZoneTypeIDEN", getZoneTypeIDEN);
        sessionStorage.setItem("setSessionstorageValueZoneTypeDescEN", getZoneTypeDescEN);
        sessionStorage.setItem("setSessionstorageValueZoneCompanyID", getCompanyID);
        sessionStorage.setItem("setSessionstorageValueZoneCompany", getCompany);
        sessionStorage.setItem("setSessionstorageValueZoneDateCreated", getDateCreated);

        window.location.href = 'edit-zones.html';

        //var panel1 = $.jsPanel({
        //    iframe: {
        //        src: "edit-zones.html",
        //        id: "myFrame",
        //        style: { "display": "none", "border": "10px solid transparent" },
        //        width: '100%',
        //        height: '100%'
        //    },

        //    callback: function () {
        //        document.getElementById("myFrame").onload = function () {
        //            $("#myFrame").fadeIn(1000);
        //        }
        //    },
        //    size: { width: 780, height: 540 },
        //    position: { left: "center", top: 30 },
        //    title: 'แก้ไข โซน', //Draw Zones
        //    theme: "black"
        //});

    });
});

$(document).ready(function () {
    $('#editZonesEN').click(function () {


        var getZoneID = $('#zoneID').val();
        var getZoneName = $('#zoneName').val();
        var getZoneNameEN = $('#zoneNameEN').val();
        var getZoneTypeID = $('#zoneTypeID').val();

        var getZoneTypeIDDesc = document.getElementById("zoneTypeID");
        var getZoneTypeIDDescText;
        if (getZoneTypeIDDesc) {
            getZoneTypeIDDescText = getZoneTypeIDDesc.options[getZoneTypeIDDesc.selectedIndex].innerHTML;
            var value = getZoneTypeIDDesc.options[getZoneTypeIDDesc.selectedIndex].value;
        }

        var getZoneTypeIDDescEN = document.getElementById("zoneTypeIDEN");
        var getZoneTypeIDDescTextEN;
        if (getZoneTypeIDDescEN) {
            getZoneTypeIDDescTextEN = getZoneTypeIDDescEN.options[getZoneTypeIDDescEN.selectedIndex].innerHTML;
            var value = getZoneTypeIDDescEN.options[getZoneTypeIDDescEN.selectedIndex].value;
        }


        var getZoneCompany = document.getElementById("zoneCompany");
        var getZoneCompanyText;
        if (getZoneCompany) {
            getZoneCompanyText = getZoneCompany.options[getZoneCompany.selectedIndex].innerHTML;
            var value = getZoneCompany.options[getZoneCompany.selectedIndex].value;
        }


        var getZoneTypeDesc = getZoneTypeIDDescText;
        var getZoneTypeIDEN = $('#zoneTypeIDEN').val();
        var getZoneTypeDescEN = getZoneTypeIDDescTextEN;
        var getCompanyID = $('#zoneCompany').val();
        var getCompany = getZoneCompanyText;
        var getDateCreated = $('#zoneDateCreated').val();


        sessionStorage.setItem("setSessionstorageValueZoneID", getZoneID);
        sessionStorage.setItem("setSessionstorageValueZoneName", getZoneName);
        sessionStorage.setItem("setSessionstorageValueZoneNameEN", getZoneNameEN);
        sessionStorage.setItem("setSessionstorageValueZoneTypeID", getZoneTypeID);
        sessionStorage.setItem("setSessionstorageValueZoneTypeDesc", getZoneTypeDesc);
        sessionStorage.setItem("setSessionstorageValueZoneTypeIDEN", getZoneTypeIDEN);
        sessionStorage.setItem("setSessionstorageValueZoneTypeDescEN", getZoneTypeDescEN);
        sessionStorage.setItem("setSessionstorageValueZoneCompanyID", getCompanyID);
        sessionStorage.setItem("setSessionstorageValueZoneCompany", getCompany);
        sessionStorage.setItem("setSessionstorageValueZoneDateCreated", getDateCreated);

        window.location.href = 'edit-zones.html';

        //var panel1 = $.jsPanel({
        //    iframe: {
        //        src: "edit-zones.html",
        //        id: "myFrame",
        //        style: { "display": "none", "border": "10px solid transparent" },
        //        width: '100%',
        //        height: '100%'
        //    },

        //    callback: function () {
        //        document.getElementById("myFrame").onload = function () {
        //            $("#myFrame").fadeIn(1000);
        //        }
        //    },
        //    size: { width: 780, height: 540 },
        //    position: { left: "center", top: 30 },
        //    title: 'Edit Zones', //Draw Zones
        //    theme: "black"
        //});


    });
});


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


var getSessionstorageValuePerimeterLength = sessionStorage.getItem('setSessionstorageValuePerimeterLength');



if (getSessionstorageValuePerimeterLength != "" && getSessionstorageValuePerimeterLength != null) {


    if (getSessionstorageValueLanguage == "th")
    {
        setTimeout(function () {

        $('.add-zone').trigger('click');
       
        }, 700);     
    }
    else if (getSessionstorageValueLanguage == "en")
    {
        setTimeout(function () {
        $('.add-zoneEN').trigger('click');

        }, 700);
   
    }

 

}

$(function () {

    $('.tgl-menu-btn').click(function () {

        setTimeout(function () {
            $('#zones-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.add-zone').click(function () {

        setTimeout(function () {
            $('#zones-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.add-zoneEN').click(function () {

        setTimeout(function () {
            $('#zones-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.edit-zone').click(function () {

        setTimeout(function () {
            $('#zones-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.edit-zoneEN').click(function () {

        setTimeout(function () {
            $('#zones-editable').bootstrapTable('resetView');

        }, 500);


    });


});


window.onresize = function (event) {
    setTimeout(function () {
        $('#zones-editable').bootstrapTable('resetView');

    }, 500);
};


// Operate Formatter

function operateFormatter(value, row, index) {
    return [
        '<div><a class="viewZone" href="javascript:void(0)" title="">',
            '<i class="fa fa-map" style="color:white"></i>',
        '</a></div>'
    ].join('');
}

//JS Panel

window.operateEvents = {
    'click .viewZone': function (e, value, row, index) {
        //alert('You click like icon, row: ' + JSON.stringify(row));
        //console.log(value, row, index);

        //Store
        localStorage.setItem("row", JSON.stringify(row));

        //Then retrieve
        var localObj = JSON.parse(localStorage.getItem(row));


        var panel1 = $.jsPanel({
            iframe: {
                src: "zone_map.html",
                id: "myFrame",
                style: { "display": "none", "border": "10px solid transparent" },
                width: '100%',
                height: '100%'
            },

            callback: function () {
                document.getElementById("myFrame").onload = function () {
                    $("#myFrame").fadeIn(1000);
                }
            },
            size: { width: 780, height: 540 },
            position: { left: "center", top: 30 },
            title: row.Name, //Zones
            theme: "black"
        });


    }
};

//Translation of Forms
if (getSessionstorageValueLanguage == "en") {
    $('#zoneNameEN').attr('placeholder', "Enter Zone Name");
    $("#zoneName").html("Zone Name");

    $("#typeZone").html("Type");
    $("#resellerName").text("Reseller");
    $("#companyName").text("Company");

    $("#showDrawZone").text("Draw Zones");
    $("#showEditZone").text("Edit Zones");
    $("#drawZonesEN").text("Draw Boundary");
    $("#editZonesEN").text("Edit Boundary");
    $("#perimeterName").text("Perimeter");
    $("#colorName").text("Color");

    $("#submit-zonesEN").text("Save");
    $("#clickLogoutEN").text("OK");
    $("#zone-confirm-deleteEN").text("Delete");

    $("#zone-confirm-addEN").text("Add Zone");
    $("#zone-confirm-editEN").text("Edit Zone");


    $("#uploadUser").text("Upload");
    $("#ZonesExportWordEN").text("MS Word");
    $("#ZonesExportPDFEN").text("PDF");
    $("#ZonesExportExcelEN").text("Excel");


}
else if (getSessionstorageValueLanguage == "th") {
    $('#zoneNameEN').attr('placeholder', "กรุณาใส่ชื่อ โซน");
    $("#zoneName").html("ชื่อ โซน");

    $("#typeZone").text("ชนิด");
    $("#resellerName").text("ผู้ค้าปลีก");
    $("#companyName").text("บริษัท");

    $("#showDrawZone").text("วาดโซน");
    $("#showEditZone").text("แก้ไขโซน");
    $("#drawZonesEN").text("วาดเขตแดน");
    $("#editZonesEN").text("แก้ไขเขตแดน");
    $("#perimeterName").text("ปริมณฑล");
    $("#colorName").text("สี");

    $("#submit-zonesEN").text("บันทึก");
    $("#clickLogoutEN").text("ตกลง");
    $("#zone-confirm-deleteEN").text("ลบ");
    $("#zone-confirm-addEN").text("เพิ่ม โซน");
    $("#zone-confirm-editEN").text("แก้ไข โซน<");

    $("#uploadUser").text("อัปโหลด");
    $("#ZonesExportWordEN").text("ไมโครซอฟท์ คำ");
    $("#ZonesExportPDFEN").text("รูปแบบไฟล์ PDF");
    $("#ZonesExportExcelEN").text("ไมโครซอฟท์ Excel");

}
else if (getSessionstorageValueLanguage == "vn") {
    $('#zoneNameEN').attr('placeholder', 'Nhập Tên Vùng');
    $("#zoneName").html("Tên Vùng");

    $("#typeZone")
    $("#resellerName").text("Dại Lý Bán Lẻ");
    $("#companyName").text("Công ty");

    $("#showDrawZone").text("Vẽ Vùng");
    $("#showEditZone").text("Sửa Vùng");
    $("#drawZonesEN").text("Vẽ Ranh Giới");
    $("#editZonesEN").text("Chỉnh Sửa Ranh Giới");
    $("#perimeterName").text("Màu");

    $("#submit-zonesEN").text("Gửi Đi");
    $("#clickLogoutEN").text("Đồng Ý");
    $("#zone-confirm-deleteEN").text("Xóa");
    $("#zone-confirm-addEN").text("Thêm Vùng");
    $("#zone-confirm-editEN").text("Sửa Vùng");

    $("#uploadUser").text("Tải lên");
    $("#ZonesExportWordEN").text("Xuất Word");
    $("#ZonesExportPDFEN").text("Xuất PDF");
    $("#ZonesExportExcelEN").text("Xuất Excel");

}
else if (getSessionstorageValueLanguage == "id") {
    $('#zoneNameEN').attr('placeholder', 'Masukkan Nama Zona');
    $("#zoneName").html("Nama Zona");

    $("#typeZone").text("Jenis");
    $("#resellerName").text("Pengecer");
    $("#companyName").text("Perusahaan");

    $("#showDrawZone").text("Tunjuk Zona");
    $("#showEditZone").text("Ubah Zona");
    $("#drawZonesEN").text("Lukis Zona");
    $("#editZonesEN").text("Ubah Zona");
    $("#perimeterName").text("Warna");

    $("#submit-zonesEN").text("Simpan");
    $("#clickLogoutEN").text("Baik");
    $("#zone-confirm-deleteEN").text("Hapus Rekor");
    $("#zone-confirm-addEN").text("Tambahkan Zona");
    $("#zone-confirm-editEN").text("Ubah Zona");

    $("#uploadUser").text("Upload");

    $("#ZonesExportWordEN").text("Ekspor ke Word");
    $("#ZonesExportPDFEN").text("Ekspor ke PDF");
    $("#ZonesExportExcelEN").text("Ekspor ke Excel");
}