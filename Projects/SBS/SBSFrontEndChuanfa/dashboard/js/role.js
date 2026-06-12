$(function () {

    var getSessionstorageValueName = sessionStorage.getItem('setSessionstorageValueName');
    var getSessionstorageValueReports = sessionStorage.getItem('setSessionstorageValueReports');
    var getSessionstorageValueRoleDesc = sessionStorage.getItem('setSessionstorageValueRoleDesc');
    var getSessionstorageValueRoleID = sessionStorage.getItem('setSessionstorageValueRoleID');
    var getSessionstorageValueEmail = sessionStorage.getItem('setSessionstorageValueEmail');
    var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');
    var getSessionstorageValueUserID = sessionStorage.getItem('setSessionstorageValueUserID');
    var getSessionstorageValueUserNotifications = sessionStorage.getItem('setSessionstorageValueUserNotifications');

    if (getSessionstorageValueRoleID >= 3) {
        $('.oaf').hide();
        $('.software').hide();

    }

    if (getSessionstorageValueReports == "") {
        console.log('All reports are activated');
    }
    else {
        $('.triggerData').hide();
        $('.dailyPerf').hide();
        $('.overallPerf').hide();
        $('.bcRanking').hide();
        $('.bcPerf').hide();

        //Convert String to Array
        var strReports = getSessionstorageValueReports;
        var AssignedReports = new Array();
        AssignedReports = strReports.split(",");
        for (var i = 0; i < AssignedReports.length; ++i) {
            if (AssignedReports[i] == 5) $('.triggerData').show();
            else if (AssignedReports[i] == 6) $('.dailyPerf').show();
            else if (AssignedReports[i] == 7) $('.overallPerf').show();
            else if (AssignedReports[i] == 8) $('.bcRanking').show();
            else if (AssignedReports[i] == 9) $('.bcPerf').show();
        }
    }
});
$(function () {

    var getSessionstorageValueUser = sessionStorage.getItem('setSessionstorageValueUser');
    var user;
    user = getSessionstorageValueUser;
    $('#user').text("You have logged in as : " + user);
});