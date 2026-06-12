
$(document).ready(function () {


    //Then retrieve
    var getLocalstorageValueAsset = localStorage.getItem('setLocalstorageValueAsset');
    var getLocalstorageValueCompany = localStorage.getItem('setLocalstorageValueCompany');
    var getLocalstorageValueDateFrom = localStorage.getItem('setLocalstorageValueDateFrom');
    var getLocalstorageValueDateTo = localStorage.getItem('setLocalstorageValueDateTo');


    //Set
    localStorage.setItem("setLocalstorageValueAsset", getLocalstorageValueAsset);
    localStorage.setItem("setLocalstorageValueCompany", getLocalstorageValueCompany);
    localStorage.setItem("setLocalstorageValueDateFrom", getLocalstorageValueDateFrom);
    localStorage.setItem("setLocalstorageValueDateTo", getLocalstorageValueDateTo);

    //Hide Elements
    $(document).ready(function () {
        $('[visibly]').Visibly();
    });


    $('#clickClear').click(function () {
        RemoveMarker();
    });

    $('#clickClearEN').click(function () {
        RemoveMarker();
    });




});













