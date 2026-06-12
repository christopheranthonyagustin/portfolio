$(document).ready(function () {

    var TrackVersion = "sg";

    var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');

    if (getSessionstorageValueTrackVersion != TrackVersion) {

       
        window.location.href = 'http://track.asiacom.co.th/sg/';

    }


});



