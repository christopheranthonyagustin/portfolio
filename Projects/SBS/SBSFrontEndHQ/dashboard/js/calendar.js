
    $(function () {

        var dateFormat = "D-MMM-YYYY HH:mm A";
        var d1 = new Date();
        d1.setHours(0);
        d1.setMinutes(0);
        var dateFrom = moment(d1).format(dateFormat);

        var d2 = new Date();
        d2.setDate(d2.getDate() + 1);
        d2.setHours(0);
        d2.setMinutes(0);
        var dateTo = moment(d2).format(dateFormat);


        jQuery('#dateFrom1').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
                ClearDateFrom();
                SelectDateFrom($input.val());
            }
        });

        jQuery('#dateTo1').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
                ClearDateTo();
                SelectDateTo($input.val());
            }
        });

        jQuery('#dateFrom2').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo2').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateFrom3').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo3').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateFrom4').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo4').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateFrom5').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo5').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateFrom6').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo6').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });


        jQuery('#dateFrom7').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo7').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });


        jQuery('#dateFrom8').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo8').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });


        jQuery('#dateFrom9').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo9').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });


        jQuery('#dateFrom10').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo10').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateFrom11').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo11').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateFrom12').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo12').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateFrom13').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo13').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateFrom14').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo14').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateFrom15').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateFrom,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        jQuery('#dateTo15').datetimepicker({
            format: 'd-M-Y H:i A',
            timepicker: true,
            value: dateTo,
            autoclose: true,
            mask: false,
            onChangeDateTime: function (dp, $input) {
                $(this).hide();
            }
        });

        function ClearDateFrom() {
            $('#dateFrom2').val('');
            $('#dateFrom3').val('');
            $('#dateFrom4').val('');
            $('#dateFrom5').val('');
            $('#dateFrom6').val('');
            $('#dateFrom7').val('');
            $('#dateFrom8').val('');
            $('#dateFrom9').val('');
            $('#dateFrom10').val('');
            $('#dateFrom11').val('');
            $('#dateFrom12').val('');
            $('#dateFrom13').val('');
            $('#dateFrom14').val('');
            $('#dateFrom15').val('');
        }

        function SelectDateFrom(date) {
            $('#dateFrom2').val(date);
            $('#dateFrom3').val(date);
            $('#dateFrom4').val(date);
            $('#dateFrom5').val(date);
            $('#dateFrom6').val(date);
            $('#dateFrom7').val(date);
            $('#dateFrom8').val(date);
            $('#dateFrom9').val(date);
            $('#dateFrom10').val(date);
            $('#dateFrom11').val(date);
            $('#dateFrom12').val(date);
            $('#dateFrom13').val(date);
            $('#dateFrom14').val(date);
            $('#dateFrom15').val(date);
        }

        function ClearDateTo() {
            $('#dateTo2').val('');
            $('#dateTo3').val('');
            $('#dateTo4').val('');
            $('#dateTo5').val('');
            $('#dateTo6').val('');
            $('#dateTo7').val('');
            $('#dateTo8').val('');
            $('#dateTo9').val('');
            $('#dateTo10').val('');
            $('#dateTo11').val('');
            $('#dateTo12').val('');
            $('#dateTo13').val('');
            $('#dateTo14').val('');
            $('#dateTo15').val('');
        }

        function SelectDateTo(date) {
            $('#dateTo2').val(date);
            $('#dateTo3').val(date);
            $('#dateTo4').val(date);
            $('#dateTo5').val(date);
            $('#dateTo6').val(date);
            $('#dateTo7').val(date);
            $('#dateTo8').val(date);
            $('#dateTo9').val(date);
            $('#dateTo10').val(date);
            $('#dateTo11').val(date);
            $('#dateTo12').val(date);
            $('#dateTo13').val(date);
            $('#dateTo14').val(date);
            $('#dateTo15').val(date);
        }

    });

