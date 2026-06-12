var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');
var reseller, company, driver;

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
            },
            type: 'image',
            onContentLoaded: function () {
                var container = $('.ekko-lightbox-container');
                var image = container.find('img');
                var windowHeight = $(window).height();
                if (image.height() + 200 > windowHeight) {
                    image.css('height', windowHeight - 150);
                    var dialog = container.parents('.modal-dialog');
                    var padding = parseInt(dialog.find('.modal-body').css('padding'));
                    dialog.css('max-width', image.width() + padding * 2 + 2);
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

//Default
if (getSessionstorageValueRoleID > 2) {
    $('#vehicle-modal').hide();
}

//On Load Reseller
var WebAPIReseller = "";
if (getSessionstorageValueRoleID == 1) {

    WebAPIReseller = 'https://track-asia.com/tracksgwebapi/api/resellerinfo';

    reseller = $.getJSON(WebAPIReseller, function (data) {

        $.each(data, function (index, item) {
            if (item.ResellerID == 4)
            {
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
            }
            else
            {
                $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            }
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    WebAPIReseller = 'https://track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    reseller = $.getJSON(WebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
            $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#formsReseller').remove();
    $('#modal-assetReseller').remove();
}


//OnLoad Company
if (getSessionstorageValueRoleID == 1) {

    company = $.getJSON("https://track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {


        $.each(data, function (index, item) {

            if (item.CompanyID == 2)
            {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
            }
            else
            {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            }

        });


        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    company = $.getJSON("https://track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {
        $.each(data, function (index, item) {
            if (item.CompanyID == getSessionstorageValueCompanyID) {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));             
            }
            else
            {
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            }
        });

        $(".selectpicker").selectpicker('refresh');

    });
} else if (getSessionstorageValueRoleID >= 3) {

    company = $.getJSON("https://track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {
            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
        });

        $(".selectpicker").selectpicker('refresh');

    });

}


var WebAPIDriver = "";
if (getSessionstorageValueRoleID == 1) {
    WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + '4' + '&CompanyID=' + '2';
}
else if (getSessionstorageValueRoleID == 2) {
    WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID;
}
else if (getSessionstorageValueRoleID >= 3) {
    WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
}
driver = $.getJSON(WebAPIDriver, function (data) {
    $.each(data, function (index, item) {
        var AssignedAsset = item.AssetID;

        if (AssignedAsset != 0) {
            //$('#assetDriver').append(
            //$('<option data-imagesrc="' + item.Image + '" disabled="disabled"></option>').val(item.DriverID).html(item.Name)
            //);

        } else {
            $('#assetDriver').append($('<option data-imagesrc="' + item.Image + '"></option>').val(item.DriverID).html(item.Name));
        }
    });

    $('.selectpicker').selectpicker('refresh');
});

//populate the Drop Down List
//On Load Category
var category = $.getJSON("https://track-asia.com/tracksgwebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#assetCategory').append($('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc));
    });

    $('.selectpicker').selectpicker('refresh');
});

//populate the Drop Down List
//On Load Make
var make = $.getJSON("https://track-asia.com/tracksgwebapi/api/makeinfo", function (data) {
    $.each(data, function (index, item) {
        $('#assetMake').append($('<option></option>').val(item.MakeID).html(item.Make));
    });

    $('.selectpicker').selectpicker('refresh');
});

var selectedDevice = "";
var device = $.getJSON("https://track-asia.com/tracksgwebapi/api/deviceinfo", function (data) {
    $.each(data, function (index, item) {
        var AssignedTags = item.AssetID;

        if (AssignedTags != 0) {
            //$('#assetDevice').append(
            //$('<option disabled="disabled"></option>').val(item.Name).html(item.Name)
            //);

        } else {
            $('#assetDevice').append($('<option data-installDate="' + item.InstallDate + '"></option>').val(item.Name).html(item.Name));

        }


    });

    $('.selectpicker').selectpicker('refresh');
});

var transmission = $.getJSON("https://track-asia.com/tracksgwebapi/api/transmissioninfo", function (data) {
    $.each(data, function (index, item) {
        $('#assetTransmission').append($('<option></option>').val(item.TransmissionID).html(item.Name));
    });

    $('.selectpicker').selectpicker('refresh');
});

var fueltype = $.getJSON("https://track-asia.com/tracksgwebapi/api/fueltypeinfo", function (data) {
    $.each(data, function (index, item) {
        $('#assetFuelType').append($('<option></option>').val(item.FuelTypeID).html(item.Name));
    });

    $('.selectpicker').selectpicker('refresh');
});

//No Network Coverage Alert
setTimeout(function () {
    if (getSessionstorageValueRoleID < 3) reseller.abort();

    company.abort();
    driver.abort();
    category.abort();
    make.abort();
    device.abort();
    transmission.abort();
    fueltype.abort();
    if ($('#LoadingForm').is(":visible")) {
        $('#LoadingForm').modal('hide');
        return alert("Unable to connect to server, Please check your network connection");
    }
}, 120000);



var selectedReseller = "";

//Reseller Forms
/*** Function to filter reseller and companies*/
$(function () {

    $('.SelectFormResellerFilter').on('change', function () {
        selectedReseller = $(this).find("option:selected").val();
        $("#vehicles-editable").empty();

        $('#load-reseller').empty();
        $('.select-reseller-filter').selectpicker('refresh');


        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("https://track-asia.com/tracksgwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                    else {
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#assetReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("https://track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {                    
                        $('#load-reseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#assetReseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#load-reseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#modal-assetReseller').remove();
            $('#load-reseller').remove();
        }

        $('#assetCompany').empty();
        $(".SelectFormCompanyFilter").selectpicker('refresh');

        $('#load-company').empty();
        $(".select-company-filter").selectpicker('refresh');


        $.getJSON("https://track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#assetCompany').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));

            $.each(data, function (index, item) {
              
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

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

        $('#assetReseller').empty();
        $('.SelectFormResellerFilter').selectpicker('refresh');

        if (getSessionstorageValueRoleID == 1) {
            $.getJSON("https://track-asia.com/tracksgwebapi/api/resellerinfo", function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                        $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                      
                    }
                    else {
                        $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name));
                    }

                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#assetReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID == 2) {
            $.getJSON("https://track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=" + selectedReseller, function (data) {
                $.each(data, function (index, item) {

                    if (item.ResellerID == selectedReseller) {
                       
                        $('#assetReseller').append($('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name));
                    }
                });

                var getReseller = $("#load-reseller").val();
                sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
                $('#assetReseller').selectpicker('refresh');
            });
        }
        else if (getSessionstorageValueRoleID >= 3) {
            $('#modal-assetReseller').remove();
            $('#assetReseller').remove();
        }

        $('#load-company').empty();
        $(".select-company-filter").selectpicker('refresh');

        $('#assetCompany').empty();
        $(".SelectFormCompanyFilter").selectpicker('refresh');

        $.getJSON("https://track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + selectedReseller, function (data) {

            $('#assetCompany').append($('<option></option>').val(0).html("-------"));
            $('#load-company').append($('<option></option>').val(0).html("-------"));


            $.each(data, function (index, item) {
               
                $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
            });

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
            $('#load-company').empty();
            $(".select-company-filter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("https://track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                           
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }
                    });
                    var getCompany = $("#assetCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".select-company-filter").selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("https://track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                          
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });
                    var getCompany = $("#assetCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".select-company-filter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("https://track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                        
                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {

                            $('#load-company').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });

                    var getCompany = $("#assetCompany").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".select-company-filter").selectpicker('refresh');

                });
            }

            //Select New Driver
            $('#assetDriver').empty();
            $(".SelectDriverFilter").selectpicker('refresh');

            var WebAPIDriver = "";

            if (getSessionstorageValueRoleID == 1) {
                WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;
            }

            else if (getSessionstorageValueRoleID == 2) {
                WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID;

            }
            else if (getSessionstorageValueRoleID >= 3) {
                WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
            }

            $.getJSON(WebAPIDriver, function (data) {

                $('#assetDriver').append($('<option></option>').val(0).html('-------'));

                $.each(data, function (index, item) {
                    var AssignedAsset = item.AssetID;

                    if (AssignedAsset != 0) {

                    } else {
                        $('#assetDriver').append($('<option data-imagesrc="' + item.Image + '"></option>').val(item.DriverID).html(item.Name));
                     
                    }
                });

                $('.selectpicker').selectpicker('refresh');
            });


            //Select New Zones
            $('#assetZoneEN').empty();
            $(".SelectZoneFilter").selectpicker('refresh');

           
            var getZone = "";

            if (getSessionstorageValueRoleID == 1) {
                getZone = 'https://track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getReseller + '&CompanyID=' + selectedCompany;

                $.getJSON(getZone, function (data) {
                    $.each(data, function (index, item) {

                        $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));

                    });

                    $('.selectpicker').selectpicker('refresh');
                });

            }

            else if (getSessionstorageValueRoleID == 2) {
                getZone = 'https://track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID;

                $.getJSON(getZone, function (data) {
                    $.each(data, function (index, item) {
                        $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));

                    });

                    $('.selectpicker').selectpicker('refresh');
                });

            }

            else if (getSessionstorageValueRoleID >= 3) {
                getZone = 'https://track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

                $.getJSON(getZone, function (data) {
                    $.each(data, function (index, item) {
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

            $('#assetCompany').empty();
            $(".SelectFormCompanyFilter").selectpicker('refresh');

            if (getSessionstorageValueRoleID == 1) {
                $.getJSON("https://track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + getReseller, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                           
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {

                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }
                    });
                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".SelectFormCompanyFilter").selectpicker('refresh');
                })
            }
            else if (getSessionstorageValueRoleID == 2) {
                $.getJSON("https://track-asia.com/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                         
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });
                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".SelectFormCompanyFilter").selectpicker('refresh');
                });
            }
            else if (getSessionstorageValueRoleID >= 3) {
                $.getJSON("https://track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {


                    $.each(data, function (index, item) {

                        if (item.CompanyID == selectedCompany) {
                         
                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name));
                        }
                        else {

                            $('#assetCompany').append($('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name));
                        }

                    });

                    var getCompany = $("#load-company").val();
                    sessionStorage.setItem("setSessionstorageValueAssetCompany", getCompany);
                    $(".SelectFormCompanyFilter").selectpicker('refresh');

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

         WebAPI = 'https://track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany;
        
        } else {

         WebAPI = 'https://track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getReseller + '&CompanyID=' + getCompany;
        }

        $('#vehicles-editable').bootstrapTable({
            idField: 'id',
            url: WebAPI,
            columns: [{
                field: 'AssetID',
                title: 'Vehicle ID',
                formatter: 'vehicleFormatter'
            }, {
                field: 'Image',
                title: 'Driver',
                formatter: 'nameFormatter'
            }, {
                field: 'Name',
                title: 'Vehicle',
                sortable: 'true'
            }, {
                field: 'Category',
                title: 'Category',
                sortable: 'true',
                formatter: 'assetFormatter'
            }, {
                field: 'Tag',
                title: 'Device',
                sortable: 'true'
            }, {
                field: 'Phone',
                title: 'Phone',
                sortable: 'true'
            }, {
                field: 'Email',
                title: 'Email',
                sortable: 'true'
            }, {
                field: 'InstallDate',
                title: 'Install Date',
                sortable: 'true',
                formatter: 'dateFormatter'
            }, {
                field: 'Action',
                title: 'Action',
                formatter: actionFormatter
            }],

            onLoadSuccess: function (row) {

                setTimeout(function () {
                    $('#LoadingForm').modal('hide');
                }, 500);

                //No Network Coverage Alert
                setTimeout(function () {
                    if ($('#LoadingForm').is(":visible")) {
                        $('#LoadingForm').modal('hide');
                        return alert("Unable to connect to server, Please check your network connection");
                    }
                }, 120000);

            }
        });


    });


});

//OnLoad Table
$(document).ready(function () {
    $('#LoadingForm').modal('show');

    var WebAPI = "";

    if (getSessionstorageValueRoleID == 1) {

        WebAPI = 'https://track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + '&ResellerID=' + '4' + '&CompanyID=' + '2';

    }
    else if (getSessionstorageValueRoleID == 2)
    {

        WebAPI = 'https://track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }
    else if (getSessionstorageValueRoleID >= 3)
    {

        WebAPI = 'https://track-asia.com/tracksgwebapi/api/assetinfo?UserID=' + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
    }


    $('#vehicles-editable').bootstrapTable({
        idField: 'id',      
        url: WebAPI,
        columns: [{
            field: 'AssetID',
            title: 'Vehicle ID',
            formatter: 'vehicleFormatter'
        }, {
            field: 'Image',
            title: 'Driver',
            formatter: 'nameFormatter'
        }, {
            field: 'Name',
            title: 'Vehicle',
            sortable: 'true'
        }, {
            field: 'Category',
            title: 'Category',
            sortable: 'true',
            formatter: 'assetFormatter'
        }, {
            field: 'Tag',
            title: 'Device',
            sortable: 'true'
        }, {
            field: 'Phone',
            title: 'Phone',
            sortable: 'true'
        }, {
            field: 'Email',
            title: 'Email',
            sortable: 'true'
        }, {
            field: 'InstallDate',
            title: 'Install Date',
            sortable: 'true',
            formatter: 'dateFormatter'
        }, {
            field: 'Action',
            title: 'Action',
            formatter: actionFormatter
        }],

        onLoadSuccess: function (row) {

            setTimeout(function () {
                $('#LoadingForm').modal('hide');
            }, 500);

            //No Network Coverage Alert
            setTimeout(function () {
                if ($('#LoadingForm').is(":visible")) {
                    $('#LoadingForm').modal('hide');
                    return alert("Unable to connect to server, Please check your network connection");
                }
            }, 120000);
 
        }
    });


	    
});


function actionFormatter(value, row) {

    var markup = "<strong><a href='javascript:editvehicle(" + JSON.stringify(row) + ")' style='color:#458FD2;'>" + "Edit" + '</a></strong>'; 
    if (getSessionstorageValueRoleID < 3) markup += "&nbsp;&nbsp;&nbsp;<strong><a href='javascript:deletevehicle(" + row.AssetID + ")' style='color:#458FD2;'>" + "Delete" + '</a></strong>';
    markup += "&nbsp;&nbsp;&nbsp;<strong><a href='javascript:viewservices(" + row.AssetID + ")' style='color:#458FD2;'>" + "Servicing" + '</a></strong>';
    markup += "&nbsp;&nbsp;&nbsp;<strong><a href='javascript:viewcontracts(" + row.AssetID + ")' style='color:#458FD2;'>" + "Contracts" + '</a></strong>';

    return markup;
}

function editvehicle(value) {
    console.log(JSON.stringify(value));

    $('#VehicleModal').modal("show");
    $('#assetID').val(value.AssetID);
    $('#assetMake').val(value.MakeID);
    $('#assetModel').val(value.Model);
    $('#assetNameEN').val(value.Name);
    $('#assetLicensePlate').val(value.LicensePlate);

    var InstallDate = value.InstallDate;
    var Singapore = moment.tz(InstallDate, 'Asia/Singapore');
    //Format UTC
    var timestamp = moment(Singapore.format()).add(8, 'hours').format("D-MMM-YYYY");
    $('#assetInstallDate').val(timestamp);

    if (value.Tag == "--") {
        $("#assetDevice").val('<option value="0" selected="selected">No Device</option>');
    }
    else {
        $("#assetDevice").append('<option value="' + value.Tag + '" selected="selected">' + value.Tag + '</option>');
    }

    $('#assetCompany').val(value.CompanyID);

    if (value.DriverID > 0) {
       $("#assetDriver").append('<option value="' + value.DriverID + '" selected="selected">' + value.Driver.Name + '</option>');
    }

    $('#assetCompany').val(value.CompanyID);
    $('#assetCategory').val(value.Category);

    //Convert String to Array
    var Zones = value.AlertZones;
    var AssignedAlertZones = new Array();
    AssignedAlertZones = Zones.split(",");
    for (a in AssignedAlertZones) {
        AssignedAlertZones[a] = parseInt(AssignedAlertZones[a], 10);
    }

    $('#assetZoneEN').val(AssignedAlertZones);

    $('#assetTransmission').val(value.TransmissionID);
    $('#assetFuelType').val(value.FuelTypeID);
    $('#assetPhoneEN').val(value.Phone);
    $('#assetEmailEN').val(value.Email);
    $('#assetIdlingLimitEN').val(value.IdleLimit);
    $('#assetSpeedLimitEN').val(value.SpeedLimit);
    $('#assetChassisNo').val(value.ChassisNo);
    $('#assetModelYear').val(value.ModelYear);

    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
    if (value.ImmatriculationDate < '2001-01-01T00:00:00') {
        $('#assetImmatriculation').val('');
    } else {

        //Convert Timezone    
        var Singapore = moment.tz(value.ImmatriculationDate, Asia);
        var Immatriculation = moment(Singapore.format()).format("DD-MMM-YYYY");
        $('#assetImmatriculation').val(Immatriculation);
    }

    if (value.FirstContractDate < '2001-01-01T00:00:00') {
        $('#assetFirstContract').val('');
    } else {

        //Convert Timezone    
        var Singapore = moment.tz(value.FirstContractDate, Asia);
        var FirstContract = moment(Singapore.format()).format("DD-MMM-YYYY");
        $('#assetFirstContract').val(FirstContract);
    }

    $('#assetCatalogValue').val(value.CatalogValue);
    $('#assetResidualValue').val(value.ResidualValue);
    $('#assetSeatNo').val(value.SeatNo);
    $('#assetDoorNo').val(value.DoorNo);
    $('#assetColor').val(value.Color);
    $('#assetCO2').val(value.CO2);
    $('#assetHorsepower').val(value.Horsepower);
    $('#assetHorseTaxation').val(value.HorsepowerTaxation);
    $('#assetPower').val(value.Power);

    $('.selectpicker').selectpicker('refresh');
}

function deletevehicle(asset_id) {

    if (getSessionstorageValueRoleID > 3) {

        $.niftyNoty({
            type: 'danger',
            icon: 'fa fa-exclamation-triangle',
            message: 'User Account not allowed to Delete',
            container: 'floating',
            timer: 3000
        });
    } else {

        bootbox.confirm("<div style='color:black'>Are you sure you want to delete ?</div>", function (result) {

            if (result) {

                $('#LoadingForm').modal('show');

                var assets = JSON.stringify({ 'AssetId': asset_id });
                var WebAPI = 'https://track-asia.com/tracksgwebapi/api/assetinfo/' + asset_id;

                $.ajax({
                    url: WebAPI,
                    type: "Delete",
                    data: JSON.stringify(assets),
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
                    permissions: ["https://*.asiacom.co.th"],
                    success: function (res) {
                        console.log(res);

                        clearVehicleForms();

                        setTimeout(function () {
                            $('#LoadingForm').modal('hide');
                        }, 500);

                        //No Network Coverage Alert
                        setTimeout(function () {
                            if ($('#LoadingForm').is(":visible")) {
                                $('#LoadingForm').modal('hide');
                                return alert("Unable to connect to server, Please check your network connection");
                            }
                        }, 120000);

                        $.niftyNoty({
                            type: 'success',
                            message: 'Deleted Successfully',
                            container: 'floating',
                            timer: 3000
                        });
                    }
                });




            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: 'Delete Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });

    }

}

function viewservices(asset_id) {

    $('#LoadingForm').modal('show');
    $('#viewServicesForms').dialog('destroy');

    $.ajax({
        type: 'GET',
        url: "https://track-asia.com/tracksgwebapi/api/serviceinfo?CompanyID=" + getSessionstorageValueCompanyID + "&AssetID=" + asset_id,
        async: false,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (data) {

            $("<div id='viewServicesForms'>").dialog({
                modal: true,
                title: "Servicing",
                width: '100%',
                position: 'center',
                height: 'auto',
                dialogClass: 'no-close',
                open: function () {

                    $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
                    $(".ui-dialog-titlebar-close").hide(); //hide close button

                    var markup =
                        "<div class='col-sm-6 form-group hidden-xs hidden-sm hidden-md hidden-lg'>" +
                        "<label class='control-label'>Asset ID</label>" +
                        "<input type='text' placeholder='Asset ID' class='form-control' id='service_asset_id' value='" + asset_id + "' disabled='disabled'>" +
                        "</div>" +
                        "<div class='col-sm-6 form-group'>" +
                        "<label class='control-label'>Company</label>" +
                        "<input type='text' placeholder='Company' class='form-control' id='service_company'>" +
                        "</div>" +
                        "<div class='col-sm-3 form-group'>" +
                        "<label class='control-label'>Driver</label>" +
                        "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='service_driver' name='service_driver' data-table='searchable'></select>" +
                        "</div>" +
                        "<div class='col-sm-3 form-group'>" +
                        "<label class='control-label'>Service Type</label>" +
                        "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='service_type' name='service_type' data-table='searchable'></select>" +
                        "</div>" +
                        "<div class='col-sm-3 form-group'>" +
                        "<label class='control-label'>Service Date</label>" +
                        "<input type='text' placeholder='Service Date' class='form-control' id='service_date'>" +
                        "</div>" +
                        "<div class='col-sm-3 form-group'>" +
                        "<label class='control-label'>Invoice Reference</label>" +
                        "<input type='text' placeholder='Invoice Reference' class='form-control' id='service_reference'>" +
                        "</div>" +
                        "<div class='col-sm-3 form-group'>" +
                        "<label class='control-label'>Odometer Value (km)</label>" +
                        "<input type='text' placeholder='Odometer Value (km)' class='form-control' id='service_odometer'>" +
                        "</div>" +
                        "<div class='col-sm-3 form-group'>" +
                        "<label class='control-label'>Total Price</label>" +
                        "<input type='text' placeholder='Total Price' class='form-control' id='service_price'>" +
                        "</div>" +
                        "<div class='col-sm-3 form-group'>" +
                        "<label class='control-label'>Address</label>" +
                        "<textarea rows='1' class='form-control' placeholder='Address' id='service_address'></textarea>" +
                        "</div>" +
                        "<div class='col-sm-3 form-group'>" +
                        "<label class='control-label'>Remarks</label>" +
                        "<textarea rows='1' class='form-control' placeholder='Remarks' id='service_remarks'></textarea>" +
                        "</div>" +
                        "<div class='col-sm-3 form-group' style='margin-top:20px;'>" +
                        "<div class='form-check'><input type='checkbox' class='form-check-input' id='service_notify' value='1'>" +
                        "<label class='form-check-label' for='service_notify'>&nbsp;Notify Driver</label></div>" +
                        "</div>" +
                        "<div class='col-sm-3 form-group' style='margin-top: 26px;'>" +
                        "<button id='addService' class='btn btn-success' type='submit' style='margin-right:15px;'>Add Service</button>" +
                        "</div>"

                    markup += "<div id='custom-service'>" +
                        "<button id='refreshServiceTable' class='btn btn-info' type='submit'>Refresh Table</button>" +
                        "</div>" +
                        "<div class='col-sm-12'>" +
                        "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto; height: 380px;' class=''>" +
                        "<table id='servicelistTable' class='table table-condensed table-vcenter searchable'" +
                        " data-toolbar='#custom-service'" +
                        " data-click-to-select='true'" +
                        " data-single-select='true'" +
                        " data-search='false'" +
                        " data-show-export='true'" +
                        " data-show-refresh='false'" +
                        " data-show-toggle='false'" +
                        " data-show-columns='false'" +
                        " data-show-toggle='false'" +
                        " data-pagination='false'" +
                        " data-show-pagination-switch='false'" +
                        " cellspacing = '0' width = '100%'> "

                    markup += "</table>" + "</div></div>";

                    var WebAPIService = 'https://track-asia.com/tracksgwebapi/api/servicetypeinfo/';
                    var service = $.getJSON(WebAPIService, function (data) {
                        $.each(data, function (index, item) {

                            $('#service_type').append($('<option></option>').val(item.ServiceTypeID).html(item.Name));

                        });
                        $('.selectpicker').selectpicker('refresh');
                    });

                    var WebAPIDriver = "";
                    if (getSessionstorageValueRoleID == 1) {
                        WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + '4' + '&CompanyID=' + '2';
                    }
                    else if (getSessionstorageValueRoleID == 2) {
                        WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID;
                    }
                    else if (getSessionstorageValueRoleID >= 3) {
                        WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
                    }
                    var driver = $.getJSON(WebAPIDriver, function (data) {
                        $('#service_driver').append($('<option selected="selected"></option>').val(0).html("---"));
                        $.each(data, function (index, item) {

                            $('#service_driver').append($('<option></option>').val(item.DriverID).html(item.Name));

                        });

                        $('.selectpicker').selectpicker('refresh');
                    });

                    if (markup !== undefined || markup !== null) $(this).html(markup);

                    Date.parseDate = function (input, format) {
                        return moment(input, format).toDate();
                    };
                    Date.prototype.dateFormat = function (format) {
                        return moment(this).format(format);
                    };

                    var dateTo = moment().format('DD-MMM-YYYY, HH:mm A');

                    jQuery('#service_date').datetimepicker({
                        format: 'DD-MMM, YYYY HH:mm',
                        formatTime: 'HH:mm',
                        formatDate: 'DD-MMM, YYYY HH:mm',
                        theme: 'dark',
                        autoclose: true,
                        mask: false,
                        timepicker: true,
                        todayButton: true,
                        value: dateTo,
                        onChangeDateTime: function (dp, $input) {
                            $(this).hide();
                            $('#service_date').datetimepicker();
                        }
                    });

                    $('#servicelistTable').bootstrapTable({
                        data: data,
                        idField: 'ServiceID',
                        exportOptions: {
                            fileName: '[Servicing] ' + moment.utc().add(8, 'hours').format('D-MMM-YYYY')
                        },
                        exportTypes: ['csv'],
                        columns: [{
                            field: 'ItemNo',
                            title: 'Item No.',
                            formatter: serialnoFormatter
                        }, {
                            field: 'ServiceID',
                            title: 'Service ID',
                            class: 'hidden-xs hiddden-sm hidden-md hidden-lg'
                        }, {
                            field: 'CompanyName',
                            title: 'Company',
                        }, {
                            field: 'Asset',
                            title: 'Vehicle'
                        }, {
                            field: 'Driver',
                            title: 'Driver'
                        }, {
                            field: 'Services',
                            title: 'Services'
                        }, {
                            field: 'Timestamp',
                            title: 'Date of Service',
                            formatter: timestampFormatter
                        }, {
                            field: 'RxTime',
                            title: 'Date of Completion',
                            formatter: rxtimeFormatter
                        }, {
                            field: 'Invoice',
                            title: 'Invoice'
                        }, {
                            field: 'Odometer',
                            title: 'Odometer'
                        }, {
                            field: 'Price',
                            title: 'Price'
                        }, {
                            field: 'Address',
                            title: 'Address'
                        }, {
                            field: 'Remarks',
                            title: 'Remarks'
                        }, {
                            field: 'Status',
                            title: 'Status'
                        }, {
                            field: 'Action',
                            title: 'Action',
                            formatter: actionserviceFormatter
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

                    var $buttonSystem = $('#addService');
                    $buttonSystem.click(function (e) {
                        e.preventDefault();

                        if ($('#service_company').val() && $('#service_reference').val()) {

                            bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
                                if (result) {

                                    $('#LoadingForm').modal('show');
                                    var svc_notif;
                                    if ($('#service_notify').prop("checked") == true) {
                                        svc_notif = 1;
                                    } else {
                                        svc_notif = 2;
                                    }

                                    var service = {
                                        CompanyName: $('#service_company').val(),
                                        CompanyID: getSessionstorageValueCompanyID,
                                        AssetID: asset_id,
                                        DriverID: $('#service_driver').val(),
                                        ServiceTypeID: $('#service_type').val(),
                                        Timestamp: $('#service_date').val(),
                                        Invoice: $('#service_reference').val(),
                                        Odometer: $('#service_odometer').val(),
                                        Price: $('#service_price').val(),
                                        Address: $('#service_address').val(),
                                        Remarks: $('#service_remarks').val(),
                                        Platform: svc_notif,
                                        Flag: 1
                                    }

                                    $.ajax({
                                        url: "https://track-asia.com/tracksgwebapi/api/servicinginfo",
                                        type: "POST",
                                        data: JSON.stringify(service),
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
                                        permissions: ["https://*.track-asia.com"],
                                        success: function (res) {
                                            console.log(res);
                                            refreshservices(asset_id);
                                        }
                                    });

                                }
                                else {

                                    setTimeout(function () {
                                        $('#LoadingForm').modal('hide');
                                    }, 500);
                                };

                            });

                        } else {
                            return alert('Fields cannot be empty!')

                        }

                    });

                    $('#refreshServiceTable').click(function (e) {
                        e.preventDefault();
                        refreshservices(asset_id);

                    });

                    $('.selectpicker').selectpicker('refresh');

                    setTimeout(function () {
                        driver.abort();
                        service.abort();
                        if ($('#LoadingForm').is(":visible")) {
                            $('#LoadingForm').modal('hide');
                            return alert("Unable to connect to server, Please check your network connection");
                        }
                    }, 120000);
                },
                buttons: {
                    //'Return': function () {
                    //    $(this).dialog('destroy');
                    //},
                    Close: function () {

                        //$(this).dialog("close");
                        $(".ui-dialog-content").dialog("close");
                    },
                }
            });



        }
    });

    setTimeout(function () {
        $('#LoadingForm').modal('hide');
    }, 500);
}

function deleteservices(value) {

    bootbox.confirm("<div style='color:black'>Are you sure you wish to delete?</div>", function (result) {
        if (result) {

            $('#LoadingForm').modal('show');
            var service = JSON.stringify({ 'ServiceID': value.ServiceID });
            var WebAPI = 'https://track-asia.com/tracksgwebapi/api/servicinginfo/' + value.ServiceID;

            $.ajax({
                url: WebAPI,
                type: "Delete",
                data: JSON.stringify(service),
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
                permissions: ["https://*.track-asia.com"],
                success: function (res) {
                    console.log(res);
                    refreshservices(value.AssetID);
                }
            });

        }
        else {

            setTimeout(function () {
                $('#LoadingForm').modal('hide');
            }, 500);
        };

    });

}

function refreshservices(asset_id) {

    $('#LoadingForm').modal('show');
    $('#servicelistTable').bootstrapTable('destroy');

    $.ajax({
        type: 'GET',
        url: "https://track-asia.com/tracksgwebapi/api/serviceinfo?CompanyID=" + getSessionstorageValueCompanyID + "&AssetID=" + asset_id,
        async: false,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (data) {


            $('#servicelistTable').bootstrapTable({
                data: data,
                idField: 'ProjectID',
                exportOptions: {
                    fileName: '[Servicing] ' + moment.utc().add(8, 'hours').format('D-MMM-YYYY')
                },
                exportTypes: ['csv'],
                columns: [{
                    field: 'ItemNo',
                    title: 'Item No.',
                    formatter: serialnoFormatter
                }, {
                    field: 'ServiceID',
                    title: 'Service ID',
                    class: 'hidden-xs hiddden-sm hidden-md hidden-lg'
                }, {
                    field: 'CompanyName',
                    title: 'Company',
                }, {
                    field: 'Asset',
                    title: 'Vehicle'
                }, {
                    field: 'Driver',
                    title: 'Driver'
                }, {
                    field: 'Services',
                    title: 'Services'
                }, {
                    field: 'Timestamp',
                    title: 'Date of Service',
                    formatter: timestampFormatter
                }, {
                    field: 'RxTime',
                    title: 'Date of Completion',
                    formatter: rxtimeFormatter
                }, {
                    field: 'Invoice',
                    title: 'Invoice'
                }, {
                    field: 'Odometer',
                    title: 'Odometer'
                }, {
                    field: 'Price',
                    title: 'Price'
                }, {
                    field: 'Address',
                    title: 'Address'
                }, {
                    field: 'Remarks',
                    title: 'Remarks'
                }, {
                    field: 'Status',
                    title: 'Status'
                }, {
                    field: 'Action',
                    title: 'Action',
                    formatter: actionserviceFormatter
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



        }
    });

    setTimeout(function () {
        $('#LoadingForm').modal('hide');
    }, 500);
}

function editservices(value) {

    $('#LoadingForm').modal('show');
    $('#updateServiceForms').dialog('destroy');

    $("<div id='updateServiceForms'>").dialog({
        modal: true,
        title: "Update Servicing",
        width: '80%',
        position: 'center',
        height: '550',
        dialogClass: 'no-close',
        open: function () {

            $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
            $(".ui-dialog-titlebar-close").hide(); //hide close button

            var top = Math.max(jQuery(window).height() / 2 - jQuery(this)[0].offsetHeight / 2, 0) - 150;
            var left = Math.max(jQuery(window).width() / 2 - jQuery(this)[0].offsetWidth / 2, 0);

            jQuery(this).parent().css('top', top + "px");
            jQuery(this).parent().css('left', left + "px");
            jQuery(this).parent().css('position', 'fixed');

            var markup =
                "<div class='col-sm-6 form-group hidden-xs hidden-sm hidden-md hidden-lg'>" +
                "<label class='control-label'>Asset ID</label>" +
                "<input type='text' placeholder='Asset ID' class='form-control' id='svc_asset_id' value='" + value.AssetID + "' disabled='disabled'>" +
                "</div>" +
                "<div class='col-sm-6 form-group'>" +
                "<label class='control-label'>Company</label>" +
                "<input type='text' placeholder='Company' class='form-control' id='svc_company' value='" + value.CompanyName + "'>" +
                "</div>" +
                "<div class='col-sm-3 form-group'>" +
                "<label class='control-label'>Driver</label>" +
                "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='svc_driver' name='svc_driver' data-table='searchable'></select>" +
                "</div>" +
                "<div class='col-sm-3 form-group'>" +
                "<label class='control-label'>Service Type</label>" +
                "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='svc_type' name='svc_type' data-table='searchable'></select>" +
                "</div>" +
                "<div class='col-sm-3 form-group'>" +
                "<label class='control-label'>Service Date</label>" +
                "<input type='text' placeholder='Service Date' class='form-control' id='svc_date'>" +
                "</div>" +
                "<div class='col-sm-3 form-group'>" +
                "<label class='control-label'>Date of Completion</label>" +
                "<input type='text' placeholder='Date of Completion' class='form-control' id='svc_completion_date'>" +
                "</div>" +
                "<div class='col-sm-3 form-group'>" +
                "<label class='control-label'>Invoice Reference</label>" +
                "<input type='text' placeholder='Invoice Reference' class='form-control' id='svc_reference' value='" + value.Invoice + "'>" +
                "</div>" +
                "<div class='col-sm-3 form-group'>" +
                "<label class='control-label'>Odometer Value</label>" +
                "<input type='text' placeholder='Odometer Value' class='form-control' id='svc_odometer' value='" + value.Odometer + "'>" +
                "</div>" +
                "<div class='col-sm-3 form-group'>" +
                "<label class='control-label'>Total Price</label>" +
                "<input type='text' placeholder='Total Price' class='form-control' id='svc_price' value='" + value.Price + "'>" +
                "</div>" +
                "<div class='col-sm-3 form-group'>" +
                "<label class='control-label'>Address</label>" +
                "<textarea rows='1' class='form-control' placeholder='Address' id='svc_address'></textarea>" +
                "</div>" +
                "<div class='col-sm-3 form-group'>" +
                "<label class='control-label'>Remarks</label>" +
                "<textarea rows='1' class='form-control' placeholder='Remarks' id='svc_remarks'></textarea>" +
                "</div>" +
                "<div class='col-sm-3 form-group' style='margin-top:20px;'>" +
                "<div class='form-check'><input type='checkbox' class='form-check-input' id='svc_notify' value='1'>" +
                "<label class='form-check-label' for='svc_notify'>&nbsp;Notify Driver</label></div>" +
                "</div>" +
                "<div class='col-sm-6 form-group'>" +
                "<label class='control-label'>Status</label>" +
                "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='svc_status' name='svc_status' data-table='searchable'></select>" +
                "</div>"; 

            var WebAPIService = 'https://track-asia.com/tracksgwebapi/api/servicetypeinfo/';
            var service = $.getJSON(WebAPIService, function (data) {
                $.each(data, function (index, item) {
                    if (value.ServiceTypeID == item.ServiceTypeID) {
                        $('#svc_type').append($('<option selected="selected"></option>').val(item.ServiceTypeID).html(item.Name));
                    } else {
                        $('#svc_type').append($('<option></option>').val(item.ServiceTypeID).html(item.Name));
                    }
          

                });
                $('.selectpicker').selectpicker('refresh');
            });

            var WebAPIDriver = "";
            if (getSessionstorageValueRoleID == 1) {
                WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + '4' + '&CompanyID=' + '2';
            }
            else if (getSessionstorageValueRoleID == 2) {
                WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID;
            }
            else if (getSessionstorageValueRoleID >= 3) {
                WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
            }
            var driver = $.getJSON(WebAPIDriver, function (data) {
                $('#svc_driver').append($('<option selected="selected"></option>').val(0).html("---"));
                $.each(data, function (index, item) {
                    if (value.DriverID == item.DriverID) {
                        $('#svc_driver').append($('<option selected="selected"></option>').val(item.DriverID).html(item.Name));
                    } else {
                        $('#svc_driver').append($('<option></option>').val(item.DriverID).html(item.Name));
                    }               
                });

                $('.selectpicker').selectpicker('refresh');
            });

            var WebAPISystem = "https://track-asia.com/tracksgwebapi/api/flagvalueinfo";
            var filter = $.getJSON(WebAPISystem, function (data) {
                $.each(data, function (index, item) {
                    if (value.Flag == item.FlagID) $('#svc_status').append($('<option selected="selected"></option>').val(item.FlagID).html(item.FlagValue));
                    else $('#svc_status').append($('<option></option>').val(item.FlagID).html(item.FlagValue));
                });
                $('.selectpicker').selectpicker('refresh');
            });

            if (markup !== undefined || markup !== null) $(this).html(markup);

            $('#svc_address').val(value.Address);
            $('#svc_remarks').val(value.Remarks);

            if (value.Platform == 1) {
                document.getElementById("svc_notify").checked = true;
            } else if (value.Platform == 2) {
                document.getElementById("svc_notify").checked = false;
            } else {
                document.getElementById("svc_notify").checked = false;
            }

            Date.parseDate = function (input, format) {
                return moment(input, format).toDate();
            };
            Date.prototype.dateFormat = function (format) {
                return moment(this).format(format);
            };

            $('#svc_date').val(inputdateFormatter(value.Timestamp));
            $('#svc_completion_date').val(inputdateFormatter(value.RxTime));

            jQuery('#svc_date').datetimepicker({
                format: 'DD-MMM, YYYY HH:mm',
                formatTime: 'HH:mm',
                formatDate: 'DD-MMM, YYYY HH:mm',
                theme: 'dark',
                autoclose: true,
                mask: false,
                timepicker: true,
                todayButton: true,
                //value: inputdateFormatter(value.Timestamp),
                onChangeDateTime: function (dp, $input) {
                    $(this).hide();
                    $('#svc_date').datetimepicker();
                }
            });

            jQuery('#svc_completion_date').datetimepicker({
                format: 'DD-MMM, YYYY HH:mm',
                formatTime: 'HH:mm',
                formatDate: 'DD-MMM, YYYY HH:mm',
                theme: 'dark',
                autoclose: true,
                mask: false,
                timepicker: true,
                todayButton: true,
                //value: inputdateFormatter(value.Timestamp),
                onChangeDateTime: function (dp, $input) {
                    $(this).hide();
                    $('#svc_completion_date').datetimepicker();
                }
            });
            
            $('.selectpicker').selectpicker('refresh');

            setTimeout(function () {
                driver.abort();
                service.abort();
                filter.abort();
                if ($('#LoadingForm').is(":visible")) {
                    $('#LoadingForm').modal('hide');
                    return alert("Unable to connect to server, Please check your network connection");
                }
            }, 120000);

        },
        buttons: {
            'Return': function () {
                $(this).dialog('destroy');
                refreshservices(value.AssetID);
            },
            'Submit': function () {

                var percentage = "";
                var flag = "";
                var validDate = $('#svc_date').val();
                var validDateRxTime = $('#svc_date').val();
                var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
                var convertTimestamp = moment(validDate, dateFormat);
                var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
                var convertRxTime = moment(validDateRxTime, dateFormat);
                var rxtime = moment(convertRxTime).subtract('hours', 8).format(dateFormat);

                if (moment(validDate).isValid() && moment(validDateRxTime).isValid()) {

                    bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
                        if (result) {

                            $('#LoadingForm').modal('show');

                            var svc_notif;
                            if ($('#svc_notify').prop("checked") == true) {
                                svc_notif = 1;
                            } else {
                                svc_notif = 2;
                            }

                            var service = {
                                CompanyName: $('#svc_company').val(),
                                CompanyID: getSessionstorageValueCompanyID,
                                AssetID: value.AssetID,
                                DriverID: $('#svc_driver').val(),
                                ServiceTypeID: $('#svc_type').val(),
                                Timestamp: timestamp,
                                RxTime: rxtime,
                                Invoice: $('#svc_reference').val(),
                                Odometer: $('#svc_odometer').val(),
                                Price: $('#svc_price').val(),
                                Address: $('#svc_address').val(),
                                Remarks: $('#svc_remarks').val(),
                                Platform: svc_notif,
                                Flag: $('#svc_status').val(),
                                ServiceID: value.ServiceID
                            }
   
                            $.ajax({
                                url: "https://track-asia.com/tracksgwebapi/api/servicinginfo?id=" + value.ServiceID,
                                type: "PUT",
                                data: JSON.stringify(service),
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
                                permissions: ["https://*.track-asia.com"],
                                success: function (res) {
                                    console.log(res);
                                    $('#updateServiceForms').dialog('destroy');
                                    refreshservices(value.AssetID);
                                }
                            });
                           

                        }
                        else {

                            setTimeout(function () {
                                $('#LoadingForm').modal('hide');
                            }, 500);
                        };

                    });

                } else {

                    alert('Invalid Date')
                }



            },
        }
    });

    setTimeout(function () {
        $('#LoadingForm').modal('hide');
    }, 500);

}

function viewcontracts(asset_id) {

    $('#LoadingForm').modal('show');
    $('#viewContractForms').dialog('destroy');

    $.ajax({
        type: 'GET',
        url: "https://track-asia.com/tracksgwebapi/api/contractinfo?CompanyID=" + getSessionstorageValueCompanyID + "&AssetID=" + asset_id,
        async: false,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (data) {

            $("<div id='viewContractForms'>").dialog({
                modal: true,
                title: "Contracts",
                width: '100%',
                position: 'center',
                height: 'auto',
                dialogClass: 'no-close',
                open: function () {

                    $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
                    $(".ui-dialog-titlebar-close").hide(); //hide close button

                    var markup =
                        "<div class='col-sm-6 form-group hidden-xs hidden-sm hidden-md hidden-lg'>" +
                        "<label class='control-label'>Asset ID</label>" +
                        "<input type='text' placeholder='Asset ID' class='form-control' id='contract_asset_id' value='" + asset_id + "' disabled='disabled'>" +
                        "</div>" +
                        "<div class='col-sm-4 form-group'>" +
                        "<label class='control-label'>Name <span style='color:red'>*</span></label>" +
                        "<input type='text' placeholder='Name' class='form-control' id='contract_name'>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Phone</label>" +
                        "<input type='text' placeholder='Phone' class='form-control' id='contract_phone'>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Email</label>" +
                        "<input type='text' placeholder='Email' class='form-control' id='contract_email'>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Driver</label>" +
                        "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='contract_driver' name='contract_driver' data-table='searchable'></select>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Contract Type</label>" +
                        "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='contract_type' name='contract_type' data-table='searchable'></select>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Invoice Date</label>" +
                        "<input type='text' placeholder='Invoice Date' class='form-control' id='contract_invoice'>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Contract Start <span style='color:red'>*</span></label>" +
                        "<input type='text' placeholder='Contract Start' class='form-control' id='contract_start'>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Contract End <span style='color:red'>*</span></label>" +
                        "<input type='text' placeholder='Contract End' class='form-control' id='contract_end'>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Contract Interval</label>" +
                        "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='contract_interval' name='contract_interval' data-table='searchable'>" +
                        "<option value='Daily'>Daily</option>" +
                        "<option value='Weekly'>Weekly</option>" +
                        "<option value='Fornightly'>Fornightly</option>" +
                        "<option value='Monthly'>Monthly</option>" +
                        "<option value='Yearly'>Yearly</option>" +
                        "<option class='hidden-xs hidden-sm hidden-md hidden-lg' value='Annually'>Annually</option>" +
                        "<option value='Half Yearly'>Half Yearly</option>" +
                        "<option value='Quarterly'>Quarterly</option>" +
                        "<option class='hidden-xs hidden-sm hidden-md hidden-lg' value='Tri-Monthly'>Tri-Monthly</option>" +
                        "<option value='Bi-Monthly'>Bi-Monthly</option>" +
                        "</select>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Notification Interval</label>" +
                        "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='contract_notif' name='contract_notif' data-table='searchable'>" +
                        "</select>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Unit</label>" +
                        "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='contract_unit' name='contract_unit' data-table='searchable'>" +
                        "<option value='days'>Day/s</option>" +
                        "<option value='weeks'>Week/s</option>" +
                        "<option value='months'>Month/s</option>" +
                        "<option value='years'>Year/s</option>" +
                        "</select>" +
                        "</div>" +
                        "<div class='col-sm-4 form-group'>" +
                        "<label class='control-label'>Terms and Conditions</label>" +
                        "<textarea rows='1' class='form-control' placeholder='Terms and Conditions' id='contract_tc'></textarea>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Odometer at creation (km)</label>" +
                        "<input type='text' placeholder='Odometer at creation (km)' class='form-control' id='contract_odometer'>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Contract No.</label>" +
                        "<input type='text' placeholder='Contract No.' class='form-control' id='contract_reference'>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group'>" +
                        "<label class='control-label'>Contract Price <span style='color:red'>*</span></label>" +
                        "<input type='text' placeholder='Contract Price' class='form-control' id='contract_price'>" +
                        "</div>" +
                        "<div class='col-sm-2 form-group' style='margin-top: 26px;'>" +
                        "<button id='addContract' class='btn btn-success' type='submit' style='margin-right:15px;'>Add Contract</button>" +
                        "</div>"

                    markup += "<div id='custom-contract'>" +
                        "<button id='refreshContractTable' class='btn btn-info' type='submit'>Refresh Table</button>" +
                        "</div>" +
                        "<div class='col-sm-12'>" +
                        "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto; height: 380px;' class=''>" +
                        "<table id='contractlistTable' class='table table-condensed table-vcenter searchable'" +
                        " data-toolbar='#custom-contract'" +
                        " data-click-to-select='true'" +
                        " data-single-select='true'" +
                        " data-search='false'" +
                        " data-show-export='true'" +
                        " data-show-refresh='false'" +
                        " data-show-toggle='false'" +
                        " data-show-columns='false'" +
                        " data-show-toggle='false'" +
                        " data-pagination='false'" +
                        " data-show-pagination-switch='false'" +
                        " cellspacing = '0' width = '100%'> "

                    markup += "</table>" + "</div></div>";

                    var WebAPIContract = 'https://track-asia.com/tracksgwebapi/api/contracttypeinfo/';
                    var contract_type = $.getJSON(WebAPIContract, function (data) {
                        $.each(data, function (index, item) {
                            if (item.ContractTypeID == 3) {
                                $('#contract_type').append($('<option selected="selected"></option>').val(item.ContractTypeID).html(item.Name));
                            }
                            else {
                                $('#contract_type').append($('<option></option>').val(item.ContractTypeID).html(item.Name));
                            }


                        });
                        $('.selectpicker').selectpicker('refresh');
                    });

                    var WebAPIDriver = "";
                    if (getSessionstorageValueRoleID == 1) {
                        WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + '4' + '&CompanyID=' + '2';
                    }
                    else if (getSessionstorageValueRoleID == 2) {
                        WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID;
                    }
                    else if (getSessionstorageValueRoleID >= 3) {
                        WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
                    }
                    var driver = $.getJSON(WebAPIDriver, function (data) {
                        $('#contract_driver').append($('<option selected="selected"></option>').val(0).html("---"));
                        $.each(data, function (index, item) {

                            $('#contract_driver').append($('<option></option>').val(item.DriverID).html(item.Name));

                        });

                        $('.selectpicker').selectpicker('refresh');
                    });

                    //Populate Interval Unit
                    var WebAPINotifInterval = "https://track-asia.com/tracksgwebapi/api/notificationintervalinfo?Description=Days";
                    var notif_interval = $.getJSON(WebAPINotifInterval, function (data) {
                        $.each(data, function (index, item) {
                            $('#contract_notif').append($('<option></option>').val(item.Unit).html(item.Unit));

                        });
                        $('.selectpicker').selectpicker('refresh');
                    });

                    if (markup !== undefined || markup !== null) $(this).html(markup);

                    var selectedUnit = "";
                    $('#contract_unit').on('change', function () {
                        $('#LoadingForm').modal('show');
                        selectedUnit = $(this).val();
                        if (selectedUnit) {

                            $('#contract_notif').empty();

                            var notif_interval = $.getJSON("https://track-asia.com/tracksgwebapi/api/notificationintervalinfo?Description=" + selectedUnit, function (data) {
                                $.each(data, function (index, item) {

                                    $('#contract_notif').append($('<option></option>').val(item.Unit).html(item.Unit));
                                });

                                $('.selectpicker').selectpicker('refresh');
                                setTimeout(function () {
                                    $('#LoadingForm').modal('hide');
                                }, 500);
                            });

                            //No Network Coverage Alert
                            setTimeout(function () {
                                notif_interval.abort();
                                if ($('#LoadingForm').is(":visible")) {
                                    $('#LoadingForm').modal('hide');
                                    return alert("Unable to connect to server, Please check your network connection");
                                }
                            }, 120000);

                        } else {

                            $('#systemsubtitle').empty();
                            $('.selectpicker').selectpicker('refresh');
                            setTimeout(function () {
                                $('#LoadingForm').modal('hide');
                            }, 500);

                        }

                    });

                    Date.parseDate = function (input, format) {
                        return moment(input, format).toDate();
                    };
                    Date.prototype.dateFormat = function (format) {
                        return moment(this).format(format);
                    };

                    var dateTo = moment().format('DD-MMM-YYYY, HH:mm A');

                    jQuery('#contract_invoice').datetimepicker({
                        format: 'DD-MMM, YYYY HH:mm',
                        formatTime: 'HH:mm',
                        formatDate: 'DD-MMM, YYYY HH:mm',
                        theme: 'dark',
                        autoclose: true,
                        mask: false,
                        timepicker: true,
                        todayButton: false,
                        //value: dateTo,
                        onChangeDateTime: function (dp, $input) {
                            $(this).hide();
                            $('#contract_invoice').datetimepicker();
                        }
                    });

                    jQuery('#contract_start').datetimepicker({
                        format: 'DD-MMM, YYYY HH:mm',
                        formatTime: 'HH:mm',
                        formatDate: 'DD-MMM, YYYY HH:mm',
                        theme: 'dark',
                        autoclose: true,
                        mask: false,
                        timepicker: true,
                        todayButton: false,
                        //value: dateTo,
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
                        //value: dateTo,
                        onChangeDateTime: function (dp, $input) {
                            $(this).hide();
                            $('#contract_end').datetimepicker();
                        }
                    });

                    $('#contractlistTable').bootstrapTable({
                        data: data,
                        idField: 'ContractID',
                        exportOptions: {
                            fileName: '[Contracts] ' + moment.utc().add(8, 'hours').format('D-MMM-YYYY')
                        },
                        exportTypes: ['csv'],
                        columns: [{
                            field: 'ItemNo',
                            title: 'Item No.',
                            formatter: serialnoFormatter
                        }, {
                            field: 'ContractID',
                            title: 'Contract ID',
                            class: 'hidden-xs hiddden-sm hidden-md hidden-lg'
                        }, {
                            field: 'Asset',
                            title: 'Vehicle'
                        }, {
                            field: 'DriverName',
                            title: 'Driver'
                        }, {
                            field: 'ContractType',
                            title: 'Contract Type'
                        }, {
                            field: 'Name',
                            title: 'Name'
                        }, {
                            field: 'ContractNo',
                            title: 'Contract Number'
                        }, {
                            field: 'Email',
                            title: 'Email'
                        }, {
                            field: 'Phone',
                            title: 'Phone'
                        }, {
                            field: 'InvoiceDate',
                            title: 'Invoice Date',
                            formatter: timestampFormatter
                        }, {
                            field: 'ContractStart',
                            title: 'Contract Start',
                            formatter: timestampFormatter
                        }, {
                            field: 'ContractEnd',
                            title: 'Contract End',
                            formatter: timestampFormatter
                        },  {
                            field: 'ContractInterval',
                            title: 'Contract Interval'
                        },  {
                            field: 'NotificationInterval',
                            title: 'Notification Interval'
                        }, {
                            field: 'OdometerAtCreation',
                            title: 'Odometer'
                        }, {
                            field: 'ContractPrice',
                            title: 'Contract Price'
                        }, {
                            field: 'TermsAndConditions',
                            title: 'Terms And Conditions'
                        }, {
                            field: 'Action',
                            title: 'Action',
                            formatter: actioncontractFormatter
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

                    var $buttonSystem = $('#addContract');
                    $buttonSystem.click(function (e) {
                        e.preventDefault();

                        var validDateStart = $('#contract_start').val();
                        var validDateEnd = $('#contract_end').val();

                        //Check Date
                        if (moment($("#contract_start").val()).isBefore($("#contract_end").val()) && moment(validDateStart).isValid() && moment(validDateEnd).isValid()) {
                            if ($('#contract_name').val() && $('#contract_price').val()) {

                                bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
                                    if (result) {

                                        $('#LoadingForm').modal('show');

                                        var datetimeFormat = "D-MMM-YYYY, hh:mm:ss A";

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
                                                    main_num = 56;
                                                    main_interval = "days";
                                                    break;
                                                default:
                                                    main_interval = "error";
                                                    break;
                                            }
                                            var n = 0;
                                            while (now.isSameOrBefore(endDate)) {

                                                if (now <= endDate) {
                                                    dates.push(moment(now).subtract(8, 'hours').format('M/D/YYYY HH:mm'));
                                                    now.add(main_num, main_interval);
                                                }

                                                n++;
                                            }

                                            return dates;
                                        };

                                        var startDate = moment($('#contract_start').val());
                                        var endDate = moment($('#contract_end').val());
                                        var results = enumerateDaysBetweenDates(startDate, endDate, $('#contract_interval').val());

                                        var contract = {
                                            CompanyID: getSessionstorageValueCompanyID,
                                            Name: $('#contract_name').val(),
                                            Timestamp: moment.utc().format(datetimeFormat),
                                            RxTime: moment.utc().format(datetimeFormat),
                                            UserID: sessionStorage.getItem('setSessionstorageValueUserID'),
                                            AssetID: asset_id,
                                            DriverID: $('#contract_driver').val(),
                                            Name: $('#contract_name').val(),
                                            ContractNo: $('#contract_reference').val(),
                                            ContractTypeID: $('#contract_type').val(),
                                            InvoiceDate: moment.utc($('#contract_invoice').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                            ContractStart: moment.utc($('#contract_start').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                            ContractEnd: moment.utc($('#contract_end').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                            ContractInterval: $("#contract_interval").val(),
                                            NotificationInterval: $("#contract_notif").val() + " " + $("#contract_unit").val(),
                                            TermsAndConditions: $("#contract_tc").val(),
                                            OdometerAtCreation: $("#contract_odometer").val(),
                                            ContractPrice: $("#contract_price").val(),
                                            Phone: $("#contract_phone").val(),
                                            Email: $("#contract_email").val()
                                        }


                                        $.ajax({
                                            url: "https://track-asia.com/tracksgwebapi/api/contractinfo",
                                            type: "POST",
                                            data: JSON.stringify(contract),
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
                                            permissions: ["https://*.track-asia.com"],
                                            success: function (res) {
                                                console.log(res);
                                 
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
                                                            case "DAY":
                                                                notif_interval = 'days';
                                                                break;
                                                            case "DAYS":
                                                                notif_interval = 'days';
                                                                break;
                                                            case "WEEK":
                                                                notif_interval = 'weeks';
                                                                break;
                                                            case "WEEKS":
                                                                notif_interval = 'weeks';
                                                                break;
                                                            case "YEAR":
                                                                notif_interval = 'years';
                                                                break;
                                                            case "YEARS":
                                                                notif_interval = 'years';
                                                                break;
                                                            case "MONTH":
                                                                notif_interval = 'months';
                                                                break;
                                                            case "MONTHS":
                                                                notif_interval = 'months';
                                                                break;
                                                            case "HOUR":
                                                                notif_interval = 'hours';
                                                                break;
                                                            case "HOURS":
                                                                notif_interval = 'hours';
                                                                break;
                                                            default:
                                                                notif_interval = 'weeks';

                                                        }

                                                        var intervaldates = moment(dates).subtract(notif_interval, arrDates[0]).format('M/D/YYYY HH:mm');

                                                        return intervaldates;
                                                    };

                                                    var notifInterval = getIntervalDates(results[i], $("#contract_notif").val() + " " + $("#contract_unit").val());

                                                    var contract_alert = {
                                                        ContractAlertID: "",
                                                        ContractID: res.ContractID,
                                                        AlertDate: notifInterval,
                                                        Timestamp: results[i],
                                                        RxTime: moment.utc().format(datetimeFormat),                                               
                                                        ContractCancelled: "",
                                                        CancelRemarks: "",
                                                        CompanyID: getSessionstorageValueCompanyID,
                                                        isSent: 1,
                                                        Flag: 1,
                                                    };

                                                    $.ajax({
                                                        url: "https://track-asia.com/tracksgwebapi/api/contractalertinfo",
                                                        type: "POST",
                                                        async: false,
                                                        data: JSON.stringify(contract_alert),
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
                                                        permissions: ["https://*.track-asia.com"],
                                                        success: function (response) {
                                                            console.log(response);
                                                        }

                                                    });


                                                    if (results.length == i + 1) {
                                                        $('#LoadingForm').modal('hide');
                                                        refreshcontract(asset_id);
                                                    }

                                                }
                                            }
                                        });


                                    }
                                    else {

                                        setTimeout(function () {
                                            $('#LoadingForm').modal('hide');
                                        }, 500);
                                    };

                                });

                            } else {
                                return alert('Fields cannot be empty!')

                            }
                        } else {
                            return alert('Invalid Contract Start and Contract End Date!')
                        }


                    });

                    $('#refreshContractTable').click(function (e) {
                        e.preventDefault();
                        refreshcontract(asset_id);

                    });

                    $('.selectpicker').selectpicker('refresh');

                    setTimeout(function () {
                        driver.abort();
                        contract_type.abort();
                        notif_interval.abort();
                        if ($('#LoadingForm').is(":visible")) {
                            $('#LoadingForm').modal('hide');
                            return alert("Unable to connect to server, Please check your network connection");
                        }
                    }, 120000);
                },
                buttons: {
                    //'Return': function () {
                    //    $(this).dialog('destroy');
                    //},
                    Close: function () {

                        //$(this).dialog("close");
                        $(".ui-dialog-content").dialog("close");
                    },
                }
            });



        }
    });

    setTimeout(function () {
        $('#LoadingForm').modal('hide');
    }, 500);
}

function editcontract(value) {

    $('#LoadingForm').modal('show');
    $('#editContractForms').dialog('destroy');

    $("<div id='editContractForms'>").dialog({
        modal: true,
        title: "Edit Contract",
        width: '100%',
        position: 'center',
        height: '500',
        dialogClass: 'no-close',
        open: function () {

            $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
            $(".ui-dialog-titlebar-close").hide(); //hide close button

            var top = Math.max(jQuery(window).height() / 2 - jQuery(this)[0].offsetHeight / 2, 0) - 150;
            var left = Math.max(jQuery(window).width() / 2 - jQuery(this)[0].offsetWidth / 2, 0);

            jQuery(this).parent().css('top', top + "px");
            jQuery(this).parent().css('left', left + "px");
            jQuery(this).parent().css('position', 'fixed');

            var markup =
                "<div class='col-sm-6 form-group hidden-xs hidden-sm hidden-md hidden-lg'>" +
                "<label class='control-label'>Asset ID</label>" +
                "<input type='text' placeholder='Asset ID' class='form-control' id='edit_contract_asset_id' value='" + value.AssetID + "' disabled='disabled'>" +
                "</div>" +
                "<div class='col-sm-4 form-group'>" +
                "<label class='control-label'>Name <span style='color:red'>*</span></label>" +
                "<input type='text' placeholder='Name' class='form-control' id='edit_contract_name' value='" + value.Name + "'>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Phone</label>" +
                "<input type='text' placeholder='Phone' class='form-control' id='edit_contract_phone' value='" + value.Phone + "'>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Email</label>" +
                "<input type='text' placeholder='Email' class='form-control' id='edit_contract_email' value='" + value.Email + "'>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Driver</label>" +
                "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='edit_contract_driver' name='edit_contract_driver' data-table='searchable'></select>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Contract Type</label>" +
                "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='edit_contract_type' name='edit_contract_type' data-table='searchable'></select>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Invoice Date</label>" +
                "<input type='text' placeholder='Invoice Date' class='form-control' id='edit_contract_invoice'>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Contract Start <span style='color:red'>*</span></label>" +
                "<input type='text' placeholder='Contract Start' class='form-control' id='edit_contract_start'>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Contract End <span style='color:red'>*</span></label>" +
                "<input type='text' placeholder='Contract End' class='form-control' id='edit_contract_end'>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Contract Interval</label>" +
                "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='edit_contract_interval' name='edit_contract_interval' data-table='searchable'>" +
                "<option value='Daily'>Daily</option>" +
                "<option value='Weekly'>Weekly</option>" +
                "<option value='Fornightly'>Fornightly</option>" +
                "<option value='Monthly'>Monthly</option>" +
                "<option value='Yearly'>Yearly</option>" +
                "<option class='hidden-xs hidden-sm hidden-md hidden-lg' value='Annually'>Annually</option>" +
                "<option value='Half Yearly'>Half Yearly</option>" +
                "<option value='Quarterly'>Quarterly</option>" +
                "<option class='hidden-xs hidden-sm hidden-md hidden-lg' value='Tri-Monthly'>Tri-Monthly</option>" +
                "<option value='Bi-Monthly'>Bi-Monthly</option>" +
                "</select>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Notification Interval</label>" +
                "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='edit_contract_notif' name='contract_notif' data-table='searchable'>" +
                "</select>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Unit</label>" +
                "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='edit_contract_unit' name='contract_unit' data-table='searchable'>" +
                "<option value='days'>Day/s</option>" +
                "<option value='weeks'>Week/s</option>" +
                "<option value='months'>Month/s</option>" +
                "<option value='years'>Year/s</option>" +
                "</select>" +
                "</div>" +
                "<div class='col-sm-4 form-group'>" +
                "<label class='control-label'>Terms and Conditions</label>" +
                "<textarea rows='1' class='form-control' placeholder='Terms and Conditions' id='edit_contract_tc'></textarea>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Odometer at creation (km)</label>" +
                "<input type='text' placeholder='Odometer at creation (km)' class='form-control' id='edit_contract_odometer' value='" + value.OdometerAtCreation + "'>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Contract No.</label>" +
                "<input type='text' placeholder='Contract No.' class='form-control' id='edit_contract_reference' value='" + value.ContractNo + "'>" +
                "</div>" +
                "<div class='col-sm-2 form-group'>" +
                "<label class='control-label'>Contract Price <span style='color:red'>*</span></label>" +
                "<input type='text' placeholder='Contract Price' class='form-control' id='edit_contract_price' value='" + value.ContractPrice + "'>" +
                "</div>";
            
            var WebAPIContract = 'https://track-asia.com/tracksgwebapi/api/contracttypeinfo/';
            var contract_type = $.getJSON(WebAPIContract, function (data) {
                $.each(data, function (index, item) {
                    if (value.ContractTypeID == item.ContractTypeID) {
                        $('#edit_contract_type').append($('<option selected="selected"></option>').val(item.ContractTypeID).html(item.Name));
                    }
                    else {
                        $('#edit_contract_type').append($('<option></option>').val(item.ContractTypeID).html(item.Name));
                    }


                });
                $('.selectpicker').selectpicker('refresh');
            });

            var WebAPIDriver = "";
            if (getSessionstorageValueRoleID == 1) {
                WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + '4' + '&CompanyID=' + '2';
            }
            else if (getSessionstorageValueRoleID == 2) {
                WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID;
            }
            else if (getSessionstorageValueRoleID >= 3) {
                WebAPIDriver = 'https://track-asia.com/tracksgwebapi/api/driverinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;
            }
            var driver = $.getJSON(WebAPIDriver, function (data) {
                $('#edit_contract_driver').append($('<option selected="selected"></option>').val(0).html("---"));
                $.each(data, function (index, item) {
                    if (value.DriverID == item.DriverID) {
                        $('#edit_contract_driver').append($('<option selected="selected"></option>').val(item.DriverID).html(item.Name));
                    } else {
                        $('#edit_contract_driver').append($('<option></option>').val(item.DriverID).html(item.Name));
                    }
                });

                $('.selectpicker').selectpicker('refresh');
            });

            //Populate Interval Unit
            var WebAPINotifInterval = "https://track-asia.com/tracksgwebapi/api/notificationintervalinfo?Description=Days";
            var notif_interval = $.getJSON(WebAPINotifInterval, function (data) {

                var str = value.NotificationInterval;
                var arrayStr = str.split(" ");
                $('#edit_contract_unit').val(arrayStr[1]);
                $.each(data, function (index, item) {

                    if (arrayStr[0] == item.Unit) {
                        $('#edit_contract_notif').append($('<option selected="selected"></option>').val(item.Unit).html(item.Unit));
                    } else {
                        $('#edit_contract_notif').append($('<option></option>').val(item.Unit).html(item.Unit));
                    }
                  

                });
                $('.selectpicker').selectpicker('refresh');
            });

            if (markup !== undefined || markup !== null) $(this).html(markup);

            var selectedUnit = "";
            $('#edit_contract_unit').on('change', function () {
                $('#LoadingForm').modal('show');
                selectedUnit = $(this).val();
                if (selectedUnit) {

                    $('#edit_contract_notif').empty();

                    var notif_interval = $.getJSON("https://track-asia.com/tracksgwebapi/api/notificationintervalinfo?Description=" + selectedUnit, function (data) {
                        $.each(data, function (index, item) {

                            $('#edit_contract_notif').append($('<option></option>').val(item.Unit).html(item.Unit));
                        });

                        $('.selectpicker').selectpicker('refresh');
                        setTimeout(function () {
                            $('#LoadingForm').modal('hide');
                        }, 500);
                    });

                    //No Network Coverage Alert
                    setTimeout(function () {
                        notif_interval.abort();
                        if ($('#LoadingForm').is(":visible")) {
                            $('#LoadingForm').modal('hide');
                            return alert("Unable to connect to server, Please check your network connection");
                        }
                    }, 120000);

                } else {

                    $('#systemsubtitle').empty();
                    $('.selectpicker').selectpicker('refresh');
                    setTimeout(function () {
                        $('#LoadingForm').modal('hide');
                    }, 500);

                }

            });

            $('#edit_contract_invoice').val(inputdateFormatter(value.InvoiceDate));
            $('#edit_contract_start').val(inputdateFormatter(value.ContractStart));
            $('#edit_contract_end').val(inputdateFormatter(value.ContractEnd));


            Date.parseDate = function (input, format) {
                return moment(input, format).toDate();
            };
            Date.prototype.dateFormat = function (format) {
                return moment(this).format(format);
            };

            var dateTo = moment().format('DD-MMM-YYYY, HH:mm A');

            jQuery('#edit_contract_invoice').datetimepicker({
                format: 'DD-MMM, YYYY HH:mm',
                formatTime: 'HH:mm',
                formatDate: 'DD-MMM, YYYY HH:mm',
                theme: 'dark',
                autoclose: true,
                mask: false,
                timepicker: true,
                todayButton: false,
                //value: dateTo,
                onChangeDateTime: function (dp, $input) {
                    $(this).hide();
                    $('#edit_contract_invoice').datetimepicker();
                }
            });

            jQuery('#edit_contract_start').datetimepicker({
                format: 'DD-MMM, YYYY HH:mm',
                formatTime: 'HH:mm',
                formatDate: 'DD-MMM, YYYY HH:mm',
                theme: 'dark',
                autoclose: true,
                mask: false,
                timepicker: true,
                todayButton: false,
                //value: dateTo,
                onChangeDateTime: function (dp, $input) {
                    $(this).hide();
                    $('#edit_contract_start').datetimepicker();
                }
            });

            jQuery('#edit_contract_end').datetimepicker({
                format: 'DD-MMM, YYYY HH:mm',
                formatTime: 'HH:mm',
                formatDate: 'DD-MMM, YYYY HH:mm',
                theme: 'dark',
                autoclose: true,
                mask: false,
                timepicker: true,
                todayButton: false,
                //value: dateTo,
                onChangeDateTime: function (dp, $input) {
                    $(this).hide();
                    $('#edit_contract_end').datetimepicker();
                }
            });

            $('#edit_contract_tc').val(value.TermsAndConditions);
            $('#edit_contract_interval').val(value.ContractInterval);

            $('.selectpicker').selectpicker('refresh');

            setTimeout(function () {
                driver.abort();
                contract_type.abort();
                notif_interval.abort();
                if ($('#LoadingForm').is(":visible")) {
                    $('#LoadingForm').modal('hide');
                    return alert("Unable to connect to server, Please check your network connection");
                }
            }, 120000);
        },
        buttons: {
            'Return': function () {
                $(this).dialog('destroy');
            },
            'Recalculate': function () {

                var validDateStart = $('#edit_contract_start').val();
                var validDateEnd = $('#edit_contract_end').val();

                if (moment(validDateStart).isValid() && moment(validDateEnd).isValid()) {


                    bootbox.confirm("<div style='color:red'>Warning!!! This action might affect the existing Contracts. <div style='color:black'>Are you sure you wish to submit?</div></div>", function (result) {
                        if (result) {

                            $('#LoadingForm').modal('show');

                            var datetimeFormat = "D-MMM-YYYY, hh:mm:ss A";

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
                                        main_num = 56;
                                        main_interval = "days";
                                        break;
                                    default:
                                        main_interval = "error";
                                        break;
                                }
                                var n = 0;
                                while (now.isSameOrBefore(endDate)) {

                                    if (now <= endDate) {
                                        dates.push(moment(now).subtract(8, 'hours').format('M/D/YYYY HH:mm'));
                                        now.add(main_num, main_interval);
                                    }

                                    n++;
                                }

                                return dates;
                            };

                            var startDate = moment($('#edit_contract_start').val());
                            var endDate = moment($('#edit_contract_end').val());
                            var results = enumerateDaysBetweenDates(startDate, endDate, $('#edit_contract_interval').val());

                            var contract = {
                                CompanyID: getSessionstorageValueCompanyID,
                                Name: $('#edit_contract_name').val(),
                                Timestamp: value.Timestamp,
                                RxTime: moment.utc().format(datetimeFormat),
                                UserID: sessionStorage.getItem('setSessionstorageValueUserID'),
                                AssetID: value.AssetID,
                                DriverID: $('#edit_contract_driver').val(),
                                Name: $('#edit_contract_name').val(),
                                ContractNo: $('#edit_contract_reference').val(),
                                ContractTypeID: $('#edit_contract_type').val(),
                                InvoiceDate: moment.utc($('#edit_contract_invoice').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                ContractStart: moment.utc($('#edit_contract_start').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                ContractEnd: moment.utc($('#edit_contract_end').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                ContractInterval: $("#edit_contract_interval").val(),
                                NotificationInterval: $("#edit_contract_notif").val() + " " + $("#edit_contract_unit").val(),
                                TermsAndConditions: $("#edit_contract_tc").val(),
                                OdometerAtCreation: $("#edit_contract_odometer").val(),
                                ContractPrice: $("#edit_contract_price").val(),
                                Phone: $("#edit_contract_phone").val(),
                                Email: $("#edit_contract_email").val()
                            }

                            $.ajax({
                                url: "https://track-asia.com/tracksgwebapi/api/contractinfo?id=" + value.ContractID,
                                type: "PUT",
                                data: JSON.stringify(contract),
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
                                permissions: ["https://*.track-asia.com"],
                                success: function (res) {
                                    console.log(res);
                                    //Delete previous alert 
                                    var deletecontractalert = JSON.stringify({
                                        'ContractID': value.ContractID
                                    });

                                    $.ajax({
                                        url: "https://track-asia.com/tracksgwebapi/api/contractalertinfoex/" + value.ContractID,
                                        type: "Delete",
                                        async: false,
                                        data: JSON.stringify(deletecontractalert),
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
                                        permissions: ["https://*.track-asia.com"],
                                        success: function (del_response) {
                                            console.log(del_response);

                                            //Add New Contract Alert
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
                                                        case "DAY":
                                                            notif_interval = 'days';
                                                            break;
                                                        case "DAYS":
                                                            notif_interval = 'days';
                                                            break;
                                                        case "WEEK":
                                                            notif_interval = 'weeks';
                                                            break;
                                                        case "WEEKS":
                                                            notif_interval = 'weeks';
                                                            break;
                                                        case "YEAR":
                                                            notif_interval = 'years';
                                                            break;
                                                        case "YEARS":
                                                            notif_interval = 'years';
                                                            break;
                                                        case "MONTH":
                                                            notif_interval = 'months';
                                                            break;
                                                        case "MONTHS":
                                                            notif_interval = 'months';
                                                            break;
                                                        case "HOUR":
                                                            notif_interval = 'hours';
                                                            break;
                                                        case "HOURS":
                                                            notif_interval = 'hours';
                                                            break;
                                                        default:
                                                            notif_interval = 'weeks';

                                                    }

                                                    var intervaldates = moment(dates).subtract(notif_interval, arrDates[0]).format('M/D/YYYY HH:mm');

                                                    return intervaldates;
                                                };

                                                var notifInterval = getIntervalDates(results[i], $("#edit_contract_notif").val() + " " + $("#edit_contract_unit").val());

                                                var contract_alert = {
                                                    ContractAlertID: "",
                                                    ContractID: value.ContractID,
                                                    AlertDate: notifInterval,
                                                    Timestamp: results[i],
                                                    RxTime: moment.utc().format(datetimeFormat),
                                                    ContractCancelled: "",
                                                    CancelRemarks: "",
                                                    CompanyID: getSessionstorageValueCompanyID,
                                                    isSent: 1,
                                                    Flag: 1,
                                                };

                                                $.ajax({
                                                    url: "https://track-asia.com/tracksgwebapi/api/contractalertinfo",
                                                    type: "POST",
                                                    async: false,
                                                    data: JSON.stringify(contract_alert),
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
                                                    permissions: ["https://*.track-asia.com"],
                                                    success: function (response) {
                                                        console.log(response);
                                                    }

                                                });


                                                if (results.length == i + 1) {
                                                    $('#LoadingForm').modal('hide');
                                                    $('#editContractForms').dialog('destroy');
                                                    refreshcontract(value.AssetID);
                                                }

                                            }
                                        }

                                    });



                                }
                            });




                        }
                        else {

                            setTimeout(function () {
                                $('#LoadingForm').modal('hide');
                            }, 500);
                        };

                    });

                } else {

                    alert('Invalid Date')
                }
            },
            'Submit': function () {

                var validDateStart = $('#edit_contract_start').val();
                var validDateEnd = $('#edit_contract_end').val();

                if (moment(validDateStart).isValid() && moment(validDateEnd).isValid()) {


                    bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
                        if (result) {

                            $('#LoadingForm').modal('show');

                            var datetimeFormat = "D-MMM-YYYY, hh:mm:ss A";

                            var contract = {
                                CompanyID: getSessionstorageValueCompanyID,
                                Name: $('#edit_contract_name').val(),
                                Timestamp: value.Timestamp,
                                RxTime: moment.utc().format(datetimeFormat),
                                UserID: sessionStorage.getItem('setSessionstorageValueUserID'),
                                AssetID: value.AssetID,
                                DriverID: $('#edit_contract_driver').val(),
                                Name: $('#edit_contract_name').val(),
                                ContractNo: $('#edit_contract_reference').val(),
                                ContractTypeID: $('#edit_contract_type').val(),
                                InvoiceDate: moment.utc($('#edit_contract_invoice').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                ContractStart: moment.utc($('#edit_contract_start').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                ContractEnd: moment.utc($('#edit_contract_end').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                ContractInterval: $("#edit_contract_interval").val(),
                                NotificationInterval: $("#edit_contract_notif").val() + " " + $("#edit_contract_unit").val(),
                                TermsAndConditions: $("#edit_contract_tc").val(),
                                OdometerAtCreation: $("#edit_contract_odometer").val(),
                                ContractPrice: $("#edit_contract_price").val(),
                                Phone: $("#edit_contract_phone").val(),
                                Email: $("#edit_contract_email").val()
                            }

                            $.ajax({
                                url: "https://track-asia.com/tracksgwebapi/api/contractinfo?id=" + value.ContractID,
                                type: "PUT",
                                data: JSON.stringify(contract),
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
                                permissions: ["https://*.track-asia.com"],
                                success: function (res) {
                                    console.log(res);
                                    
                                    $('#LoadingForm').modal('hide');
                                    $('#editContractForms').dialog('destroy');
                                    refreshcontract(value.AssetID);
                                }
                            });




                        }
                        else {

                            setTimeout(function () {
                                $('#LoadingForm').modal('hide');
                            }, 500);
                        };

                    });

                } else {

                    alert('Invalid Date')
                }
            }
        }
    });

    setTimeout(function () {
        $('#LoadingForm').modal('hide');
    }, 500);
}

function deletecontract(value) {

    bootbox.confirm("<div style='color:black'>Are you sure you wish to delete?</div>", function (result) {
        if (result) {

            $('#LoadingForm').modal('show');
            var service = JSON.stringify({ 'ContractID': value.ContractID });
            var WebAPI = 'https://track-asia.com/tracksgwebapi/api/contractinfo/' + value.ContractID;

            $.ajax({
                url: WebAPI,
                type: "Delete",
                data: JSON.stringify(service),
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
                permissions: ["https://*.track-asia.com"],
                success: function (res) {
                    console.log(res);
                    refreshcontract(value.AssetID);
                }
            });

        }
        else {

            setTimeout(function () {
                $('#LoadingForm').modal('hide');
            }, 500);
        };

    });

}

function refreshcontract(asset_id) {

    $('#LoadingForm').modal('show');
    $('#contractlistTable').bootstrapTable('destroy');

    $.ajax({
        type: 'GET',
        url: "https://track-asia.com/tracksgwebapi/api/contractinfo?CompanyID=" + getSessionstorageValueCompanyID + "&AssetID=" + asset_id,
        async: false,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (data) {


            $('#contractlistTable').bootstrapTable({
                data: data,
                idField: 'ContractID',
                exportOptions: {
                    fileName: '[Contracts] ' + moment.utc().add(8, 'hours').format('D-MMM-YYYY')
                },
                exportTypes: ['csv'],
                columns: [{
                    field: 'ItemNo',
                    title: 'Item No.',
                    formatter: serialnoFormatter
                }, {
                    field: 'ContractID',
                    title: 'Contract ID',
                    class: 'hidden-xs hiddden-sm hidden-md hidden-lg'
                }, {
                    field: 'Asset',
                    title: 'Vehicle'
                }, {
                    field: 'DriverName',
                    title: 'Driver'
                }, {
                    field: 'ContractType',
                    title: 'Contract Type'
                }, {
                    field: 'Name',
                    title: 'Name'
                }, {
                    field: 'ContractNo',
                    title: 'Contract Number'
                }, {
                    field: 'Email',
                    title: 'Email'
                }, {
                    field: 'Phone',
                    title: 'Phone'
                }, {
                    field: 'InvoiceDate',
                    title: 'Invoice Date',
                    formatter: timestampFormatter
                }, {
                    field: 'ContractStart',
                    title: 'Contract Start',
                    formatter: timestampFormatter
                }, {
                    field: 'ContractEnd',
                    title: 'Contract End',
                    formatter: timestampFormatter
                }, {
                    field: 'ContractInterval',
                    title: 'Contract Interval'
                }, {
                    field: 'NotificationInterval',
                    title: 'Notification Interval'
                }, {
                    field: 'OdometerAtCreation',
                    title: 'Odometer'
                }, {
                    field: 'ContractPrice',
                    title: 'Contract Price'
                }, {
                    field: 'TermsAndConditions',
                    title: 'Terms And Conditions'
                }, {
                    field: 'Action',
                    title: 'Action',
                    formatter: actioncontractFormatter
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



        }
    });

    setTimeout(function () {
        $('#LoadingForm').modal('hide');
    }, 500);
}

function viewcontractalert(value) {

    $('#LoadingForm').modal('show');
    $('#viewContractAlertForms').dialog('destroy');

    $.ajax({
        type: 'GET',
        url: "https://track-asia.com/tracksgwebapi/api/contractalertinfo?ContractID=" + value.ContractID + "&CompanyID=" + getSessionstorageValueCompanyID,
        async: false,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (data) {

            $("<div id='viewContractAlertForms'>").dialog({
                modal: true,
                title: "Contract Alerts",
                width: '100%',
                position: 'absolute',
                height: 'auto',
                dialogClass: 'no-close',
                open: function () {

                    $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
                    $(".ui-dialog-titlebar-close").hide(); //hide close button

                    var markup =
                        "<div class='col-sm-4 form-group'>" +
                        "<label class='control-label'>Alert Date <span style='color:red'>*</span></label>" +
                        "<input type='text' placeholder='Alert Date' class='form-control' id='add_contract_alertdate'>" +
                        "</div>" +
                        "<div class='col-sm-4 form-group'>" +
                        "<label class='control-label'>Scheduled Date <span style='color:red'>*</span></label>" +
                        "<input type='text' placeholder='Scheduled Date' class='form-control' id='add_contract_scheduleddate'>" +
                        "</div>" +
                        "<div class='col-sm-4 form-group' style='margin-top: 26px;'>" +
                        "<button id='addContractAlert' class='btn btn-success' type='submit' style='margin-right:15px;'>Add Contract Alert</button>" +
                        "</div>";

                    markup += "<div id='custom-contract-alert'>" +
                        "<button id='refreshContractAlertTable' class='btn btn-info' type='submit'>Refresh Table</button>" +
                        "</div>" +
                        "<div class='col-sm-12'>" +
                        "<div style='border-style: none; margin: 0px; padding: 0px 3px; overflow: auto;' class=''>" +
                        "<table id='contractalertlistTable' class='table table-condensed table-vcenter searchable'" +
                        " data-toolbar='#custom-contract-alert'" +
                        " data-click-to-select='true'" +
                        " data-single-select='true'" +
                        " data-search='false'" +
                        " data-show-export='true'" +
                        " data-show-refresh='false'" +
                        " data-show-toggle='false'" +
                        " data-show-columns='false'" +
                        " data-show-toggle='false'" +
                        " data-pagination='false'" +
                        " data-show-pagination-switch='false'" +
                        " cellspacing = '0' width = '100%'> "

                    markup += "</table>" + "</div></div>";


                    if (markup !== undefined || markup !== null) $(this).html(markup);

                    Date.parseDate = function (input, format) {
                        return moment(input, format).toDate();
                    };
                    Date.prototype.dateFormat = function (format) {
                        return moment(this).format(format);
                    };

                    var dateTo = moment().format('DD-MMM-YYYY, HH:mm A');

                    jQuery('#add_contract_alertdate').datetimepicker({
                        format: 'DD-MMM, YYYY HH:mm',
                        formatTime: 'HH:mm',
                        formatDate: 'DD-MMM, YYYY HH:mm',
                        theme: 'dark',
                        autoclose: true,
                        mask: false,
                        timepicker: true,
                        todayButton: false,
                        //value: dateTo,
                        onChangeDateTime: function (dp, $input) {
                            $(this).hide();
                            $('#add_contract_alertdate').datetimepicker();
                        }
                    });

                    jQuery('#add_contract_scheduleddate').datetimepicker({
                        format: 'DD-MMM, YYYY HH:mm',
                        formatTime: 'HH:mm',
                        formatDate: 'DD-MMM, YYYY HH:mm',
                        theme: 'dark',
                        autoclose: true,
                        mask: false,
                        timepicker: true,
                        todayButton: false,
                        //value: dateTo,
                        onChangeDateTime: function (dp, $input) {
                            $(this).hide();
                            $('#add_contract_scheduleddate').datetimepicker();
                        }
                    });

                    $('#contractalertlistTable').bootstrapTable({
                        data: data,
                        idField: 'ContractAlertID',
                        exportOptions: {
                            fileName: '[Contract Alerts] ' + moment.utc().add(8, 'hours').format('D-MMM-YYYY')
                        },
                        exportTypes: ['csv'],
                        columns: [{
                            field: 'ItemNo',
                            title: 'Item No.',
                            formatter: serialnoFormatter
                        }, {
                            field: 'ContractAlertID',
                            title: 'Contract Alert ID',
                            //class: 'hidden-xs hiddden-sm hidden-md hidden-lg'
                        }, {
                            field: 'AlertDate',
                            title: 'Alert Date',
                            formatter: timestampFormatter
                        }, {
                            field: 'AlertDate',
                            title: 'Alert Day',
                            formatter: dayFormatter
                        }, {
                            field: 'Timestamp',
                            title: 'Scheduled Date',
                            formatter: timestampFormatter
                        }, {
                            field: 'Timestamp',
                            title: 'Scheduled Day',
                            formatter: dayFormatter
                        }, {
                            field: 'ContractCancelled',
                            title: 'Date of Cancellation',
                            formatter: timestampFormatter
                        }, {
                            field: 'CancelRemarks',
                            title: 'Cancel Remarks'
                        }, {
                            field: 'FlagValue',
                            title: 'Status'
                        }, {
                            field: 'Action',
                            title: 'Action',
                            formatter: actioncontractalertFormatter
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

                    var $buttonSystem = $('#addContractAlert');
                    $buttonSystem.click(function (e) {
                        e.preventDefault();

                        var validAlertDate = $('#add_contract_alertdate').val();
                        var validScheduledDate = $('#add_contract_scheduleddate').val();

                        //Check Date
                        if (moment($("#add_contract_alertdate").val()).isBefore($("#add_contract_scheduleddate").val()) && moment(validAlertDate).isValid() && moment(validScheduledDate).isValid()) {

                            bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
                                if (result) {

                                    $('#LoadingForm').modal('show');
                                    var datetimeFormat = "D-MMM-YYYY, hh:mm:ss A";

                                    var contract_alert = {
                                        ContractAlertID: value.ContractAlertID,
                                        ContractID: value.ContractID,
                                        AlertDate: moment.utc($('#add_contract_alertdate').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                        Timestamp: moment.utc($('#add_contract_scheduleddate').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                        RxTime: moment.utc().format(datetimeFormat),
                                        ContractCancelled: "",
                                        CancelRemarks: "",
                                        CompanyID: value.CompanyID,
                                        isSent: 1,
                                        Flag: 1,
                                    };

                                    $.ajax({
                                        url: "https://track-asia.com/tracksgwebapi/api/contractalertinfo",
                                        type: "POST",
                                        data: JSON.stringify(contract_alert),
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
                                        permissions: ["https://*.track-asia.com"],
                                        success: function (res) {
                                            console.log(res);

                                            $('#LoadingForm').modal('hide');
                                            refreshcontractalert(value);
                                        }
                                    });


                                }
                                else {

                                    setTimeout(function () {
                                        $('#LoadingForm').modal('hide');
                                    }, 500);
                                };

                            });

                        } else {
                            return alert('Invalid Alert Date or Scheduled Date!')
                        }


                    });

                    $('#refreshContractAlertTable').click(function (e) {
                        e.preventDefault();
                        refreshcontractalert(value);

                    });

                    setTimeout(function () {
                        if ($('#LoadingForm').is(":visible")) {
                            $('#LoadingForm').modal('hide');
                            return alert("Unable to connect to server, Please check your network connection");
                        }
                    }, 120000);
                },
                buttons: {
                    'Return': function () {
                        $(this).dialog('destroy');
                    },
                }
            });



        }
    });

    setTimeout(function () {
        $('#LoadingForm').modal('hide');
    }, 500);
}

function editcontractalert(value) {

    $('#LoadingForm').modal('show');
    $('#editContractAlertForms').dialog('destroy');

    $("<div id='editContractAlertForms'>").dialog({
        modal: true,
        title: "Edit Contract Alert",
        width: '50%',
        position: 'center',
        height: '450',
        dialogClass: 'no-close',
        open: function () {

            $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
            $(".ui-dialog-titlebar-close").hide(); //hide close button

            var top = Math.max(jQuery(window).height() / 2 - jQuery(this)[0].offsetHeight / 2, 0) - 150;
            var left = Math.max(jQuery(window).width() / 2 - jQuery(this)[0].offsetWidth / 2, 0);

            jQuery(this).parent().css('top', top + "px");
            jQuery(this).parent().css('left', left + "px");
            jQuery(this).parent().css('position', 'fixed');

            var markup =
                "<div class='col-sm-4 form-group'>" +
                "<label class='control-label'>Alert Date <span style='color:red'>*</span></label>" +
                "<input type='text' placeholder='Alert Date' class='form-control' id='edit_contract_alertdate'>" +
                "</div>" +
                "<div class='col-sm-4 form-group'>" +
                "<label class='control-label'>Scheduled Date <span style='color:red'>*</span></label>" +
                "<input type='text' placeholder='Scheduled Date' class='form-control' id='edit_contract_scheduleddate'>" +
                "</div>" +             
                "<div class='col-sm-4 form-group'>" +
                "<label class='control-label'>Status</label>" +
                "<select class='selectpicker' data-live-search='true' data-dropup-auto='false' data-width='100%' data-style='btn-asiacomDropdown' id='edit_contract_status' name='edit_contract_status' data-table='searchable'>" +
                "</select>" +
                "</div>";


            //Populate Flag Value
            var WebAPISystem = "https://track-asia.com/tracksgwebapi/api/flaginfo";
            var filter = $.getJSON(WebAPISystem, function (data) {
                $.each(data, function (index, item) {
                    if (value.Flag == item.FlagID) {
                        $('#edit_contract_status').append($('<option selected="selected"></option>').val(item.FlagID).html(item.FlagValue));
                    } else {
                        $('#edit_contract_status').append($('<option></option>').val(item.FlagID).html(item.FlagValue));
                    }


                });
                $('.selectpicker').selectpicker('refresh');
            });

            if (markup !== undefined || markup !== null) $(this).html(markup);
     
            $('#edit_contract_alertdate').val(inputdateFormatter(value.AlertDate));
            $('#edit_contract_scheduleddate').val(inputdateFormatter(value.Timestamp));


            Date.parseDate = function (input, format) {
                return moment(input, format).toDate();
            };
            Date.prototype.dateFormat = function (format) {
                return moment(this).format(format);
            };

            var dateTo = moment().format('DD-MMM-YYYY, HH:mm A');

            jQuery('#edit_contract_alertdate').datetimepicker({
                format: 'DD-MMM, YYYY HH:mm',
                formatTime: 'HH:mm',
                formatDate: 'DD-MMM, YYYY HH:mm',
                theme: 'dark',
                autoclose: true,
                mask: false,
                timepicker: true,
                todayButton: false,
                //value: dateTo,
                onChangeDateTime: function (dp, $input) {
                    $(this).hide();
                    $('#edit_contract_alertdate').datetimepicker();
                }
            });

            jQuery('#edit_contract_scheduleddate').datetimepicker({
                format: 'DD-MMM, YYYY HH:mm',
                formatTime: 'HH:mm',
                formatDate: 'DD-MMM, YYYY HH:mm',
                theme: 'dark',
                autoclose: true,
                mask: false,
                timepicker: true,
                todayButton: false,
                //value: dateTo,
                onChangeDateTime: function (dp, $input) {
                    $(this).hide();
                    $('#edit_contract_scheduleddate').datetimepicker();
                }
            });


            $('.selectpicker').selectpicker('refresh');

            setTimeout(function () {
                filter.abort();
                if ($('#LoadingForm').is(":visible")) {
                    $('#LoadingForm').modal('hide');
                    return alert("Unable to connect to server, Please check your network connection");
                }
            }, 120000);
        },
        buttons: {
            'Return': function () {
                $(this).dialog('destroy');
            },
            'Submit': function () {

                var datetimeFormat = "D-MMM-YYYY, hh:mm:ss A";
                var validAlertDate = $('#edit_contract_alertdate').val();
                var validScheduledDate = $('#edit_contract_scheduleddate').val();

                if (moment(validAlertDate).isValid() && moment(validScheduledDate).isValid()) {

                    if ($('#edit_contract_status').val() == 2) {

                        //Cancel Contract Alert
                        var contract_alert = {
                            ContractAlertID: value.ContractAlertID,
                            ContractID: value.ContractID,
                            AlertDate: moment.utc($('#edit_contract_alertdate').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                            Timestamp: moment.utc($('#edit_contract_scheduleddate').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                            RxTime: moment.utc().format(datetimeFormat),
                            ContractCancelled: value.ContractCancelled,
                            CancelRemarks: value.CancelRemarks,
                            CompanyID: value.CompanyID,
                            isSent: value.isSent,
                            Flag: $('#edit_contract_status').val(),
                        };

                        cancelcontractalert(contract_alert);

                    } else {

                        bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
                            if (result) {

                                $('#LoadingForm').modal('show');

                                var datetimeFormat = "D-MMM-YYYY, hh:mm:ss A";

                                var contract_alert = {
                                    ContractAlertID: value.ContractAlertID,
                                    ContractID: value.ContractID,
                                    AlertDate: moment.utc($('#edit_contract_alertdate').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                    Timestamp: moment.utc($('#edit_contract_scheduleddate').val()).subtract(8, 'hours').format('DD-MMM, YYYY HH:mm'),
                                    RxTime: moment.utc().format(datetimeFormat),
                                    ContractCancelled: value.ContractCancelled,
                                    CancelRemarks: value.CancelRemarks,
                                    CompanyID: value.CompanyID,
                                    isSent: value.isSent,
                                    Flag: $('#edit_contract_status').val(),
                                };
         
                                $.ajax({
                                    url: "https://track-asia.com/tracksgwebapi/api/contractalertinfo?id=" + value.ContractAlertID,
                                    type: "PUT",
                                    data: JSON.stringify(contract_alert),
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
                                    permissions: ["https://*.track-asia.com"],
                                    success: function (res) {
                                        console.log(res);

                                        $('#LoadingForm').modal('hide');
                                        $('#editContractAlertForms').dialog('destroy');
                                        refreshcontractalert(value);
                                    }
                                });

                            }
                            else {

                                setTimeout(function () {
                                    $('#LoadingForm').modal('hide');
                                }, 500);
                            };

                        });

                    }



                } else {

                    alert('Invalid Date')
                }
            }
        }
    });

    setTimeout(function () {
        $('#LoadingForm').modal('hide');
    }, 500);
}

function cancelcontractalert(value) {

    $('#LoadingForm').modal('show');
    $('#cancelContractAlertForms').dialog('destroy');

    $("<div id='cancelContractAlertForms'>").dialog({
        modal: true,
        title: "Cancel Contract",
        width: '50%',
        position: 'center',
        height: '350',
        dialogClass: 'no-close',
        open: function () {

            $('.ui-widget-overlay').addClass('custom-overlay'); //change backgound color
            $(".ui-dialog-titlebar-close").hide(); //hide close button

            var top = Math.max(jQuery(window).height() / 2 - jQuery(this)[0].offsetHeight / 2, 0) - 150;
            var left = Math.max(jQuery(window).width() / 2 - jQuery(this)[0].offsetWidth / 2, 0);

            jQuery(this).parent().css('top', top + "px");
            jQuery(this).parent().css('left', left + "px");
            jQuery(this).parent().css('position', 'fixed');

            var markup = "<div class='col-sm-12 form-group'>" +
                "<label class='control-label'>Remarks</label>" +
                "<textarea rows='6' id='cancelRemarks' placeholder='Remarks' class='form-control'></textarea>" +
                "</div>"

            if (markup !== undefined || markup !== null) $(this).html(markup);

            $('#cancelRemarks').val(value.CancelRemarks);
        },
        buttons: {
            'Return': function () {
                $(this).dialog('destroy');
                setTimeout(function () {
                    $('#LoadingForm').modal('hide');
                }, 500);
            },
            'Submit': function () {

                if (isEmpty($('#cancelRemarks').val()) == false) {

                    bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
                        if (result) {

                            value.ContractCancelled = moment().format();
                            value.CancelRemarks = $('#cancelRemarks').val();

                            $('#LoadingForm').modal('show');

                            console.log('Contract Param : ' + JSON.stringify(value));

                            var updateContract = 'https://track-asia.com/tracksgwebapi/api/contractalertinfo?id=' + value.ContractAlertID;

                            $.ajax({
                                url: updateContract,
                                type: "PUT",
                                async: false,
                                data: JSON.stringify(value),
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
                                permissions: ["https://*.track-asia.com"],
                                success: function (res) {
                                    console.log(res);

                                    $('#LoadingForm').modal('hide');
                                    $('#cancelContractAlertForms').dialog('destroy');
                                    $('#editContractAlertForms').dialog('destroy');
                                    refreshcontractalert(value);
                                    setTimeout(function () {
                                        $('#LoadingForm').modal('hide');
                                    }, 500);


                                }
                            });

                        }
                        else {

                            setTimeout(function () {
                                $('#LoadingForm').modal('hide');
                            }, 500);
                        };

                    });
                }
                else {
                    return alert('Fields cannot be empty!');
                }
            },
        }
    });

    setTimeout(function () {
        $('#LoadingForm').modal('hide');
    }, 500);

}

function deletecontractalert(value) {

    bootbox.confirm("<div style='color:black'>Are you sure you wish to delete?</div>", function (result) {
        if (result) {

            $('#LoadingForm').modal('show');
            var service = JSON.stringify({ 'ContractAlertID': value.ContractAlertID });
            var WebAPI = 'https://track-asia.com/tracksgwebapi/api/contractalertinfo/' + value.ContractAlertID;

            $.ajax({
                url: WebAPI,
                type: "Delete",
                data: JSON.stringify(service),
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
                permissions: ["https://*.track-asia.com"],
                success: function (res) {
                    console.log(res);
                    refreshcontractalert(value);
                }
            });

        }
        else {

            setTimeout(function () {
                $('#LoadingForm').modal('hide');
            }, 500);
        };

    });

}

function refreshcontractalert(value) {

    $('#LoadingForm').modal('show');
    $('#contractalertlistTable').bootstrapTable('destroy');

    $.ajax({
        type: 'GET',
        url: "https://track-asia.com/tracksgwebapi/api/contractalertinfo?ContractID=" + value.ContractID + "&CompanyID=" + getSessionstorageValueCompanyID,
        async: false,
        data: {
            get_param: 'value'
        },
        dataType: 'json',
        success: function (data) {


            $('#contractalertlistTable').bootstrapTable({
                data: data,
                idField: 'ContractAlertID',
                exportOptions: {
                    fileName: '[Contract Alerts] ' + moment.utc().add(8, 'hours').format('D-MMM-YYYY')
                },
                exportTypes: ['csv'],
                columns: [{
                    field: 'ItemNo',
                    title: 'Item No.',
                    formatter: serialnoFormatter
                }, {
                    field: 'ContractAlertID',
                    title: 'Contract Alert ID',
                    //class: 'hidden-xs hiddden-sm hidden-md hidden-lg'
                }, {
                    field: 'AlertDate',
                    title: 'Alert Date',
                    formatter: timestampFormatter
                }, {
                    field: 'AlertDate',
                    title: 'Alert Day',
                    formatter: dayFormatter
                }, {
                    field: 'Timestamp',
                    title: 'Scheduled Date',
                    formatter: timestampFormatter
                }, {
                    field: 'Timestamp',
                    title: 'Scheduled Day',
                    formatter: dayFormatter
                }, {
                    field: 'ContractCancelled',
                    title: 'Date of Cancellation',
                    formatter: timestampFormatter
                }, {
                    field: 'CancelRemarks',
                    title: 'Cancel Remarks'
                }, {
                    field: 'FlagValue',
                    title: 'Status'
                }, {
                    field: 'Action',
                    title: 'Action',
                    formatter: actioncontractalertFormatter
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



        }
    });

    setTimeout(function () {
        $('#LoadingForm').modal('hide');
    }, 500);
}

function inputdateFormatter(value) {

    if (value <= '2001-01-01 00:00:00' || value == null || value == "" || value == 'undefined') {

        return moment().format('DD-MMMM, YYYY HH:mm');
    } else {

        //Format UTC
        var timestamp = moment(value).add('hours', 8).format('DD-MMMM, YYYY HH:mm');

        return timestamp;
    }

}

function serialnoFormatter(value, row, index) {

    return index + 1;
}

function actionserviceFormatter(value, row, index) {

    return "<div>" +
        "<span>" +
        "<a href='javascript:editservices(" + JSON.stringify(row) + ")' style='color:#458FD2;'>" +
        "Edit" +
        "</a>" +
        "</span>" +
        "&nbsp;&nbsp;&nbsp;" +
        "<span>" +
        "<a href='javascript:deleteservices(" + JSON.stringify(row) + ")' style='color:#458FD2;'>" +
        "Delete" +
        "</a>" +
        "</span>" +
        "</div>";

}

function actioncontractFormatter(value, row, index) {

    return "<div>" +
        "<span>" +
        "<a href='javascript:viewcontractalert(" + JSON.stringify(row) + ")' style='color:#458FD2;'>" +
        "View" +
        "</a>" +
        "</span>" +
        "&nbsp;&nbsp;&nbsp;" +
        "<span>" +
        "<a href='javascript:editcontract(" + JSON.stringify(row) + ")' style='color:#458FD2;'>" +
        "Edit" +
        "</a>" +
        "</span>" +
        "&nbsp;&nbsp;&nbsp;" +
        "<span>" +
        "<a href='javascript:deletecontract(" + JSON.stringify(row) + ")' style='color:#458FD2;'>" +
        "Delete" +
        "</a>" +
        "</span>" +
        "</div>";

}

function actioncontractalertFormatter(value, row, index) {

    return "<div>" +      
            "<span>" +
            "<a href='javascript:editcontractalert(" + JSON.stringify(row) + ")' style='color:#458FD2;'>" +
            "Edit" +
            "</a>" +
            "</span>" +
            "&nbsp;&nbsp;&nbsp;" +
            "<span>" +
            "<a href='javascript:deletecontractalert(" + JSON.stringify(row) + ")' style='color:#458FD2;'>" +
            "Delete" +
            "</a>" +
            "</span>" +
            "</div>";

}

function timestampFormatter(value, row) {

    if (value < '2001-01-01T00:00:00' || value == null || value == "") {
        return '-';
    }
    else {


        //Format UTC
        var timestamp = moment(value).add('hours', 8).format('D-MMMM-YYYY, HH:mm:ss A');
        return '<div>' + '<span>' + timestamp + '</span>' + '</div>';

    }

}

function rxtimeFormatter(value, row) {

    if (value < '2001-01-01T00:00:00' || value == null || value == "") {
        return '-';
    }
    else {

        if (row.Flag == 2) {
            //Format UTC
            var timestamp = moment(value).add('hours', 8).format('D-MMMM-YYYY, HH:mm:ss A');
            return '<div>' + '<span>' + timestamp + '</span>' + '</div>';
        } else {
            return '-';
        }


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

function inputdateFormatter(value) {

    if (value <= '2001-01-01 00:00:00' || value == null || value == "" || value == 'undefined') {

        return moment().format('DD-MMMM, YYYY HH:mm');
    } else {

        //Format UTC
        var timestamp = moment(value).add('hours', 8).format('DD-MMMM, YYYY HH:mm');

        return timestamp;
    }

}

function isEmpty(str) {
    return (!str || 0 === str.length);
}

// FORMAT COLUMN
// Use "data-formatter" on HTML to format the display of bootstrap table column.
// =================================================================


// format for Vehicle Column.
// =================================================================
function vehicleFormatter(value, row) {
	return '<span class="text-normal" >' + value + '</span>';
}

// Format for User Name Column.
// =================================================================
function nameFormatter(value, row) {
    var labelColor;
    var text;

    var getDriverID = row.DriverID;

    var driverAddress;
    if (row.Driver.Address == '') {
        driverAddress = "No Address Provided";
    } else {
        driverAddress = row.Driver.Address;
    }

    var driverPhone;
    if (row.Driver.Phone == '') {
        driverPhone = "No Phone No. Provided";
    } else {
        driverPhone = row.Driver.Phone;
    }

    if (row.DriverID != "0" && row.ImageFill == "Uniform") {
        text = value;
        return '<div style="color:black;"><a href="' + text + '" class="btn-link" data-toggle="lightbox" data-title="' + row.Driver.Name + '" data-footer="' + "<strong>Address: </strong>" + driverAddress + "\n" + "<strong>Phone: </strong>" + driverPhone + '"><img src="' + text + '" class="img-responsive" alt="' + text + '" height="30" width="30"></a></div>';

    } else if (row.DriverID != "0" && row.ImageFill == "None") {
        labelColor = "success";
        text = row.Driver.Name;
        return '<center><div class="label label-table label-' + labelColor + '">' + text + '</div></center>';

    } else if (row.DriverID == "0") {
        labelColor = "dark";
        text = "No Driver Assigned";

        return '<div class="label label-table label-' + labelColor + '">' + text + '</div>';

    } 
   

}

// Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {
	

    if (value == "0001-01-01T00:00:00") {

        timestamp = "No Installation Date Record"

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
    if (value == "Van") return '<i class="fas fa-shuttle-van hidden-xs hidden-md">&nbsp;</i> ' + value;
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

    document.getElementById("softwareEN").innerHTML = version;


});

//OnLoad Zones
var getZone = "";
if (getSessionstorageValueRoleID == 1)
    {
        getZone = 'https://track-asia.com/tracksgwebapi/api/zonefilterinfo?ResellerID=' + '4' + '&CompanyID=' + '2';

        $.getJSON(getZone, function (data) {
            $.each(data, function (index, item) {
                $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));

            });

            $('.selectpicker').selectpicker('refresh');
        });

    }
    
else if (getSessionstorageValueRoleID == 2) {
        getZone = 'https://track-asia.com/tracksgwebapi/api/zonefilterinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

        $.getJSON(getZone, function (data) {
            $.each(data, function (index, item) {
                $('#assetZoneEN').append($('<option></option>').val(item.ZoneID).html(item.Name));

            });

            $('.selectpicker').selectpicker('refresh');
        });

    }

else if (getSessionstorageValueRoleID >= 3)
    {
        getZone = 'https://track-asia.com/tracksgwebapi/api/zonefilterinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

        $.getJSON(getZone, function (data) {
            $.each(data, function (index, item) {
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

$(document).ready(function () {
        $('select.getInstallDateDevice').change(function () {
            var getInstallDateDevice = $(this).find(':selected').attr('data-installDate')
            
            var Singapore = moment.tz(getInstallDateDevice, 'Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
            //Format UTC
            var timestamp = moment(Singapore.format()).add('hours', 8).format("D-MMM-YYYY, hh:mm:ss A");
            var assetInstallDate = $('#assetInstallDate').val(timestamp);

           
        });
    });

function clearVehicleForms() {

    $('#assetID').val('');
    $('#assetMake').val('');
    $('#assetModel').val('');
    $('#assetNameEN').val('');
    $('#assetLicensePlate').val('');
    $('#assetDevice').val('');
    $('#assetDriver').val('');
    $('#assetPhoneEN').val('');
    $('#assetEmailEN').val('');
    $('#assetIdlingLimitEN').val(0);
    $('#assetSpeedLimitEN').val(0);
    $('#assetChassisNo').val('');
    $('#assetModelYear').val('');
    $('#assetCatalogValue').val('');
    $('#assetResidualValue').val('');
    $('#assetSeatNo').val('');
    $('#assetDoorNo').val('');
    $('#assetColor').val('');
    $('#assetCO2').val(0);
    $('#assetHorsepower').val(0);
    $('#assetHorseTaxation').val(0);
    $('#assetPower').val(0);
    $('#vehicles-editable').bootstrapTable('refresh');
}

function returnToTab1() {
    $('#main-wz').bootstrapWizard('first');
}