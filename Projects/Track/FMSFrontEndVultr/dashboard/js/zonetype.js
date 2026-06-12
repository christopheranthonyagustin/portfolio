$(function () {

    $.getJSON("https://app.track-asia.com/tracksgwebapi/api/zonetypeinfo", function (data) {
        $.each(data, function (index, item) {
            $('#getZoneTypes').append($('<option></option>').val(item.ZoneTypeID).html(item.Name));
            $('#getPoiTypes').append($('<option></option>').val(item.ZoneTypeID).html(item.Name));
        });
        $(".selectpicker").selectpicker('refresh');
    });

});