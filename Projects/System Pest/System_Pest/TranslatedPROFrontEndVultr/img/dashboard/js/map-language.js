

//Then retrieve
var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

//alert(getSessionstorageValueLanguage);
if (getSessionstorageValueLanguage == "th") {


    window.google = window.google || {};
    google.maps = google.maps || {};
    (function () {

        function getScript(src) {
            document.write('<' + 'script src="' + src + '"><' + '/script>');
        }

        getScript("https://maps.googleapis.com/maps/api/js?client=gme-acecomtechnologies&v=3.33&libraries=places,drawing&language=th");
    })();


}
else if (getSessionstorageValueLanguage == "en") {

    window.google = window.google || {};
    google.maps = google.maps || {};
    (function () {

        function getScript(src) {
            document.write('<' + 'script src="' + src + '"><' + '/script>');
        }

        getScript("https://maps.googleapis.com/maps/api/js?client=gme-acecomtechnologies&v=3.33&libraries=places,drawing&language=en");
    })();

}
else if (getSessionstorageValueLanguage == "vn") {

    window.google = window.google || {};
    google.maps = google.maps || {};
    (function () {

        function getScript(src) {
            document.write('<' + 'script src="' + src + '"><' + '/script>');
        }

        getScript("https://maps.googleapis.com/maps/api/js?client=gme-acecomtechnologies&v=3.33&libraries=places,drawing&language=vi");
    })();

}
else if (getSessionstorageValueLanguage == "id") {

    window.google = window.google || {};
    google.maps = google.maps || {};
    (function () {

        function getScript(src) {
            document.write('<' + 'script src="' + src + '"><' + '/script>');
        }

        getScript("https://maps.googleapis.com/maps/api/js?client=gme-acecomtechnologies&v=3.33&libraries=places,drawing&language=id");
    })();

}
else
{
    window.google = window.google || {};
    google.maps = google.maps || {};
    (function () {

        function getScript(src) {
            document.write('<' + 'script src="' + src + '"><' + '/script>');
        }

        getScript("https://maps.googleapis.com/maps/api/js?client=gme-acecomtechnologies&v=3.28&libraries=places,drawing&language=en");
    })();
}


