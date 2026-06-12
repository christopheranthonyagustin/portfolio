
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');

//Then retrieve
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

// Mobile Reseller
var MobileWebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    MobileWebAPIReseller = 'https://app.track-asia.com/tracksgwebapi/api/resellerinfo';

    $.getJSON(MobileWebAPIReseller, function (data) {
        $.each(data, function (index, item) {

            if (item.ResellerID == "1") {
                $('#mobile-load-reseller').append(
                    $('<option data-icon="fa fa-user-secret fa-lg" selected="selected"></option>').val(item.ResellerID).html(item.Name)

                );
            } else {

                $('#mobile-load-reseller').append(
                    $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)

                );
            }
        });
        var getReseller = $("#mobile-load-reseller").val();
        sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
        $('#mobile-load-reseller').selectpicker('refresh');

    });

} else if (getSessionstorageValueRoleID == 2) {

    MobileWebAPIReseller = 'https://app.track-asia.com/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(MobileWebAPIReseller, function (data) {
        $.each(data, function (index, item) {
            $('#mobile-load-reseller').append(
                $('<option data-icon="fa fa-user-secret fa-lg"></option>').val(item.ResellerID).html(item.Name)
            );
        });
        var getReseller = $("#mobile-load-reseller").val();
        sessionStorage.setItem("setSessionstorageValueAssetReseller", getReseller);
        $('#mobile-load-reseller').selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID >= 3) {
    $('#mobile-load-reseller').remove();
}


//Mobile Company
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {


        $.each(data, function (index, item) {

            if (item.CompanyID == 2) {

                $('#mobile-load-company').append(
                    $('<option data-icon="fa fa-building-o fa-lg" selected="selected"></option>').val(item.CompanyID).html(item.Name)
                );

            } else {

                $('#mobile-load-company').append(
                    $('<option data-icon="fa fa-building-o fa-lg"></option>').val(item.CompanyID).html(item.Name)
                );

            }

        });


        $(".selectpicker").selectpicker('refresh');
    });

} else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {
        $.each(data, function (index, item) {

            $('#mobile-load-company').append(
                $('<option></option>').val(item.CompanyID).html(item.Name)
            );

        });

        $(".selectpicker").selectpicker('refresh');

    });
} else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

        $.each(data, function (index, item) {

            $('#mobile-load-company').append(
                $('<option></option>').val(item.CompanyID).html(item.Name)
            );

        });

        $(".selectpicker").selectpicker('refresh');

    });

}


//Mobile Assets
if (getSessionstorageValueRoleID == 1) {

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=" + '&ResellerID=' + '1' + '&CompanyID=' + '1', function (data) {

        $.each(data, function (index, item) {

            $('#mobile-load-assets').append(
                $('<option></option>').val(item.Name).html(item.Name)
            );
        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {

        $.each(data, function (index, item) {
            $('#mobile-load-assets').append(
                $('<option></option>').val(item.Name).html(item.Name)
            );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#mobile-load-assets').append(
                $('<option></option>').val(item.Name).html(item.Name)
            );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}


$.getJSON("https://app.track-asia.com/tracksgwebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-category').append(
            $('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc)
        );
    });
    $(".selectpicker").selectpicker('refresh');

});

$.getJSON("https://app.track-asia.com/tracksgwebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-categoryEN').append(
            $('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc)
        );
    });
    $(".selectpicker").selectpicker('refresh');

});


//  Format for Vehicle Status Color
// =================================================================
function assetColorStatus(value, row) {

    var assetTimestamp = row.LastPos.Timestamp;
    var timestamp1 = moment.utc(assetTimestamp).local().format("DD MMM YYYY");
    var d = new Date();
    var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
    timestamp2 = Date.parse(timestamp2);
    timestamp1 = Date.parse(timestamp1);

    var labelColor;
    if (value == "MOVE") {
        labelColor = "success";
    } else if (value == "IDLE") {
        labelColor = "warning";
    }
    else if (value == "STOP" && timestamp2 > timestamp1) {
        labelColor = "down";
    }
    else if (value == "STOP") {
        labelColor = "danger";
    }

    var keys = Object.keys(row);

    for (var i = 0; i < keys.length; i++) {
        var val = row[keys[i]];
        // use val

        var Category = "";
        switch (row.Category) {
            case "Car":
                Category = "car";
                break;
            case "Truck":
                Category = "truck";
                break;
            case "Van":
                Category = "van";
                break;
            case "Bus":
                Category = "bus";
                break;
            case "Motorcycle":
                Category = "motorcycle";
                break;
            case "Recovery Veh":
                Category = "truck";
                break;
            case "Lorry":
                Category = "truck";
                break;
            case "10 Footer Lorry":
                Category = "truck";
                break;
            case "14 Footer Lorry":
                Category = "truck";
                break;
            case "Ambulance":
                Category = "ambulance";
                break;

        }

        Category = Category;

    }



    return '<div class="pull-left bord-all badge-' + labelColor + '">' + '<img class="img-square img-xs" src="img/categories/' + Category + '.png">' + '</div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + value + '</div>';
}

//  Format for GPS Status Color
// =================================================================
function gpsStatus(gps, timestamp) {

    var d = new Date();
    var timestamp2 = moment.utc(d).local().format("D-MMM-YYYY");
    var dateEntered = moment(timestamp, 'D-MMM-YYYY').format('D-MMM-YYYY');

    var labelColor;
    if (timestamp2 > dateEntered) {
        labelColor = "down";
    }
    else if (gps >= 2) {
        labelColor = "success";
    }
    else if (gps < 2 && timestamp2 == dateEntered) {
        labelColor = "danger";
    } else {
        labelColor = "down";
    }


    return '<div class="pull-right bord-all badge-' + labelColor + '">' + '<span title="GPS"><img class="img-square img-xs" src="img/categories/gps.png" alt="GPS Status" style="width:16px; height:12px;"></span></div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + gps + '</div>';
}


//  Format for GPRS Status Color
// =================================================================
function gprsStatus(gprs, timestamp) {

    var d = new Date();
    var timestamp2 = moment.utc(d).local().format("D-MMM-YYYY");
    var dateEntered = moment(timestamp, 'D-MMM-YYYY').format('D-MMM-YYYY');

    var labelColor;
    if (timestamp2 > dateEntered) {
        labelColor = "down";
    }
    else if (gprs == 0) {
        labelColor = "success";

    } else if (gprs == 1) {
        labelColor = "warning";
    }
    else if (gprs == 2 && timestamp2 == dateEntered) {
        labelColor = "danger";
    } else {
        labelColor = "down";
    }

    return '<div class="pull-left bord-all badge-' + labelColor + '">' + '<span title="3G"><img class="img-square img-xs" src="img/categories/gprs.png" alt="GPRS Status" style="width:16px; height:12px;"></span></div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + gprs + '</div>';
}

function barLight(barLight, timestamp) {

    var assetTimestamp = timestamp;
    var timestamp1 = moment.utc(assetTimestamp).local().format("DD MMM YYYY");
    var d = new Date();
    var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
    timestamp2 = Date.parse(timestamp2);
    timestamp1 = Date.parse(timestamp1);

    var labelColor;
    if (barLight == 1) {
        labelColor = "success";
    } else if (barLight == 0 && timestamp2 > timestamp1) {
        labelColor = "down";
    } else if (barLight == 0) {
        labelColor = "danger";
    }

    return '<div class="pull-left bord-all badge-' + labelColor + '">' + '<span title="Bar Light"><img class="img-square img-xs" src="img/categories/lightbulb.png" alt="Bar Light Status" style="width:16px; height:12px;"></span></div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + barLight + '</div>';
}


//Filter-Engine

(function (document) {
    'use strict';

    var EngineTableFilter = (function (Arr) {


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
                var selects = document.getElementsByClassName('SelectEngineFilter');
                Arr.forEach.call(selects, function (select) {
                    select.onchange = _onSelectEvent;
                });
            }
        };
    })(Array.prototype);

    document.addEventListener('readystatechange', function () {
        if (document.readyState === 'complete') {
            EngineTableFilter.init();
        }
    });

})(document);


//Filter-No GPS

(function (document) {
    'use strict';

    var NoGPSTableFilter = (function (Arr) {


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
                var selects = document.getElementsByClassName('SelectNoGPSFilter');
                Arr.forEach.call(selects, function (select) {
                    select.onchange = _onSelectEvent;

                });
            }
        };
    })(Array.prototype);

    document.addEventListener('readystatechange', function () {
        if (document.readyState === 'complete') {
            NoGPSTableFilter.init();
        }
    });

})(document);


//Filter-No GPRS

(function (document) {
    'use strict';

    var NoGPRSTableFilter = (function (Arr) {


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
                var selects = document.getElementsByClassName('SelectNoGPRSFilter');
                Arr.forEach.call(selects, function (select) {
                    select.onchange = _onSelectEvent;

                });
            }
        };
    })(Array.prototype);

    document.addEventListener('readystatechange', function () {
        if (document.readyState === 'complete') {
            NoGPRSTableFilter.init();
        }
    });

})(document);


//Filter-Category

(function (document) {
    'use strict';

    var CategoryTableFilter = (function (Arr) {

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
                var selects = document.getElementsByClassName('SelectCategoryFilter');
                Arr.forEach.call(selects, function (select) {
                    select.onchange = _onSelectEvent;

                });
            }
        };
    })(Array.prototype);

    document.addEventListener('readystatechange', function () {
        if (document.readyState === 'complete') {
            CategoryTableFilter.init();
        }
    });

})(document);



//Storage
$(document).ready(function () {

    //Then retrieve
    var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
    var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
    var getSessionstorageValueEmail = sessionStorage.getItem('setSessionstorageValueEmail');
    var getSessionstorageValueName = sessionStorage.getItem('setSessionstorageValueName');
    var getSessionstorageValueRoleDesc = sessionStorage.getItem('setSessionstorageValueRoleDesc');
    var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');

    if (getSessionstorageValueUser == null | getSessionstorageValueUser == "undefined" | getSessionstorageValueUser == "") {

        window.location.href = 'https://track-asia.com/sg/'; //Login URL
        sessionStorage.clear();
        //window.location.href = '/';
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


//OnLoad Version Number
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




//Filter Zone

if (getSessionstorageValueRoleID == 1) {
    var getZone = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + '1' + '&CompanyID=' + '1';

    $.getJSON(getZone, function (data) {
        $.each(data, function (index, item) {
            $('#assetZone').append(
                $('<option></option>').val(item.ZoneID).html(item.Name)
            );
            $('#assetZoneEN').append(
                $('<option></option>').val(item.ZoneID).html(item.Name)
            );

        });

        $('.selectpicker').selectpicker('refresh');
    });

}

else if (getSessionstorageValueRoleID == 2) {
    var getZoneByID = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID;

    $.getJSON(getZoneByID, function (data) {
        $.each(data, function (index, item) {

            if (item.CompanyID == getSessionstorageValueCompanyID) {
                $('#assetZone').append(
                    $('<option></option>').val(item.ZoneID).html(item.Name)
                );
                $('#assetZoneEN').append(
                    $('<option></option>').val(item.ZoneID).html(item.Name)
                );
            }


        });

        $('.selectpicker').selectpicker('refresh');
    });

}

else if (getSessionstorageValueRoleID >= 3) {
    var getZoneByID = 'https://app.track-asia.com/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

    $.getJSON(getZoneByID, function (data) {
        $.each(data, function (index, item) {
            $('#assetZone').append(
                $('<option></option>').val(item.ZoneID).html(item.Name)
            );
            $('#assetZoneEN').append(
                $('<option></option>').val(item.ZoneID).html(item.Name)
            );
        });

        $('.selectpicker').selectpicker('refresh');
    });

}


//Set
//sessionStorage.setItem("setSessionstorageValueEngine", JSON.stringify(objEngine));


//Onload
//document.getElementById("muteAlert").checked = true;

// check height
//alert(screen.height);
// check.width
//screen.width;

