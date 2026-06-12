
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


//Forms
var WebAPIReseller = "";

//Onload Reseller
if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'https://app.track-asia.com/tracksgwebapi/api/resellerinfo';

    $.getJSON(WebAPIReseller, function (data) {

        $.each(data, function (index, item) {

            if (item.ResellerID == "4") {
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

    WebAPIReseller = 'https://app.track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

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

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=" + "4", function (data) {

        $.each(data, function (index, item) {

            if (item.CompanyID == 2) {
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

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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
        $("#drivers-editable").empty();
        $('#mobile-driverResellerEN').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        $('#load-reseller').empty();
        $('.select-reseller-filter').selectpicker('refresh');


        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("https://app.track-asia.com/tracksgwebapi/api/resellerinfo", function (data) {
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
            $.getJSON("https://app.track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
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


        $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

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
        $("#drivers-editable").empty();
        $('#mobile-driverResellerEN').empty();
        $('.MobileSelectResellerFilter').selectpicker('refresh');

        $('#driverReseller').empty();
        $('.SelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("https://app.track-asia.com/tracksgwebapi/api/resellerinfo", function (data) {
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
            $.getJSON("https://app.track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
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

        $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

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
        $("#drivers-editable").empty();
        $('#load-reseller').empty();
        $('.select-reseller-filter').selectpicker('refresh');

        $('#driverReseller').empty();
        $('.SelectResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("https://app.track-asia.com/tracksgwebapi/api/resellerinfo", function (data) {
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
            $.getJSON("https://app.track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
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

        $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

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
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {

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
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


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
        var getReseller = $('#load-reseller').val();
        if (selectedCompany != 0) {

            //Select New Company
            $('#mobile-driverCompanyEN').empty();
            $(".MobileSelectCompanyFilter").selectpicker('refresh');

            $('#driverCompany').empty();
            $(".SelectCompanyFilter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + getReseller, function (data) {

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
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


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
        var getReseller = $('#mobile-assetReseller').val();
        if (selectedCompany != 0) {
            $('#drivers-editable').empty();
            //Select New Company
            $('#load-company').empty();
            $(".select-company-filter").selectpicker('refresh');

            $('#driverCompany').empty();
            $(".SelectCompanyFilter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + getReseller, function (data) {

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
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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
                $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


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

        $('#drivers-editable').bootstrapTable('destroy');

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

        var WebAPI = 'https://app.track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getReseller + '&CompanyID=' + getCompany;

        $('#drivers-editable').bootstrapTable({
            idField: 'id',
            url: WebAPI,
            columns: [{
                field: 'state',
                title: 'ID',
                checkbox: 'true'
            },
            {
                field: 'Company',
                title: 'Company Name',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg'
            },
            {
                field: 'Name',
                title: 'Driver Name',
                sortable: 'true',
            }, 
			{
                field: 'LoginName',
                title: 'Login Name',
                sortable: 'true',
            },
			{
                field: 'Email',
                title: 'Email',
                sortable: 'true',
            }, {
                field: 'Phone',
                title: 'Phone',
                sortable: 'true',
            }, {
                field: 'Address',
                title: 'Address',
                sortable: 'true',
            }, {
                field: 'DateOfBirth',
                title: 'Date of Birth',
                sortable: 'true',
                formatter: 'dateFormatter',
                class: 'hidden-xs hidden-sm hidden-md hidden-lg'
            }, {
                field: 'Remarks',
                title: 'Remarks',
            }, {
                field: 'Asset',
                title: 'Assigned Vehicle',
                formatter: 'vehicleFormatter'
            }, {
                field: 'Image',
                title: 'Driver Profile',
                formatter: 'nameFormatter'
            }],

            onCheck: function (row) {

                $("#toggle-aside").hide(); //Add Driver
                $("#toggle-aside2").show(); //Edit Driver
                $("#driverImage").show();
                if (row.ImageFill == "Uniform") {
                    // document["showImage"].src = row.Image;
                    $("#showImage").attr("src", row.Image);
                }

                var driverID = $('#driverID').val(row.DriverID);
                var driverLoginName = $('#driverLoginNameEN').val(row.LoginName);
                var driverNameEN = $('#driverNameEN').val(row.Name);
                var driverReseller = $('#driverReseller').val(row.ResellerID);
                var driverCompany = $('#driverCompany').val(row.CompanyID);
                var driverEmail = $('#driverEmail').val(row.Email);
                var driverEmailEN = $('#driverEmailEN').val(row.Email);
                var driverPhone = $('#driverPhone').val(row.Phone);
                var driverPhoneEN = $('#driverPhoneEN').val(row.Phone);
                var driverAddress = $('#driverAdress').val(row.Address);
                var driverAddressEN = $('#driverAddressEN').val(row.Address);
                var driverRemarks = $('#driverRemarks').val(row.Remarks);
                var driverRemarksEN = $('#driverRemarksEN').val(row.Remarks);
                var driverPassword = $('#driverPassword').val(row.Password);

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

                $('#driverDateOfBirth').val(timestamp);
                $('.selectpicker').selectpicker('refresh');

            },

            onUncheck: function (row) {

                $("#toggle-aside").show(); //Add Driver
                $("#toggle-aside2").hide(); //Edit Driver
                clearDriverForms();
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

        WebAPI = 'https://app.track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + '4' + '&CompanyID=' + '2';
    } else if (getSessionstorageValueRoleID == 2) {

        WebAPI = 'https://app.track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    } else if (getSessionstorageValueRoleID >= 3) {

        WebAPI = 'https://app.track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }


        $('#drivers-editable').bootstrapTable({
            idField: 'id',      
            url: WebAPI,
            columns: [{
                field: 'state',
                title: 'ID',
                checkbox: 'true'
            }, 
            {
                field: 'Company',
                title: 'Company Name',          
                class: 'hidden-xs hidden-sm hidden-md hidden-lg'
            },
            {
                field: 'Name',
                title: 'Driver Name',
                sortable: 'true',
            },
			{
                field: 'LoginName',
                title: 'Login Name',
                sortable: 'true',
            },
			{
                field: 'Email',
                title: 'Email',
                sortable: 'true',
            }, {
                field: 'Phone',
                title: 'Phone',
                sortable: 'true',
            }, {
                field: 'Address',
                title: 'Address',
                sortable: 'true',
            }, {
                field: 'DateOfBirth',
                title: 'Date of Birth',
                sortable: 'true',
                formatter: 'dateFormatter',
                class:'hidden-xs hidden-sm hidden-md hidden-lg'
            }, {
                field: 'Remarks',
                title: 'Remarks',
            }, {
                field: 'Asset',
                title: 'Assigned Vehicle',
                formatter: 'vehicleFormatter'
            }, {
                field: 'Image',
                title: 'Driver Profile',
                formatter: 'nameFormatter'
            }],

            onCheck: function (row) {
         
                $("#toggle-aside").hide(); //Add Driver
                $("#toggle-aside2").show(); //Edit Driver
                $("#driverImage").show();
                if (row.ImageFill == "Uniform") {             
                    $("#showImage").attr("src", row.Image);
                }

                var driverID = $('#driverID').val(row.DriverID);
                var driverLoginName = $('#driverLoginNameEN').val(row.LoginName);
                var driverNameEN = $('#driverNameEN').val(row.Name);
                var driverReseller = $('#driverReseller').val(row.ResellerID);
                var driverCompany = $('#driverCompany').val(row.CompanyID);       
                var driverEmail = $('#driverEmail').val(row.Email);
                var driverEmailEN = $('#driverEmailEN').val(row.Email);
                var driverPhone = $('#driverPhone').val(row.Phone);
                var driverPhoneEN = $('#driverPhoneEN').val(row.Phone);
                var driverAddress = $('#driverAdress').val(row.Address);
                var driverAddressEN = $('#driverAddressEN').val(row.Address);
                var driverRemarks = $('#driverRemarks').val(row.Remarks);
                var driverRemarksEN = $('#driverRemarksEN').val(row.Remarks);
                var driverPassword = $('#driverPassword').val(row.Password);

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

                //$('#driverDateOfBirth').val(timestamp);
                $('.selectpicker').selectpicker('refresh');

            },

            onUncheck: function (row) {
              
                $("#toggle-aside").show(); //Add Driver
                $("#toggle-aside2").hide(); //Edit Driver
                clearDriverForms();
            },

            onLoadSuccess: function (row) {

                $("#driverImage").hide();
                $("#toggle-aside2").hide();
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
var $table = $('#drivers-editable'), $remove = $('#driver-confirm-delete'), $removeEN = $('#driver-confirm-deleteEN');
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
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';
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
	    labelColor = "dark";
	    text = "No Vehicle Assigned";
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
                $('#drivers-editable').bootstrapTable('resetView');

            }, 500);


        });

        $('.add-driver').click(function () {

            setTimeout(function () {
                $('#drivers-editable').bootstrapTable('resetView');

            }, 500);


        });

        $('.add-driverEN').click(function () {

            setTimeout(function () {
                $('#drivers-editable').bootstrapTable('resetView');

            }, 500);


        });

        $('.edit-driver').click(function () {

            setTimeout(function () {
                $('#drivers-editable').bootstrapTable('resetView');

            }, 500);


        });

        $('.edit-driverEN').click(function () {

            setTimeout(function () {
                $('#drivers-editable').bootstrapTable('resetView');

            }, 500);


        });


    });


    window.onresize = function(event) {
        setTimeout(function () {
        $('#drivers-editable').bootstrapTable('resetView');

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

    function clearDriverForms() {

        $('#driverID').val('');
        $('#driverNameEN').val('');
        $('#driverEmailEN').val('');
        $('#driverPhoneEN').val('');
        $('#driverAddressEN').val('');
        $('#driverDateOfBirth').val('');
        $('#driverRemarksEN').val('');
        $('#driverPassword').val('');
        $('#drivers-editable').bootstrapTable('refresh');
    }

    function returnToTab1()
    {
        $('#main-wz').bootstrapWizard('first');
    }
