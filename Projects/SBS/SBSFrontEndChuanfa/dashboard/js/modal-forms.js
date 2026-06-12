$("#buttonNew").click(function() {
    $('#TableFormNew').modal("show");
});
$("#buttonEdit").click(function() {
    $('#TableFormEdit').modal("show");
});
$("#buttonDelete").click(function() {
    $('#ConfirmDelete').modal("show");
});

function confirmdelete() {
    $("#DeleteEntry").click(function () {
        $('#ValidateDelete').modal("show");
    });
}
$(function() {
    $('.showform').change(function() {
        $('.form').hide();
        $('.' + $(this).val()).show();
    });
});