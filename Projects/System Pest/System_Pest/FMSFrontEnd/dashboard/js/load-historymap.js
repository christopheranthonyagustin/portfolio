
//populate the Drop Down List

$.getJSON("http://117.120.7.119/spwebapi/api/companyinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-company').append(
             $('<option></option>').val(item.Name).html(item.Name)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});


$.getJSON("http://117.120.7.119/spwebapi/api/companyinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-company2').append(
             $('<option></option>').val(item.Name).html(item.Name)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});



$.getJSON("http://117.120.7.119/spwebapi/api/reportinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-report').append(
             $('<option></option>').val(item.Name).html(item.Name)          
         );
        
    });

    $(".selectpicker").selectpicker('refresh');
});



$.getJSON("http://117.120.7.119/spwebapi/api/assetinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-assets').append(
             $('<option></option>').val(item.Name).html(item.Name)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});


$.getJSON("http://117.120.7.119/spwebapi/api/assetinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-assets2').append(
             $('<option></option>').val(item.Name).html(item.Name)
         );
    });
    $(".selectpicker").selectpicker('refresh');
});


$.getJSON("http://117.120.7.119/spwebapi/api/categoryinfo", function (data) {
    $.each(data, function (index, item) {
        $('#load-category').append(
             $('<option></option>').val(item.CategoryDesc).html(item.CategoryDesc)
         );

    });

    $(".selectpicker").selectpicker('refresh');
});


//  Format for Vehicle Column.
// =================================================================
function vehicleFormatter(value, row) {
    

    return '<a class="btn-link" id="showVehicle" onClick="showVehicle()">' + value + '</a>';
}


//  Format for Ignition Column.
// =================================================================
function ignitionFormatter(value, row) {
    var labelColor;
    var text;
    if (value == 1) {
        labelColor = "success";
        text = "On";
    } else if (value == 0) {
        labelColor = "dark";
        text = "Off";
    } 
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    return '<div class="label label-table label-' + labelColor + '"> ' + text + '</div>';
}


//  Format for Engine Column.
// =================================================================
function engineFormatter(value, row) {
    var labelColor;
    if (value == "MOVE") {
        labelColor = "success";
    } else if (value == "IDLE") {
        labelColor = "warning";
    } else if (value == "STOP") {
        labelColor = "danger";
    }
    var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
    return '<div class="label label-table label-' + labelColor + '"> ' + value + '</div>';
}



//  Format for Timestamp Column.
// =================================================================
function timestampFormatter(value, row) {


    //var t = value;


    //function convertUTCDateToLocalDate(date) {
    //    var newDate = new Date(date.getTime() + date.getTimezoneOffset() * 60 * 1000);

    //    var offset = date.getTimezoneOffset() / 60;
    //    var hours = date.getHours();

    //    newDate.setHours(hours - offset);

    //    return newDate;
    //}

    //var date = convertUTCDateToLocalDate(new Date(t));


    //var timestamp = moment(date.toLocaleString()).format("D-MMM-YYYY, hh:mm:ss A");

    //Convert Timezone
    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    var Singapore = moment.tz(value, Asia);

    //Format UTC
    //var timestamp = moment(Singapore.format()).format("D-MMM-YYYY, hh:mm:ss A");
    var timestamp = moment.utc(Singapore.format()).add('hours', 8).format('D-MMM-YYYY, hh:mm:ss A');


    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';



}



//<!--Filter-Vehicle-->
(function (document) {
    'use strict';

    var VehicleTableFilter = (function (Arr) {


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
                var selects = document.getElementsByClassName('select-vehicle-filter');
                Arr.forEach.call(selects, function (select) {
                    select.onchange = _onSelectEvent;


                });
            }
        };
    })(Array.prototype);

    document.addEventListener('readystatechange', function () {
        if (document.readyState === 'complete') {
            VehicleTableFilter.init();

        }
    });

})(document);



//Hide Elements
$(document).ready(function () {
    options = {
        clearOnHide: true
    }
    $('[visibly]').Visibly();
})




//OnChange Filter
$(document).ready(function () {
    
    $('#load-assets').change(function () {
        localStorage.setItem("setLocalstorageValueAsset", $(this).val());

    });

    $('#load-company').change(function () {
        localStorage.setItem("setLocalstorageValueAsset", $(this).val());

    });

    $('#dateFrom').on('change', function () {
        localStorage.setItem("setLocalstorageValueDateFrom", $(this).val());
    });
    
    $('#dateTo').on('change', function () {
        localStorage.setItem("setLocalstorageValueDateTo", $(this).val());
    });
    
    
});



//Storage
$(document).ready(function () {

    var getAsset = $("#load-assets").val(); //the value of the selected option        
    var getCompany = $("#load-company").val();

    localStorage.setItem("setLocalstorageValueAsset", getAsset);
    localStorage.setItem("setLocalstorageValueCompany", getCompany);

    var getLocalstorageValueAsset = sessionStorage.getItem('setLocalstorageValueAsset');
    var getLocalstorageValueCompany = sessionStorage.getItem('setLocalstorageValueCompany');


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

    //Then retrieve
    var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');


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