
var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');

//Then retrieve
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

// Mobile Reseller
var MobileWebAPIReseller = "";

if (getSessionstorageValueRoleID == 1) {

    MobileWebAPIReseller = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo';

    $.getJSON(MobileWebAPIReseller, function (data) {
        $.each(data, function (index, item) {

            if (item.ResellerID == "4") {
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

    MobileWebAPIReseller = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;

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

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?&ResellerID=" + "4", function (data) {


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

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?ResellerID=" + getSessionstorageValueUserResellerID, function (data) {
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

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/companyinfo?CompanyID=" + getSessionstorageValueCompanyID + "&ResellerID=" + getSessionstorageValueUserResellerID, function (data) {

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

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + '&ResellerID=' + '4' + '&CompanyID=' + '2', function (data) {

        $.each(data, function (index, item) {

            $('#mobile-load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });

}
else if (getSessionstorageValueRoleID == 2) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {

        $.each(data, function (index, item) {
            $('#mobile-load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}
else if (getSessionstorageValueRoleID >= 3) {

    $.getJSON("http://103.237.168.119/tracksgwebapi/api/assetinfo?UserID=" + getSessionstorageValueUserID + '&ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID, function (data) {
        $.each(data, function (index, item) {
            $('#mobile-load-assets').append(
                 $('<option></option>').val(item.Name).html(item.Name)
             );
        });
        $(".selectpicker").selectpicker('refresh');
    });
}


$.getJSON("http://103.237.168.119/tracksgwebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-category').append(
             $('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc)
         );
    });
    $(".selectpicker").selectpicker('refresh');

});

$.getJSON("http://103.237.168.119/tracksgwebapi/api/categoryinfo", function (data) {
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
    var labelColor;
    if (value == "MOVE") {
        labelColor = "success";

    } else if (value == "IDLE") {
        labelColor = "warning";
    }
    else if (value == "STOP") {
        labelColor = "danger";
    }
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    
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
        }

        Category = Category;

    }
   


    return '<div class="pull-left bord-all badge-' + labelColor + '">' + '<img class="img-square img-xs" src="img/categories/' + Category + '.png">' + '</div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + value + '</div>';
}


//  Format for GPS Status Color
// =================================================================
function gpsStatus(value, row) {
    var labelColor;
    if (value >= 2) {
        labelColor = "success";
    } 
    else if (value < 2) {
        labelColor = "danger";
    }
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';

    return '<div class="pull-right bord-all badge-' + labelColor + '">' + '<span title="GPS"><img class="img-square img-xs" src="img/categories/gps.png" alt="GPS Status" style="width:16px; height:12px;"></span></div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + value + '</div>';
}


//  Format for GPRS Status Color
// =================================================================
function gprsStatus(value, row) {

    var date = new Date();

    var labelColor;
    if (value == 0) {
        labelColor = "success";

    } else if (value == 1) {
        labelColor = "warning";
    }
    else if (value == 2) {
        labelColor = "danger";
    }
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    return '<div class="pull-left bord-all badge-' + labelColor + '">' + '<span title="GPRS"><img class="img-square img-xs" src="img/categories/gprs.png" alt="GPRS Status" style="width:16px; height:12px;"></span></div>' + '<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-desktop">' + value + '</div>';
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

       window.location.href = 'http://track.asiacom.co.th/sg/'; //Login URL
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

    document.getElementById("verNum").innerHTML = version;

    document.getElementById("verNumEN").innerHTML = version;

});




//Filter Zone

if (getSessionstorageValueRoleID == 1) {
    var getZone = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + '4' + '&CompanyID=' + '2';

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
    var getZoneByID = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID;

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
    var getZoneByID = 'http://103.237.168.119/tracksgwebapi/api/zoneinfo?ResellerID=' + getSessionstorageValueUserResellerID + '&CompanyID=' + getSessionstorageValueCompanyID;

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

AutoAdjustScreen();

window.onresize = function (event) {
    setTimeout(function () {

        AutoAdjustScreen();
    }, 500);
};



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
                document.getElementById('map-canvas').style.height = "568px";
                $('#assetStatus').bootstrapTable('resetView', { height: 320 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "560px";
                $('#assetStatus').bootstrapTable('resetView', { height: 335 });
            }

        }, 500);
    }
    else if (screen.height == 720) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "520px";
                $('#assetStatus').bootstrapTable('resetView', { height: 250 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "510px";
                $('#assetStatus').bootstrapTable('resetView', { height: 285 });
            }

        }, 500);
    }
    else if (screen.height == 786) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "560px";
                $('#assetStatus').bootstrapTable('resetView', { height: 338 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "576px";
                $('#assetStatus').bootstrapTable('resetView', { height: 353 });
            }

        }, 500);
    }
    else if (screen.height == 800) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "600px";
                $('#assetStatus').bootstrapTable('resetView', { height: 365 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "590px";
                $('#assetStatus').bootstrapTable('resetView', { height: 360 });
            }

        }, 500);
    }
    else if (screen.height == 864) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "662px";
                $('#assetStatus').bootstrapTable('resetView', { height: 435 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "652px";
                $('#assetStatus').bootstrapTable('resetView', { height: 425 });
            }

        }, 500);
    }
    else if (screen.height == 900) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "700px";
                $('#assetStatus').bootstrapTable('resetView', { height: 450 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "692px";
                $('#assetStatus').bootstrapTable('resetView', { height: 465 });
            }

        }, 500);
    }
    else if (screen.height == 960) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "760px";
                $('#assetStatus').bootstrapTable('resetView', { height: 525 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "747px";
                $('#assetStatus').bootstrapTable('resetView', { height: 520 });
            }

        }, 500);
    }
    else if (screen.height == 1024) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "822px";
                $('#assetStatus').bootstrapTable('resetView', { height: 590 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "812px";
                $('#assetStatus').bootstrapTable('resetView', { height: 580 });
            }

        }, 500);
    }
    else if (screen.height == 1080) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "878px";
                $('#assetStatus').bootstrapTable('resetView', { height: 646 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "868px";
                $('#assetStatus').bootstrapTable('resetView', { height: 636 });
            }

        }, 500);
    }
    else if (screen.height == 1050) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "847px";
                $('#assetStatus').bootstrapTable('resetView', { height: 615 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "840px";
                $('#assetStatus').bootstrapTable('resetView', { height: 605 });
            }

        }, 500);
    }
    else if (screen.height == 1200) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "1000px";
                $('#assetStatus').bootstrapTable('resetView', { height: 760 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "990px";
                $('#assetStatus').bootstrapTable('resetView', { height: 755 });
            }

        }, 500);
    }
    else if (screen.height == 1344) {
        setTimeout(function () {

            if (isChromium !== null && isChromium !== undefined && vendorName === "Google Inc." && isOpera == false && isIEedge == false) {
                // is Google chrome 
                document.getElementById('map-canvas').style.height = "1142px";
                $('#assetStatus').bootstrapTable('resetView', { height: 900 });
            } else {
                // not Google chrome 
                document.getElementById('map-canvas').style.height = "1132px";
                $('#assetStatus').bootstrapTable('resetView', { height: 895 });
            }

        }, 500);
    }
    else {
        setTimeout(function () {
            $('#assetStatus').bootstrapTable('resetView', { height: 400 });
        }, 500);
    }
}