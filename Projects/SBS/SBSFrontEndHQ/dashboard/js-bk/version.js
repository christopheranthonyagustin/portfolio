$(document).ready(function () {

    $.ajax({
        url: "data/version.txt",
        dataType: "text",
        contentType: 'application/json; charset=utf-8',
        success: function (data) {

            // document.getElementById("ver").value = data;
            $('#ver').text(data + "\u00A9 2017"  );
        }
    });
});
