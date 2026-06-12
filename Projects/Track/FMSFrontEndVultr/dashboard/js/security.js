$(document).ready(function () {

    var TrackVersion = "sg";

    var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');

    if (getSessionstorageValueTrackVersion != TrackVersion) {

       
        window.location.href = 'https://track-asia.com/sg/';

    }


});



