
var getSessionstorageValueUserImage = sessionStorage.getItem('setSessionstorageValueUserImage');
var getSessionstorageValueUserImageFill = sessionStorage.getItem('setSessionstorageValueUserImageFill');
var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');

var getSessionstorageValueUserImageCompany = sessionStorage.getItem('setSessionstorageValueUserImageCompany');
var getSessionstorageValueUserImageFillCompany = sessionStorage.getItem('setSessionstorageValueUserImageFillCompany');


$(document).ready(function () {

    if (getSessionstorageValueUserImageFill == "Uniform") {

       // document["showProfile"].src = getSessionstorageValueUserImage;
        $("#showProfile").attr("src", getSessionstorageValueUserImage);
    }

    if (getSessionstorageValueUserImageFillCompany == "Uniform") {

        // document["showProfile"].src = getSessionstorageValueUserImage;
        if (getSessionstorageValueCompanyID > 0) $("#showProfileCompany").attr("src", getSessionstorageValueUserImageCompany).addClass('img-thumbnail');
        else $("#showProfileCompany").attr("src", getSessionstorageValueUserImageCompany);
    }

    if (getSessionstorageValueCompanyID == 0) $('#titleCompany').append($('<div></div>').val("SYSTEM PEST").html("SYSTEM PEST"));
    else $('#titleCompany').append($('<div></div>').val(getSessionstorageValueCompany).html(getSessionstorageValueCompany));





});



