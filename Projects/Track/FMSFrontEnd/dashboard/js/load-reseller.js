var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
var getSessionstorageValueUserResellerID = sessionStorage.getItem('setSessionstorageValueUserResellerID');
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

 //Onload
 document.getElementById("resellerStatus").checked = true;


$(document).ready(function() {

    var WebAPI = "";

    if (getSessionstorageValueRoleID == 1) {

        WebAPI = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo';

    } else {

        WebAPI = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo?ResellerID=' + getSessionstorageValueUserResellerID;
    }


	$('#reseller-editable').bootstrapTable({
		idField: 'id',
		url: WebAPI,
		columns: [{
		    field: 'state',
		    title: 'ID',
		    checkbox: 'true'
		}, {
			field: 'ResellerID',
			title: 'ID',
			class: 'hidden-xs hidden-sm hidden-md hidden-lg',
			formatter: 'resellerFormatter'
		}, {
		    field: 'Name',
		    title: 'Reseller Name',
            sortable: 'true'
		}, {
			field: 'Address',
			title: 'Address',
			sortable: 'true'
		}, {
		    field: 'Email',
		    title: 'Email',
		    sortable: 'true'
		}, {
		    field: 'Phone',
		    title: 'Phone',
		    sortable: 'true'
		},  {
		    field: 'Flag',
		    title: 'Enabled/Disabled',
		    formatter: 'statusFormatter'
		}],

		
		onCheck: function (row) {

		    $("#toggle-aside").hide();
		    $("#toggle-aside2").show();
		    //$("#edit-toggle-button").show();
		    //$("#add-toggle-button").hide();

		    var resellerID = $('#resellerID').val(row.ResellerID);
		    var resellerStatus = $('#resellerStatus').val(row.Flag);
		    var resellerName = $('#resellerName').val(row.Name);
		    var resellerNameEN = $('#resellerNameEN').val(row.Name);
		    var resellerAddress = $('#resellerAddress').val(row.Address);
		    var resellerAddressEN = $('#resellerAddressEN').val(row.Address);
		    var resellerEmail = $('#resellerEmail').val(row.Email);
		    var resellerEmailEN = $('#resellerEmailEN').val(row.Email);
		    var resellerPhone = $('#resellerPhone').val(row.Phone);
		    var resellerPhoneEN = $('#resellerPhoneEN').val(row.Phone);
		    
		    $(".selectpicker").selectpicker('refresh');


		},

		onUncheck: function (row) {
		    $("#toggle-aside").show();
		    $("#toggle-aside2").hide();
		    clearResellerForms();
		},

		onLoadSuccess: function (row) {

		    if (getSessionstorageValueRoleID == 1) {
		        $("#toggle-aside").show();
		    }
		    else {

		        $("#toggle-aside").hide();
		    }

		    if (getSessionstorageValueRoleID == 1 && getSessionstorageValueLanguage == "th") {

		        $("#reseller-confirm-delete").show();

		    }
		    else if (getSessionstorageValueRoleID == 1 && getSessionstorageValueLanguage == "en") {
		        $("#reseller-confirm-deleteEN").show();

		    }
		    else if (getSessionstorageValueRoleID != 1) {
		        $("#reseller-confirm-deleteEN").hide();
		        $("#reseller-confirm-delete").hide();
		    }

		   // $("#edit-toggle-button").hide();	   
		    $("#toggle-aside2").hide();
		   
		}

		//onLoadError: function () {
		//    alert('Event: onLoadError, data: ' + alert('error'));
		//}
	});



});

//Delete Row
var $table = $('#reseller-editable'), $remove = $('#reseller-confirm-delete'), $removeEN = $('#reseller-confirm-deleteEN');

$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
    $removeEN.prop('disabled', !$table.bootstrapTable('getSelections').length);
});


//Update Row
//var $table = $('#vehicles-editable'), $remove = $('#vehicle-confirm-update');

//$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
//    $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
//});



// FORMAT COLUMN
// Use "data-formatter" on HTML to format the display of bootstrap table column.
// =================================================================


// format for Vehicle Column.
// =================================================================
function resellerFormatter(value, row) {
	return '<a href="#" class="btn-link" > Reseller #' + value + '</a>';
}




// Format for User Name Column.
// =================================================================
function nameFormatter(value, row) {
	return '<a href="#" class="btn-link" > ' + value + '</a>';
}




// Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {
	var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
	return '<span class="text-muted"><i class="fa fa-clock-o"></i> ' + value + '</span>';
}



//  Format for Status Column.
// =================================================================
function statusFormatter(value, row) {
    var labelColor;
    var text;
    //if (value == "Enabled") {
	if (value == 0) {
	    labelColor = "success";
	    text = "Enabled";
	}else if(value == 1){
	    labelColor = "dark";
	    text = "Disabled";
	}
	var icon = row.id % 2 === 0 ? 'fa-star' : 'fa-user';
	return '<div class="label label-table label-'+ labelColor+'"> ' + text + '</div>';
}



// Format for Tracking Number Column.
// =================================================================
function trackFormatter(value, row) {
	if (value) return '<i class="fa fa-truck"></i> ' + value;
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

//Total Companies
var url = 'http://103.237.168.119/tracksgwebapi/api/resellerinfo';

$.getJSON(url, function (reseller) {


    var $result = $('#total-reseller');
    $result.text(reseller.length)

});


//populate the Drop Down List


var changeCheckbox = document.querySelector('.resellerStatus');

changeCheckbox.onchange = function () {
    
    var val;

    if (changeCheckbox.checked == true) {
        val = 0;
    }

    else if (changeCheckbox.checked == false) {
        val = 1;
    }

    return val;

};


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
            $('#reseller-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.add-reseller').click(function () {

        setTimeout(function () {
            $('#reseller-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.add-resellerEN').click(function () {

        setTimeout(function () {
            $('#reseller-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.edit-reseller').click(function () {

        setTimeout(function () {
            $('#reseller-editable').bootstrapTable('resetView');

        }, 500);


    });

    $('.edit-resellerEN').click(function () {

        setTimeout(function () {
            $('#reseller-editable').bootstrapTable('resetView');

        }, 500);


    });


});


window.onresize = function (event) {
    setTimeout(function () {
        $('#reseller-editable').bootstrapTable('resetView');

    }, 500);
};


function clearResellerForms() {

    $('#resellerID').val('');
    $('#resellerNameEN').val('');
    $('#resellerAddressEN').val('');
    $('#resellerEmailEN').val('');
    $('#resellerPhoneEN').val('');

    $('#reseller-editable').bootstrapTable('refresh');
}