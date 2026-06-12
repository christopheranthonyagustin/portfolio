$('#i18n').change(function () {
    $.getScript('plugins/bootstrap-table/locale/bootstrap-table-' + $(this).val() + '.js', function () {
            
    });
});