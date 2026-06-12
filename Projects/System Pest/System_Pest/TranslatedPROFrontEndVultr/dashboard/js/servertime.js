
//window.onload = function () {

//    function showTheTime() {
//        var s = moment().format('hh:mm:ss A');
//        document.getElementById("clockbox").innerHTML = s;
//    }

//    showTheTime(); // for the first load
//    setInterval(showTheTime, 250); // update it periodically
//}

window.onload = function () {

    var getSessionstorageValueTrackVersion = sessionStorage.getItem('setSessionstorageValueTrackVersion');

    function showTheTime() {

        if (getSessionstorageValueTrackVersion == "sg") {
            var s = moment.utc().add('hours', 8).format('hh:mm:ss A');
        }
        else if (getSessionstorageValueTrackVersion == "th" || getSessionstorageValueTrackVersion == "vn" || getSessionstorageValueTrackVersion == "id") {

            var s = moment.utc().add('hours', 7).format('hh:mm:ss A');
        }

        document.getElementById("clockbox").innerHTML = s;
    }

    showTheTime(); // for the first load
    setInterval(showTheTime, 250); // update it periodically
}