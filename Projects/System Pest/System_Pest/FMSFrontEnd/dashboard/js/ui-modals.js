var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');
var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');
var titleAreYouSure, titleJobNumberUsed, titleCancel, titleSuccess, titleInvalidDate, titleAreYouSureDelete, titleDeleteSuccess, titleDeleteCancel, titleInvalidJobNumber;
var titleAddJob, titleJobCannotDelet, titleNoPhoneUsere, titleAssignPhone;
var titleResellerUsed, titleResellerEmpty, titlePhoneUsed, titlePhoneNameUsed;

if (getSessionstorageValueLanguage == "en")
{
    titleAreYouSure = "Are you sure you wish to submit?";
    titleJobNumberUsed = "Job Number had been used!";
    titleCancel = "Canceled";
    titleSuccess = "Successful";
    titleInvalidDate = "Invalid Date";
    titleAreYouSureDelete = "Are you sure you wish to delete ?";
    titleDeleteSuccess = "Deleted Successfully";
    titleDeleteCancel = "Delete Canceled";
    titleInvalidJobNumber = "Invalid Job Number";
    titleAddJob = "Are you sure you wish to add a job?";
    titleJobCannotDelete = "Job cannot be deleted!";
    titleNoPhoneUsere = "Selected Phone has no phone user! Pls. try again";
    titleAssignPhone = "Please assign to a Device."

    titleResellerUsed = "Reseller had been used!";
    titleResellerEmpty = "Reseller Name is empty";
    titlePhoneUsed = "Phone User had been used!";
    titlePhoneNameUsed = "";
}
else if (getSessionstorageValueLanguage == "th")
{
    titleAreYouSure = "คุณแน่ใจหรือว่าต้องการส่ง?"
    titleJobNumberUsed = "หมายเลขงานถูกนำมาใช้แล้ว!";
    titleCancel = "ยกเลิก";
    titleSuccess = "ประสบความสำเร็จ";
    titleInvalidDate = "วันที่ไม่ถูกต้อง";
    titleAreYouSureDelete = "คุณต้องการลบ ?";
    titleDeleteSuccess = "ลบเรียบร้อยแล้ว";
    titleDeleteCancel = "ลบถูกยกเลิก";
    titleInvalidJobNumber = "หมายเลขงานไม่ถูกต้อง";
    titleAddJob = "คุณต้องการเพิ่มงานหรือไม่?";
    titleJobCannotDelete = "ไม่สามารถลบงานได้!";
    titleNoPhoneUsere = "ขออภัยไม่มีผู้ใช้โทรศัพท์";
    titleAssignPhone = "โปรดมอบหมายให้กับอุปกรณ์."

    titleResellerUsed = "มีการใช้ตัวแทนจำหน่ายแล้ว";
    titleResellerEmpty = "ชื่อผู้ค้าปลีกว่างเปล่า";
    titlePhoneUsed = "มีการใช้ผู้ใช้โทรศัพท์แล้ว";
    titlePhoneNameUsed = "ใช้ชื่อโทรศัพท์แล้ว";

}
else if (getSessionstorageValueLanguage == "vn")
{
    titleAreYouSure = "Bạn Có Chắc Chắn Muốn Gửi?"
    titleJobNumberUsed = "Số việc đã được sử dụng!";
    titleCancel = "Đã hủy";
    titleSuccess = "Thành công";
    titleInvalidDate = "Ngày không hợp lệ";
    titleAreYouSureDelete = "Bạn muốn xóa ?";
    titleDeleteSuccess = "Xóa thành công";
    titleDeleteCancel = "Xóa Đã Hủy";
    titleInvalidJobNumber = "Số việc làm không hợp lệ";
    titleAddJob = "Bạn muốn thêm một công việc?";
    titleJobCannotDelete = "Không thể xóa công việc!";
    titleNoPhoneUsere = "Xin Lỗi, Không Có Người Sử Dụng Diện Thoại"
    titleAssignPhone = "Vui Lòng Chỉ Dịnh Cho Một Thiết Bị."

    titleResellerUsed = "Người bán lại đã được sử dụng";
    titleResellerEmpty = "Tên người bán lại trống";
    titlePhoneUsed = "Người dùng điện thoại đã được sử dụng";
    titlePhoneNameUsed = "Tên Điện thoại đã được sử dụng!";

}
else if (getSessionstorageValueLanguage == "id")
{
    titleAreYouSure = "Anda mengkonfirmasi mengirimkan?"
    titleJobNumberUsed = "Nomor Kerja telah digunakan!";
    titleCancel = "Dibatalkan";
    titleSuccess = "Berjaya";
    titleInvalidDate = "Tanggal Salah";
    titleAreYouSureDelete = "Anda ingin menghapus ?";
    titleDeleteSuccess = "Hapus Rekor Berjaya";
    titleDeleteCancel = "Hapus Dibatalkan";
    titleInvalidJobNumber = "Nomor Job Salah";
    titleAddJob = "Anda ingin menambahkan Kerja?";
    titleJobCannotDelete = "Kerja tidak dapat dihapus!";
    titleNoPhoneUsere = "Maaf, Tidak ada Telepon Pengguna"
    titleAssignPhone = "Sila tetapkan untuk sebuah Perangkat."

    titleResellerUsed = "Pengecer telah digunakan";
    titleResellerEmpty = "Nama Pengecer kosong";
    titlePhoneUsed = "Pengguna telepon telah digunakan";
    titlePhoneNameUsed = "Nama telepon telah digunakan!";

}

$(document).ready(function () {


    // Vehicle Submit
    $('#submit-vehicle').on('click', function () {

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
        bootbox.confirm("<div style='color:black'>คุณแน่ใจหรือว่า ต้องการ จะส่ง ?</div>", function (result) {
            if (result) {

                //setTimeout(function () { $('#vehicles-editable').bootstrapTable('refresh'); }, '5000');
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

                var url = 'http://117.120.7.119/spwebapi/api/assetinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }

                var getZones = $('#assetZone').val();
                var ObjZones = JSON.stringify(getZones);
                var parseObjAssets = ObjZones.replace(/\[|\"|\]/g, "");

                var assets = {
                    AssetID: $('#assetID').val(),
                    Name: $('#assetName').val(),
                    Category: $('#assetCategory').val(),
                    Tag: $('#assetDevice').val(),
                    CompanyID: $('#assetCompany').val(),
                    DriverID: $('#assetDriver').val(),
                    Phone: $('#assetPhone').val(),
                    Email: $('#assetEmail').val(),
                    Image: $('#assetImage').val(),
                    AlertZones: parseObjAssets,
                    Mileage: $('#assetMileage').val(),
                    DistanceAlert: $('#assetDistanceAlert').val(),
                    DateAlert: $('#assetDateAlert').val(),
                    IdlingLimit: $('#assetIdlingLimit').val(),
                    SpeedLimit: $('#assetSpeedLimit').val(),
                    Notifications: $('#assetNotifications').val(),
                    //CurfewStart: $('#assetInstallDate').val()
                    InstallDate: $('#assetInstallDate').val()
                };

                var getUser = sessionStorage.getItem('setSessionstorageValueUser');
                var getCompany = sessionStorage.getItem('setSessionstorageValueCompany');

                var emailAssets = {
                    Sender: "TRACKLitePro",
                    Recipients: "support@asiacom.co.th",
                    Message: "[TRACKLitePro - " + assets.Company + "]Device Added: " + getUser + " - " + assets.Name + " (" + assets.InstallDate + ")",
                    Timestamp: moment().format(),
                    RxTime: moment().format(),
                    Flag: 1,
                    CompanyID: getCompany,
                    AssetID: assets.AssetID
                };


                $.ajax({
                    url: "http://117.120.7.119/spwebapi/api/messageinfo",
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
                        // console.log(emailAssets);
                    }
                });


                var GetAssetID = $('#assetID').val();

                if (assets.AssetID == 'undefined' || assets.AssetID == null || assets.AssetID == 0 || assets.AssetID != GetAssetID) {


                    $.ajax({
                        url: "http://117.120.7.119/spwebapi/api/assetinfo",
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
                            // console.log(assets);
                            window.location.reload(true);
                        }
                    });

                }

                else {

                    var updateAsset = 'http://117.120.7.119/spwebapi/api/assetinfo?id=' + assets.AssetID;

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
                            // console.log(assets);
                            window.location.reload(true);
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

    $('#submit-vehicleEN').on('click', function () {

        if (getSessionstorageValueLanguage == "en") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });
        }
        else if (getSessionstorageValueLanguage == "th") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "th",


            });
        }
        else if (getSessionstorageValueLanguage == "vn") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "vi",


            });
        }
        else if (getSessionstorageValueLanguage == "id") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "id",


            });
        }


        bootbox.confirm("<div style='color:black'>" + titleAreYouSure + "</div>", function (result) {
            if (result) {

                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    message: titleSuccess,
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

                var url = 'http://117.120.7.119/spwebapi/api/assetinfo';
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
                    InstallDate: $('#assetInstallDate').val()
                };

                var GetAssetID = $('#assetID').val();
                var getUser = sessionStorage.getItem('setSessionstorageValueUser');
                var getCompany = sessionStorage.getItem('setSessionstorageValueCompanyID');

                var emailAssets = {
                    Sender: "TRACKLitePro",
                    Recipients: "support@asiacom.co.th",
                    Message: "[TRACKLitePro - " + assets.Company + "]Vehicle Added: " + getUser + " - " + assets.Name + " (" + assets.InstallDate + ")",
                    Timestamp: moment().format(),
                    RxTime: moment().format(),
                    Flag: 1,
                    CompanyID: getCompany,
                    AssetID: assets.AssetID
                };


                var apiAsset = 'http://117.120.7.119/spwebapi/api/duplicateasset?Name=' + assets.Name;


                if (assets.AssetID == 'undefined' || assets.AssetID == null || assets.AssetID == 0 || assets.AssetID != GetAssetID) {

                    //Check Duplicate Asset
                    $.getJSON(apiAsset, function (data) {

                        if (data.length == 1)
                        {
                            alert(titlePhoneNameUsed);
                        }
                        else
                        {
                            $.ajax({
                                url: "http://117.120.7.119/spwebapi/api/assetinfo",
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
                                    //console.log(assets);
                                    window.location.reload(true);
                                }
                            });


                            $.ajax({
                                url: "http://117.120.7.119/spwebapi/api/messageinfo",
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
                                    // console.log(emailAssets);       
                                    window.location.reload(true);
                                }
                            });
                        }

                    });


                }

                else {

                    //Check Duplicate Asset
                    $.getJSON(apiAsset, function (data) {

                        if (data.length == 1)
                        {
                            $.each(data, function (index, item) {

                                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                                    if (row.Name == item.Name)
                                    {
                                        updateAssets();
                                    }
                                    else
                                    {
                                        alert('Phone Name had been used!');
                                    }

                            });
                                
                            });
                        }
                        else
                        {
                            updateAssets();
                        }
                    });

                    function updateAssets()
                    {
                        var updateAsset = 'http://117.120.7.119/spwebapi/api/assetinfo?id=' + assets.AssetID;

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
                                //  console.log(assets);
                                window.location.reload(true);
                            }
                        });
                    }

                }

            }

            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: titleCancel,
                    container: 'floating',
                    timer: 3000
                });
            };

        });

    });

    //Confirm Delete Row Vehicles
    $('#vehicle-confirm-delete').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });

        //bootbox.confirm("Are you sure you wish to delete?", function (result) {
        bootbox.confirm("<div style='color:black'>คุณแน่ใจว่า คุณต้องการลบ ?</div>", function (result) {
            if (result) {
                window.location.reload(true);
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    //message: 'ประสบความสำเร็จ ที่ถูกลบ',
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var assets = JSON.stringify({ 'AssetId': row.AssetID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/assetinfo/' + row.AssetID;

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
                    message: 'ลบ ยกเลิก',
                    container: 'floating',
                    timer: 3000
                });
            };

        });



    });
    $('#vehicle-confirm-deleteEN').on('click', function () {

        if (getSessionstorageValueLanguage == "en") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });
        }
        else if (getSessionstorageValueLanguage == "th") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "th",


            });
        }
        else if (getSessionstorageValueLanguage == "vn") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "vi",


            });
        }
        else if (getSessionstorageValueLanguage == "id") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "id",


            });
        }

        //bootbox.confirm("Are you sure you wish to delete?", function (result) {

        bootbox.confirm("<div style='color:black'>" + titleAreYouSureDelete + "</div>", function (result) {

            if (result) {
                window.location.reload(true);
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: titleDeleteSuccess,
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var assets = JSON.stringify({ 'AssetId': row.AssetID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/assetinfo/' + row.AssetID;

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
                    message: titleDeleteCancel,
                    container: 'floating',
                    timer: 3000
                });
            };

        });



    });

    // =================================================================

    //Submit Zones
    $('#submit-zones').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
        var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
        var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');

        var zoneName = $('#zoneNameEN').val();

        var perimeter = $('.validationPerimeter').val();


        if (perimeter == "" | perimeter == null | perimeter == "undefined" | zoneName == "" | zoneName == null | zoneName == "undefined") {

            alert('กรุณากรอกข้อมูล ที่ว่างเปล่า');

        }

        else {

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
            bootbox.confirm("<div style='color:black'>คุณแน่ใจหรือว่า ต้องการ จะส่ง ?</div>", function (result) {
                if (result) {
                    // window.location.reload(true);
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

                    var url = 'http://117.120.7.119/spwebapi/api/zoneinfo';
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
                        Name: $('#zoneName').val(),
                        //Type: $('#zoneType').val(),
                        TypeID: $('#zoneTypeID').val(),
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
                            url: "http://117.120.7.119/spwebapi/api/zoneinfo",
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
                                //var getZoneName = $('#zoneName').val();
                                //var getZoneTypeID = $('#zoneTypeID').val();
                                //var getZoneTypeDesc = getZoneTypeIDDescText;
                                //var getCompanyID = $('#zoneCompany').val();
                                //var getCompany = getZoneCompanyText;
                                //var getDateCreated = $('#zoneDateCreated').val();
                                sessionStorage.removeItem("setSessionstorageValuePerimeterLength");
                                sessionStorage.removeItem("setSessionstorageValueZoneID");
                                sessionStorage.removeItem("setSessionstorageValueZoneName");
                                sessionStorage.removeItem("setSessionstorageValueZoneTypeID");
                                sessionStorage.removeItem("setSessionstorageValueZoneTypeDesc");
                                sessionStorage.removeItem("setSessionstorageValueZoneCompany");
                                sessionStorage.removeItem("setSessionstorageValueZoneCompanyID");
                                sessionStorage.removeItem("setSessionstorageValueZoneDateCreated");

                                window.location.reload(true);
                                //window.location = "/Dashboard/zones.html"

                            }
                        });
                    }

                    else {


                        var updateZone = 'http://117.120.7.119/spwebapi/api/zoneinfo?id=' + zones.ZoneID;

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
                                sessionStorage.removeItem("setSessionstorageValuePerimeterLength");
                                sessionStorage.removeItem("setSessionstorageValueZoneID");
                                sessionStorage.removeItem("setSessionstorageValueZoneName");
                                sessionStorage.removeItem("setSessionstorageValueZoneTypeID");
                                sessionStorage.removeItem("setSessionstorageValueZoneTypeDesc");
                                sessionStorage.removeItem("setSessionstorageValueZoneCompany");
                                sessionStorage.removeItem("setSessionstorageValueZoneCompanyID");
                                sessionStorage.removeItem("setSessionstorageValueZoneDateCreated");

                                window.location.reload(true);
                                //window.location = "/th/Dashboard/zones.html"
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

        }

    });
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
            if (getSessionstorageValueLanguage == "en") {
                bootbox.setDefaults({
                    /**
                     * @optional String
                     * @default: en
                     * which locale settings to use to translate the three
                     * standard button labels: OK, CONFIRM, CANCEL
                     */
                    locale: "en",


                });
            }
            else if (getSessionstorageValueLanguage == "th") {
                bootbox.setDefaults({
                    /**
                     * @optional String
                     * @default: en
                     * which locale settings to use to translate the three
                     * standard button labels: OK, CONFIRM, CANCEL
                     */
                    locale: "th",


                });
            }
            else if (getSessionstorageValueLanguage == "vn") {

                bootbox.setDefaults({
                    /**
                     * @optional String
                     * @default: en
                     * which locale settings to use to translate the three
                     * standard button labels: OK, CONFIRM, CANCEL
                     */
                    locale: "vi",


                });
            }
            else if (getSessionstorageValueLanguage == "id") {

                bootbox.setDefaults({
                    /**
                     * @optional String
                     * @default: en
                     * which locale settings to use to translate the three
                     * standard button labels: OK, CONFIRM, CANCEL
                     */
                    locale: "id",


                });
            }


            bootbox.confirm("<div style='color:black'>" + titleAreYouSure + "</div>", function (result) {
                if (result) {
                    $.niftyNoty({
                        type: 'success',
                        icon: 'fa fa-check',
                        message: titleSuccess,
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

                    var url = 'http://117.120.7.119/spwebapi/api/zoneinfo';
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

                    var type;
                    if (getSessionstorageValueLanguage == "en") {
                        type = $('#zoneTypeIDEN').val();
                    } else if (getSessionstorageValueLanguage == "th") {
                        type = $('#zoneTypeIDTH').val();
                    } else if (getSessionstorageValueLanguage == "vn") {
                        type = $('#zoneTypeIDVN').val();
                    } else if (getSessionstorageValueLanguage == "id") {
                        type = $('#zoneTypeIDID').val();
                    }

                    var zones = {
                        ZoneID: $('#zoneID').val(),
                        Name: $('#zoneNameEN').val(),
                        //Type: $('#zoneType').val(),
                        TypeID: type,
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

                    var apiZone = 'http://117.120.7.119/spwebapi/api/duplicatezone?Name=' + zones.Name;

                    if (zones.ZoneID == 'undefined' || zones.ZoneID == null || zones.ZoneID == 0 || zones.ZoneID != GetZoneID) {

                        //Check Duplicate Zone
                        $.getJSON(apiZone, function (data) {

                            if (data.length == 1)
                            {
                                alert('Zone had been used!');
                            }
                            else
                            {
                                $.ajax({
                                    url: "http://117.120.7.119/spwebapi/api/zoneinfo",
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

                                        //window.location = "th/Dashboard/zones.html"
                                        window.location.reload(true);
                                    }
                                });

                            }
                        });


                    }

                    else {

                        //Check Duplicate Zone
                        $.getJSON(apiZone, function (data) {

                            if (data.length == 1) {
                                $.each(data, function (index, item) {

                                    var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                                        if (row.Name == item.Name) {
                                            updateZones();
                                        }
                                        else {
                                            alert('Zone Name had been used!');
                                        }

                                    });

                                });
                            }
                            else {
                                updateZones();
                            }
                        });

                        function updateZones()
                        {
                            var updateZone = 'http://117.120.7.119/spwebapi/api/zoneinfo?id=' + zones.ZoneID;

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

                                    window.location.reload(true);
                                    //window.location = "/th/Dashboard/zones.html"
                                    // window.location.reload(true);
                                }
                            });

                        }
                    }

                }


                else {
                    $.niftyNoty({
                        type: 'danger',
                        icon: 'fa fa-minus',
                        message: titleCancel,
                        container: 'floating',
                        timer: 3000
                    });
                };

            });
        }
    });

    //Confirm Delete Row Zones
    $('#zone-confirm-delete').on('click', function () {


        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });

        //bootbox.confirm("Are you sure you wish to delete zone/s?", function(result) {
        bootbox.confirm("<div style='color:black'>คคุณแน่ใจหรือว่า ต้องการลบ โซน ?</div>", function (result) {
            if (result) {
                window.location.reload(true);
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message : 'Deleted Successfully',
                    message: 'ประสบความสำเร็จ ที่ถูกลบ',
                    container: 'floating',
                    timer: 3000
                });

                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var zones = JSON.stringify({ 'ZoneId': row.ZoneID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/zoneinfo/' + row.ZoneID;

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
                    message: 'ลบ ยกเลิก',
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });
    $('#zone-confirm-deleteEN').on('click', function () {


        if (getSessionstorageValueLanguage == "en") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });
        }
        else if (getSessionstorageValueLanguage == "th") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "th",


            });
        }
        else if (getSessionstorageValueLanguage == "vn") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "vi",


            });
        }
        else if (getSessionstorageValueLanguage == "id") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "id",


            });
        }

        //bootbox.confirm("Are you sure you wish to delete zone/s?", function(result) {
        bootbox.confirm("<div style='color:black'>" + titleAreYouSureDelete + "</div>", function (result) {
            if (result) {

                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message : 'Deleted Successfully',
                    message: titleDeleteSuccess,
                    container: 'floating',
                    timer: 3000
                });

                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var zones = JSON.stringify({ 'ZoneId': row.ZoneID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/zoneinfo/' + row.ZoneID;

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
                            window.location.reload(true);
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
                    message: titleDeleteCancel,
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

                var url = 'http://117.120.7.119/spwebapi/api/companyinfo';
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
                        url: "http://117.120.7.119/spwebapi/api/companyinfo",
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
                        }
                    });
                }

                else {


                    var updateCompany = 'http://117.120.7.119/spwebapi/api/companyinfo?id=' + company.CompanyID;

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

        if (getSessionstorageValueLanguage == "en") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });
        }
        else if (getSessionstorageValueLanguage == "th") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "th",


            });
        }
        else if (getSessionstorageValueLanguage == "vn") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "vi",


            });
        }
        else if (getSessionstorageValueLanguage == "id") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "id",


            });
        }

        bootbox.confirm("<div style='color:black'>" + titleAreYouSure + "</div>", function (result) {

            if (result) {
                
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    message: titleSuccess,
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

                var url = 'http://117.120.7.119/spwebapi/api/companyinfo';
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

                var apiCompany = 'http://117.120.7.119/spwebapi/api/duplicatecompany?Name=' + company.Name;

                if (company.CompanyID == 'undefined' || company.CompanyID == null || company.CompanyID == 0 || company.CompanyID != GetCompanyID) {

                    //Check Duplicate Company
                    $.getJSON(apiCompany, function (data) {

                        if (data.length == 1) {
                            alert('Company had been used!');

                        }
                        else
                        {
                            $.ajax({
                                url: "http://117.120.7.119/spwebapi/api/companyinfo",
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
                                    window.location.reload(true);
                                }
                            });
                        }
                    });
                }
                else {

                    //Check Duplicate Company
                    $.getJSON(apiCompany, function (data) {

                        if (data.length == 1) {
                            $.each(data, function (index, item) {

                                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                                    if (row.Name == item.Name) {
                                        updateCompanies();
                                    }
                                    else {
                                        alert('Company had been used!');
                                    }

                                });

                            });
                        }
                        else {
                            updateCompanies();
                        }
                    });

                    function updateCompanies()
                    {
                        var updateCompany = 'http://117.120.7.119/spwebapi/api/companyinfo?id=' + company.CompanyID;

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
                                window.location.reload(true);
                            }
                        });
                    }
                }

            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: titleCancel,
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

                var url = 'http://117.120.7.119/spwebapi/api/companyinfo';
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
                        url: "http://117.120.7.119/spwebapi/api/companyinfo",
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


                    var updateCompany = 'http://117.120.7.119/spwebapi/api/companyinfo?id=' + company.CompanyID;

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
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/companyinfo/' + row.CompanyID;

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

        if (getSessionstorageValueLanguage == "en") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });
        }
        else if (getSessionstorageValueLanguage == "th") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "th",


            });
        }
        else if (getSessionstorageValueLanguage == "vn") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "vi",


            });
        }
        else if (getSessionstorageValueLanguage == "id") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "id",


            });
        }

        //bootbox.confirm("Are you sure you wish to delete company?", function (result) {
        bootbox.confirm("<div style='color:black'>" + titleAreYouSureDelete + "</div>", function (result) {
            if (result) {
                window.location.reload(true);
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: titleDeleteSuccess,
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var company = JSON.stringify({ 'CompanyID': row.CompanyID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/companyinfo/' + row.CompanyID;

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
                    message: titleDeleteCancel,
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });

    // =================================================================

    //Submit User
    $('#submit-user').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
        var getAlertType = $('#userNotificationsType').val();
        var getAlerts = $('#userNotifications').val();

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

                var url = 'http://117.120.7.119/spwebapi/api/userinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }


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

                try {
                    if (GetUserID == null | GetUserID == "" | GetUserID == "undefined") {
                        var getPassword = $('#userPassword').val();
                        var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
                        hashPassword = hash;

                    }
                    else
                    {
                        var getPassword = $('#userPassword').val();

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
                    RoleDesc: $('#userRoleDesc').val(),
                    RoleDesc: $('#userRoleDescReseller').val(),
                    RoleDesc: $('#userRoleDescMaster').val(),
                    RoleDesc: $('#userRoleDescAdmin').val(),
                    Name: $('#userFullName').val(),
                    User: $('#UserName').val(),
                    Password: hash,
                    //Password: $('#confirmPassword').val(),
                    Email: $('#userEmail').val(),
                    Phone: $('#userPhone').val(),
                    Image: $('#userImage').val(),
                    Notifications: parseObjAlerts,
                    Language: $('#load-language').val(),
                    Assets: parseObjAssets,
                    LoginRetry: valLoginRetry,
                    ResellerID: getResellerID
                };




                if (user.UserID == 'undefined' || user.UserID == null || user.UserID == 0 || user.UserID != GetUserID) {



                    $.ajax({
                        url: "http://117.120.7.119/spwebapi/api/userinfo",
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
                        }
                    });

                }

                else {

                    var updateUser = 'http://117.120.7.119/spwebapi/api/userinfo?id=' + user.UserID;

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
    $('#submit-userEN').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
        var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
        var getAlertType = $('#userNotificationsType').val();
        var getAlerts = $('#userNotifications').val();

        var getUserCompany = $('#userCompany').val();

        if (getUserCompany != "0" || getUserCompany == "") {

            if (getSessionstorageValueLanguage == "en") {
                bootbox.setDefaults({
                    /**
                     * @optional String
                     * @default: en
                     * which locale settings to use to translate the three
                     * standard button labels: OK, CONFIRM, CANCEL
                     */
                    locale: "en",


                });
            }
            else if (getSessionstorageValueLanguage == "th") {
                bootbox.setDefaults({
                    /**
                     * @optional String
                     * @default: en
                     * which locale settings to use to translate the three
                     * standard button labels: OK, CONFIRM, CANCEL
                     */
                    locale: "th",


                });
            }
            else if (getSessionstorageValueLanguage == "vn") {

                bootbox.setDefaults({
                    /**
                     * @optional String
                     * @default: en
                     * which locale settings to use to translate the three
                     * standard button labels: OK, CONFIRM, CANCEL
                     */
                    locale: "vi",


                });
            }
            else if (getSessionstorageValueLanguage == "id") {

                bootbox.setDefaults({
                    /**
                     * @optional String
                     * @default: en
                     * which locale settings to use to translate the three
                     * standard button labels: OK, CONFIRM, CANCEL
                     */
                    locale: "id",


                });
            }


            bootbox.confirm("<div style='color:black'>" + titleAreYouSure + "</div>", function (result) {
                if (result) {
     
                    $.niftyNoty({
                        type: 'success',
                        icon: 'fa fa-check',

                        message: titleSuccess,
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

                    var url = 'http://117.120.7.119/spwebapi/api/userinfo';
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
                        url: "http://117.120.7.119/spwebapi/api/fileupload/uploadfileuser",
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

                    var apiUser = 'http://117.120.7.119/spwebapi/api/duplicateuser?User=' + user.User;

                    if (user.UserID == 'undefined' || user.UserID == null || user.UserID == 0 || user.UserID != GetUserID) {

                        //Check Duplicate User
                        $.getJSON(apiUser, function (data) {

                            if (data.length == 1)
                            {
                                alert('User had been used!');
                            }
                            else
                            {
                                $.ajax({
                                    url: "http://117.120.7.119/spwebapi/api/userinfo",
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
                                        window.location.reload(true);
                                    }
                                });
                            }
                        });
                    }

                    else {

                        //Check Duplicate User
                        $.getJSON(apiUser, function (data) {

                            if (data.length == 1) {
                                $.each(data, function (index, item) {

                                    var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                                        if (row.User == item.User) {
                                            updateUsers();
                                        }
                                        else {
                                            alert('Phone Name had been used!');
                                        }

                                    });

                                });
                            }
                            else {
                                updateUsers();
                            }
                        });

                        function updateUsers()
                        {
                            var updateUser = 'http://117.120.7.119/spwebapi/api/userinfo?id=' + user.UserID;

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

                }

                else {
                    $.niftyNoty({
                        type: 'danger',
                        icon: 'fa fa-minus',
                        message: titleCancel,

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

                    var url = 'http://117.120.7.119/spwebapi/api/userinfo';
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
                        url: "http://117.120.7.119/spwebapi/api/fileupload/uploadfileuser",
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
                            url: "http://117.120.7.119/spwebapi/api/userinfo",
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
                            }
                        });

                    }

                    else {

                        var updateUser = 'http://117.120.7.119/spwebapi/api/userinfo?id=' + user.UserID;

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
    $('#users-confirm-delete').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });

        //bootbox.confirm("Are you sure you wish to delete user?", function (result) {
        bootbox.confirm("<div style='color:black'>คุณแน่ใจหรือว่า ต้องการลบ ผู้ใช้?</div>", function (result) {
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

                    var user = JSON.stringify({ 'UserID': row.UserID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/userinfo/' + row.UserID;

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
                    message: 'ลบ ยกเลิก',
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });
    $('#users-confirm-deleteEN').on('click', function () {

        if (getSessionstorageValueLanguage == "en") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });
        }
        else if (getSessionstorageValueLanguage == "th") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "th",


            });
        }
        else if (getSessionstorageValueLanguage == "vn") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "vi",


            });
        }
        else if (getSessionstorageValueLanguage == "id") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "id",


            });
        }

        //bootbox.confirm("Are you sure you wish to delete user?", function (result) {
        bootbox.confirm("<div style='color:black'>" + titleAreYouSureDelete + "</div>", function (result) {
            if (result) {
                window.location.reload(true);
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: titleDeleteSuccess,
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var user = JSON.stringify({ 'UserID': row.UserID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/userinfo/' + row.UserID;

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
                    message: titleDeleteCancel,
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });

    // =================================================================

    //Submit Device
    $('#submit-device').on('click', function () {

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
        bootbox.confirm("<div style='color:black'>คุณแน่ใจหรือว่า ต้องการ จะส่ง ?</div>", function (result) {
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

                var url = 'http://117.120.7.119/spwebapi/api/deviceinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }

                var device = {
                    DeviceID: $('#deviceID').val(),
                    Name: $('#deviceName').val(),
                    Imei: $('#deviceIMEI').val(),
                    Phone: $('#devicePhone').val(),
                    Interval: $('#devicePollingInterval').val(),
                    Port: $('#devicePort').val(),
                    APN: $('#deviceAPN').val(),
                    InstallDate: $('#deviceInstallDate').val(),
                    //ModifiedTimestamp: $('#userImage').val(),
                    Remarks: $('#deviceRemarks').val(),
                    //isSentOut: $('#userDepartment').val(),
                    //Image: $('#userAssets').val(),
                    //ImageFill: $('#userAssets').val()
                };


                var GetDeviceID = $('#deviceID').val();

                if (device.DeviceID == 'undefined' || device.DeviceID == null || device.DeviceID == 0 || device.DeviceID != GetDeviceID) {


                    $.ajax({
                        url: "http://117.120.7.119/spwebapi/api/deviceinfo",
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
                        }
                    });

                }

                else {


                    var updateDevice = 'http://117.120.7.119/spwebapi/api/deviceinfo?id=' + device.DeviceID;

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
    $('#submit-deviceEN').on('click', function () {

        function IDGenerator() {

                this.length = 15;
                this.timestamp = +new Date;

                var _getRandomInt = function (min, max) {
                    return Math.floor(Math.random() * (max - min + 1)) + min;
                }

                this.generate = function () {
                    var ts = this.timestamp.toString();
                    var parts = ts.split("").reverse();
                    var id = "";

                    for (var i = 0; i < this.length; ++i) {
                        var index = _getRandomInt(0, parts.length - 1);
                        id += parts[index];
                    }

                    return id;
                }
        }

        //Add port number
        var arrPort = ['18043'];
        var port = arrPort[Math.floor(Math.random() * arrPort.length)];
        $('#devicePortEN').val(port);

        if (getSessionstorageValueLanguage == "en") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });
        }
        else if (getSessionstorageValueLanguage == "th") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "th",


            });
        }
        else if (getSessionstorageValueLanguage == "vn") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "vi",


            });
        }
        else if (getSessionstorageValueLanguage == "id") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "id",


            });
        }

        bootbox.confirm("<div style='color:black'>" + titleAreYouSure + "</div>", function (result) {
            if (result) {
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    message: titleSuccess,
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

                var url = 'http://117.120.7.119/spwebapi/api/deviceinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }

                var getTimestamp = $('#deviceInstallDate').val();
                var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
                var convertTimestamp = moment(getTimestamp, dateFormat);
                var timestamp;

                if (getSessionstorageValueTrackVersion == "sg")
                {
                    timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);
                }
                else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id")
                {
                    timestamp = moment(convertTimestamp).subtract('hours', 7).format(dateFormat);
                }

                var generator = new IDGenerator();
                var getDeviceName = $('#deviceNameEN').val();
                var uniqueID = generator.generate();
                var key;
                if (getDeviceName == "") key = uniqueID;
                else key = $('#deviceNameEN').val();

                var device = {
                    DeviceID: $('#deviceID').val(),
                    Name: key,
                    Imei: key,
                    Phone: $('#devicePhoneEN').val(),
                    Interval: $('#devicePollingIntervalEN').val(),
                    Port: port,
                    APN: $('#deviceAPNEN').val(),
                    InstallDate: timestamp,
                    //ModifiedTimestamp: $('#userImage').val(),
                    Remarks: $('#deviceRemarksEN').val(),
                    isSentOut: $('#isSentOutEN').val(),
                    Key: uniqueID,
                    CompanyID: $('#load-company').val()
                    //Image: $('#userAssets').val(),
                    //ImageFill: $('#userAssets').val()
                };


                var GetDeviceID = $('#deviceID').val();
                var DeviceAPI = "http://117.120.7.119/spwebapi/api/deviceinfo"
                var apiDevice = 'http://117.120.7.119/spwebapi/api/duplicatedevice?Name=' + device.Name;

                if (device.DeviceID == 'undefined' || device.DeviceID == null || device.DeviceID == 0 || device.DeviceID != GetDeviceID) {

                    //Check Duplicate Device
                    $.getJSON(apiDevice, function (data) {

                        if (data.length == 1) {
                            alert('Device had been used!');

                        }
                        else
                        {
                            $.ajax({
                                url: DeviceAPI,
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
									window.location.reload(true);
                                }
                            });
                        }
                    });
                }

                else {

                    //Check Duplicate Device
                    $.getJSON(apiDevice, function (data) {

                        if (data.length == 1) {
                            $.each(data, function (index, item) {

                                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                                    if (row.Name == item.Name) {
                                        updateDevices();
                                    }
                                    else {
                                        alert('Device Name had been used!');
                                    }

                                });

                            });
                        }
                        else {
                            updateDevices();
                        }
                    });

                    function updateDevices()
                    {
                        var updateDevice = 'http://117.120.7.119/spwebapi/api/deviceinfo?id=' + device.DeviceID;

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
            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: titleCancel,
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

                var url = 'http://117.120.7.119/spwebapi/api/deviceinfo';
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
                        url: "http://117.120.7.119/spwebapi/api/deviceinfo",
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
                        }
                    });

                }

                else {


                    var updateDevice = 'http://117.120.7.119/spwebapi/api/deviceinfo?id=' + device.DeviceID;

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
    $('#device-confirm-delete').on('click', function () {


        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });

        //bootbox.confirm("Are you sure you wish to delete user?", function (result) {
        bootbox.confirm("<div style='color:black'>คุณแน่ใจหรือว่า ต้องการลบ ผู้ใช้?</div>", function (result) {
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

                    var device = JSON.stringify({ 'DeviceID': row.DeviceID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/deviceinfo/' + row.DeviceID;

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
                    message: 'ลบ ยกเลิก',
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });
    $('#device-confirm-deleteEN').on('click', function () {


        if (getSessionstorageValueLanguage == "en") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });
        }
        else if (getSessionstorageValueLanguage == "th") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "th",


            });
        }
        else if (getSessionstorageValueLanguage == "vn") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "vi",


            });
        }
        else if (getSessionstorageValueLanguage == "id") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "id",


            });
        }

        //bootbox.confirm("Are you sure you wish to delete user?", function (result) {
        bootbox.confirm("<div style='color:black'>" + titleAreYouSureDelete + "</div>", function (result) {
            if (result) {
                window.location.reload(true);
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: titleDeleteSuccess,
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var device = JSON.stringify({ 'DeviceID': row.DeviceID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/deviceinfo/' + row.DeviceID;

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
                    message: titleDeleteCancel,
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });


    // =================================================================

    //Submit Reseller
    $('#submit-reseller').on('click', function () {

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
        bootbox.confirm("<div style='color:black'>คุณแน่ใจหรือว่า ต้องการ จะส่ง ?</div>", function (result) {
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

                var url = 'http://117.120.7.119/spwebapi/api/resellerinfo';
                var xhr = createCORSRequest('GET', url);
                xhr.send();
                if (!xhr) {
                    throw new Error('CORS not supported');
                }


                var reseller = {
                    ResellerID: $('#resellerID').val(),
                    Flag: 1,
                    Name: $('#resellerName').val(),
                    Address: $('#resellerAddress').val(),
                    Email: $('#resellerEmail').val(),
                    Phone: $('#resellerPhone').val()
                };

                var GetResellerID = $('#resellerID').val();

                if (reseller.ResellerID == 'undefined' || reseller.ResellerID == null || reseller.ResellerID == 0 || reseller.ResellerID != GetResellerID) {

                    $.ajax({
                        url: "http://117.120.7.119/spwebapi/api/resellerinfo",
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
                        }

                    });
                }

                else {


                    var updateReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?id=' + reseller.ResellerID;

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
    $('#submit-resellerEN').on('click', function () {

        var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
        var getReseller = $('#resellerNameEN').val();

        if (getReseller == "") {
            alert(titleResellerEmpty);
        }
        else
        {
            if (getSessionstorageValueLanguage == "en") {
                bootbox.setDefaults({
                    /**
                     * @optional String
                     * @default: en
                     * which locale settings to use to translate the three
                     * standard button labels: OK, CONFIRM, CANCEL
                     */
                    locale: "en",


                });
            }
            else if (getSessionstorageValueLanguage == "th") {
                bootbox.setDefaults({
                    /**
                     * @optional String
                     * @default: en
                     * which locale settings to use to translate the three
                     * standard button labels: OK, CONFIRM, CANCEL
                     */
                    locale: "th",


                });
            }
            else if (getSessionstorageValueLanguage == "vn") {

                bootbox.setDefaults({
                    /**
                     * @optional String
                     * @default: en
                     * which locale settings to use to translate the three
                     * standard button labels: OK, CONFIRM, CANCEL
                     */
                    locale: "vi",


                });
            }
            else if (getSessionstorageValueLanguage == "id") {

                bootbox.setDefaults({
                    /**
                     * @optional String
                     * @default: en
                     * which locale settings to use to translate the three
                     * standard button labels: OK, CONFIRM, CANCEL
                     */
                    locale: "id",


                });
            }

            bootbox.confirm("<div style='color:black'>" + titleAreYouSure + "</div>", function (result) {

                if (result) {

                    $.niftyNoty({
                        type: 'success',
                        icon: 'fa fa-check',
                        message: titleSuccess,
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

                    var url = 'http://117.120.7.119/spwebapi/api/resellerinfo';
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
                    var apiReseller = 'http://117.120.7.119/spwebapi/api/duplicatereseller?Name=' + reseller.Name;
                    if (reseller.ResellerID == 'undefined' || reseller.ResellerID == null || reseller.ResellerID == 0 || reseller.ResellerID != GetResellerID) {

                        //Check Duplicate Reseller
                        $.getJSON(apiReseller, function (data) {
                            if (data.length == 1) {
                                alert(titleResellerUsed);
                            }
                            else {
                                $.ajax({
                                    url: "http://117.120.7.119/spwebapi/api/resellerinfo",
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
                                        window.location.reload(true);
                                    }
                                });
                            }
                        });

                    }

                    else {

                        //Check Duplicate Reseller
                        $.getJSON(apiReseller, function (data) {

                            if (data.length == 1) {
                                $.each(data, function (index, item) {

                                    var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                                        if (row.Name == item.Name) {
                                            updateResellers();
                                        }
                                        else {
                                            alert('Reseller Name had been used!');
                                        }

                                    });

                                });
                            }
                            else {
                                updateResellers();
                            }
                        });

                        function updateResellers() {
                            var updateReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?id=' + reseller.ResellerID;

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
                                    window.location.reload(true);
                                }

                            });
                        }
                    }
                }


                else {
                    $.niftyNoty({
                        type: 'danger',
                        icon: 'fa fa-minus',
                        message: titleCancel,
                        container: 'floating',
                        timer: 3000
                    });
                };

            });

        }
        

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

                var url = 'http://117.120.7.119/spwebapi/api/resellerinfo';
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
                        url: "http://117.120.7.119/spwebapi/api/resellerinfo",
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
                        }
                    });
                }

                else {


                    var updateReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?id=' + reseller.ResellerID;

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
    $('#reseller-confirm-delete').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });

        //bootbox.confirm("Are you sure you wish to delete reseller?", function (result) {
        bootbox.confirm("<div style='color:black'>คุณแน่ใจหรือว่า ต้องการลบ บริษัท ?</div>", function (result) {
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

                    var reseller = JSON.stringify({ 'ResellerID': row.ResellerID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/resellerinfo/' + row.ResellerID;

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
                    message: 'ลบ ยกเลิก',
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });
    $('#reseller-confirm-deleteEN').on('click', function () {

        if (getSessionstorageValueLanguage == "en") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });
        }
        else if (getSessionstorageValueLanguage == "th") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "th",


            });
        }
        else if (getSessionstorageValueLanguage == "vn") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "vi",


            });
        }
        else if (getSessionstorageValueLanguage == "id") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "id",


            });
        }

        //bootbox.confirm("Are you sure you wish to delete reseller?", function (result) {
        bootbox.confirm("<div style='color:black'>" + titleAreYouSureDelete + "</div>", function (result) {
            if (result) {
                window.location.reload(true);
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: titleDeleteSuccess,
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var reseller = JSON.stringify({ 'ResellerID': row.ResellerID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/resellerinfo/' + row.ResellerID;

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
                    message: titleDeleteCancel,
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });



    // =================================================================

    //Submit Driver
    $('#submit-driver').on('click', function () {

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
        bootbox.confirm("<div style='color:black'>คุณแน่ใจหรือว่า ต้องการ จะส่ง ?</div>", function (result) {
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

                var url = 'http://117.120.7.119/spwebapi/api/driverinfo';
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
                    url: "http://117.120.7.119/spwebapi/api/fileupload/uploadfile",
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

                if (birthday == null || birthday == 'undefined' || birthday == "") {

                    birthday = $('#driverDateOfBirth').val();
                } else {

                    birthday = moment.utc().add('hours', 7).format('D-MMM-YYYY, hh:mm:ss A');
                }


                var driver = {
                    DriverID: $('#driverID').val(),
                    CompanyID: $('#driverCompany').val(),
                    Name: $('#driverName').val(),
                    Email: $('#driverEmail').val(),
                    Address: $('#driverAddress').val(),
                    Phone: $('#driverPhone').val(),
                    DateOfBirth: birthday,
                    Remarks: $('#driverRemarks').val()
                };



                if (driver.DriverID == 'undefined' || driver.DriverID == null || driver.DriverID == 0 || driver.DriverID != getDriverID) {

                    $.ajax({
                        url: "http://117.120.7.119/spwebapi/api/driverinfo",
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
                        }
                    });
                }

                else {


                    var updateDriver = 'http://117.120.7.119/spwebapi/api/driverinfo?id=' + driver.DriverID;

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
                        }
                    });


                }

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

    $('#submit-driverEN').on('click', function () {


        if (getSessionstorageValueLanguage == "en") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });
        }
        else if (getSessionstorageValueLanguage == "th") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "th",


            });
        }
        else if (getSessionstorageValueLanguage == "vn") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "vi",


            });
        }
        else if (getSessionstorageValueLanguage == "id") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "id",


            });
        }

        bootbox.confirm("<div style='color:black'>" + titleAreYouSure + "</div>", function (result) {

            if (result) {
                
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    message: titleSuccess,
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

                var url = 'http://117.120.7.119/spwebapi/api/driverinfo';
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
                    url: "http://117.120.7.119/spwebapi/api/fileupload/uploadfile",
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

                    birthday = moment.utc().add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');
                }


                var hashPassword = "";
                var getPassword = $('#driverPasswordEN').val();

                try {
                    if (getDriverID == null | getDriverID == "" | getDriverID == "undefined") {

                        var hash = CryptoJS.SHA3(getPassword, { outputLength: 256 }).toString(CryptoJS.enc.Base64);
                        hashPassword = hash;

                    }
                    else if (getDriverID != null && getPassword.length == 256) {
                        hashPassword = getPassword;
                    }
                    else {

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


                var driver = {
                    DriverID: $('#driverID').val(),
                    CompanyID: $('#driverCompany').val(),
                    Name: $('#driverNameEN').val(),
                    Password: hashPassword,
                    Email: $('#driverEmailEN').val(),        
                    Address: $('#driverAddressEN').val(),
                    Phone: $('#driverPhoneEN').val(),
                    DateOfBirth: birthday,
                    Remarks: $('#driverRemarksEN').val()
                };

                var apiDriver = 'http://117.120.7.119/spwebapi/api/duplicatedriver?Name=' + driver.Name;

                if (driver.DriverID == 'undefined' || driver.DriverID == null || driver.DriverID == 0 || driver.DriverID != getDriverID) {

                    $.getJSON(apiDriver, function (data) {

                        if (data.length == 1)
                        {
                            alert(titlePhoneUsed);
                        }
                        else
                        {
                            $.ajax({
                                url: "http://117.120.7.119/spwebapi/api/driverinfo",
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

                    //Check Duplicate Driver
                    $.getJSON(apiDriver, function (data) {

                        if (data.length == 1)
                        {
                            $.each(data, function (index, item) {

                                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                                    if (row.Name == item.Name)
                                    {
                                        updateDrivers();
                                    }
                                    else
                                    {
                                        alert('Phone User had been used!');
                                    }

                                });

                            });
                        }
                        else
                        {
                            updateDrivers();
                        }
                    });

                    function updateDrivers()
                    {
                        var updateDriver = 'http://117.120.7.119/spwebapi/api/driverinfo?id=' + driver.DriverID;

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

            }


            else {
                $.niftyNoty({
                    type: 'danger',
                    icon: 'fa fa-minus',
                    message: titleCancel,
                    container: 'floating',
                    timer: 3000
                });
            };

        });


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

                var url = 'http://117.120.7.119/spwebapi/api/driverinfo';
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
                    url: "http://117.120.7.119/spwebapi/api/fileupload/uploadfile",
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
                        url: "http://117.120.7.119/spwebapi/api/driverinfo",
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
                        }
                    });
                }

                else {


                    var updateDriver = 'http://117.120.7.119/spwebapi/api/driverinfo?id=' + driver.DriverID;

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
    $('#driver-confirm-delete').on('click', function () {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });

        //bootbox.confirm("Are you sure you wish to delete reseller?", function (result) {
        bootbox.confirm("<div style='color:black'>คุณแน่ใจหรือว่า ต้องการลบ บริษัท ?</div>", function (result) {
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

                    var driver = JSON.stringify({ 'DriverID': row.DriverID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/driverinfo/' + row.DriverID;

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
                    message: 'ลบ ยกเลิก',
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });
    $('#driver-confirm-deleteEN').on('click', function () {

        if (getSessionstorageValueLanguage == "en") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "en",


            });
        }
        else if (getSessionstorageValueLanguage == "th") {
            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "th",


            });
        }
        else if (getSessionstorageValueLanguage == "vn") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "vi",


            });
        }
        else if (getSessionstorageValueLanguage == "id") {

            bootbox.setDefaults({
                /**
                 * @optional String
                 * @default: en
                 * which locale settings to use to translate the three
                 * standard button labels: OK, CONFIRM, CANCEL
                 */
                locale: "id",


            });
        }
        //bootbox.confirm("Are you sure you wish to delete reseller?", function (result) {
        bootbox.confirm("<div style='color:black'>" + titleAreYouSureDelete + "</div>", function (result) {
            if (result) {
                window.location.reload(true);
                $.niftyNoty({
                    type: 'success',
                    icon: 'fa fa-check',
                    //message: 'Deleted Successfully',
                    message: titleDeleteSuccess,
                    container: 'floating',
                    timer: 3000
                });


                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    var driver = JSON.stringify({ 'DriverID': row.DriverID });
                    var WebAPI = 'http://117.120.7.119/spwebapi/api/driverinfo/' + row.DriverID;

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
                    message: titleDeleteCancel,
                    container: 'floating',
                    timer: 3000
                });
            };

        });
    });


    // =================================================================
    // Pause
    $('#pauseAnimate').on('click', function () {

        $.niftyNoty({
            type: 'warning',
            icon: 'fa fa-pause',
            message: 'หยุด',
            container: 'floating',
            timer: 3000
        });

    });
    $('#pauseAnimateEN').on('click', function () {

        $.niftyNoty({
            type: 'warning',
            icon: 'fa fa-pause',
            message: 'Pause',
            container: 'floating',
            timer: 3000
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

                var url = 'http://117.120.7.119/spwebapi/api/userinfo';
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


                var updateUser = 'http://117.120.7.119/spwebapi/api/userinfo?id=' + user.UserID;

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
                    }
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

                var url = 'http://117.120.7.119/spwebapi/api/userinfo';
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


                var updateProfile = 'http://117.120.7.119/spwebapi/api/userinfo?id=' + profile.UserID;

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
                    }
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
    
    //Submit Scheduled Jobs
    $('#submit-job').on('click', function () {

        var getTimestamp = $("#date").val();
        var dateFormat = "DD-MMM-YYYY"; //DD-MMM-YYYY
        var convertTimestamp = moment(getTimestamp, dateFormat);

        var validateTimestamp = moment(getTimestamp, dateFormat).isValid();
        var timestamp = moment(convertTimestamp).format(dateFormat);
        var checkCase = $('#case').val();
        // Get today's date
        var todaysDate = moment().format('DD-MMM-YYYY');

        if (todaysDate > timestamp) {
            alert(titleInvalidDate);
        }
        else {
            if (validateTimestamp == true) {
                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "en",


                    });

                    if (row.Flag == 1 || row.Flag == 2) {
                        bootbox.confirm("<div style='color:black'>Are you sure you wish to edit a job?</div>", function (result) {

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

                                var url = 'http://117.120.7.119/spwebapi/api/jobinfo';
                                var xhr = createCORSRequest('GET', url);
                                xhr.send();
                                if (!xhr) {
                                    throw new Error('CORS not supported');
                                }


                                var getJobID = $('#jobid').val();
                                var getAmount = $('#amount').val();
                                var finalAmount = getAmount.replace(/\D/g, '');

                                var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
                                var getTimestamp = $("#date").val();
                                var convertTimestamp = moment(getTimestamp, dateFormat);
                                var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);


                                var driver = {
                                    Name: $('#driver').val(),
                                }


                                if (row.JobStatus == "In Progress" || row.JobStatus == "Job Edited") {
                                    var jobEdit = {
                                        JobID: $('#jobid').val(),
                                        Timestamp: timestamp,
                                        RxTime: $('#date').val(),
                                        Amount: finalAmount,
                                        Caller: $('#caller').val(),
                                        Phone: $('#phone').val(),
                                        Unit: $('#unit').val(),
                                        Bed: 0,
                                        Origin: $('#origin').val(),
                                        Destination: $('#destination').val(),
                                        Accessories: sessionStorage.getItem('setSessionstorageValueAccessories'),
                                        Remarks: $('#remarks').val(),
                                        Patient: $('#patient').val(),
                                        Payment: $('#payment').val(),
                                        Trip: $('#trip').val(),
                                        Receipt: "",
                                        Flag: 1,
                                        JobNumber: $('#case').val(),
                                        JobStatus: "Job Edited",
                                        Agent: sessionStorage.getItem('setSessionstorageValueUser'),
                                        Company: sessionStorage.getItem('setSessionstorageValueCompany'),
                                        AssetCompanyID: sessionStorage.getItem('setSessionstorageValueCompanyID'),
                                        AssetResellerID: sessionStorage.getItem('setSessionstorageValueUserResellerID'),
                                        JobUser: $('#driver').val(),
                                        JobType: "Normal",
                                        AssetID: $('#jobAssets').val(),
										PIC: $('#pic').val(),
										Postal: $('#postal').val(),
										CompanyDestination: $('#company-destination').val()
                                    };

                                    var patient = {
                                        PatientID: $('#patientid').val(),
                                        Name: $('#patient').val(),
                                        Remarks: $('#remarks').val(),
                                        Remarks2: $('#patientRemarks').val(),
                                        CallerName: $('#caller').val(),
                                        CallerPhone: $('#phone').val(),
                                        Unit: $('#unit').val(),
                                        Address: $('#origin').val(),
                                        DialysisCentre: $('#destination').val(),
                                        CompanyID: sessionStorage.getItem('setSessionstorageValueCompanyID'),
                                        ResellerID: sessionStorage.getItem('setSessionstorageValueUserResellerID'),
                                        TreatmentDay1: $('#treatmentDay1').val(),
                                        TreatmentDay2: $('#treatmentDay2').val(),
                                        TreatmentDay3: $('#treatmentDay3').val(),
                                    }

                                    var updateJob = 'http://117.120.7.119/spwebapi/api/jobinfo?id=' + jobEdit.JobID;

                                    $.ajax({
                                        url: updateJob,
                                        type: "PUT",
                                        data: JSON.stringify(jobEdit),
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
                                        success: function (jobEdit) {
                                            console.log(jobEdit);
                                            clearJobForms();
                                            $('#TableFormNew').modal('hide');
                                            $('#jobs-editable').bootstrapTable('refresh');
                                            //window.location.reload(true);
                                        }
                                    });

                                }
                                else if (row.JobStatus == "Scheduled" || row.JobStatus == "Scheduled In Progress" || row.JobStatus == "Scheduled Edited") {

                                    //Get Asset
                                    $.ajax({
                                        url: "http://117.120.7.119/spwebapi/api/checkdriver",
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
                                            var asset_id = driver.AssetID;
                                            var jobStatus;
                                            if (asset_id > 0) {
                                                jobStatus = "Scheduled Edited";
                                            }
                                            else if (asset_id == 0) {
                                                jobStatus = "Scheduled";
                                            }

                                            var getDriverPhone = driver.Phone;
                                            if (getDriverPhone != "") {
                                                sessionStorage.setItem("setSessionstorageValueDriverPhone", getDriverPhone);
                                            }
                                            else {
                                                sessionStorage.setItem("setSessionstorageValueDriverPhone", 0);
                                            }

                                            var jobEdit = {
                                                JobID: $('#jobid').val(),
                                                Timestamp: timestamp,
                                                RxTime: $('#date').val(),
                                                Amount: finalAmount,
                                                Caller: $('#caller').val(),
                                                Phone: $('#phone').val(),
                                                Unit: $('#unit').val(),
                                                Bed: 0,
                                                Origin: $('#origin').val(),
                                                Destination: $('#destination').val(),
                                                Accessories: sessionStorage.getItem('setSessionstorageValueAccessories'),
                                                Remarks: $('#remarks').val(),
                                                Patient: $('#patient').val(),
                                                Payment: $('#payment').val(),
                                                Trip: $('#trip').val(),
                                                Receipt: "",
                                                Flag: 1,
                                                JobNumber: $('#case').val(),
                                                JobStatus: jobStatus,
                                                Agent: sessionStorage.getItem('setSessionstorageValueUser'),
                                                Company: sessionStorage.getItem('setSessionstorageValueCompany'),
                                                AssetCompanyID: sessionStorage.getItem('setSessionstorageValueCompanyID'),
                                                AssetResellerID: sessionStorage.getItem('setSessionstorageValueUserResellerID'),
                                                JobUser: $('#driver').val(),
                                                JobType: "Scheduled",
                                                AssetID: asset_id,
												PIC: $('#pic').val(),
												Postal: $('#postal').val(),
												CompanyDestination: $('#company-destination').val()
                                            };

                                            var updateJob = 'http://117.120.7.119/spwebapi/api/jobinfo?id=' + jobEdit.JobID;

                                            $.ajax({
                                                url: updateJob,
                                                type: "PUT",
                                                data: JSON.stringify(jobEdit),
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
                                                success: function (jobEdit) {
                                                    console.log(jobEdit);
                                                    clearJobForms();
                                                    $('#TableFormNew').modal('hide');
                                                    $('#jobs-editable').bootstrapTable('refresh');
                                                    //window.location.reload(true);
                                                }
                                            });
                                        }
                                    });
                                }

                            }


                            else {
                                $.niftyNoty({
                                    type: 'danger',
                                    icon: 'fa fa-minus',
                                    message: titleCancel,
                                    container: 'floating',
                                    timer: 3000
                                });
                            };

                        });
                    }
                    else {
                        alert('Job cannot be edited!');
                    }


                });
            }
            else {
                alert('Invalid Date');
            }

        }


    });

    $('#submit-jobEN').on('click', function () {

        var getTimestamp = $("#date").val();
        var dateFormat = "DD-MMM-YYYY"; //DD-MMM-YYYY
        var convertTimestamp = moment(getTimestamp, dateFormat);

        var validateTimestamp = moment(getTimestamp, dateFormat).isValid();
        var timestamp = moment(convertTimestamp).format(dateFormat);
        var checkCase = $('#case').val();
        // Get today's date
        var todaysDate = moment().format('DD-MMM-YYYY');
        var getAddress = $('#destination').val();
        if (todaysDate > timestamp) {
            alert(titleInvalidDate);
        }
        else {
            if (validateTimestamp == true)
            {
                if (checkCase.substring(3, 15) == "Invalid date")
                {
                    alert(titleInvalidJobNumber);
                }
                else
                {
                    if (getAddress == "")
                    {
                        if (getSessionstorageValueLanguage == "en") alert('Address must not be empty');
                        else if (getSessionstorageValueLanguage == "th") alert('ที่อยู่ต้องไม่ว่างเปล่า');
                        else if (getSessionstorageValueLanguage == "vn") alert('Địa chỉ không được để trống');
                        else if (getSessionstorageValueLanguage == "id") alert('Alamat tidak boleh kosong');
                    }
                    else
                    {
                        //action
                        if (getSessionstorageValueLanguage == "en") {
                            bootbox.setDefaults({
                                /**
                                 * @optional String
                                 * @default: en
                                 * which locale settings to use to translate the three
                                 * standard button labels: OK, CONFIRM, CANCEL
                                 */
                                locale: "en",


                            });
                        }
                        else if (getSessionstorageValueLanguage == "th") {
                            bootbox.setDefaults({
                                /**
                                 * @optional String
                                 * @default: en
                                 * which locale settings to use to translate the three
                                 * standard button labels: OK, CONFIRM, CANCEL
                                 */
                                locale: "th",


                            });
                        }
                        else if (getSessionstorageValueLanguage == "vn") {

                            bootbox.setDefaults({
                                /**
                                 * @optional String
                                 * @default: en
                                 * which locale settings to use to translate the three
                                 * standard button labels: OK, CONFIRM, CANCEL
                                 */
                                locale: "vi",


                            });
                        }
                        else if (getSessionstorageValueLanguage == "id") {

                            bootbox.setDefaults({
                                /**
                                 * @optional String
                                 * @default: en
                                 * which locale settings to use to translate the three
                                 * standard button labels: OK, CONFIRM, CANCEL
                                 */
                                locale: "id",


                            });
                        }

                        bootbox.confirm("<div style='color:black'>" + titleAddJob + "</div>", function (result) {

                            if (result) {

                                $.niftyNoty({
                                    type: 'success',
                                    icon: 'fa fa-check',
                                    message: titleSuccess,
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

                                var url = 'http://117.120.7.119/spwebapi/api/jobinfo';
                                var xhr = createCORSRequest('GET', url);
                                xhr.send();
                                if (!xhr) {
                                    throw new Error('CORS not supported');
                                }


                                var getJobID = $('#jobid').val();
                                var getAmount = $('#amount').val();
                                var finalAmount = getAmount.replace(/\D/g, '');

                                var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
                                var getTimestamp = $("#date").val();
                                var convertTimestamp = moment(getTimestamp, dateFormat);
                                var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);

                                //Reverse Geocode
                                var destination = $('#destination').val();


                                var driver = {
                                    Name: $('#driver').val(),
                                }

                                //Get Asset
                                $.ajax({
                                    url: "http://117.120.7.119/spwebapi/api/checkdriver",
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
                                        var asset_id = driver.AssetID;
                                        var getDriverPhone = driver.Phone;
                                        if (getDriverPhone != "") {
                                            sessionStorage.setItem("setSessionstorageValueDriverPhone", getDriverPhone);
                                        }
                                        else {
                                            sessionStorage.setItem("setSessionstorageValueDriverPhone", 0);
                                        }


                                        var job = {
                                            JobID: $('#jobid').val(),
                                            Timestamp: timestamp,
                                            RxTime: $('#date').val(),
                                            Amount: finalAmount,
                                            PIC: $('#pic').val(),
                                            Phone: $('#phone').val(),
                                            Unit: $('#unit').val(),
                                            Destination: destination,
                                            Remarks: $('#remarks').val(),
                                            Remarks2: $('#phoneuser-remarks').val(),
                                            Receipt: "",
                                            Flag: 1,
                                            JobNumber: $('#case').val(),
                                            JobStatus: "Scheduled",
                                            Agent: sessionStorage.getItem('setSessionstorageValueUser'),
                                            Company: sessionStorage.getItem('setSessionstorageValueCompany'),
                                            AssetCompanyID: sessionStorage.getItem('setSessionstorageValueCompanyID'),
                                            AssetResellerID: sessionStorage.getItem('setSessionstorageValueUserResellerID'),
                                            JobUser: $('#driver').val(),
                                            JobType: "Scheduled",
                                            AssetID: asset_id,
                                            Postal: $('#postal').val(),
                                            CompanyDestination: $('#company-destination').val()
                                        };

                                        //alert(job.AssetID);

                                        //Save/Edit Jobs
                                        if (job.JobID == 'undefined' || job.JobID == null || job.JobID == 0 || job.JobID != getJobID) {

                                            var apiJobNumber = 'http://117.120.7.119/spwebapi/api/searchjob?JobNumber=' + job.JobNumber;

                                            //Check Duplicate Job Number
                                            $.getJSON(apiJobNumber, function (data) {

                                                if (data.length == 1) {
                                                    alert(titleJobNumberUsed);

                                                }
                                                else {
                                                    //Add Scheduled Job
                                                    $.ajax({
                                                        url: "http://117.120.7.119/spwebapi/api/jobinfo",
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
                                                            sendAlert();
                                                            clearJobForms();
                                                            generateJobNumber();
                                                            $('#date').val(moment().format('D-MMM-YYYY, HH:mm'));
                                                            sessionStorage.removeItem("setSessionstorageValueScheduledJobLocationFrom");
                                                            sessionStorage.removeItem("setSessionstorageValueScheduledJobLocationTo");
                                                        }
                                                    });


                                                }

                                            });
                                        }

                                        else {

                                            var updateJob = 'http://117.120.7.119/spwebapi/api/jobinfo?id=' + job.JobID;

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
                                                    clearJobForms();
                                                    //window.location.reload(true);
                                                }
                                            });

                                        }



                                    }
                                });

                            }
                            else {
                                $.niftyNoty({
                                    type: 'danger',
                                    icon: 'fa fa-minus',
                                    message: titleCancel,
                                    container: 'floating',
                                    timer: 3000
                                });
                            };

                        });
                    }
                }
            }
            else {
                alert('Invalid Date');
            }
        }
    });

 $('#job-confirm-deleteEN').on('click', function () {

     if (getSessionstorageValueLanguage == "en") {
         bootbox.setDefaults({
             /**
              * @optional String
              * @default: en
              * which locale settings to use to translate the three
              * standard button labels: OK, CONFIRM, CANCEL
              */
             locale: "en",


         });
     }
     else if (getSessionstorageValueLanguage == "th") {
         bootbox.setDefaults({
             /**
              * @optional String
              * @default: en
              * which locale settings to use to translate the three
              * standard button labels: OK, CONFIRM, CANCEL
              */
             locale: "th",


         });
     }
     else if (getSessionstorageValueLanguage == "vn") {

         bootbox.setDefaults({
             /**
              * @optional String
              * @default: en
              * which locale settings to use to translate the three
              * standard button labels: OK, CONFIRM, CANCEL
              */
             locale: "vi",


         });
     }
     else if (getSessionstorageValueLanguage == "id") {

         bootbox.setDefaults({
             /**
              * @optional String
              * @default: en
              * which locale settings to use to translate the three
              * standard button labels: OK, CONFIRM, CANCEL
              */
             locale: "id",


         });
     }

        var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

            var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');
            var Singapore = moment.tz(row.Timestamp, Asia);
            var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, HH:mm:ss');

            var driver = {
                Name: row.JobDriver,
            }

            //Filter delete job
            if (row.Flag == 0 ||row.Flag == 1 || row.Flag == 2)
            {               
                bootbox.confirm("<div style='color:black'>" + titleAreYouSureDelete + "</div>", function (result) {
                    if (result) {

                        $.niftyNoty({
                            type: 'success',
                            icon: 'fa fa-check',
                            //message: 'Deleted Successfully',
                            message: titleDeleteSuccess,
                            container: 'floating',
                            timer: 3000
                        });


                            var job = JSON.stringify({ 'JobID': row.JobID });
                            var WebAPI = 'http://117.120.7.119/spwebapi/api/jobinfo/' + row.JobID;

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

                                    if (row.Flag == 1 || row.Flag == 2)
                                    {
                                        //Get Asset
                                        $.ajax({
                                            url: "http://117.120.7.119/spwebapi/api/checkdriver",
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
                                                var asset_id = driver.AssetID;
                                                var getDriverPhone;

                                                if (getDriverPhone != "") {
                                                    getDriverPhone = driver.Phone;
                                                }
                                                else {
                                                    getDriverPhone = 0;
                                                }
                                                sendCancelAlert(row.Patient, row.Origin, row.Destination, timestamp, row.AssetID, row.CompanyID, row.JobNumber, getDriverPhone);

                                            }
                                        });


                                    }

                                    $('#jobs-editable').bootstrapTable('refresh');
                                }
                            });
                            return row.JobID
   
                    }


                    else {
                        $.niftyNoty({
                            type: 'danger',
                            icon: 'fa fa-minus',
                            message: titleDeleteCancel,
                            container: 'floating',
                            timer: 3000
                        });
                    };

                });

            }
            else
            {
                alert(titleJobCannotDelete);
            }
        });

        $table.bootstrapTable('remove', {
            field: 'JobID',
            values: ids
        });
        $remove.prop('disabled', true);


    });




    // =================================================================

    //Submit Jobs Call center

    $('#submit-call').on('click', function () {

	
        var getTimestamp = $("#jobTime").val();
        var dateFormat = "DD-MMM-YYYY"; //DD-MMM-YYYY
        var convertTimestamp = moment(getTimestamp, dateFormat);

        var validateTimestamp = moment(getTimestamp, dateFormat).isValid();
        var timestamp = moment(convertTimestamp).format(dateFormat);
        // Get today's date
        var todaysDate = moment().format('DD-MMM-YYYY');
		
		if (validateTimestamp == true)
        {
            if(timestamp < todaysDate){
                alert("Invalid Date Selected");
            }else{
                 //action
                if (getSessionstorageValueLanguage == "en") {
                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "en",


                    });
                }
                else if (getSessionstorageValueLanguage == "th")
                {
                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "th",


                    });
                }
                else if (getSessionstorageValueLanguage == "vn") {

                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "vi",


                    });
                }
                else if (getSessionstorageValueLanguage == "id") {

                    bootbox.setDefaults({
                        /**
                         * @optional String
                         * @default: en
                         * which locale settings to use to translate the three
                         * standard button labels: OK, CONFIRM, CANCEL
                         */
                        locale: "id",


                    });
                }


                if ($('#jobPostal').val().length == 6)
                {
                    bootbox.confirm("<div style='color:black'>" + titleAreYouSure + "</div>", function (result) {

                        if (result) {

                            $.niftyNoty({
                                type: 'success',
                                icon: 'fa fa-check',
                                message: titleSuccess,
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

                            var url = 'http://117.120.7.119/spwebapi/api/jobinfo';
                            var xhr = createCORSRequest('GET', url);
                            xhr.send();
                            if (!xhr) {
                                throw new Error('CORS not supported');
                            }

                            var dateFormat = "D-MMM-YYYY, hh:mm:ss A";
                            var getTimestamp = $("#jobTime").val();
                            var convertTimestamp = moment(getTimestamp, dateFormat);
                            var timestamp = moment(convertTimestamp).subtract('hours', 8).format(dateFormat);

                            var getJobNumber = $("#reference").val();
                            var getJobID = $('#jobid').val();
                            var getCompanyName = $("#companyName").val();
                            var getJobDestination = $("#jobDestination").val();
                            var getJobPostal = $("#jobPostal").val();
                            var getJobUnit = $("#jobUnit").val();
                            var getJobPIC = $("#jobPIC").val();
                            var getJobContactNumber = $("#jobContactNumber").val();
                            var getJobDate = timestamp;
                            var getJobCharges = $("#jobCharges").val();
                            var getCustomerEmail = $("#customerEmail").val();
                            var getJobSite = $("#jobSite").val();
                            var getJobTechnician = $("#jobTechnician").val();
                            var getJobRemarks = $("#jobRemarks").val();
                            var getJobAssetID;

                            var checkAssetID = 'http://track-asia.com/spwebapi/api/driverinfo/' + getJobTechnician;
                            $.ajax({
                                url: checkAssetID,
                                type: 'GET',
                                async: false,
                                cache: false,
                                dataType: 'json',
                                success: function (json) {
                                    console.log(JSON.stringify(json));

                                    if (json.AssetID == '') {
                                        getJobAssetID = 0;
                                    } else {
                                        getJobAssetID = json.AssetID;
                                    }

                                },
                                error: function (XMLHttpRequest, textStatus, errorThrown) {

                                }
                            });

                            if (getJobNumber == "" || getJobNumber == null || getJobNumber == "undefined") {
                                //populate Job Number
                                var date = new Date();
                                var todaydate = date.getDate();
                                var todaymon = date.getMonth() + 1;
                                var todayyear = date.getFullYear();
                                //pull the last two digits of the year
                                todayyear = todayyear.toString().substr(2, 2);

                                var q = todayyear;
                                if (todaymon <= 9) {
                                    var y = "0" + todaymon;
                                }
                                else
                                    var y = todaymon;

                                if (todaydate <= 9) {
                                    var z = "0" + todaydate;
                                }
                                else
                                    var z = todaydate;


                                function randomString() {
                                    var chars = "0123456789";
                                    var string_length = 3;
                                    var randomstring = '';
                                    for (var i = 0; i < string_length; i++) {
                                        var rnum = Math.floor(Math.random() * chars.length);
                                        randomstring += chars.substring(rnum, rnum + 1);
                                    }

                                    return randomstring;
                                }

                                getJobNumber = "JN-" + z + y + q + "-" + randomString();
                            }

                            var job = {
                                JobID: $('#jobid').val(),
                                Company: getCompanyName,
                                Timestamp: getJobDate,
                                AssetCompany: sessionStorage.getItem('setSessionstorageValueCompany'),
                                AssetCompanyID: sessionStorage.getItem('setSessionstorageValueCompanyID'),
                                AssetResellerID: sessionStorage.getItem('setSessionstorageValueUserResellerID'),
                                AssetID: getJobAssetID,
                                RxTime: moment().format(),
                                JobNumber: getJobNumber,
                                Amount: getJobCharges,
                                PIC: getJobPIC,
                                Unit: getJobUnit,
                                Phone: getJobContactNumber,
                                Destination: getJobDestination,
                                CusEmail: getCustomerEmail,
                                Site: getJobSite,
                                Flag: 1,
                                Receipt: null,
                                UserID: sessionStorage.getItem('setSessionstorageValueUserID'),
                                DriverID: getJobTechnician,
                                Remarks: getJobRemarks,
                                Postal: getJobPostal,
                                JobAccepted: null,
                                JobCompleted: null,
                            };

                            sessionStorage.setItem("setSessionstorageValueJobNumber", job.JobNumber);

                            //alert(JSON.stringify(job));
                            if (job.JobID == 'undefined' || job.JobID == null || job.JobID == 0 || job.JobID != getJobID) {

                                var apiJobNumber = 'http://117.120.7.119/spwebapi/api/searchjob?JobNumber=' + job.JobNumber;

                                //Check Duplicate Job Number
                                $.getJSON(apiJobNumber, function (data) {

                                    if (data.length == 1) {
                                        alert(titleJobNumberUsed);
                                    }
                                    else {
                                        $.ajax({
                                            url: "http://117.120.7.119/spwebapi/api/jobinfo",
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
                                                generateJobNumber();
                                                reloadJobsCreated();
                                                sessionStorage.removeItem('setSessionstorageValueAvailableAmbulance');
                                                $('#jobTime').val(moment().format('D-MMM-YYYY, HH:mm'));
                                                //window.location.reload(true);
                                                var total_pest = $('#pestsTreatment').bootstrapTable('getData').length;
                                                console.log(total_pest);
                                                var table = $("#pestsTreatment tbody");
                                                table.find('tr').each(function (i) {
                                                    var $tds = $(this).find('td'),
                                                            itemNo = $tds.eq(1).text()
                                                    pests = $tds.eq(2).text(),
                                                    treatments = $tds.eq(3).text()

                                                    //console.log(treatments);
                                                    var pests = {
                                                        JobID: job.JobID,
                                                        ItemNo: itemNo,
                                                        PestDesc: pests,
                                                        TreatmentDesc: treatments,
                                                    }

                                                    $.ajax({
                                                        url: "http://117.120.7.119/spwebapi/api/pesttreatmentinfo",
                                                        type: "POST",
                                                        data: JSON.stringify(pests),
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
                                                        permissions: ["https://track-asia.com"],
                                                        success: function (pests) {
                                                            console.log(pests);


                                                        }
                                                    });

                                                    if (i === total_pest - 1) {

                                                        $('#pestsTreatment').bootstrapTable('removeAll');
                                                    }
                                                });

                                            }
                                        });
                                    }

                                });


                            }

                            else {

                                var job = {
                                    JobID: $('#jobid').val(),
                                    Company: getCompanyName,
                                    Timestamp: getJobDate,
                                    AssetCompany: sessionStorage.getItem('setSessionstorageValueCompany'),
                                    AssetCompanyID: sessionStorage.getItem('setSessionstorageValueCompanyID'),
                                    AssetResellerID: sessionStorage.getItem('setSessionstorageValueUserResellerID'),
                                    AssetID: getJobAssetID,
                                    RxTime: moment().format(),
                                    JobNumber: getJobNumber,
                                    Amount: getJobCharges,
                                    PIC: getJobPIC,
                                    Unit: getJobUnit,
                                    Phone: getJobContactNumber,
                                    Destination: getJobDestination,
                                    CusEmail: getCustomerEmail,
                                    Site: getJobSite,
                                    Flag: 6,
                                    Receipt: null,
                                    UserID: sessionStorage.getItem('setSessionstorageValueUserID'),
                                    DriverID: getJobTechnician,
                                    Remarks: getJobRemarks,
                                    Postal: getJobPostal,
                                    JobAccepted: null,
                                    JobCompleted: null,
                                };

                                var updateJob = 'http://117.120.7.119/spwebapi/api/jobinfo?id=' + job.JobID;

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
                                        //sendCancelAlert();
                                        clearJobForms();
                                        reloadJobsCreated();
                                        generateJobNumber();
                                        sessionStorage.removeItem('setSessionstorageValueAvailableAmbulance');
                                        $('#date').val(moment().format('D-MMM-YYYY, HH:mm'));

                                        if (getSessionstorageValueCompanyID == 4) {
                                            $('.agentRemarks').hide();
                                            $('.phoneuserRemarks').hide();
                                            $(".jobsCreatedTable").css('height', '157px');
                                        }

                                        var jobID = { JobID: getJobID };
                                        var deletePestTreatment = 'http://117.120.7.119/spwebapi/api/deletepesttreatment';
                                        //console.log(deletePestTreatment);

                                        $.ajax({
                                            url: deletePestTreatment,
                                            type: "POST",
                                            data: JSON.stringify(jobID),
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
                                            success: function (deletePestTreatment) {
                                                console.log(deletePestTreatment);

                                                var total_pest = $('#pestsTreatment').bootstrapTable('getData').length;
                                                //console.log(total_pest);
                                                var table = $("#pestsTreatment tbody");
                                                table.find('tr').each(function (i) {
                                                    var $tds = $(this).find('td'),
                                                            itemNo = $tds.eq(1).text()
                                                    pests = $tds.eq(2).text(),
                                                    treatments = $tds.eq(3).text()

                                                    //console.log(treatments);
                                                    var pests = {
                                                        JobID: getJobID,
                                                        ItemNo: itemNo,
                                                        PestDesc: pests,
                                                        TreatmentDesc: treatments,
                                                    }

                                                    $.ajax({
                                                        url: "http://117.120.7.119/spwebapi/api/pesttreatmentinfo",
                                                        type: "POST",
                                                        data: JSON.stringify(pests),
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
                                                        permissions: ["https://track-asia.com"],
                                                        success: function (pests) {
                                                        }
                                                    });

                                                    if (i === total_pest - 1) {

                                                        //console.log('end');
                                                        $('#pestsTreatment').bootstrapTable('removeAll');
                                                    }


                                                });

                                            }
                                        });




                                    }
                                });


                            }

                        }


                        else {
                            $.niftyNoty({
                                type: 'danger',
                                icon: 'fa fa-minus',
                                message: titleCancel,
                                container: 'floating',
                                timer: 3000
                            });
                        };

                    });
                }
                else
                {
                    alert('Postal Code is empty or not valid');
                }

        
            }
            

        }
		
    });
})

$('#submit-itemEN').on('click', function () {


    if (getSessionstorageValueLanguage == "en") {
        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });
    }
    else if (getSessionstorageValueLanguage == "th") {
        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });
    }
    else if (getSessionstorageValueLanguage == "vn") {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "vi",


        });
    }
    else if (getSessionstorageValueLanguage == "id") {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "id",


        });
    }

    bootbox.confirm("<div style='color:black'>" + titleAreYouSure + "</div>", function (result) {

        if (result) {
            
            $.niftyNoty({
                type: 'success',
                icon: 'fa fa-check',
                message: titleSuccess,
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

            var url = 'http://117.120.7.119/spwebapi/api/inventoryinfo';
            var xhr = createCORSRequest('GET', url);
            xhr.send();
            if (!xhr) {
                throw new Error('CORS not supported');
            }

            var getInventoryID = $('#inventoryID').val();
            var getItemName = $('#itemName').val();
            var getItemReference = $('#itemReference').val();
            var getItemQuantity = $('#itemQuantity').val();
            var getItemPrice = $('#itemPrice').val();
            var getItemUnit = $('#itemUnit').val();
            var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
            var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');

            var apiAsset = 'https://track-asia.com/spwebapi/api/duplicateinventory?Name=' + getItemName + "&CompanyID=" + getSessionstorageValueCompanyID;

            if (getInventoryID == 'undefined' || getInventoryID == null || getInventoryID == 0 || getInventoryID != getInventoryID || getInventoryID == "") {

                //Check Duplicate Asset
                $.getJSON(apiAsset, function (data) {

                    if (data.length == 1)
                    {
                        alert('Item already Existed in Inventory');
                        clearInputFields();
                    }
                    else{
                        var inventory = {
                            Name: getItemName,
                            Quantity: getItemQuantity,
                            Reference: getItemReference,
                            Price: getItemPrice,
                            Unit: getItemUnit,
                            CompanyID: getSessionstorageValueCompanyID,
                        };
        
                        $.ajax({
                            url: "https://track-asia.com/spwebapi/api/inventoryinfo",
                            type: "POST",
                            data: JSON.stringify(inventory),
                            crossDomain: true,
                            async:false,
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
                            success: function (inventory) {
                                console.log(inventory)
                                var inventoryHistory = {
                                    InventoryID : inventory.InventoryID,
                                    Name: getItemName,
                                    PreviousQuantity: 0,
                                    Quantity: getItemQuantity,
                                    TotalQuantity: getItemQuantity,
                                    Timestamp: moment().format(),
                                    RxTime: moment().format(),
                                    StockType: 1,
                                    Reference: getItemReference,
                                    Platform: 1,
                                    CompanyID: getSessionstorageValueCompanyID,
                                    UserID: getSessionstorageValueUserID,
                                };

                                $.ajax({
                                    url: "https://track-asia.com/spwebapi/api/inventoryhistoryinfo",
                                    type: "POST",
                                    data: JSON.stringify(inventoryHistory),
                                    crossDomain: true,
                                    async:false,
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
                                    success: function (inventoryHistory) {
                                        console.log(inventoryHistory);
                                        clearInputFields();
                                        window.location.reload(true);

                                     }
                                });
                            }
                        });
                    }

                });
                
            }
            else {

                var updateInventory = 'https://track-asia.com/spwebapi/api/inventoryinfo?id=' + getInventoryID;
                var getStockTypeQuantity = $('#itemFinalQuantity').val();
                var getStockType= $('#stockType').find("option:selected").val();    
                var finalQuantity;
                var stockUpdate = '';
                if(getStockTypeQuantity == "" || getStockTypeQuantity == null){
                    var inventory = {
                        InventoyID: getInventoryID,
                        Name: getItemName,
                        Quantity: getItemQuantity,
                        Reference: getItemReference,
                        Price: getItemPrice,
                        Unit: getItemUnit,
                        CompanyID: getSessionstorageValueCompanyID,
                    };
                }else{
                    if(getStockType == 1){
                        stockUpdate = 2;
                        finalQuantity = parseInt(getItemQuantity) + parseInt(getStockTypeQuantity);
    
                    }else if(getStockType == 2){
                        stockUpdate = 3
                        finalQuantity = parseInt(getItemQuantity) - parseInt(getStockTypeQuantity);
                    }
    
                    var inventory = {
                        InventoyID: getInventoryID,
                        Name: getItemName,
                        Quantity: finalQuantity,
                        Reference: getItemReference,
                        Price: getItemPrice,
                        Unit: getItemUnit,
                        CompanyID: getSessionstorageValueCompanyID,
                    };
                }

                $.ajax({
                    url: updateInventory,
                    type: "PUT",
                    async:false,
                    data: JSON.stringify(inventory),
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
                    success: function (inventory) {
                        var inventoryHistory = {
                            InventoryID : getInventoryID,
                            Name: getItemName,
                            PreviousQuantity: getItemQuantity,
                            Quantity: getStockTypeQuantity,
                            TotalQuantity: finalQuantity,
                            Timestamp: moment().format(),
                            RxTime: moment().format(),
                            StockType: stockUpdate,
                            Reference: getItemReference,
                            Platform: 1,
                            CompanyID: getSessionstorageValueCompanyID,
                            UserID: getSessionstorageValueUserID,
                        };

                        $.ajax({
                            url: "https://track-asia.com/spwebapi/api/inventoryhistoryinfo",
                            type: "POST",
                            data: JSON.stringify(inventoryHistory),
                            crossDomain: true,
                            async:false,
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
                            success: function (inventoryHistory) {
                                console.log(inventoryHistory);
                                clearInputFields();
                                window.location.reload(true);

                             }
                        });
                    }
                });
            }

        }


        else {
            $.niftyNoty({
                type: 'danger',
                icon: 'fa fa-minus',
                message: titleCancel,
                container: 'floating',
                timer: 3000
            });
        };

    });


});

$('#inventory-confirm-deleteEN').on('click', function () {

    if (getSessionstorageValueLanguage == "en") {
        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });
    }
    else if (getSessionstorageValueLanguage == "th") {
        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });
    }
    else if (getSessionstorageValueLanguage == "vn") {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "vi",


        });
    }
    else if (getSessionstorageValueLanguage == "id") {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "id",


        });
    }
    //bootbox.confirm("Are you sure you wish to delete reseller?", function (result) {
    bootbox.confirm("<div style='color:black'>" + titleAreYouSureDelete + "</div>", function (result) {
        if (result) {
            
            $.niftyNoty({
                type: 'success',
                icon: 'fa fa-check',
                //message: 'Deleted Successfully',
                message: titleDeleteSuccess,
                container: 'floating',
                timer: 3000
            });



            var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
                
                var inventoryHistory = {
                    InventoryID : row.InventoryID,
                    Name: row.Name,
                    PreviousQuantity: row.Quantity,
                    Quantity: 0,
                    TotalQuantity: row.Quantity,
                    Timestamp: moment().format(),
                    RxTime: moment().format(),
                    StockType: 4,
                    Reference: row.Reference,
                    Platform: 1,
                    CompanyID: getSessionstorageValueCompanyID,
                    UserID: getSessionstorageValueUserID,
                };


                $.ajax({
                    url: "https://track-asia.com/spwebapi/api/inventoryhistoryinfo",
                    type: "POST",
                    data: JSON.stringify(inventoryHistory),
                    crossDomain: true,
                    async:false,
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
                    success: function (inventoryHistory) {
                        console.log(inventoryHistory);
                        //clearInputFields();
                        //window.location.reload(true);

                    }});

    
                var inventory = JSON.stringify({ 'InventoryID': row.InventoryID });
                var WebAPI = 'http://117.120.7.119/spwebapi/api/inventoryinfo/' + row.InventoryID;

                
                $.ajax({
                    url: WebAPI,
                    type: "Delete",
                    data: JSON.stringify(inventory),
                    crossDomain: true,
                    async:false,
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
                    success: function (inventory) {
                        console.log(inventory);
                        window.location.reload(true);
                    }
                });


                return row.InventoryID

                
            
            });
            $table.bootstrapTable('remove', {
                field: 'InventoryID',
                values: ids
            });
            $remove.prop('disabled', true);


        }


        else {
            $.niftyNoty({
                type: 'danger',
                icon: 'fa fa-minus',
                //message: 'Delete Canceled',
                message: titleDeleteCancel,
                container: 'floating',
                timer: 3000
            });
        };

    });
});

//===================================================================

$('#submit-maintenance').on('click', function () {

    //action
    if (getSessionstorageValueLanguage == "en") {
        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });
    }
    else if (getSessionstorageValueLanguage == "th") {
        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });
    }
    else if (getSessionstorageValueLanguage == "vn") {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "vi",


        });
    }
    else if (getSessionstorageValueLanguage == "id") {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "id",


        });
    }

    bootbox.confirm("<div style='color:black'>" + titleAreYouSure + "</div>", function (result) {

        if (result) {

            $.niftyNoty({
                type: 'success',
                icon: 'fa fa-check',
                message: titleSuccess,
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

            var url = 'http://track-asia.com/spwebapi/api/maintenanceinfo';
            var xhr = createCORSRequest('GET', url);
            xhr.send();
            if (!xhr) {
                throw new Error('CORS not supported');
            }

            var $table = $('#exceltable');
            var datetimeFormat = "D-MMM-YYYY, hh:mm:ss A";

            //Do action
            var data = $table.bootstrapTable('getData');
            $.each(data, function (index, value) {


                var enumerateDaysBetweenDates = function (startDate, endDate, interval) {
                    var now = startDate, dates = [];

                    var main_num = 1;
                    var main_interval;
                    switch (interval) {
                        case "Daily":
                            main_interval = "days";
                            break;
                        case "Weekly":
                            main_interval = "weeks";
                            break;
                        case "Yearly":
                            main_interval = "years";
                            break;
                        case "Monthly":
                            main_interval = "months";
                            break;
                        case "Quarterly":
                            main_num = 4;
                            main_interval = "months";
                            break;
                        case "Tri-Monthly":
                            main_num = 3;
                            main_interval = "months";
                            break;
                        case "Bi-Monthly":
                            main_num = 15;
                            main_interval = "days";
                            break;
                        default:
                            main_interval = "error";
                            break;
                    }
                    var n = 0;
                    while (now.isSameOrBefore(endDate)) {

                        
                        if (n == 0)
                        {
                            console.log('First Maintenance');
                        } else {
                            if (now < endDate) dates.push(now.format('M/D/YYYY'));
                        }

                        now.add(main_num, main_interval);
                        n++;
                    }

                    return dates;
                };

                var startDate = moment(value.CONTRACT_START);
                var endDate = moment(value.CONTRACT_END);
                var results = enumerateDaysBetweenDates(startDate, endDate, value.MAINTENANCE_INTERVAL);

                var maintenance = {
                    MaintenanceID: "",
                    CompanyID: sessionStorage.getItem('setSessionstorageValueCompanyID'),
                    Timestamp: moment.utc().format(datetimeFormat),
                    RxTime: moment.utc().format(datetimeFormat),
                    Remarks: "",
                    DriverID: 0,
                    UserID: sessionStorage.getItem('setSessionstorageValueUserID'),
                    AssetID: 0,
                    Address: value.ADDRESS,
                    Postal: value.POSTAL,
                    Unit: value.UNIT,
                    PIC: value.PERSON_IN_CHARGE,
                    Phone: value.PHONE,
                    Email: value.EMAIL,
                    Site: value.SITE,
                    ContractStart: value.CONTRACT_START,
                    ContractEnd: value.CONTRACT_END,
                    MaintenanceInterval: value.MAINTENANCE_INTERVAL,
                    NotificationInterval: value.NOTIFICATION_INTERVAL,
                    Remarks: value.REMARKS
                };


                $.ajax({
                    url: "http://track-asia.com/spwebapi/api/maintenanceinfo",
                    type: "POST",
                    data: JSON.stringify(maintenance),
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
                    permissions: ["https://track-asia.com"],
                    success: function (maintenance) {
                        console.log(maintenance);
                        //alert(JSON.stringify(maintenance));

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
                                    default:
                                        notif_interval = 'weeks';
                                }

                                var intervaldates = moment(dates).subtract(notif_interval, arrDates[0]).format('M/D/YYYY');

                                return intervaldates;
                            };

                            var notifInterval = getIntervalDates(results[i], value.NOTIFICATION_INTERVAL);

                            var maintenancejob = {
                                MaintenanceJobID: "",
                                MaintenanceID: maintenance.MaintenanceID,
                                AlertDate: notifInterval,
                                Timestamp: results[i],
                                RxTime: moment.utc().format(datetimeFormat),
                                Flag: 1,
                                JobCancelled: "",
                                CancelRemarks: "",
                                isSent: 1,
                            };

                            $.ajax({
                                url: "http://track-asia.com/spwebapi/api/maintenancejobinfo",
                                type: "POST",
                                data: JSON.stringify(maintenancejob),
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
                                permissions: ["https://track-asia.com"],
                                success: function (maintenancejob) {
                                    console.log(maintenancejob);
                                }
                            });



                        }


                    }
                });


            });


            $('#submit-maintenance').hide();
            $('#exceltable').bootstrapTable('removeAll');
        }


        else {
            $.niftyNoty({
                type: 'danger',
                icon: 'fa fa-minus',
                message: titleCancel,
                container: 'floating',
                timer: 3000
            });
        };

    });


});

$('#jobsCreatedMaintenance-cancel').on('click', function () {

    if (getSessionstorageValueLanguage == "en") {
        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "en",


        });
    }
    else if (getSessionstorageValueLanguage == "th") {
        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "th",


        });
    }
    else if (getSessionstorageValueLanguage == "vn") {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "vi",


        });
    }
    else if (getSessionstorageValueLanguage == "id") {

        bootbox.setDefaults({
            /**
             * @optional String
             * @default: en
             * which locale settings to use to translate the three
             * standard button labels: OK, CONFIRM, CANCEL
             */
            locale: "id",


        });
    }
    //bootbox.confirm("Are you sure you wish to delete reseller?", function (result) {
    bootbox.confirm("<div style='color:black'>" + titleAreYouSureDelete + "</div>", function (result) {
        if (result) {
            window.location.reload(true);
            $.niftyNoty({
                type: 'success',
                icon: 'fa fa-check',
                //message: 'Deleted Successfully',
                message: titleDeleteSuccess,
                container: 'floating',
                timer: 3000
            });


            var ids = $.map($table.bootstrapTable('getSelections'), function (row) {

                var maintenance = JSON.stringify({ 'MaintenanceID': row.MaintenanceID });
                var WebAPI = 'http://117.120.7.119/spwebapi/api/maintenanceinfo/' + row.MaintenanceID;

                $.ajax({
                    url: WebAPI,
                    type: "Delete",
                    data: JSON.stringify(maintenance),
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
                    success: function (inventory) {
                        console.log(inventory);
                    }
                });
                return row.MaintenanceID
            });
            $table.bootstrapTable('remove', {
                field: 'MaintenanceID',
                values: ids
            });
            $('#jobsCreatedMaintenance-cancel').prop('disabled', true);


        }


        else {
            $.niftyNoty({
                type: 'danger',
                icon: 'fa fa-minus',
                //message: 'Delete Canceled',
                message: titleDeleteCancel,
                container: 'floating',
                timer: 3000
            });
        };

    });
});

//===================================================================