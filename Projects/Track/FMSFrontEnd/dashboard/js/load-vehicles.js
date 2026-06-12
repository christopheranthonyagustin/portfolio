
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
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


//On Load Reseller
var WebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {

        $.each(data, function (index, item) {
            if (item.ResellerID == 4)
            {
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#mobile-assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
            }
            else
            {
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#mobile-assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            }
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    WebAPIReseller = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#mobile-assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#formsReseller').remove();
    $('#modal-assetReseller').remove();
}



//OnLoad Company
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {


        $.each(data, function (index, item) {

            if (item.CompanyID == 2)
            {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
            }
            else
            {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            }

        });


        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {
        $.each(data, function (index, item) {
            if (item.CompanyID == getSessionstorageValueCompanyID) {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
            }
            else
            {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            }
        });

        $(".selectpicker").selectpicker('refresh');

    });
} else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {
            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));4
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
        $("#vehicles-editable").empty();

        $('#mobile-assetReseller').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        $('#load-reseller').empty();
        $('.select-reseller-filter').selectpicker('refresh');


        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://103.237.168.119/tracksgwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#mobile-assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#mobile-assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#assetReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-assetReseller').selectpicker('refresh');
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://103.237.168.119/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#assetReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-assetReseller').selectpicker('refresh');
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#modal-assetReseller').remove();
            $('#load-reseller').remove();
        }

        $('#assetCompany').empty();
        $(".SelectFormCompanyFilter").selectpicker('refresh');

        $('#mobile-load-company').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#load-company').empty();
        $(".select-company-filter").selectpicker('refresh');


        $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#mobile-load-company').append($('<option></option>').val(0).html("-------"));
            $('#assetCompany').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));

            $.each(data, function (index, item) {
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
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
        $("#vehicles-editable").empty();
        $('#mobile-assetReseller').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        $('#assetReseller').empty();
        $('.SelectFormResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://103.237.168.119/tracksgwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#mobile-assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#mobile-assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                        $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-assetReseller').selectpicker('refresh');
                $('#assetReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://103.237.168.119/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#mobile-assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#mobile-assetReseller').selectpicker('refresh');
                $('#assetReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#modal-assetReseller').remove();
            $('#assetReseller').remove();
        }

        $('#load-company').empty();
        $(".select-company-filter").selectpicker('refresh');

        $('#mobile-load-company').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#assetCompany').empty();
        $(".SelectFormCompanyFilter").selectpicker('refresh');

        $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#mobile-load-company').append($('<option></option>').val(0).html("-------"));
            $('#assetCompany').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));


            $.each(data, function (index, item) {
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
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
        $("#vehicles-editable").empty();
        $('#load-reseller').empty();
        $('.select-reseller-filter').selectpicker('refresh');

        $('#assetReseller').empty();
        $('.SelectFormResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("http://103.237.168.119/tracksgwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                        $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#mobile-assetReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
                $('#assetReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("http://103.237.168.119/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#mobile-assetReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
                $('#assetReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#load-reseller').selectpicker('refresh');
            $('#assetReseller').remove();
        }

        $('#load-company').empty();
        $(".select-company-filter").selectpicker('refresh');

        $('#mobile-load-company').empty();
        $(".MobileSelectCompanyFilter").selectpicker('refresh');

        $('#assetCompany').empty();
        $(".SelectFormCompanyFilter").selectpicker('refresh');

        $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#mobile-load-company').append($('<option></option>').val(0).html("-------"));
            $('#assetCompany').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));


            $.each(data, function (index, item) {
                $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
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

        var getReseller = $('#assetReseller').val();

        if (selectedCompany != 0) {

            //Select New Company
            $('#mobile-load-company').empty();
            $(".MobileSelectCompanyFilter").selectpicker('refresh');

            $('#load-company').empty();
            $(".select-company-filter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }
                    });
                    var getCompany = $("#assetCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".select-company-filter").selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("http://track.asiacom.co.th/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });
                    var getCompany = $("#assetCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".select-company-filter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });

                    var getCompany = $("#assetCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".select-company-filter").selectpicker('refresh');

                });
            }

            //Select New Driver
            $('#assetDriver').empty();
            $(".SelectDriverFilter").selectpicker('refresh');

            $('#mobile-assetDriver').empty();
            $(".MobileSelectDriverFilter").selectpicker('refresh');

            var WebAPIDriver = "";

            if (getSessionstorageValueRoleID == 1) {
                WebAPIDriver = 'http://103.237.168.119/tracksgwebapi/api/driverinfo?ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
            }

            else if (getSessionstorageValueRoleID == 2) {
                WebAPIDriver = 'http://103.237.168.119/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID;

            }
            else if (getSessionstorageValueRoleID >= 3) {
                WebAPIDriver = 'http://103.237.168.119/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
            }

            $.getJSON(WebAPIDriver, function (data) {

                $('#assetDriver').append($('<option></option>').val(0).html('-------'));
                $('#mobile-assetDriver').append($('<option></option>').val(0).html('-------'));

                $.each(data, function (index, item) {
                    var AssignedAsset = item.AssetID;

                    if (AssignedAsset != 0) {

                    } else {
                        $('#assetDriver').append($('<option data-imagesrc="' + item.Image + '"></option>').val(item.DriverID).html(item.Name));
                        $('#mobile-assetDriver').append($('<option data-imagesrc="' + item.Image + '"></option>').val(item.DriverID).html(item.Name));
                    }
                });

                $('.selectpicker').selectpicker('refresh');
            });


            //Select New Zones
            $('#assetZoneEN').empty();
            $(".SelectZoneFilter").selectpicker('refresh');

            $('#mobile-assetZoneEN').empty();
            $(".MobileSelectZoneFilter").selectpicker('refresh');
            
            var getZone = "";

            if (getSessionstorageValueRoleID == 1) {
                getZone = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;

                $.getJSON(getZone, function (data) {
                    $.each(data, function (index, item) {

                        $('#mobile-assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));
                        $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));

                    });

                    $('.selectpicker').selectpicker('refresh');
                });

            }

            else if (getSessionstorageValueRoleID == 2) {
                getZone = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID;

                $.getJSON(getZone, function (data) {
                    $.each(data, function (index, item) {
                        $('#mobile-assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));
                        $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));

                    });

                    $('.selectpicker').selectpicker('refresh');
                });

            }

            else if (getSessionstorageValueRoleID >= 3) {
                getZone = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

                $.getJSON(getZone, function (data) {
                    $.each(data, function (index, item) {
                        $('#mobile-assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));
                        $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));
                    });

                    $('.selectpicker').selectpicker('refresh');
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
        var getReseller = $('#load-reseller').val();

        if (selectedCompany != 0) {

            //Select New Company
            $('#mobile-load-company').empty();
            $(".MobileSelectCompanyFilter").selectpicker('refresh');

            $('#assetCompany').empty();
            $(".SelectFormCompanyFilter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + getReseller, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }
                    });
                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".SelectFormCompanyFilter").selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("http://track.asiacom.co.th/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });
                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".MobileSelectCompanyFilter").selectpicker('refresh');
                    $(".SelectFormCompanyFilter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#mobile-load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
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
            $('#vehicles-editable').empty();
            //Select New Company
            $('#load-company').empty();
            $(".select-company-filter").selectpicker('refresh');

            $('#assetCompany').empty();
            $(".SelectFormCompanyFilter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + getReseller, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }
                    });
                    var getCompany = $("#mobile-load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".select-company-filter").selectpicker('refresh');
                    $(".SelectFormCompanyFilter").selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("http://track.asiacom.co.th/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });
                    var getCompany = $("#mobile-load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".select-company-filter").selectpicker('refresh');
                    $(".SelectFormCompanyFilter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });

                    var getCompany = $("#mobile-load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".select-company-filter").selectpicker('refresh');
                    $(".SelectFormCompanyFilter").selectpicker('refresh');

                });
            }

            //Select New Driver
            $('#assetDriver').empty();
            $(".SelectDriverFilter").selectpicker('refresh');

            $('#mobile-assetDriver').empty();
            $(".MobileSelectDriverFilter").selectpicker('refresh');

            var WebAPIDriver = "";

            if (getSessionstorageValueRoleID == 1) {
                WebAPIDriver = 'http://103.237.168.119/tracksgwebapi/api/driverinfo?ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
            }

            else if (getSessionstorageValueRoleID == 2) {
                WebAPIDriver = 'http://103.237.168.119/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID;

            }
            else if (getSessionstorageValueRoleID >= 3) {
                WebAPIDriver = 'http://103.237.168.119/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
            }

            $.getJSON(WebAPIDriver, function (data) {

                $('#assetDriver').append($('<option></option>').val(0).html('-------'));
                $('#mobile-assetDriver').append($('<option></option>').val(0).html('-------'));

                $.each(data, function (index, item) {
                    var AssignedAsset = item.AssetID;

                    if (AssignedAsset != 0) {

                    } else {
                        $('#assetDriver').append($('<option data-imagesrc="' + item.Image + '"></option>').val(item.DriverID).html(item.Name));
                        $('#mobile-assetDriver').append($('<option data-imagesrc="' + item.Image + '"></option>').val(item.DriverID).html(item.Name));
                    }
                });

                $('.selectpicker').selectpicker('refresh');
            });


            //Select New Zones
            $('#assetZoneEN').empty();
            $(".SelectZoneFilter").selectpicker('refresh');

            $('#mobile-assetZoneEN').empty();
            $(".MobileSelectZoneFilter").selectpicker('refresh');

            var getZone = "";

            if (getSessionstorageValueRoleID == 1) {
                getZone = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;

                $.getJSON(getZone, function (data) {
                    $.each(data, function (index, item) {

                        $('#mobile-assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));
                        $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));

                    });

                    $('.selectpicker').selectpicker('refresh');
                });

            }

            else if (getSessionstorageValueRoleID == 2) {
                getZone = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID;

                $.getJSON(getZone, function (data) {
                    $.each(data, function (index, item) {
                        $('#mobile-assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));
                        $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));

                    });

                    $('.selectpicker').selectpicker('refresh');
                });

            }

            else if (getSessionstorageValueRoleID >= 3) {
                getZone = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

                $.getJSON(getZone, function (data) {
                    $.each(data, function (index, item) {
                        $('#mobile-assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));
                        $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));
                    });

                    $('.selectpicker').selectpicker('refresh');
                });

            }
        }

    });


});


//OnChange Table
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
        //$("#load-reseller").remove();
        selectedReseller = getSessionstorageValueUserResellerID;

    }
    else if (getSessionstorageValueRoleID >= 3) {

        // $("#load-reseller").remove();
        //$(".select-reseller-filter").hide();
        $('#submit-filter').hide();
        selectedReseller = getSessionstorageValueUserResellerID;

    }

    $(".select-company-filter").change(function () {
        selectedCompany = $(this).find("option:selected").val();


    });


    $("#submit-filter").click(function () {

        $('#vehicles-editable').bootstrapTable('destroy');

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

        var WebAPI;

        if (getSessionstorageValueRoleID == 1) {

         WebAPI = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany;
        
        } else {

         WebAPI = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany;


        }

       
        $('#vehicles-editable').bootstrapTable({
            idField: 'id',
            url: WebAPI,
            columns: [{
                field: 'state',
                title: 'ID',
                checkbox: 'true'
            }, {
                field: 'AssetID',
                title: 'ID',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg',
                formatter: 'vehicleFormatter'
            },

            {
                field: 'Company',
                title: 'Company Name',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg'
            },

            {
                field: 'Name',
                title: 'Vehicle',
                sortable: 'true',
                //title: 'ชื่อ ยานพาหนะ'
            }, {
                field: 'Category',
                title: 'Category',
                sortable: 'true',
                //title: 'หมวดหมู่',
                formatter: 'assetFormatter'
            }, {
                field: 'Tag',
                title: 'Device',
                sortable: 'true',
                //title: 'ชื่ออุปกรณ์'
            }, {
                field: 'Phone',
                title: 'Phone',
                sortable: 'true',
                //title: 'โทรศัพท์'
            }, {
                field: 'Email',
                title: 'Email',
                sortable: 'true',
                //title: 'อีเมล์'
            }, {
                field: 'InstallDate',
                title: 'Install Date',
                sortable: 'true',
                //title: 'วันที่ ติดตั้ง',
                formatter: 'dateFormatter'
            }, {
                field: 'Image',
                title: 'Driver Profile',
                formatter: 'nameFormatter'
            }],


            onCheck: function (row) {

                $('#mobile-assetDriver').empty();
                $('.MobileSelectDriverFilter').selectpicker('refresh');

                $("#toggle-aside").hide(); //Add Vehicle
                $("#toggle-aside2").show(); //Edit Vehicle
                $("#PhoneNumber").show();
                $("#EmailAddress").show();

                var assetID = $('#assetID').val(row.AssetID);

                $("#displayDriver").show();
                if (row.ImageFill == "Uniform") {
                    // document["showDriver"].src = row.Driver.Image;
                    $("#showDriver").attr("src", row.Image);
                }

                var getCheckbox = $('table input[type=checkbox]:checked').length;

                if (getCheckbox == 1) {

                    if (row.Tag == "--")
                    {
                        var assetDevice = $("#assetDevice").val('<option value="0" selected="selected">No Device</option>');
                    }
                    else
                    {
                        var assetDevice = $("#assetDevice").append('<option value="' + row.Tag + '" selected="selected">' + row.Tag + '</option>');
                    }
                   

                    if (row.DriverID != 0) {
                        var assetDriver = $("#assetDriver").append('<option value="' + row.DriverID + '" selected="selected">' + row.Driver.Name + '</option>');
                    }
                }

                var assetName = $('#assetName').val(row.Name);
                var assetNameEN = $('#assetNameEN').val(row.Name);
                var assetCategoryID = $('#assetCategoryID').val(row.CategoryID);
                var assetCategory = $('#assetCategory').val(row.Category);
                //var assetDevice = $('#assetDevice').val(row.Tag);
                //var assetCompany = $('#assetCompany').val(row.Company);
                var assetCompany = $('#assetCompany').val(row.CompanyID);
                //var assetDriver = $('#assetDriver').val(row.DriverID);
                //var assetDriverEN = $('#assetDriverEN').val(row.DriverID);
                var assetPhone = $('#assetPhone').val(row.Driver.Phone);
                var assetPhoneEN = $('#assetPhoneEN').val(row.Driver.Phone);
                var assetEmail = $('#assetEmail').val(row.Driver.Email);
                var assetEmailEN = $('#assetEmailEN').val(row.Driver.Email);
                //var assetImage = $('#assetImage').val(row.Image);
                //var assetZone = $('#assetZone').val(row.AlertZones);
                var assetZoneEN = $('#assetZoneEN').val(row.AlertZones);
                var assetMileage = $('#assetMileage').val(row.Mileage);
                var assetMileageEN = $('#assetMileageEN').val(row.Mileage);
                var assetDistanceAlert = $('#assetDistanceAlert').val(row.Remarks);
                var assetDistanceAlertEN = $('#assetDistanceAlertEN').val(row.Remarks);
                var assetDateAlert = $('#assetDateAlert').val(row.Remarks);
                var assetDateAlertEN = $('#assetDateAlertEN').val(row.Remarks);
                var assetIdlingLimit = $('#assetIdlingLimit').val(row.Remarks);
                var assetIdlingLimitEN = $('#assetIdlingLimitEN').val(row.Remarks);
                var assetSpeedLimit = $('#assetSpeedLimit').val(row.SpeedLimit);
                var assetSpeedLimitEN = $('#assetSpeedLimitEN').val(row.SpeedLimit);
                //Convert String to Array
                var Zones = row.AlertZones;
                var AssignedAlertZones = new Array();
                AssignedAlertZones = Zones.split(",");
                for (a in AssignedAlertZones) {
                    AssignedAlertZones[a] = parseInt(AssignedAlertZones[a], 10);
                }

                var assetZones = $('#assetZone').val(AssignedAlertZones);
                var assetZonesEN = $('#assetZoneEN').val(AssignedAlertZones);

                var InstallDate = row.InstallDate;
                var Bangkok = moment.tz(InstallDate, 'Asia/Bangkok');
                //Format UTC
                var timestamp = moment(Bangkok.format()).add('hours', 8).format("D-MMM-YYYY, hh:mm:ss A");
                $('#assetInstallDate').val(timestamp);


                $('.selectpicker').selectpicker('refresh');
            },

            onUncheck: function (row) {

                $("#assetDevice").remove();
                $("#toggle-aside").show(); //Add Vehicle
                $("toggle-aside2").hide(); //Edit Vehicle
                clearDriverForms();
                //window.location.reload(true);
            },

            onLoadSuccess: function (row) {
                $("#displayDriver").hide();
                $("#toggle-aside2").hide();
                $("#PhoneNumber").hide();
                $("#EmailAddress").hide();

            }

            //onLoadError: function () {

            //    alert('Event: onLoadError, data: ' + alert('error'));
            //}


        });


    });


});

//OnLoad Table
$(document).ready(function () {
  

    var WebAPI = "";

    if (getSessionstorageValueRoleID == 1) {

        WebAPI = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + '4' + '&CompanyID=' + '2';

    }
    else if (getSessionstorageValueRoleID == 2)
    {

        WebAPI = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }
    else if (getSessionstorageValueRoleID >= 3)
    {

        WebAPI = 'http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }


    $('#vehicles-editable').bootstrapTable({
        idField: 'id',      
        url: WebAPI,
        columns: [{
            field: 'state',
            title: 'ID',
            checkbox: 'true'
        }, {
            field: 'AssetID',
            title: 'ID',
            class: 'hidden-xs hidden-sm hidden-md hidden-lg',
            formatter: 'vehicleFormatter'
        },

        {
            field: 'Company',
            title: 'Company Name',          
            class: 'hidden-xs hidden-sm hidden-md hidden-lg'
        },

        {
            field: 'Name',
            title: 'Vehicle',
            sortable: 'true',
            //title: 'ชื่อ ยานพาหนะ'
        }, {
            field: 'Category',
            title: 'Category',
            sortable: 'true',
            //title: 'หมวดหมู่',
            formatter: 'assetFormatter'
        }, {
            field: 'Tag',
            title: 'Device',
            sortable: 'true',
            //title: 'ชื่ออุปกรณ์'
        }, {
            field: 'Phone',
            title: 'Phone',
            sortable: 'true',
            //title: 'โทรศัพท์'
        }, {
            field: 'Email',
            title: 'Email',
            sortable: 'true',
            //title: 'อีเมล์'
        }, {
            field: 'InstallDate',
            title: 'Install Date',
            sortable: 'true',
            //title: 'วันที่ ติดตั้ง',
            formatter: 'dateFormatter'
        },{
            field: 'Image',
            title: 'Driver Profile',
            formatter: 'nameFormatter'
        },],


        onCheck: function (row) {

            //$('#assetDriver').empty();
            //$('.SelectDriverFilter').selectpicker('refresh');

            $('#mobile-assetDriver').empty();
            $('.MobileSelectDriverFilter').selectpicker('refresh');
                
            $("#toggle-aside").hide();
            $("#toggle-aside2").show();
            $("#PhoneNumber").show();
            $("#EmailAddress").show();

            var assetID = $('#assetID').val(row.AssetID);

            $("#displayDriver").show();
            if (row.ImageFill == "Uniform") {
                // document["showDriver"].src = row.Driver.Image;
                $("#showDriver").attr("src", row.Image);
            }

            var getCheckbox = $('table input[type=checkbox]:checked').length;
            
            if (getCheckbox == 1)
            {

                if (row.Tag == "--") {
                    var assetDevice = $("#assetDevice").val('<option value="0" selected="selected">No Device</option>');
                }
                else {
                    var assetDevice = $("#assetDevice").append('<option value="' + row.Tag + '" selected="selected">' + row.Tag + '</option>');
                }

              if (row.DriverID != 0)
              {
                 var assetDriver = $("#assetDriver").append('<option value="' + row.DriverID + '" selected="selected">' + row.Driver.Name + '</option>');                
              }
            }
                 
            var assetName = $('#assetName').val(row.Name);
            var assetNameEN = $('#assetNameEN').val(row.Name);
            var assetCategoryID = $('#assetCategoryID').val(row.CategoryID);
            var assetCategory = $('#assetCategory').val(row.Category);
            //var assetDevice = $('#assetDevice').val(row.Tag);
            //var assetCompany = $('#assetCompany').val(row.Company);
            var assetCompany = $('#assetCompany').val(row.CompanyID);
            //var assetDriver = $('#assetDriver').val(row.DriverID);
            //var assetDriverEN = $('#assetDriverEN').val(row.DriverID);
            var assetPhone = $('#assetPhone').val(row.Driver.Phone);
            var assetPhoneEN = $('#assetPhoneEN').val(row.Driver.Phone);
            var assetEmail = $('#assetEmail').val(row.Driver.Email);
            var assetEmailEN = $('#assetEmailEN').val(row.Driver.Email);
            //var assetImage = $('#assetImage').val(row.Image);
            //var assetZone = $('#assetZone').val(row.AlertZones);
            var assetZoneEN = $('#assetZoneEN').val(row.AlertZones);
            var assetMileage = $('#assetMileage').val(row.Mileage);
            var assetMileageEN = $('#assetMileageEN').val(row.Mileage);
            var assetDistanceAlert = $('#assetDistanceAlert').val(row.Remarks);
            var assetDistanceAlertEN = $('#assetDistanceAlertEN').val(row.Remarks);
            var assetDateAlert = $('#assetDateAlert').val(row.Remarks);
            var assetDateAlertEN = $('#assetDateAlertEN').val(row.Remarks);
            var assetIdlingLimit = $('#assetIdlingLimit').val(row.Remarks);
            var assetIdlingLimitEN = $('#assetIdlingLimitEN').val(row.Remarks);
            var assetSpeedLimit = $('#assetSpeedLimit').val(row.SpeedLimit);
            var assetSpeedLimitEN = $('#assetSpeedLimitEN').val(row.SpeedLimit);
	        //Convert String to Array
            var Zones = row.AlertZones;
            var AssignedAlertZones = new Array();
            AssignedAlertZones = Zones.split(",");
            for (a in AssignedAlertZones) {
                AssignedAlertZones[a] = parseInt(AssignedAlertZones[a], 10);
            }

            var assetZones = $('#assetZone').val(AssignedAlertZones);
            var assetZonesEN = $('#assetZoneEN').val(AssignedAlertZones);

            var InstallDate = row.InstallDate;
            var Bangkok = moment.tz(InstallDate, 'Asia/Bangkok');
            //Format UTC
            var timestamp = moment(Bangkok.format()).add('hours', 7).format("D-MMM-YYYY, hh:mm:ss A");
            $('#assetInstallDate').val(timestamp);


            $('.selectpicker').selectpicker('refresh');
        },

        onUncheck: function (row) {
           
            $("#assetDevice").remove();
            $("#toggle-aside").show(); //Add Vehicle
            $("toggle-aside2").hide(); //Edit Vehicle
            clearDriverForms();
            //window.location.reload(true);
        },

        onLoadSuccess: function (row) {
            $("#displayDriver").hide();
            $("#toggle-aside2").hide();
            $("#PhoneNumber").hide();
            $("#EmailAddress").hide();
 
        }

    });


	    
});



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
var $table = $('#vehicles-editable'), $remove = $('#vehicle-confirm-delete'), $removeEN = $('#vehicle-confirm-deleteEN');



$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);


});





var url = 'http://track.asiacom.co.th/tracksgwebapi/api/assetinfo';
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
    if (value == "Car") return '<i class="fa fa-car fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Van") return ' ' + value;
    if (value == "Truck") return '<i class="fa fa-truck fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Motorcycle") return '<i class="fa fa-motorcycle fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Ship") return '<i class="fa fa-ship fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Train") return '<i class="fa fa-train fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Mixer") return ' ' + value;
    if (value == "10t") return ' ' + value;
    if (value == "6t") return ' ' + value;
    if (value == "3.5t") return ' ' + value;
    if (value == "2.5t") return ' ' + value;
    if (value == "Lorry Crane") return ' ' + value;
    if (value == "Bus") return '<i class="fa fa-bus fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Recovery Veh") return '<i class="fa fa-ambulance fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Prime Mover") return ' ' + value;
    if (value == "Household") return '<i class="fa fa-cab fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Trailer") return '<i class="fa fa-truck fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value
    if (value == "Flatbed Truck") return '<i class="fa fa-truck fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Hooklift Truck") return '<i class="fa fa-truck fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Vacuum Truck") return '<i class="fa fa-truck fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Crane Truck") return '<i class="fa fa-truck fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Tipper Truck") return '<i class="fa fa-truck fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Reefer Truck") return '<i class="fa fa-truck fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Lorry") return '<i class="fa fa-truck fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "10 Footer Lorry") return '<i class="fa fa-truck fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "14 Footer Lorry") return '<i class="fa fa-truck fa-xs hidden-xs hidden-md">&nbsp;</i> ' + value;
    if (value == "Excavator") return ' ' + value;
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
//On Load Category
$.getJSON("http://103.237.168.119/tracksgwebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#assetCategory').append($('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc));
        $('#mobile-assetCategory').append($('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc));
    });

    $('.selectpicker').selectpicker('refresh');
});


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

        window.location.href = 'http://track.asiacom.co.th/sg/'; //Login URL

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


//OnLoad Zones
var getZone = "";

    if (getSessionstorageValueRoleID == 1)
    {
        getZone = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + '4' + '&CompanyID=' + '2';

        $.getJSON(getZone, function (data) {
            $.each(data, function (index, item) {

                $('#mobile-assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));
                $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));

            });

            $('.selectpicker').selectpicker('refresh');
        });

    }
    
    else if (getSessionstorageValueRoleID == 2) {
        getZone = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

        $.getJSON(getZone, function (data) {
            $.each(data, function (index, item) {

                $('#mobile-assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));
                $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));

            });

            $('.selectpicker').selectpicker('refresh');
        });

    }

    else if (getSessionstorageValueRoleID >= 3)
    {
        getZone = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

        $.getJSON(getZone, function (data) {
            $.each(data, function (index, item) {
                $('#mobile-assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));
                $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));
            });

            $('.selectpicker').selectpicker('refresh');
        });

    }




    $(function () {

        $('.tgl-menu-btn').click(function () {

            setTimeout(function () {
                $('#vehicles-editable').bootstrapTable('resetView');

            }, 500);


        });

        $('.add-vehicle').click(function () {

            setTimeout(function () {
                $('#vehicles-editable').bootstrapTable('resetView');

            }, 500);


        });

        $('.add-vehicleEN').click(function () {

            setTimeout(function () {
                $('#vehicles-editable').bootstrapTable('resetView');

            }, 500);


        });

        $('.edit-vehicle').click(function () {

            setTimeout(function () {
                $('#vehicles-editable').bootstrapTable('resetView');

            }, 500);


        });

        $('.edit-vehicleEN').click(function () {

            setTimeout(function () {
                $('#vehicles-editable').bootstrapTable('resetView');

            }, 500);


        });


    });


    window.onresize = function(event) {
        setTimeout(function () {
        $('#vehicles-editable').bootstrapTable('resetView');

        }, 500);
    };




    var WebAPIDriver = "";

    if (getSessionstorageValueRoleID == 1) {
        WebAPIDriver = 'http://103.237.168.119/tracksgwebapi/api/driverinfo?ResellerID=' + '4' + '&CompanyID=' + '2';
    }

    else if (getSessionstorageValueRoleID == 2) {
        WebAPIDriver = 'http://103.237.168.119/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    }
    else if (getSessionstorageValueRoleID >= 3) {
        WebAPIDriver = 'http://103.237.168.119/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }

    $.getJSON(WebAPIDriver, function (data) {
        $.each(data, function (index, item) {
            var AssignedAsset = item.AssetID;

            if (AssignedAsset != 0) {
                //$('#assetDriver').append(
                //$('<option data-imagesrc="' + item.Image + '" disabled="disabled"></option>').val(item.DriverID).html(item.Name)
                //);

            } else {
                $('#assetDriver').append($('<option data-imagesrc="' + item.Image + '"></option>').val(item.DriverID).html(item.Name));
                $('#mobile-assetDriver').append($('<option data-imagesrc="' + item.Image + '"></option>').val(item.DriverID).html(item.Name));
            }        
        });

        $('.selectpicker').selectpicker('refresh');
    });

    $("#displayDriver").hide();
    function setImage(select) {
        $("#displayDriver").show();
        var image = document.getElementsByName("image-swap")[0];
        //image.src = select.options[select.selectedIndex].value;
        image.src = select.options[select.selectedIndex].dataset.imagesrc;

        if (select.value == "") {
         $("#displayDriver").hide();
        }


    }


    var selectedDevice = "";


    $.getJSON("http://103.237.168.119/tracksgwebapi/api/deviceinfo", function (data) {
        $.each(data, function (index, item) {
            var AssignedTags = item.AssetID;

            if (AssignedTags != 0) {
                //$('#assetDevice').append(
                //$('<option disabled="disabled"></option>').val(item.Name).html(item.Name)
                //);

            } else {
                $('#assetDevice').append($('<option data-installDate="' + item.InstallDate + '"></option>').val(item.Name).html(item.Name));
                $('#mobile-assetDevice').append($('<option data-installDate="' + item.InstallDate + '"></option>').val(item.Name).html(item.Name));

            }

                
        });

        $('.selectpicker').selectpicker('refresh');
    });


    $(document).ready(function () {
        $('select.getInstallDateDevice').change(function () {
            var getInstallDateDevice = $(this).find(':selected').attr('data-installDate')
            
            var Singapore = moment.tz(getInstallDateDevice, 'Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
            //Format UTC
            var timestamp = moment(Singapore.format()).add('hours', 8).format("D-MMM-YYYY, hh:mm:ss A");
            var assetInstallDate = $('#assetInstallDate').val(timestamp);

           
        });
    });

    $(document).ready(function () {
        $('select.mobile-getInstallDateDevice').change(function () {
            var getInstallDateDevice = $(this).find(':selected').attr('data-installDate')

            var Singapore = moment.tz(getInstallDateDevice, 'Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
            //Format UTC
            var timestamp = moment(Singapore.format()).add('hours', 8).format("D-MMM-YYYY, hh:mm:ss A");
            var assetInstallDate = $('#mobile-assetInstallDate').val(timestamp);


        });
    });


    function clearVehicleForms() {

        $('#assetID').val('');
        $('#assetNameEN').val('');
        $('#assetSpeedLimitEN').val('');
        $('#assetInstallDate').val('');
        $('#vehicles-editable').bootstrapTable('refresh');
    }

    function returnToTab1() {
        $('#main-wz').bootstrapWizard('first');
    }