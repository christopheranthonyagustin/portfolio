
var getSessionstorageValueUserImage = sessionStorage.getItem('setSessionstorageValueUserImage');
var getSessionstorageValueUserImageFill = sessionStorage.getItem('setSessionstorageValueUserImageFill');

$(document).ready(function () {

    if (getSessionstorageValueUserImageFill == "Uniform") {

       // document["showProfile"].src = getSessionstorageValueUserImage;
        $("#showProfile").attr("src", getSessionstorageValueUserImage);
    }



});



