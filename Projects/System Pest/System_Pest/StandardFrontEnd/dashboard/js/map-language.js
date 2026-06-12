

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

        getScript("https://maps.googleapis.com/maps/api/js?key=AIzaSyCKyWKb4gOhrzxCSI-wPVXoHq06qy9tZgM");
    })();


}
else if (getSessionstorageValueLanguage == "en") {

    window.google = window.google || {};
    google.maps = google.maps || {};
    (function () {

        function getScript(src) {
            document.write('<' + 'script src="' + src + '"><' + '/script>');
        }

        getScript("https://maps.googleapis.com/maps/api/js?key=AIzaSyCKyWKb4gOhrzxCSI-wPVXoHq06qy9tZgM");
    })();

}
else if (getSessionstorageValueLanguage == "vn") {

    window.google = window.google || {};
    google.maps = google.maps || {};
    (function () {

        function getScript(src) {
            document.write('<' + 'script src="' + src + '"><' + '/script>');
        }

        getScript("https://maps.googleapis.com/maps/api/js?key=AIzaSyCKyWKb4gOhrzxCSI-wPVXoHq06qy9tZgM");
    })();

}
else if (getSessionstorageValueLanguage == "id") {

    window.google = window.google || {};
    google.maps = google.maps || {};
    (function () {

        function getScript(src) {
            document.write('<' + 'script src="' + src + '"><' + '/script>');
        }

        getScript("https://maps.googleapis.com/maps/api/js?key=AIzaSyCKyWKb4gOhrzxCSI-wPVXoHq06qy9tZgM");
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

        getScript("https://maps.googleapis.com/maps/api/js?key=AIzaSyCKyWKb4gOhrzxCSI-wPVXoHq06qy9tZgM");
    })();
}


