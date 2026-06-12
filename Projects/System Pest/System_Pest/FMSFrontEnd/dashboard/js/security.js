$(document).ready(function () {

    var TrackVersion = "sg";

    //Then retrieve
    var getSessionstorageValueCompany = sessionStorage.getItem('setSessionstorageValueCompany');
    var getSessionstorageValueCompanyID = sessionStorage.getItem('setSessionstorageValueCompanyID');
    var getSessionstorageValueEmail = sessionStorage.getItem('setSessionstorageValueEmail');
    var getSessionstorageValueName = sessionStorage.getItem('setSessionstorageValueName');
    var getSessionstorageValueRoleDesc = sessionStorage.getItem('setSessionstorageValueRoleDesc');
    var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');
    var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');
    var baseAddress = "http://track-asia.com/systempest/";

    if (getSessionstorageValueTrackVersion != TrackVersion) {

       
        window.location.href = baseAddress;

    }


});



