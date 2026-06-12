
// this part would be in your own data file
window.onload = function () {


    moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    function showTheTime() {
        var s = moment().tz("Asia/Singapore").format('hh:mm:ss A');
        document.getElementById("clockbox").innerHTML = s;
    }

    showTheTime(); // for the first load
    setInterval(showTheTime, 250); // update it periodically
}