

$(document).ready(function () {


    // Vehicle Submit
    $('#submit-vehicleEN').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });


        bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
            if (result) {

                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    message: 'Successful',
                    container: 'floating',
                    timer: 3000
                });

                jQuery.support.cors = true;

                function createCORSRequest(method, url) {
                    var xhr = new XMLHttpRequest();
                    if ("withCredentials" in xhr) {

                        // Check if the XMLHttpRequest object has a "withCredentials" property.
                        // "withCredentials" only exists on XMLHTTPRequest2 objects.
                        xhr.open(method, url, true);

                    } else if (typeof XDomainRequest != "undefined") {

                        // Otherwise, check if XDomainRequest.
                        // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                        xhr = new XDomainRequest();
                        xhr.open(method, url);

                    } else {

                        // Otherwise, CORS is not supported by the browser.
                        xhr = null;

                    }
                    return xhr;
                }

                var url = 'http://track.asiacom.co.th/tracksgwebapi/api/assetinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }

                var getZones = $('#assetZoneEN').val();
                var ObjZones = JSON.stringify(getZones);
                var parseObjAssets = ObjZones.replace(/\[|\"|\]/g, "");

                var assets = {
                    AssetID: $('#assetID').val(),
                    Name: $('#assetNameEN').val(),
                    Category: $('#assetCategory').val(),
                    Tag: $('#assetDevice').val(),
                    //CompanyID: $('#assetCompany').val(),
                    CompanyID: $('#assetCompany').val(),
                    DriverID: $('#assetDriver').val(),
                    Phone: $('#assetPhoneEN').val(),
                    Email: $('#assetEmailEN').val(),
                    Image: $('#assetImage').val(),
                    AlertZones: parseObjAssets,
                    Mileage: $('#assetMileageEN').val(),
                    DistanceAlert: $('#assetDistanceAlertEN').val(),
                    DateAlert: $('#assetDateAlertEN').val(),
                    IdlingLimit: $('#assetIdlingLimitEN').val(),
                    SpeedLimit: $('#assetSpeedLimitEN').val(),
                    //Notifications: $('#assetNotifications').val(),
                    //CurfewStart: $('#assetInstallDate').val()
                    InstallDate: $('#assetInstallDate').val(),
                    Flag: 1
                };

                var GetAssetID = $('#assetID').val();
                var getUser = sessionStorage.getItem('setSessionstorageValueUser');
                var getCompany = sessionStorage.getItem('setSessionstorageValueCompanyID');

                var emailAssets = {
                    Sender: "TRACK",
                    Recipients: "support@asiacom.co.th",
                    Message: "[TRACK - " + assets.Company + "]New Vehicle Added: " + getUser + " - " + assets.Name + " (" + assets.InstallDate + ")",
                    Timestamp: moment().format(),
                    RxTime: moment().format(),
                    Flag: 1,
                    CompanyID: getCompany,
                    AssetID: assets.AssetID
                };

                if (assets.AssetID == 'undefined' || assets.AssetID == null || assets.AssetID == 0 || assets.AssetID != GetAssetID) {

                    $.ajax({
                        url: "http://track.asiacom.co.th/tracksgwebapi/api/messageinfo",
                        type: "POST",
                        data: JSON.stringify(emailAssets),
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
                        success: function (emailAssets) {
                            console.log(emailAssets);       
                            //window.location.reload(true);
                        }

                    });

                }

                if (assets.AssetID == 'undefined' || assets.AssetID == null || assets.AssetID == 0 || assets.AssetID != GetAssetID) {


                    $.ajax({
                        url: "http://track.asiacom.co.th/tracksgwebapi/api/assetinfo",
                        type: "POST",
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
                        permissions: ["http://*.asiacom.co.th"],
                        success: function (assets) {
                            console.log(assets);
                            clearVehicleForms();
                            returnToTab1();
                           // window.location.reload(true);
                        }

                    });

                }

                else {

                    var updateAsset = 'http://track.asiacom.co.th/tracksgwebapi/api/assetinfo?id=' + assets.AssetID;

                    $.ajax({
                        url: updateAsset,
                        type: "PUT",
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
                        permissions: ["http://*.asiacom.co.th"],
                        success: function (assets) {
                            console.log(assets);
                            $("#toggle-aside").show();
                            $("#toggle-aside2").hide();
                            clearVehicleForms();
                            returnToTab1();
                        }
                    });

                }

            }

            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: 'Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });

    });

    //Confirm Delete Row Vehicles
    $('#vehicle-confirm-deleteEN').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        //bootbox.confirm("Are you sure you wish to delete?", function (result) {

        bootbox.confirm("<div style='color:black'>Are you sure you want to delete ?</div>", function (result) {

            if (result) {

                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: 'Deleted Successfully',
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var assets = JSON.stringify({ 'AssetId': row.AssetID });
                    var WebAPI = 'http://track.asiacom.co.th/tracksgwebapi/api/assetinfo/' + row.AssetID;

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
                        permissions: ["http://*.asiacom.co.th"],
                        success: function (assets) {
                            console.log(assets);
                            $("#toggle-aside").show();
                            $("#toggle-aside2").hide();
                            clearVehicleForms();
                            returnToTab1();
                        }
                    });

                    return row.AssetID
                });


                $table.bootstrapTable('remove', {
                    field: 'AssetID',
                    values: ids
                });


                $remove.prop('disabled', true);




            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    //message: 'Delete Canceled',
                    message: 'Delete Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });



    });

    // =================================================================

    //Submit Zones
    $('#submit-zonesEN').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
        var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
        var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');

        var zoneName = $('#zoneNameEN').val();

        var perimeter = $('.validationPerimeter').val();


        if (perimeter == "" | perimeter == null | perimeter == "undefined" | zoneName == "" | zoneName == null | zoneName == "undefined") {

            alert('Please fill out empty fields');

        }

        else {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });


            bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
                if (result) {
                    $.niftyNoty({
                        type: 'success',
                        icon: 'fa fa-check',
                        message: 'Successful',
                        container: 'floating',
                        timer: 3000
                    });

                    jQuery.support.cors = true;

                    function createCORSRequest(method, url) {
                        var xhr = new XMLHttpRequest();
                        if ("withCredentials" in xhr) {

                            // Check if the XMLHttpRequest object has a "withCredentials" property.
                            // "withCredentials" only exists on XMLHTTPRequest2 objects.
                            xhr.open(method, url, true);

                        } else if (typeof XDomainRequest != "undefined") {

                            // Otherwise, check if XDomainRequest.
                            // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                            xhr = new XDomainRequest();
                            xhr.open(method, url);

                        } else {

                            // Otherwise, CORS is not supported by the browser.
                            xhr = null;

                        }
                        return xhr;
                    }

                    var url = 'http://track.asiacom.co.th/tracksgwebapi/api/zoneinfo';
                    var xhr = createCORSRequest('GET', url);
                    xhr.send();
                    if (!xhr) {
                        throw new Error('CORS not supported');
                    }

                    var getCreatedDate = "";

                    if (getCreatedDate != "") {
                        getCreatedDate = $('#zoneDateCreated').val();
                    } else {
                        getCreatedDate = moment().format('D-MMM-YYYY, hh:mm:ss A');
                    }


                    var zones = {
                        ZoneID: $('#zoneID').val(),
                        Name: $('#zoneNameEN').val(),
                        //Type: $('#zoneType').val(),
                        TypeID: $('#zoneTypeIDEN').val(),
                        CompanyID: $('#zoneCompany').val(),
                        Perimeter: $('#Perimeter').val(),
                        CreatedDate: getCreatedDate,
                        //MCC: $('#zoneMCC').val(),
                        //MNC: $('#zoneMNC').val(),
                        //LAC: $('#zoneLAC').val(),
                        CellIds: $('#zoneCellID').val(),
                        Created_UserID: getSessionstorageValueUserID,
                        Modified_UserID: getSessionstorageValueUserID,
                        Created_User: getSessionstorageValueUser,
                        Modified_User: getSessionstorageValueUser,
                        Color: $('#zoneColor').val()

                    };

                    var GetZoneID = $('#zoneID').val();

                    if (zones.ZoneID == 'undefined' || zones.ZoneID == null || zones.ZoneID == 0 || zones.ZoneID != GetZoneID) {

                        $.ajax({
                            url: "http://track.asiacom.co.th/tracksgwebapi/api/zoneinfo",
                            type: "POST",
                            data: JSON.stringify(zones),
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
                            success: function (zones) {
                                //console.log(zones);

                                //var getZoneID = $('#zoneID').val();
                                //var getZoneNameEN = $('#zoneNameEN').val();
                                //var getZoneTypeIDEN = $('#zoneTypeIDEN').val();                           
                                //var getZoneTypeDescEN = getZoneTypeIDDescTextEN;
                                //var getCompanyID = $('#zoneCompany').val();
                                //var getCompany = getZoneCompanyText;
                                //var getDateCreated = $('#zoneDateCreated').val();
                                sessionStorage.removeItem("setSessionstorageValuePerimeterLength");
                                sessionStorage.removeItem("setSessionstorageValueZoneID");
                                sessionStorage.removeItem("setSessionstorageValueZoneNameEN");
                                sessionStorage.removeItem("setSessionstorageValueZoneTypeIDEN");
                                sessionStorage.removeItem("setSessionstorageValueZoneTypeDescEN");
                                sessionStorage.removeItem("setSessionstorageValueZoneCompany");
                                sessionStorage.removeItem("setSessionstorageValueZoneCompanyID");
                                sessionStorage.removeItem("setSessionstorageValueZoneDateCreated");
                                sessionStorage.removeItem("setSessionstorageValueZoneColor");

                                clearZoneForms();

                            }
                        });
                    }

                    else {


                        var updateZone = 'http://track.asiacom.co.th/tracksgwebapi/api/zoneinfo?id=' + zones.ZoneID;

                        $.ajax({
                            url: updateZone,
                            type: "PUT",
                            data: JSON.stringify(zones),
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
                            success: function (zones) {
                                console.log(zones);
                                sessionStorage.removeItem("setSessionstorageValueZoneID");
                                sessionStorage.removeItem("setSessionstorageValueZoneNameEN");
                                sessionStorage.removeItem("setSessionstorageValueZoneTypeIDEN");
                                sessionStorage.removeItem("setSessionstorageValueZoneTypeDescEN");
                                sessionStorage.removeItem("setSessionstorageValueZoneCompany");
                                sessionStorage.removeItem("setSessionstorageValueZoneCompanyID");
                                sessionStorage.removeItem("setSessionstorageValueZoneDateCreated");
                                sessionStorage.removeItem("setSessionstorageValueZoneColor");
                                $("#toggleBoundary").show();
                                $("#showDrawZone").show();
                                $("#drawZonesEN").show();
                                $("#toggle-aside").show();
                                $("#toggle-aside2").hide();
                                clearZoneForms();
                            }
                        });


                    }

                }


                else {
                    $.niftyNoty({
                        type: 'danger',
                        icon: 'fa fa-minus',
                        message: 'Canceled',
                        container: 'floating',
                        timer: 3000
                    });
                };

            });
        }
    });

    //Confirm Delete Row Zones
    $('#zone-confirm-deleteEN').on('click', function () {


        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        //bootbox.confirm("Are you sure you wish to delete zone/s?", function(result) {
        bootbox.confirm("<div style='color:black'>Are you sure you want to delete ?</div>", function (result) {
            if (result) {

                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message : 'Deleted Successfully',
                    message: 'Deleted Successfully',
                    container: 'floating',
                    timer: 3000
                });

                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var zones = JSON.stringify({ 'ZoneId': row.ZoneID });
                    var WebAPI = 'http://track.asiacom.co.th/tracksgwebapi/api/zoneinfo/' + row.ZoneID;

                    $.ajax({
                        url: WebAPI,
                        type: "Delete",
                        data: JSON.stringify(zones),
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
                        success: function (zones) {
                            console.log(zones);
                            sessionStorage.removeItem("setSessionstorageValuePerimeterLength");
                            $("#drawZonesEN").show();
                            $("#toggle-aside").show();
                            $("#toggle-aside2").hide();
                            clearZoneForms();
                            //window.location.reload(true);
                        }
                    });

                    return row.ZoneID
                });
                $table.bootstrapTable('remove', {
                    field: 'ZoneID',
                    values: ids
                });
                $remove.prop('disabled', true);



            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    //message : 'Delete Canceled',
                    message: 'Delete Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });

    // =================================================================

    //Submit Company
    $('#submit-companyEN').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {

            if (result) {

                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    message: 'Successful',
                    container: 'floating',
                    timer: 3000
                });

                jQuery.support.cors = true;

                function createCORSRequest(method, url) {
                    var xhr = new XMLHttpRequest();
                    if ("withCredentials" in xhr) {

                        // Check if the XMLHttpRequest object has a "withCredentials" property.
                        // "withCredentials" only exists on XMLHTTPRequest2 objects.
                        xhr.open(method, url, true);

                    } else if (typeof XDomainRequest != "undefined") {

                        // Otherwise, check if XDomainRequest.
                        // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                        xhr = new XDomainRequest();
                        xhr.open(method, url);

                    } else {

                        // Otherwise, CORS is not supported by the browser.
                        xhr = null;

                    }
                    return xhr;
                }

                var url = 'http://track.asiacom.co.th/tracksgwebapi/api/companyinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }


                var getResellerID;
                if (getSessionstorageValueRoleID == 1) {

                    getResellerID = $('#companyReseller').val();
                }
                else {

                    getResellerID = getSessionstorageValueUserResellerID
                }


                var getReports = $('#companyReportEN').val();
                var ObjReports = JSON.stringify(getReports);
                var parseObjReports = ObjReports.replace(/\[|\"|\]/g, "");

                var company = {
                    CompanyID: $('#companyID').val(),
                    //Flag: $('#companyStatus').val(),
                    Flag: 1,
                    Name: $('#companyNameEN').val(),
                    Address: $('#companyAddressEN').val(),
                    Email: $('#companyEmailEN').val(),
                    Phone: $('#companyPhoneEN').val(),
                    //UserLimit: $('#companyUserLimitEN').val(),
                    //ZoneLimit: $('#companyZoneLimitEN').val(),
                    //AssetLimit: $('#companyVehicleLimitEN').val(),
                    //SmsLimit: $('#companySmsLimitEN').val(),
                    Categories: $('#companyCategoryEN').val(),
                    Image: $('#companyImage').val(),
                    Reports: parseObjReports,
                    ResellerID: getResellerID

                };

                var GetCompanyID = $('#companyID').val();

                if (company.CompanyID == 'undefined' || company.CompanyID == null || company.CompanyID == 0 || company.CompanyID != GetCompanyID) {

                    $.ajax({
                        url: "http://track.asiacom.co.th/tracksgwebapi/api/companyinfo",
                        type: "POST",
                        data: JSON.stringify(company),
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
                        success: function (company) {
                            console.log(company);
                            clearCompanyForms();
                            returnToTab1();
                        }
                    });
                }

                else {


                    var updateCompany = 'http://track.asiacom.co.th/tracksgwebapi/api/companyinfo?id=' + company.CompanyID;

                    $.ajax({
                        url: updateCompany,
                        type: "PUT",
                        data: JSON.stringify(company),
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
                        success: function (company) {
                            console.log(company);
                            $('#toggle-aside').show();
                            $('#toggle-aside2').hide();
                            clearCompanyForms();
                            returnToTab1();
                        }
                    });


                }

            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: 'Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });

    });
    $('#submit-company-mobileEN').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {

            if (result) {
               
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    message: 'Successful',
                    container: 'floating',
                    timer: 3000
                });

                jQuery.support.cors = true;

                function createCORSRequest(method, url) {
                    var xhr = new XMLHttpRequest();
                    if ("withCredentials" in xhr) {

                        // Check if the XMLHttpRequest object has a "withCredentials" property.
                        // "withCredentials" only exists on XMLHTTPRequest2 objects.
                        xhr.open(method, url, true);

                    } else if (typeof XDomainRequest != "undefined") {

                        // Otherwise, check if XDomainRequest.
                        // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                        xhr = new XDomainRequest();
                        xhr.open(method, url);

                    } else {

                        // Otherwise, CORS is not supported by the browser.
                        xhr = null;

                    }
                    return xhr;
                }

                var url = 'http://track.asiacom.co.th/tracksgwebapi/api/companyinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }


                var getResellerID;
                if (getSessionstorageValueRoleID == 1) {

                    getResellerID = $('#mobile-companyResellerEN').val();
                }
                else {

                    getResellerID = getSessionstorageValueUserResellerID
                }


                var getReports = $('#mobile-companyReportEN').val();
                var ObjReports = JSON.stringify(getReports);
                var parseObjReports = ObjReports.replace(/\[|\"|\]/g, "");

                var company = {
                    CompanyID: $('#companyID').val(),
                    //Flag: $('#companyStatus').val(),
                    Flag: 1,
                    Name: $('#mobile-companyNameEN').val(),
                    Address: $('#mobile-companyAddressEN').val(),
                    Email: $('#mobile-companyEmailEN').val(),
                    Phone: $('#mobile-companyPhoneEN').val(),
                    Image: $('#companyImage').val(),
                    Reports: parseObjReports,
                    ResellerID: getResellerID

                };

                var GetCompanyID = $('#companyID').val();

                if (company.CompanyID == 'undefined' || company.CompanyID == null || company.CompanyID == 0 || company.CompanyID != GetCompanyID) {

                    $.ajax({
                        url: "http://track.asiacom.co.th/tracksgwebapi/api/companyinfo",
                        type: "POST",
                        data: JSON.stringify(company),
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
                        success: function (company) {
                            window.location.reload(true);
                            console.log(company);
                        }
                    });
                }

                else {


                    var updateCompany = 'http://track.asiacom.co.th/tracksgwebapi/api/companyinfo?id=' + company.CompanyID;

                    $.ajax({
                        url: updateCompany,
                        type: "PUT",
                        data: JSON.stringify(company),
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
                        success: function (company) {
                            window.location.reload(true);
                            console.log(company);
                        }
                    });


                }

            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: 'Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });

    });

    //Confirm Delete Row Companies
    $('#company-confirm-deleteEN').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        //bootbox.confirm("Are you sure you wish to delete company?", function (result) {
        bootbox.confirm("<div style='color:black'>Are you sure you wish to delete ?</div>", function (result) {
            if (result) {

                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: 'Deleted Successfully',
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var company = JSON.stringify({ 'CompanyID': row.CompanyID });
                    var WebAPI = 'http://track.asiacom.co.th/tracksgwebapi/api/companyinfo/' + row.CompanyID;

                    $.ajax({
                        url: WebAPI,
                        type: "Delete",
                        data: JSON.stringify(company),
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
                        success: function (company) {
                            console.log(company);
                            $('#toggle-aside').show();
                            $('#toggle-aside2').hide();
                            clearCompanyForms();
                            returnToTab1();
                        }
                    });
                    return row.CompanyID
                });
                $table.bootstrapTable('remove', {
                    field: 'CompanyID',
                    values: ids
                });
                $remove.prop('disabled', true);


            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    //message: 'Delete Canceled',
                    message: 'Delete Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });

    // =================================================================

    //Submit User
    $('#submit-userEN').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
        var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
        var getAlertType = $('#userNotificationsType').val();
        var getAlerts = $('#userNotifications').val();

        var getUserCompany = $('#userCompany').val();

        if (getUserCompany != "0" || getUserCompany == "") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });


            bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
                if (result) {

                    $.niftyNoty({
                        type: 'success',
                        icon: 'fa fa-check',

                        message: 'Successful',
                        container: 'floating',
                        timer: 3000
                    });

                    jQuery.support.cors = true;

                    function createCORSRequest(method, url) {
                        var xhr = new XMLHttpRequest();
                        if ("withCredentials" in xhr) {

                            // Check if the XMLHttpRequest object has a "withCredentials" property.
                            // "withCredentials" only exists on XMLHTTPRequest2 objects.
                            xhr.open(method, url, true);

                        } else if (typeof XDomainRequest != "undefined") {

                            // Otherwise, check if XDomainRequest.
                            // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                            xhr = new XDomainRequest();
                            xhr.open(method, url);

                        } else {

                            // Otherwise, CORS is not supported by the browser.
                            xhr = null;

                        }
                        return xhr;
                    }

                    var url = 'http://track.asiacom.co.th/tracksgwebapi/api/userinfo';
                    var xhr = createCORSRequest('GET', url);
                    xhr.send();
                    if (!xhr) {
                        throw new Error('CORS not supported');
                    }

                    var GetUserID = $('#userID').val();

                    var data = new FormData();
                    var files = $("#uploadUser").get(0).files;


                    // Add the uploaded image content to the form data collection
                    if (files.length > 0) {
                        data.append("UploadedImage", files[0], GetUserID + ".png");
                    }

                    // Make Ajax request with the contentType = false, and procesDate = false
                    var ajaxRequest = $.ajax({
                        type: "POST",
                        url: "http://track.asiacom.co.th/tracksgwebapi/api/fileupload/uploadfileuser",
                        contentType: false,
                        processData: false,
                        data: data,
                        success: function (data) {
                            console.log('success');
                        }
                    });

                    ajaxRequest.done(function (responseData, textStatus) {
                        if (textStatus == 'success') {
                            if (responseData != null) {
                                if (responseData.Key) {
                                    alert(responseData.Value);
                                    $("#uploadUser").val('');
                                } else {
                                    alert(responseData.Value);
                                }
                            }
                        } else {
                            alert(responseData.Value);
                        }
                    });


                    var valLoginRetry;

                    if (changeCheckbox.checked == true) {

                        valLoginRetry = 10;
                    }

                    else if (changeCheckbox.checked == false) {
                        valLoginRetry = 0;
                    }

                    var parseObjAlerts;


                    if (getAlertType != null) {

                        var i = 0;
                        var ConcateC = "";
                        for (i = 0; i < getAlertType.length; i++) {
                            ConcateC += getAlertType[i];

                        }

                        var MergeAlert = [];
                        for (i = 0; i < getAlerts.length; i++) {
                            MergeAlert[i] = getAlerts[i] + ":" + ConcateC;
                            //alert(c[i]);
                        }

                        var ObjAlerts = JSON.stringify(MergeAlert);
                        parseObjAlerts = ObjAlerts.replace(/\[|\"|\]|\E|S|U/g, "");
                    }


                    var getAssets = $('#userAssets').val();
                    var ObjAssets = JSON.stringify(getAssets);
                    var parseObjAssets = ObjAssets.replace(/\[|\"|\]/g, "");

                    var getResellerID;
                    if (getSessionstorageValueRoleID == 1) {

                        getResellerID = $('#userReseller').val();
                    }
                    else {

                        getResellerID = getSessionstorageValueUserResellerID
                    }



                    var hashPassword = "";
                    var getPassword = $('#userPasswordEN').val();

                    try {
                        if (GetUserID == null | GetUserID == "" | GetUserID == "undefined") {

                            var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
                            hashPassword = hash;

                        }
                        else if (GetUserID != null && getPassword.length == 256)
                        {
                            hashPassword = getPassword;
                        }
                        else
                        {
                            
                            if (getPassword.length == 64) {
                                hashPassword = getPassword;
                            }
                            else {
                                var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
                                hashPassword = hash;
                            }

                        }
                    }
                    catch (e) {

                        console.log('You got this error: ' + e);
                    }

                    //var getPassword = $('#userPasswordEN').val();
                    //var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);


                    var user = {
                        UserID: $('#userID').val(),
                        CompanyID: $('#userCompany').val(),
                        RoleID: $('#userRoleDesc').val(),
                        Name: $('#userFullNameEN').val(),
                        User: $('#UserNameEN').val(),
                        Password: hashPassword,
                        //Password: $('#confirmPassword').val(),
                        Email: $('#userEmailEN').val(),
                        Phone: $('#userPhoneEN').val(),
                        Image: $('#userImage').val(),
                        Notifications: parseObjAlerts,
                        Language: $('#load-language').val(),
                        Assets: parseObjAssets,
                        LoginRetry: valLoginRetry,
                        ResellerID: getResellerID
                    };


                    if (user.UserID == 'undefined' || user.UserID == null || user.UserID == 0 || user.UserID != GetUserID) {



                        $.ajax({
                            url: "http://track.asiacom.co.th/tracksgwebapi/api/userinfo",
                            type: "POST",
                            data: JSON.stringify(user),
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
                            success: function (user) {
                                console.log(user);
                                $("#toggle-aside").show();
                                $("#toggle-aside2").hide();
                                clearUserForms();
                                returnToTab1();
                            }
                        });

                    }

                    else {

                        var updateUser = 'http://track.asiacom.co.th/tracksgwebapi/api/userinfo?id=' + user.UserID;

                        $.ajax({
                            url: updateUser,
                            type: "PUT",
                            data: JSON.stringify(user),
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
                            success: function (user) {
                                console.log(user);
                                clearUserForms();
                                returnToTab1();
                            }
                        });

                    }

                }

                else {
                    $.niftyNoty({
                        type: 'danger',
                        icon: 'fa fa-minus',
                        message: 'Canceled',

                        container: 'floating',
                        timer: 3000
                    });
                };

            });
        } else {

            alert('You Must Select Company');
        }

    });
    $('#submit-user-mobileEN').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
        var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
        var getAlertType = $('#mobile-userNotificationsType').val();
        var getAlerts = $('#mobile-userNotifications').val();

        var getUserCompany = $('#mobile-load-company').val();

        if (getUserCompany != "0" || getUserCompany == "") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });


            bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
                if (result) {

                    $.niftyNoty({
                        type: 'success',
                        icon: 'fa fa-check',

                        message: 'Successful',
                        container: 'floating',
                        timer: 3000
                    });

                    jQuery.support.cors = true;

                    function createCORSRequest(method, url) {
                        var xhr = new XMLHttpRequest();
                        if ("withCredentials" in xhr) {

                            // Check if the XMLHttpRequest object has a "withCredentials" property.
                            // "withCredentials" only exists on XMLHTTPRequest2 objects.
                            xhr.open(method, url, true);

                        } else if (typeof XDomainRequest != "undefined") {

                            // Otherwise, check if XDomainRequest.
                            // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                            xhr = new XDomainRequest();
                            xhr.open(method, url);

                        } else {

                            // Otherwise, CORS is not supported by the browser.
                            xhr = null;

                        }
                        return xhr;
                    }

                    var url = 'http://track.asiacom.co.th/tracksgwebapi/api/userinfo';
                    var xhr = createCORSRequest('GET', url);
                    xhr.send();
                    if (!xhr) {
                        throw new Error('CORS not supported');
                    }

                    var GetUserID = $('#userID').val();

                    var data = new FormData();
                    var files = $("#uploadUser").get(0).files;


                    // Add the uploaded image content to the form data collection
                    if (files.length > 0) {
                        data.append("UploadedImage", files[0], GetUserID + ".png");
                    }

                    // Make Ajax request with the contentType = false, and procesDate = false
                    var ajaxRequest = $.ajax({
                        type: "POST",
                        url: "http://track.asiacom.co.th/tracksgwebapi/api/fileupload/uploadfileuser",
                        contentType: false,
                        processData: false,
                        data: data,
                        success: function (data) {
                            console.log('success');
                        }
                    });

                    ajaxRequest.done(function (responseData, textStatus) {
                        if (textStatus == 'success') {
                            if (responseData != null) {
                                if (responseData.Key) {
                                    alert(responseData.Value);
                                    $("#uploadUser").val('');
                                } else {
                                    alert(responseData.Value);
                                }
                            }
                        } else {
                            alert(responseData.Value);
                        }
                    });


                    var valLoginRetry;

                    if (changeCheckbox.checked == true) {

                        valLoginRetry = 10;
                    }

                    else if (changeCheckbox.checked == false) {
                        valLoginRetry = 0;
                    }

                    var parseObjAlerts;


                    if (getAlertType != null) {

                        var i = 0;
                        var ConcateC = "";
                        for (i = 0; i < getAlertType.length; i++) {
                            ConcateC += getAlertType[i];

                        }

                        var MergeAlert = [];
                        for (i = 0; i < getAlerts.length; i++) {
                            MergeAlert[i] = getAlerts[i] + ":" + ConcateC;
                            //alert(c[i]);
                        }

                        var ObjAlerts = JSON.stringify(MergeAlert);
                        parseObjAlerts = ObjAlerts.replace(/\[|\"|\]|\E|S|U/g, "");
                    }


                    var getAssets = $('#mobile-userAssets').val();
                    var ObjAssets = JSON.stringify(getAssets);
                    var parseObjAssets = ObjAssets.replace(/\[|\"|\]/g, "");

                    var getResellerID;
                    if (getSessionstorageValueRoleID == 1) {

                        getResellerID = $('#mobile-load-reseller').val();
                    }
                    else {

                        getResellerID = getSessionstorageValueUserResellerID
                    }



                    var hashPassword = "";
                    var getPassword = $('#mobile-userPasswordEN').val();

                    try {
                        if (GetUserID == null | GetUserID == "" | GetUserID == "undefined") {

                            var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
                            hashPassword = hash;

                        }
                        else if (GetUserID != null && getPassword.length == 256) {
                            hashPassword = getPassword;
                        }
                        else {

                            var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
                            hashPassword = hash;

                        }
                    }
                    catch (e) {

                        console.log('You got this error: ' + e);
                    }

                    //var getPassword = $('#userPasswordEN').val();
                    //var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);


                    var user = {
                        UserID: $('#userID').val(),
                        CompanyID: $('#mobile-load-company').val(),
                        RoleID: $('#mobile-userRoleDesc').val(),
                        Name: $('#mobile-userFullNameEN').val(),
                        User: $('#mobile-UserNameEN').val(),
                        Password: hashPassword,
                        //Password: $('#confirmPassword').val(),
                        Email: $('#mobile-userEmailEN').val(),
                        Phone: $('#mobile-userPhoneEN').val(),
                        Image: $('#userImage').val(),
                        Notifications: parseObjAlerts,
                        Language: $('#load-language').val(),
                        Assets: parseObjAssets,
                        LoginRetry: valLoginRetry,
                        ResellerID: getResellerID
                    };


                    if (user.UserID == 'undefined' || user.UserID == null || user.UserID == 0 || user.UserID != GetUserID) {



                        $.ajax({
                            url: "http://track.asiacom.co.th/tracksgwebapi/api/userinfo",
                            type: "POST",
                            data: JSON.stringify(user),
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
                            success: function (user) {
                                window.location.reload(true);
                                console.log(user);
                                // window.location.reload(true);
                            },
                            error: function () { alert('error'); }

                        });

                    }

                    else {

                        var updateUser = 'http://track.asiacom.co.th/tracksgwebapi/api/userinfo?id=' + user.UserID;

                        $.ajax({
                            url: updateUser,
                            type: "PUT",
                            data: JSON.stringify(user),
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
                            success: function (user) {
                                window.location.reload(true);
                                console.log(user);
                                //window.location.reload(true);
                            },
                            error: function () { alert('error'); }

                        });

                    }

                }

                else {
                    $.niftyNoty({
                        type: 'danger',
                        icon: 'fa fa-minus',
                        message: 'Canceled',

                        container: 'floating',
                        timer: 3000
                    });
                };

            });
        } else {

            alert('You Must Select Company');
        }

    });
    //Confirm Delete Row Users
    $('#users-confirm-deleteEN').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        //bootbox.confirm("Are you sure you wish to delete user?", function (result) {
        bootbox.confirm("<div style='color:black'>Are you sure you wish to delete ?</div>", function (result) {
            if (result) {
               
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: 'Deleted Successfully',
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var user = JSON.stringify({ 'UserID': row.UserID });
                    var WebAPI = 'http://track.asiacom.co.th/tracksgwebapi/api/userinfo/' + row.UserID;

                    $.ajax({
                        url: WebAPI,
                        type: "Delete",
                        data: JSON.stringify(user),
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
                        success: function (user) {
                            console.log(user);
                            $("#toggle-aside").show();
                            $("#toggle-aside2").hide();
                            clearUserForms();
                            returnToTab1();
                        }

                    });

                    return row.UserID
                });
                $table.bootstrapTable('remove', {
                    field: 'UserID',
                    values: ids
                });
                $remove.prop('disabled', true);


            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    //message: 'Delete Canceled',
                    message: 'Delete Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });

    // =================================================================

    //Submit Device
    $('#submit-deviceEN').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
            if (result) {
                
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    message: 'Successful',
                    container: 'floating',
                    timer: 3000
                });


                jQuery.support.cors = true;

                function createCORSRequest(method, url) {
                    var xhr = new XMLHttpRequest();
                    if ("withCredentials" in xhr) {

                        // Check if the XMLHttpRequest object has a "withCredentials" property.
                        // "withCredentials" only exists on XMLHTTPRequest2 objects.
                        xhr.open(method, url, true);

                    } else if (typeof XDomainRequest != "undefined") {

                        // Otherwise, check if XDomainRequest.
                        // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                        xhr = new XDomainRequest();
                        xhr.open(method, url);

                    } else {

                        // Otherwise, CORS is not supported by the browser.
                        xhr = null;

                    }
                    return xhr;
                }

                var url = 'http://track.asiacom.co.th/tracksgwebapi/api/deviceinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }

                var device = {
                    DeviceID: $('#deviceID').val(),
                    Name: $('#deviceNameEN').val(),
                    Imei: $('#deviceIMEIEN').val(),
                    Phone: $('#devicePhoneEN').val(),
                    Interval: $('#devicePollingIntervalEN').val(),
                    Port: $('#devicePortEN').val(),
                    APN: $('#deviceAPNEN').val(),
                    InstallDate: $('#deviceInstallDate').val(),
                    //ModifiedTimestamp: $('#userImage').val(),
                    Remarks: $('#deviceRemarksEN').val(),
                    isSentOut: $('#isSentOutEN').val(),
                    //Image: $('#userAssets').val(),
                    //ImageFill: $('#userAssets').val()
                };


                var GetDeviceID = $('#deviceID').val();

                if (device.DeviceID == 'undefined' || device.DeviceID == null || device.DeviceID == 0 || device.DeviceID != GetDeviceID) {


                    $.ajax({
                        url: "http://track.asiacom.co.th/tracksgwebapi/api/deviceinfo",
                        type: "POST",
                        data: JSON.stringify(device),
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
                        success: function (device) {
                            console.log(device);
                            clearDeviceForms();
                            returnToTab1();
                        }
                    });

                }

                else {


                    var updateDevice = 'http://track.asiacom.co.th/tracksgwebapi/api/deviceinfo?id=' + device.DeviceID;

                    $.ajax({
                        url: updateDevice,
                        type: "PUT",
                        data: JSON.stringify(device),
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
                        success: function (device) {
                            console.log(device);
                            $('#toggle-aside').show();
                            $('#toggle-aside2').hide();
                            clearDeviceForms();
                            returnToTab1();
                        }
                    });


                }


            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: 'Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });


    });
    $('#submit-device-mobileEN').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
            if (result) {
                
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    message: 'Successful',
                    container: 'floating',
                    timer: 3000
                });


                jQuery.support.cors = true;

                function createCORSRequest(method, url) {
                    var xhr = new XMLHttpRequest();
                    if ("withCredentials" in xhr) {

                        // Check if the XMLHttpRequest object has a "withCredentials" property.
                        // "withCredentials" only exists on XMLHTTPRequest2 objects.
                        xhr.open(method, url, true);

                    } else if (typeof XDomainRequest != "undefined") {

                        // Otherwise, check if XDomainRequest.
                        // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                        xhr = new XDomainRequest();
                        xhr.open(method, url);

                    } else {

                        // Otherwise, CORS is not supported by the browser.
                        xhr = null;

                    }
                    return xhr;
                }

                var url = 'http://track.asiacom.co.th/tracksgwebapi/api/deviceinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }

                var device = {
                    DeviceID: $('#deviceID').val(),
                    Name: $('#mobile-deviceNameEN').val(),
                    Imei: $('#mobile-deviceIMEIEN').val(),
                    Phone: $('#mobile-devicePhoneEN').val(),
                    Interval: $('#mobile-devicePollingIntervalEN').val(),
                    Port: $('#mobile-devicePortEN').val(),
                    APN: $('#mobile-deviceAPNEN').val(),
                    InstallDate: $('#mobile-deviceInstallDateEN').val(),
                    //ModifiedTimestamp: $('#userImage').val(),
                    Remarks: $('#mobile-deviceRemarksEN').val(),
                    isSentOut: $('#isSentOutEN').val(),
                    //Image: $('#userAssets').val(),
                    //ImageFill: $('#userAssets').val()
                };


                var GetDeviceID = $('#deviceID').val();

                if (device.DeviceID == 'undefined' || device.DeviceID == null || device.DeviceID == 0 || device.DeviceID != GetDeviceID) {


                    $.ajax({
                        url: "http://track.asiacom.co.th/tracksgwebapi/api/deviceinfo",
                        type: "POST",
                        data: JSON.stringify(device),
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
                        success: function (device) {
                            window.location.reload(true);
                            console.log(device);
                        },
                        //error: function () { alert('error'); }
                        error: function (x, y, z) {
                            alert(x + '\n' + y + '\n' + z);
                        }
                    });

                }

                else {


                    var updateDevice = 'http://track.asiacom.co.th/tracksgwebapi/api/deviceinfo?id=' + device.DeviceID;

                    $.ajax({
                        url: updateDevice,
                        type: "PUT",
                        data: JSON.stringify(device),
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
                        success: function (device) {
                            window.location.reload(true);
                            console.log(device);
                        },
                        //error: function () { alert('error'); }
                        error: function (x, y, z) {
                            alert(x + '\n' + y + '\n' + z);
                        }
                    });


                }


            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: 'Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });


    });
    //Confirm Delete Row Device
    $('#device-confirm-deleteEN').on('click', function () {


        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        //bootbox.confirm("Are you sure you wish to delete user?", function (result) {
        bootbox.confirm("<div style='color:black'>Are you sure you wish to delete ?</div>", function (result) {
            if (result) {
       
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: 'Deleted Successfully',
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var device = JSON.stringify({ 'DeviceID': row.DeviceID });
                    var WebAPI = 'http://track.asiacom.co.th/tracksgwebapi/api/deviceinfo/' + row.DeviceID;

                    $.ajax({
                        url: WebAPI,
                        type: "Delete",
                        data: JSON.stringify(device),
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
                        success: function (device) {
                            console.log(device);
                            $('#toggle-aside').show();
                            $('#toggle-aside2').hide();
                            clearDeviceForms();
                            returnToTab1();
                        }
                    });

                    return row.DeviceID
                });
                $table.bootstrapTable('remove', {
                    field: 'DeviceID',
                    values: ids
                });
                $remove.prop('disabled', true);


            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    //message: 'Delete Canceled',
                    message: 'Delete Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });


    // =================================================================

    //Submit Reseller
    $('#submit-resellerEN').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {

            if (result) {

                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    message: 'Successful',
                    container: 'floating',
                    timer: 3000
                });

                jQuery.support.cors = true;

                function createCORSRequest(method, url) {
                    var xhr = new XMLHttpRequest();
                    if ("withCredentials" in xhr) {

                        // Check if the XMLHttpRequest object has a "withCredentials" property.
                        // "withCredentials" only exists on XMLHTTPRequest2 objects.
                        xhr.open(method, url, true);

                    } else if (typeof XDomainRequest != "undefined") {

                        // Otherwise, check if XDomainRequest.
                        // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                        xhr = new XDomainRequest();
                        xhr.open(method, url);

                    } else {

                        // Otherwise, CORS is not supported by the browser.
                        xhr = null;

                    }
                    return xhr;
                }

                var url = 'http://track.asiacom.co.th/tracksgwebapi/api/resellerinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }


                var reseller = {
                    ResellerID: $('#resellerID').val(),
                    Flag: 1,
                    Name: $('#resellerNameEN').val(),
                    Address: $('#resellerAddressEN').val(),
                    Email: $('#resellerEmailEN').val(),
                    Phone: $('#resellerPhoneEN').val()
                };

                var GetResellerID = $('#resellerID').val();

                if (reseller.ResellerID == 'undefined' || reseller.ResellerID == null || reseller.ResellerID == 0 || reseller.ResellerID != GetResellerID) {

                    $.ajax({
                        url: "http://track.asiacom.co.th/tracksgwebapi/api/resellerinfo",
                        type: "POST",
                        data: JSON.stringify(reseller),
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
                        success: function (reseller) {
                            console.log(reseller);
                            clearResellerForms();
                        }
                    });
                }

                else {


                    var updateReseller = 'http://track.asiacom.co.th/tracksgwebapi/api/resellerinfo?id=' + reseller.ResellerID;

                    $.ajax({
                        url: updateReseller,
                        type: "PUT",
                        data: JSON.stringify(reseller),
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
                        success: function (reseller) {
                            console.log(reseller);
                            $("#toggle-aside").show();
                            $('#toggle-aside2').hide();
                            clearResellerForms();
                        }
                    });


                }

            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: 'Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });


    });
    $('#submit-reseller-mobileEN').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {

            if (result) {             
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    message: 'Successful',
                    container: 'floating',
                    timer: 3000
                });

                jQuery.support.cors = true;

                function createCORSRequest(method, url) {
                    var xhr = new XMLHttpRequest();
                    if ("withCredentials" in xhr) {

                        // Check if the XMLHttpRequest object has a "withCredentials" property.
                        // "withCredentials" only exists on XMLHTTPRequest2 objects.
                        xhr.open(method, url, true);

                    } else if (typeof XDomainRequest != "undefined") {

                        // Otherwise, check if XDomainRequest.
                        // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                        xhr = new XDomainRequest();
                        xhr.open(method, url);

                    } else {

                        // Otherwise, CORS is not supported by the browser.
                        xhr = null;

                    }
                    return xhr;
                }

                var url = 'http://track.asiacom.co.th/tracksgwebapi/api/resellerinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }


                var reseller = {
                    ResellerID: $('#resellerID').val(),
                    Flag: 1,
                    Name: $('#mobile-resellerNameEN').val(),
                    Address: $('#mobile-resellerAddressEN').val(),
                    Email: $('#mobile-resellerEmailEN').val(),
                    Phone: $('#mobile-resellerPhoneEN').val()
                };

                var GetResellerID = $('#resellerID').val();

                if (reseller.ResellerID == 'undefined' || reseller.ResellerID == null || reseller.ResellerID == 0 || reseller.ResellerID != GetResellerID) {

                    $.ajax({
                        url: "http://track.asiacom.co.th/tracksgwebapi/api/resellerinfo",
                        type: "POST",
                        data: JSON.stringify(reseller),
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
                        success: function (reseller) {
                            window.location.reload(true);
                            console.log(reseller);
                        },
                        error: function () {
                            alert('error');
                        }
                    });
                }

                else {


                    var updateReseller = 'http://track.asiacom.co.th/tracksgwebapi/api/resellerinfo?id=' + reseller.ResellerID;

                    $.ajax({
                        url: updateReseller,
                        type: "PUT",
                        data: JSON.stringify(reseller),
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
                        success: function (reseller) {
                            window.location.reload(true);
                            console.log(reseller);
                        },
                        error: function () {
                            alert('error');
                        }

                    });


                }

            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: 'Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });


    });
    $('#reseller-confirm-deleteEN').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        //bootbox.confirm("Are you sure you wish to delete reseller?", function (result) {
        bootbox.confirm("<div style='color:black'>Are you sure you wish to delete ?</div>", function (result) {
            if (result) {
            
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: 'Deleted Successfully',
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var reseller = JSON.stringify({ 'ResellerID': row.ResellerID });
                    var WebAPI = 'http://track.asiacom.co.th/tracksgwebapi/api/resellerinfo/' + row.ResellerID;

                    $.ajax({
                        url: WebAPI,
                        type: "Delete",
                        data: JSON.stringify(reseller),
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
                        success: function (reseller) {
                            console.log(reseller);
                            $("#toggle-aside").show();
                            $('#toggle-aside2').hide();
                            clearResellerForms();
                        }

                    });
                    return row.ResellerID
                });
                $table.bootstrapTable('remove', {
                    field: 'ResellerID',
                    values: ids
                });
                $remove.prop('disabled', true);


            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    //message: 'Delete Canceled',
                    message: 'Delete Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });

    // =================================================================

    //Submit Driver
    $('#submit-driverEN').on('click', function () {
        var getDriver = $('#driverNameEN').val();
        if (getDriver != "")
        {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });

            bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {

                if (result) {
                    //window.location.reload(true);
                    $.niftyNoty({
                        type: 'success',
                        icon: 'fa fa-check',
                        message: 'Successful',
                        container: 'floating',
                        timer: 3000
                    });

                    jQuery.support.cors = true;

                    function createCORSRequest(method, url) {
                        var xhr = new XMLHttpRequest();
                        if ("withCredentials" in xhr) {

                            // Check if the XMLHttpRequest object has a "withCredentials" property.
                            // "withCredentials" only exists on XMLHTTPRequest2 objects.
                            xhr.open(method, url, true);

                        } else if (typeof XDomainRequest != "undefined") {

                            // Otherwise, check if XDomainRequest.
                            // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                            xhr = new XDomainRequest();
                            xhr.open(method, url);

                        } else {

                            // Otherwise, CORS is not supported by the browser.
                            xhr = null;

                        }
                        return xhr;
                    }

                    var url = 'http://track.asiacom.co.th/tracksgwebapi/api/driverinfo';
                    var xhr = createCORSRequest('GET', url);
                    xhr.send();
                    if (!xhr) {
                        throw new Error('CORS not supported');
                    }


                    var getDriverID = $('#driverID').val();

                    var data = new FormData();
                    var files = $("#uploadDriver").get(0).files;


                    // Add the uploaded image content to the form data collection
                    if (files.length > 0) {
                        data.append("UploadedImage", files[0], getDriverID + ".png");
                    }

                    // Make Ajax request with the contentType = false, and procesDate = false
                    var ajaxRequest = $.ajax({
                        type: "POST",
                        url: "http://track.asiacom.co.th/tracksgwebapi/api/fileupload/uploadfile",
                        contentType: false,
                        processData: false,
                        data: data,
                        success: function (data) {
                            console.log('success');
                        }
                    });

                    ajaxRequest.done(function (responseData, textStatus) {
                        if (textStatus == 'success') {
                            if (responseData != null) {
                                if (responseData.Key) {
                                    alert(responseData.Value);
                                    $("#uploadDriver").val('');
                                } else {
                                    alert(responseData.Value);
                                }
                            }
                        } else {
                            alert(responseData.Value);
                        }
                    });


                    var birthday = "";

                    if (birthday != null || birthday != 'undefined' || birthday != "") {

                        birthday = $('#driverDateOfBirth').val();
                    } else {

                        birthday = moment.utc().add('hours', 7).format('D-MMM-YYYY, hh:mm:ss A');
                    }


                    var driver = {
                        DriverID: $('#driverID').val(),
                        CompanyID: $('#driverCompany').val(),
                        Name: $('#driverNameEN').val(),
                        Email: $('#driverEmailEN').val(),
                        Address: $('#driverAddressEN').val(),
                        Phone: $('#driverPhoneEN').val(),
                        DateOfBirth: birthday,
                        Remarks: $('#driverRemarksEN').val()
                    };



                    if (driver.DriverID == 'undefined' || driver.DriverID == null || driver.DriverID == 0 || driver.DriverID != getDriverID) {

                        $.ajax({
                            url: "http://track.asiacom.co.th/tracksgwebapi/api/driverinfo",
                            type: "POST",
                            data: JSON.stringify(driver),
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
                            success: function (driver) {
                                console.log(driver);
                                clearDriverForms();
                                returnToTab1();
                            }
                        });
                    }

                    else {


                        var updateDriver = 'http://track.asiacom.co.th/tracksgwebapi/api/driverinfo?id=' + driver.DriverID;

                        $.ajax({
                            url: updateDriver,
                            type: "PUT",
                            data: JSON.stringify(driver),
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
                            success: function (driver) {
                                console.log(driver);
                                $("#toggle-aside").show();
                                $("#toggle-aside2").hide();
                                clearDriverForms();
                                returnToTab1();
                            }
                        });


                    }

                }


                else {
                    $.niftyNoty({
                        type: 'danger',
                        icon: 'fa fa-minus',
                        message: 'Canceled',
                        container: 'floating',
                        timer: 3000
                    });
                };

            });
        }
        else
        {
            alert('Driver Name must not be empty!');
        }


    });
    $('#submit-driver-mobileEN').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {

            if (result) {
               
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    message: 'Successful',
                    container: 'floating',
                    timer: 3000
                });

                jQuery.support.cors = true;

                function createCORSRequest(method, url) {
                    var xhr = new XMLHttpRequest();
                    if ("withCredentials" in xhr) {

                        // Check if the XMLHttpRequest object has a "withCredentials" property.
                        // "withCredentials" only exists on XMLHTTPRequest2 objects.
                        xhr.open(method, url, true);

                    } else if (typeof XDomainRequest != "undefined") {

                        // Otherwise, check if XDomainRequest.
                        // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                        xhr = new XDomainRequest();
                        xhr.open(method, url);

                    } else {

                        // Otherwise, CORS is not supported by the browser.
                        xhr = null;

                    }
                    return xhr;
                }

                var url = 'http://track.asiacom.co.th/tracksgwebapi/api/driverinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }


                var getDriverID = $('#driverID').val();

                var data = new FormData();
                var files = $("#uploadDriver").get(0).files;


                // Add the uploaded image content to the form data collection
                if (files.length > 0) {
                    data.append("UploadedImage", files[0], getDriverID + ".png");
                }

                // Make Ajax request with the contentType = false, and procesDate = false
                var ajaxRequest = $.ajax({
                    type: "POST",
                    url: "http://track.asiacom.co.th/tracksgwebapi/api/fileupload/uploadfile",
                    contentType: false,
                    processData: false,
                    data: data,
                    success: function (data) {
                        console.log('success');
                    }
                });

                ajaxRequest.done(function (responseData, textStatus) {
                    if (textStatus == 'success') {
                        if (responseData != null) {
                            if (responseData.Key) {
                                alert(responseData.Value);
                                $("#uploadDriver").val('');
                            } else {
                                alert(responseData.Value);
                            }
                        }
                    } else {
                        alert(responseData.Value);
                    }
                });


                var birthday = "";

                if (birthday != null || birthday != 'undefined' || birthday != "") {

                    birthday = $('#mobile-driverDateOfBirth').val();
                } else {

                    birthday = moment.utc().add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
                }


                var driver = {
                    DriverID: $('#driverID').val(),
                    CompanyID: $('#mobile-driverCompanyEN').val(),
                    Name: $('#mobile-driverNameEN').val(),
                    Email: $('#mobile-driverEmailEN').val(),
                    Address: $('#mobile-driverAddressEN').val(),
                    Phone: $('#mobile-driverPhoneEN').val(),
                    DateOfBirth: birthday,
                    Remarks: $('#mobile-driverRemarksEN').val()
                };



                if (driver.DriverID == 'undefined' || driver.DriverID == null || driver.DriverID == 0 || driver.DriverID != getDriverID) {

                    $.ajax({
                        url: "http://track.asiacom.co.th/tracksgwebapi/api/driverinfo",
                        type: "POST",
                        data: JSON.stringify(driver),
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
                        success: function (driver) {
                            window.location.reload(true);
                            console.log(driver);
                        },
                        error: function (driver) {
                            alert('error');
                        }
                    });
                }

                else {


                    var updateDriver = 'http://track.asiacom.co.th/tracksgwebapi/api/driverinfo?id=' + driver.DriverID;

                    $.ajax({
                        url: updateDriver,
                        type: "PUT",
                        data: JSON.stringify(driver),
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
                        success: function (driver) {
                            window.location.reload(true);
                            console.log(driver);
                        },
                        error: function (driver) {
                            alert('error');
                        }

                    });


                }

            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: 'Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });


    });
    $('#driver-confirm-deleteEN').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        //bootbox.confirm("Are you sure you wish to delete reseller?", function (result) {
        bootbox.confirm("<div style='color:black'>Are you sure you wish to delete ?</div>", function (result) {
            if (result) {
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: 'Deleted Successfully',
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var driver = JSON.stringify({ 'DriverID': row.DriverID });
                    var WebAPI = 'http://track.asiacom.co.th/tracksgwebapi/api/driverinfo/' + row.DriverID;

                    $.ajax({
                        url: WebAPI,
                        type: "Delete",
                        data: JSON.stringify(driver),
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
                        success: function (driver) {
                            console.log(driver);
                            $("#toggle-aside").show();
                            $("#toggle-aside2").hide();
                            clearDriverForms();
                            returnToTab1();
                        }

                    });
                    return row.DriverID
                });
                $table.bootstrapTable('remove', {
                    field: 'DriverID',
                    values: ids
                });
                $remove.prop('disabled', true);


            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    //message: 'Delete Canceled',
                    message: 'Delete Canceled',
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });


    // =================================================================


    //Submit User
    $('#submit-userProfile').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
        var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
        var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
        var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');


        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });


        bootbox.confirm("<div style='color:black'>คุณแน่ใจหรือว่า ต้องการส่ง?</div>", function (result) {
            if (result) {
                window.location.reload(true);
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',

                    message: 'ที่ประสบความสำเร็จ',
                    container: 'floating',
                    timer: 3000
                });

                jQuery.support.cors = true;

                function createCORSRequest(method, url) {
                    var xhr = new XMLHttpRequest();
                    if ("withCredentials" in xhr) {

                        // Check if the XMLHttpRequest object has a "withCredentials" property.
                        // "withCredentials" only exists on XMLHTTPRequest2 objects.
                        xhr.open(method, url, true);

                    } else if (typeof XDomainRequest != "undefined") {

                        // Otherwise, check if XDomainRequest.
                        // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                        xhr = new XDomainRequest();
                        xhr.open(method, url);

                    } else {

                        // Otherwise, CORS is not supported by the browser.
                        xhr = null;

                    }
                    return xhr;
                }

                var url = 'http://track.asiacom.co.th/tracksgwebapi/api/userinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }


                var hashPassword = "";

                try {

                    var getPassword = $('#profilePassword').val();
                    var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
                    hashPassword = hash;


                }
                catch (e) {

                    console.log('You got this error: ' + e);
                }

                //var getPassword = $('#userPasswordEN').val();
                //var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);


                var user = {
                    UserID: getSessionstorageValueUserID,
                    CompanyID: getSessionstorageValueCompanyID,
                    RoleID: getSessionstorageValueRoleID,
                    Name: $('#profileNameEN').val(),
                    User: $('#profileUsernameEN').val(),
                    Password: hashPassword,
                    //Password: $('#confirmPassword').val(),
                    Email: $('#profileEmailEN').val(),
                    Phone: $('#profilePhoneNumberEN').val(),
                    //Image: $('#userImage').val(),
                    //Notifications: parseObjAlerts,
                    //Language: $('#load-language').val(),
                    //Assets: parseObjAssets,
                    //LoginRetry: valLoginRetry,
                    ResellerID: getSessionstorageValueUserResellerID
                };


                var updateUser = 'http://track.asiacom.co.th/tracksgwebapi/api/userinfo?id=' + user.UserID;

                $.ajax({
                    url: updateUser,
                    type: "PUT",
                    data: JSON.stringify(user),
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
                    success: function (user) {
                        console.log(user);
                        //window.location.reload(true);
                    },
                    error: function () { alert('error'); }

                });




            }

            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: 'ยกเลิก',

                    container: 'floating',
                    timer: 3000
                });
            };

        });




    });
    $('#submit-userProfileEN').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
        var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
        var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
        var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
        var getSessionstorageValueUserNotifications = sessionStorage.getItem('setSessionstorageValueUserNotifications');
        var getSessionstorageValueUserAssets = sessionStorage.getItem('setSessionstorageValueUserAssets');

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });


        bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {
            if (result) {
                // window.location.reload(true);
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',

                    message: 'Successful',
                    container: 'floating',
                    timer: 3000
                });

                jQuery.support.cors = true;

                function createCORSRequest(method, url) {
                    var xhr = new XMLHttpRequest();
                    if ("withCredentials" in xhr) {

                        // Check if the XMLHttpRequest object has a "withCredentials" property.
                        // "withCredentials" only exists on XMLHTTPRequest2 objects.
                        xhr.open(method, url, true);

                    } else if (typeof XDomainRequest != "undefined") {

                        // Otherwise, check if XDomainRequest.
                        // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                        xhr = new XDomainRequest();
                        xhr.open(method, url);

                    } else {

                        // Otherwise, CORS is not supported by the browser.
                        xhr = null;

                    }
                    return xhr;
                }

                var url = 'http://track.asiacom.co.th/tracksgwebapi/api/userinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }


                var hashPassword = "";

                try {

                    var getPassword = $('#profilePasswordEN').val();
                    var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
                    hashPassword = hash;


                }
                catch (e) {

                    console.log('You got this error: ' + e);
                }

                //var getPassword = $('#userPasswordEN').val();
                //var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);


                var profile = {
                    UserID: getSessionstorageValueUserID,
                    Name: $('#profileNameEN').val(),
                    User: $('#profileUsername').val(),
                    Password: hashPassword,
                    RoleID: getSessionstorageValueRoleID,
                    Phone: $('#profilePhoneNumberEN').val(),
                    Email: $('#profileEmailEN').val(),
                    CompanyID: getSessionstorageValueCompanyID,
                    Assets: getSessionstorageValueUserAssets,
                    Notifications: getSessionstorageValueUserNotifications,
                    LoginRetry: 10,
                    //Password: $('#confirmPassword').val(),
                    Image: $('#userImage').val(),
                    Language: 1,
                    ResellerID: getSessionstorageValueUserResellerID
                };


                var updateProfile = 'http://track.asiacom.co.th/tracksgwebapi/api/userinfo?id=' + profile.UserID;

                $.ajax({
                    url: updateProfile,
                    type: "PUT",
                    data: JSON.stringify(profile),
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
                    success: function (profile) {
                        console.log(profile);
                        //window.location.reload(true);
                    },
                    error: function () { alert('error'); }

                });




            }

            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: 'Canceled',

                    container: 'floating',
                    timer: 3000
                });
            };

        });

    });


    // =================================================================
    
    //Submit Jobs
    $('#submit-jobEN').on('click', function () {

        var getJobNumber = $('#jobNumber').val();
        if (getJobNumber == "")
        {
            alert('Job Number must not be empty!');
        }
        else
        {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });

            bootbox.confirm("<div style='color:black'>Are you sure you wish to submit?</div>", function (result) {

                if (result) {

                    $.niftyNoty({
                        type: 'success',
                        icon: 'fa fa-check',
                        message: 'Successful',
                        container: 'floating',
                        timer: 3000
                    });

                    jQuery.support.cors = true;

                    function createCORSRequest(method, url) {
                        var xhr = new XMLHttpRequest();
                        if ("withCredentials" in xhr) {

                            // Check if the XMLHttpRequest object has a "withCredentials" property.
                            // "withCredentials" only exists on XMLHTTPRequest2 objects.
                            xhr.open(method, url, true);

                        } else if (typeof XDomainRequest != "undefined") {

                            // Otherwise, check if XDomainRequest.
                            // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
                            xhr = new XDomainRequest();
                            xhr.open(method, url);

                        } else {

                            // Otherwise, CORS is not supported by the browser.
                            xhr = null;

                        }
                        return xhr;
                    }

                    var url = 'http://track.asiacom.co.th/tracksgwebapi/api/jobinfo';
                    var xhr = createCORSRequest('GET', url);
                    xhr.send();
                    if (!xhr) {
                        throw new Error('CORS not supported');
                    }


                    var getJobID = $('#jobid').val();


                    var job = {
                        JobID: $('#jobid').val(),
                        JobNumber: $('#jobNumber').val(),
                        Company: $('#jobCustomerCompany').val(),
                        Timestamp: $('#deliveryDate').val(),
                        RxTime: $('#deliveryDate').val(),
                        AssetCompanyID: $('#jobCompany').val(),
                        AssetResellerID: $('#jobReseller').val(),
                        AssetID: $('#jobAssets').val()
                    };



                    if (job.JobID == 'undefined' || job.JobID == null || job.JobID == 0 || job.JobID != getJobID) {

                        $.ajax({
                            url: "http://track.asiacom.co.th/tracksgwebapi/api/jobinfo",
                            type: "POST",
                            data: JSON.stringify(job),
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
                            success: function (job) {
                                console.log(job);
                                clearJobForms();
                                $('#TableFormNew').modal('hide');
                                $('#jobs-editable').bootstrapTable('refresh');
                            }
                        });
                    }

                    else {


                        var updateJob = 'http://track.asiacom.co.th/tracksgwebapi/api/jobinfo?id=' + job.JobID;

                        $.ajax({
                            url: updateJob,
                            type: "PUT",
                            data: JSON.stringify(job),
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
                            success: function (job) {
                                console.log(job);
                                $("#buttonNew").show();
                                $("#buttonEdit").hide();
                                clearJobForms();
                                $('#TableFormNew').modal('hide');
                                $('#jobs-editable').bootstrapTable('refresh');
                            }

                        });


                    }

                }


                else {
                    $.niftyNoty({
                        type: 'danger',
                        icon: 'fa fa-minus',
                        message: 'Canceled',
                        container: 'floating',
                        timer: 3000
                    });
                };

            });
        }

    });
    $('#job-confirm-deleteEN').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });

        //bootbox.confirm("Are you sure you wish to delete reseller?", function (result) {
        bootbox.confirm("<div style='color:black'>Are you sure you wish to delete ?</div>", function (result) {
            if (result) {
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: 'Deleted Successfully',
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var job = JSON.stringify({ 'JobID': row.JobID });
                    var WebAPI = 'http://track.asiacom.co.th/tracksgwebapi/api/jobinfo/' + row.JobID;

                    $.ajax({
                        url: WebAPI,
                        type: "Delete",
                        data: JSON.stringify(job),
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
                        success: function (job) {
                            console.log(job);
                            $("#buttonNew").show();
                            $("#buttonEdit").hide();
                            clearJobForms();
                            $('#TableFormNew').modal('hide');
                            $('#jobs-editable').bootstrapTable('refresh');
                        }

                    });
                    return row.JobID
                });
                $table.bootstrapTable('remove', {
                    field: 'JobID',
                    values: ids
                });
                $remove.prop('disabled', true);


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
    });


})
