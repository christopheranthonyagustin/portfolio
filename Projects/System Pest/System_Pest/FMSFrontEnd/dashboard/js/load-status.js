
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');

//Then retrieve
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

// Mobile Reseller
var MobileWebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    MobileWebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo';

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

    MobileWebAPIReseller = 'http://117.120.7.119/spwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

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

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?&ResellerID=" + "1", function (data) {


        $.each(data, function (index, item) {

            if (item.CompanyID == 1) {

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

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {
        $.each(data, function (index, item) {
		if (item.CompanyID == getSessionstorageValueCompanyID)
            {
                $('#mobile-load-company').append($('<option selected="selected"></option>').val(item.CompanyID).html(item.Name));
            }
            else
            {
                $('#mobile-load-company').append($('<option></option>').val(item.CompanyID).html(item.Name));
            }

            

        });

        $(".selectpicker").selectpicker('refresh');

    });
} else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://117.120.7.119/spwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + '&ResellerID=' + '1' + '&CompanyID=' + '1', function (data) {

        $.each(data, function (index, item) {

            $('#mobile-load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {

        $.each(data, function (index, item) {
            $('#mobile-load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://117.120.7.119/spwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#mobile-load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}


$.getJSON("http://117.120.7.119/spwebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-category').append(
             $('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc)
         );
    });
    $(".selectpicker").selectpicker('refresh');

});

$.getJSON("http://117.120.7.119/spwebapi/api/categoryinfo", function (data) {
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
    //var timestamp1 = moment.utc(assetTimestamp).local().format("DD MMM YYYY");
    //var d = new Date();
    //var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
    //timestamp2 = Date.parse(timestamp2);
    //timestamp1 = Date.parse(timestamp1);

    var timestamp2 = new Date().getDate();
    var timestamp1 = new Date(assetTimestamp).getDate();

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

            case "Phone":
                Category = "phone";
                break;

        }

        Category = Category;

    }
   


    return '<div class="pull-left bord-all badge-' + labelColor + '">' + '<img class="img-square img-xs" src="img/categories/' + Category + '.png">' + '</div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + value + '</div>';
}


////  Format for GPS Status Color
//// =================================================================
//function gpsStatus(value, row) {

//    var assetTimestamp = row.LastPos.Timestamp;
//    //var timestamp1 = moment.utc(assetTimestamp).local().format("DD MMM YYYY");
//    //var d = new Date();
//    //var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
//    //timestamp2 = Date.parse(timestamp2);
//    //timestamp1 = Date.parse(timestamp1);

//    var timestamp2 = new Date().getDate();
//    var timestamp1 = new Date(assetTimestamp).getDate();

//    var labelColor;
//    if (value >= 2) {
//        labelColor = "success";
//    } else if (value < 2 && timestamp2 > timestamp1) {
//        labelColor = "down";
//    }
//    else if (value < 2) {
//        labelColor = "danger";
//    }


//    return '<div class="pull-right bord-all badge-' + labelColor + '">' + '<span title="GPS"><img class="img-square img-xs" src="img/categories/gps.png" alt="GPS Status" style="width:16px; height:12px;"></span></div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + value + '</div>';
//}


////  Format for GPRS Status Color
//// =================================================================
//function gprsStatus(value, row) {

//    var assetTimestamp = row.LastPos.Timestamp;
//    //var timestamp1 = moment.utc(assetTimestamp).local().format("DD MMM YYYY");
//    //var d = new Date();
//    //var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
//    //timestamp2 = Date.parse(timestamp2);
//    //timestamp1 = Date.parse(timestamp1);

//    var timestamp2 = new Date().getDate();
//    var timestamp1 = new Date(assetTimestamp).getDate();

//    var labelColor;
//    if (value == 0) {
//        labelColor = "success";

//    } else if (value == 1) {
//        labelColor = "warning";
//    }
//    else if (value == 2 && timestamp2 > timestamp1) {
//        labelColor = "down";
//    }

//    else if (value == 2) {
//        labelColor = "danger";
//    }

//    return '<div class="pull-left bord-all badge-' + labelColor + '">' + '<span title="GPRS"><img class="img-square img-xs" src="img/categories/gprs.png" alt="GPRS Status" style="width:16px; height:12px;"></span></div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + value + '</div>';
//}

//  Format for GPS Status Color
// =================================================================
function gpsStatus(gps, timestamp) {

    var assetTimestamp = timestamp;
    var timestamp1 = moment.utc(assetTimestamp).local().format("DD MMM YYYY");
    var d = new Date();
    var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
    timestamp2 = Date.parse(timestamp2);
    timestamp1 = Date.parse(timestamp1);

    var labelColor;
    if (gps >= 2) {
        labelColor = "success";
    } else if (gps < 2 && timestamp2 > timestamp1) {
        labelColor = "down";
    }
    else if (gps < 2) {
        labelColor = "danger";
    }


    return '<div class="pull-right bord-all badge-' + labelColor + '">' + '<span title="GPS"><img class="img-square img-xs" src="img/categories/gps.png" alt="GPS Status" style="width:16px; height:12px;"></span></div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + gps + '</div>';
}


//  Format for GPRS Status Color
// =================================================================
function gprsStatus(gprs, timestamp) {

    var assetTimestamp = timestamp;
    var timestamp1 = moment.utc(assetTimestamp).local().format("DD MMM YYYY");
    var d = new Date();
    var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
    timestamp2 = Date.parse(timestamp2);
    timestamp1 = Date.parse(timestamp1);

    var labelColor;
    if (gprs == 0) {
        labelColor = "success";

    } else if (gprs == 1) {
        labelColor = "warning";
    }
    else if (gprs == 2 && timestamp2 > timestamp1) {
        labelColor = "down";
    }

    else if (gprs == 2) {
        labelColor = "danger";
    }

    return '<div class="pull-left bord-all badge-' + labelColor + '">' + '<span title="GPRS"><img class="img-square img-xs" src="img/categories/gprs.png" alt="GPRS Status" style="width:16px; height:12px;"></span></div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + gprs + '</div>';
}

function barLight(value, row) {

    var assetTimestamp = row.LastPos.Timestamp;
    //var timestamp1 = moment.utc(assetTimestamp).local().format("DD MMM YYYY");
    //var d = new Date();
    //var timestamp2 = moment.utc(d).local().format("DD MMM YYYY");
    //timestamp2 = Date.parse(timestamp2);
    //timestamp1 = Date.parse(timestamp1);

    var timestamp2 = new Date().getDate();
    var timestamp1 = new Date(assetTimestamp).getDate();

    var labelColor;
    if (value == 1) {
        labelColor = "success";
    } else if (value == 0 && timestamp2 > timestamp1) {
        labelColor = "down";
    } else if (value == 0) {
        labelColor = "danger";
    }

    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    return '<div class="pull-left bord-all badge-' + labelColor + '">' + '<span title="Bar Light"><img class="img-square img-xs" src="img/categories/lightbulb.png" alt="Bar Light Status" style="width:16px; height:12px;"></span></div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + value + '</div>';
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

       window.location.href = 'http://track-asia.com/systempest/'; //Login URL
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

     if (getSessionstorageValueLanguage == "th") document.getElementById("verNum").innerHTML = version;
    if (getSessionstorageValueLanguage == "en") document.getElementById("verNumEN").innerHTML = version;
    if (getSessionstorageValueLanguage == "vn") document.getElementById("verNumVN").innerHTML = version;
    if (getSessionstorageValueLanguage == "id") document.getElementById("verNumID").innerHTML = version;

});




//Filter Zone

if (getSessionstorageValueRoleID == 1) {
    var getZone = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + '1' + '&CompanyID=' + '1';

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
    var getZoneByID = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID;

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
    var getZoneByID = 'http://117.120.7.119/spwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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
document.getElementById("muteAlert").checked = true;

//Translate Footer
if (getSessionstorageValueLanguage == "en") {
    $('#move').html('Move'); $('#idle').html('Idle'); $('#stop').html('Stop'); $('#moveTitle').attr('title', 'Status Color When Phone is Moving'); $('#idleTitle').attr('title', 'Status Color When Phone is Idle'); $('#stopTitle').attr('title', 'Status Color When Phone is Stop');
    $('#noGPS').html('No GPS'); $('#noGPRS').html('No GPRS');
}
else if (getSessionstorageValueLanguage == "th") {
    $('#move').html('รถวิ่ง'); $('#idle').html('รถจอดติดเครื่อง'); $('#stop').html('หยุด'); $('#moveTitle').attr('title', 'เครื่องยนต์ สี สถานะ เมื่อ ยานพาหนะ จะย้าย'); $('#idleTitle').attr('title', 'เครื่องยนต์ สี สถานะ เมื่อ ไม่ได้ใช้งาน ยานพาหนะเป็น'); $('#stopTitle').attr('title', 'เครื่องยนต์ สี สถานะ เมื่อ ยานพาหนะเป็น หยุด');
    $('#noGPS').html('ไม่มี GPS'); $('#noGPRS').html('ไม่มี GPRS');
    $('#down').html('ลง');
    $('#filter-options option:contains("Status")').text('สถานะ');
    $('#filter-options option:contains("Engine")').text('เครื่องยนต์');
    $('#filter-options option:contains("Category")').text('ประเภท');
    $('#filter-options option:contains("No GPS")').text('ไม่มี GPS');
    $('#filter-options option:contains("No GPRS")').text('ไม่มี GPRS');
    $('#filter-options option:contains("Zones")').text('โซน');

    $('#SearchAsset').attr("placeholder", "ค้นหาเบอร์โทรศัพท์");
    $('#pac-input').attr("placeholder", "สถานที่ค้นหา");

}
else if (getSessionstorageValueLanguage == "vn") {
    $('#move').html('di chuyển'); $('#idle').html('Không hoạt động'); $('#stop').html('dừng lại'); $('#moveTitle').attr('title', 'Động cơ Màu Status Khi xe đang chuyển'); $('#idleTitle').attr('title', 'Động cơ Màu Status Khi xe là nhàn rỗi'); $('#stopTitle').attr('title', 'Động cơ Màu Status Khi xe đang dừng');
    $('#noGPS').html('không có GPS'); $('#noGPRS').html('không có GPRS');
    $('#down').html('Xuống');
    $('#filter-options option:contains("Status")').text('Trạng thái');
    $('#filter-options option:contains("Engine")').text('Động cơ');
    $('#filter-options option:contains("Category")').text('thể loại');
    $('#filter-options option:contains("No GPS")').text('không có GPS');
    $('#filter-options option:contains("No GPRS")').text('không có GPRS');
    $('#filter-options option:contains("Zones")').text('khu');

    $('#SearchAsset').attr("placeholder", "Tìm kiếm Điện thoại");
    $('#pac-input').attr("placeholder", "Tìm kiếm địa điểm");
}
else if (getSessionstorageValueLanguage == "id") {

    $('#move').html('Gerak'); $('#idle').html('Menganggur'); $('#stop').html('Berhenti'); $('#moveTitle').attr('title', 'Status Warna Ketika Ponsel Bergerak'); $('#idleTitle').attr('title', 'Status Warna Ketika Phone adalah Menganggur'); $('#stopTitle').attr('title', 'Status Warna Ketika Phone adalah Berhenti');
    $('#noGPS').html('Tiada GPS'); $('#noGPRS').html('Tiada GPRS');
    $('#down').html('Turun');
    $('#filter-options option:contains("Status")').text('Status');
    $('#filter-options option:contains("Engine")').text('Mesin');
    $('#filter-options option:contains("Category")').text('Kategori');
    $('#filter-options option:contains("No GPS")').text('Tiada GPS');
    $('#filter-options option:contains("No GPRS")').text('Tiada GPRS');
    $('#filter-options option:contains("Zones")').text('zona');

    $('#SearchAsset').attr("placeholder", "Cari Ponsel");
    $('#pac-input').attr("placeholder", "Mencari Lokasi");
}
