

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

                var url = 'http://66.96.208.81/sbswebapi/api/assetinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }

                //var getZones = $('#getZones').val();
                //var ObjZones = JSON.stringify(getZones);
                //var parseObjAssets = ObjZones.replace(/\[|\"|\]/g, "");

                var assets = {
                    AssetID: $('#assetID').val(),
                    Name: $('#assetNameEN').val(),
                    Category: $('#getCategories').val(),
                    Tag: $('#getDevices').val(),
                    CompanyID: $('#getCompanies').val(),
                    //=================================//
                    DriverID: 0,
                    Phone: "",
                    Email: "",
                    AlertZones: parseObjAssets,
                    Mileage: 0,
                    DistanceAlert: $('#distance').val(),
                    DateAlert: $('#dateAlert').val(),
                    IdlingLimit: 0,
                    SpeedLimit: 0,
                    InstallDate: $('#installDate').val()
                };

                var GetAssetID = $('#assetID').val();
                var getUser = sessionStorage.getItem('setSessionstorageValueUser');
                var getCompany = sessionStorage.getItem('setSessionstorageValueCompanyID');

                //send alert
                var emailAssets = {
                    Sender: "ADS",
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
                        url: "http://66.96.208.81/sbswebapi/api/messageinfo",
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

                    var apiSearchAsset = 'http://66.96.208.81/sbswebapi/api/searchasset?Name=' + assets.Name;

                    
                    //Check Duplicate Asset
                    $.getJSON(apiSearchAsset, function (data) {

                        if (data.length == 1)
                        {
                            alert('Asset had been used!');

                        }
                        else {
                            $.ajax({
                                url: "http://66.96.208.81/sbswebapi/api/assetinfo",
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
                                    $('#TableFormNew').modal('hide');
                                    $('#vehicles-editable').bootstrapTable('refresh');
                                    //window.location.reload(true);
                                }
                            });
                        }


                    });

                }

                else {

                    var updateAsset = 'http://66.96.208.81/sbswebapi/api/assetinfo?id=' + assets.AssetID;

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
                            //window.location.reload(true);
                            $('#TableFormNew').modal('hide');
                            $('#vehicles-editable').bootstrapTable('refresh');
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
                window.location.reload(true);
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
                    var WebAPI = 'http://66.96.208.81/sbswebapi/api/assetinfo/' + row.AssetID;

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
                        },
                        //error: function () { alert('error'); }
                        error: function (x, y, z) {
                            alert(x + '\n' + y + '\n' + z);
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


    //Submit Company
    $('#submit-company').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });

        //bootbox.confirm("Are you sure you wish to submit?", function (result) {
        bootbox.confirm("ค<div style='color:black'>คุณแน่ใจหรือว่า ต้องการ จะส่ง ?</div>", function (result) {
            if (result) {
                window.location.reload(true);
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Successful',
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

                var url = 'http://66.96.208.81/sbswebapi/api/companyinfo';
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

                var getReports = $('#companyReport').val();
                var ObjReports = JSON.stringify(getReports);
                var parseObjReports = ObjReports.replace(/\[|\"|\]/g, "");

                var company = {
                    CompanyID: $('#companyID').val(),
                    //Flag: $('#companyStatus').val(),
                    Flag: 1,
                    Name: $('#companyName').val(),
                    Address: $('#companyAddress').val(),
                    Email: $('#companyEmail').val(),
                    Phone: $('#companyPhone').val(),
                    //UserLimit: $('#companyUserLimit').val(),
                    //ZoneLimit: $('#companyZoneLimit').val(),
                    //AssetLimit: $('#companyVehicleLimit').val(),
                    //SmsLimit: $('#companySmsLimit').val(),
                    Categories: $('#companyCategory').val(),
                    Image: $('#companyImage').val(),
                    Reports: getReports

                };

                var GetCompanyID = $('#companyID').val();

                if (company.CompanyID == 'undefined' || company.CompanyID == null || company.CompanyID == 0 || company.CompanyID != GetCompanyID) {

                    $.ajax({
                        url: "http://66.96.208.81/sbswebapi/api/companyinfo",
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
                        },
                        //error: function () { alert('error'); }
                        error: function (x, y, z) {
                            alert(x + '\n' + y + '\n' + z);
                        }
                    });
                }

                else {


                    var updateCompany = 'http://66.96.208.81/sbswebapi/api/companyinfo?id=' + company.CompanyID;

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
                    //message: 'Canceled',
                    message: 'ยกเลิก',
                    container: 'floating',
                    timer: 3000
                });
            };

        });


    });
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
                window.location.reload(true);
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

                var url = 'http://66.96.208.81/sbswebapi/api/companyinfo';
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
                        url: "http://66.96.208.81/sbswebapi/api/companyinfo",
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
                        },
                        //error: function () { alert('error'); }
                        error: function (x, y, z) {
                            alert(x + '\n' + y + '\n' + z);
                        }
                    });
                }

                else {


                    var updateCompany = 'http://66.96.208.81/sbswebapi/api/companyinfo?id=' + company.CompanyID;

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

                var url = 'http://66.96.208.81/sbswebapi/api/companyinfo';
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
                        url: "http://66.96.208.81/sbswebapi/api/companyinfo",
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
                        },
                        //error: function () { alert('error'); }
                        error: function (x, y, z) {
                            alert(x + '\n' + y + '\n' + z);
                        }
                    });
                }

                else {


                    var updateCompany = 'http://66.96.208.81/sbswebapi/api/companyinfo?id=' + company.CompanyID;

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

    //Confirm Delete Row Companies
    $('#company-confirm-delete').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });

        //bootbox.confirm("Are you sure you wish to delete company?", function (result) {
        bootbox.confirm("<div style='color:black'>คคุณแน่ใจหรือว่า ต้องการลบ บริษัท ?</div>", function (result) {
            if (result) {
                window.location.reload(true);
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: 'ประสบความสำเร็จ ที่ถูกลบ',
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var company = JSON.stringify({ 'CompanyID': row.CompanyID });
                    var WebAPI = 'http://66.96.208.81/sbswebapi/api/companyinfo/' + row.CompanyID;

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
                        },
                        //error: function () { alert('error'); }
                        error: function (x, y, z) {
                            alert(x + '\n' + y + '\n' + z);
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
                    message: 'ลบ ยกเลิก',
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });
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
                window.location.reload(true);
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
                    var WebAPI = 'http://66.96.208.81/sbswebapi/api/companyinfo/' + row.CompanyID;

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
                        },
                        //error: function () { alert('error'); }
                        error: function (x, y, z) {
                            alert(x + '\n' + y + '\n' + z);
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
        var getSessionstorageValueRoleID = 1;
        var getAlertType = $('#notification-type').val();
        var getAlerts = $('#getNotification').val();

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

                    var url = 'http://66.96.208.81/sbswebapi/api/userinfo';
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
                        url: "http://66.96.208.81/sbswebapi/api/fileupload/uploadfileuser",
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


                    //var getAssets = $('#getAssets').val();
                    //var ObjAssets = JSON.stringify(getAssets);
                    //var parseObjAssets = ObjAssets.replace(/\[|\"|\]/g, "");

                    var getReports = $('#getReport').val();
                    var ObjReports = JSON.stringify(getReports);
                    var parseObjReports = ObjReports.replace(/\[|\"|\]/g, "");

                    //var getResellerID;
                    //if (getSessionstorageValueRoleID == 1) {

                    //    getResellerID = $('#userReseller').val();
                    //}
                    //else {

                    //    getResellerID = getSessionstorageValueUserResellerID
                    //}


                    var hashPassword = "";
                    var getPassword = $('#password').val();

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
                        RoleID: $('#getRoles').val(),
                        Name: $('#fname').val(),
                        User: $('#username').val(),
                        Password: hashPassword,
                        Email: $('#email').val(),
                        Phone: $('#phone').val(),
                        Image: $('#userImage').val(),
                        Notifications: parseObjAlerts,
                        LanguageID: $('#getLanguage').val(),
                        Assets: "",
                        LoginRetry: 10,
                        ResellerID: 1,
                        Reports: parseObjReports
                    };


                    if (user.UserID == 'undefined' || user.UserID == null || user.UserID == 0 || user.UserID != GetUserID) {

                        var apiSearchUser = 'http://66.96.208.81/sbswebapi/api/searchuser?User=' + user.User;

                        $.getJSON(apiSearchUser, function (data) {

                            if (data.length == 1) {
                                alert('User had been used!');

                            }
                            else {
                                $.ajax({
                                    url: "http://66.96.208.81/sbswebapi/api/userinfo",
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
                                        clearUserForms();
                                    }

                                });
                            }
                        });
                        

                    }

                    else {

                        var updateUser = 'http://66.96.208.81/sbswebapi/api/userinfo?id=' + user.UserID;

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
                                window.location.reload(true);
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
                    var WebAPI = 'http://66.96.208.81/sbswebapi/api/userinfo/' + row.UserID;

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
                            clearUserForms();
                        },
                        error: function () {
                            alert('error');
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

                var url = 'http://66.96.208.81/sbswebapi/api/deviceinfo';
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
                    InstallDate: $('#deviceInstallDateEN').val(),
                    Remarks: $('#deviceRemarksEN').val(),
                    isSentOut: $('#otaFilter').val(),
                    DeviceType: $('#load-type').val(),
                    IP: $('#deviceIP').val(),
                    SSID: $('#deviceSSID').val(),
                    Username: $('#deviceUsername').val(),
                    Password: $('#devicePassword').val(),
                    SecurityType: $('#deviceSecurity').val(),
                    Mode: $('#deviceMode').val(),
                    IPAddress: $('#deviceIPAddress').val(),
                    IPMask: $('#deviceIPMask').val(),
                    IPGateway: $('#deviceIPGateway').val()
                };


                var GetDeviceID = $('#deviceID').val();

                if (device.DeviceID == 'undefined' || device.DeviceID == null || device.DeviceID == 0 || device.DeviceID != GetDeviceID) {

                    var apiSearchDevice = 'http://66.96.208.81/sbswebapi/api/searchdevice?Name=' + device.Name;

                    //Check Duplicate Device
                    $.getJSON(apiSearchDevice, function (data) {

                        if (data.length == 1) {
                            alert('Device had been used!');

                        }
                        else {
                            $.ajax({
                                url: "http://66.96.208.81/sbswebapi/api/deviceinfo",
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
                                    clearUserForms();
                                }
                            });
                        }
                    });


                }

                else {


                    var updateDevice = 'http://66.96.208.81/sbswebapi/api/deviceinfo?id=' + device.DeviceID;

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
                            window.location.reload(true);
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

    //Delete Device
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
                window.location.reload(true);
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
                    var WebAPI = 'http://66.96.208.81/sbswebapi/api/deviceinfo/' + row.DeviceID;

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
                        },
                        //error: function () { alert('error'); }
                        error: function (x, y, z) {
                            alert(x + '\n' + y + '\n' + z);
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

    //Submit Driver
    $('#submit-driverEN').on('click', function () {


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

                var url = 'http://66.96.208.81/sbswebapi/api/driverinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }


                var getDriverID = $('#driverID').val();

                var data = new FormData();
                var files = $("#uploadDriverEN").get(0).files;


                // Add the uploaded image content to the form data collection
                if (files.length > 0) {
                    data.append("UploadedImage", files[0], getDriverID + ".png");
                }

                // Make Ajax request with the contentType = false, and procesDate = false
                var ajaxRequest = $.ajax({
                    type: "POST",
                    url: "http://66.96.208.81/sbswebapi/api/fileupload/uploadfile",
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
                                $("#uploadDriverEN").val('');
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

                    birthday = $('#driverDateOfBirthEN').val();
                } else {

                    birthday = "";
                }

                var driver = {
                    DriverID: $('#driverID').val(),
                    CompanyID: $('#driverCompanyEN').val(),
                    Name: $('#driverNameEN').val(),
                    Email: $('#driverEmailEN').val(),
                    Address: $('#driverAddressEN').val(),
                    Phone: $('#driverPhoneEN').val(),
                    DateOfBirth: birthday,
                    Remarks: $('#driverRemarksEN').val()
                };



                if (driver.DriverID == 'undefined' || driver.DriverID == null || driver.DriverID == 0 || driver.DriverID != getDriverID) {

                    var apiSearchDriver = 'http://66.96.208.81/sbswebapi/api/searchdriver?Name=' + driver.Name;

                    //Check Duplicate Asset
                    $.getJSON(apiSearchDriver, function (data) {

                        if (data.length == 1) {
                            alert('Driver had been used!');

                        }
                        else {
                            $.ajax({
                                url: "http://66.96.208.81/sbswebapi/api/driverinfo",
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
                                    window.location.reload(true);
                                }
                            });
                        }
                    });


                }

                else {


                    var updateDriver = 'http://66.96.208.81/sbswebapi/api/driverinfo?id=' + driver.DriverID;

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
                            window.location.reload(true);
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

    //Confirm Delete Row Reseller
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
                window.location.reload(true);
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
                    var WebAPI = 'http://66.96.208.81/sbswebapi/api/driverinfo/' + row.DriverID;

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
                        },
                        error: function (driver) {
                            alert('error');
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

                var url = 'http://66.96.208.81/sbswebapi/api/userinfo';
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


                var updateUser = 'http://66.96.208.81/sbswebapi/api/userinfo?id=' + user.UserID;

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

                var url = 'http://66.96.208.81/sbswebapi/api/userinfo';
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


                var updateProfile = 'http://66.96.208.81/sbswebapi/api/userinfo?id=' + profile.UserID;

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
               window.location.reload(true);
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

                var url = 'http://66.96.208.81/sbswebapi/api/jobinfo';
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
                        url: "http://66.96.208.81/sbswebapi/api/jobinfo",
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
                        },
                        error: function (job) {
                            alert('error');
                        }
                    });
                }

                else {


                    var updateJob = 'http://66.96.208.81/sbswebapi/api/jobinfo?id=' + job.JobID;

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
                        },
                        error: function (job) {
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
                window.location.reload(true);
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
                    var WebAPI = 'http://66.96.208.81/sbswebapi/api/jobinfo/' + row.JobID;

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
                        },
                        error: function (job) {
                            alert('error');
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
