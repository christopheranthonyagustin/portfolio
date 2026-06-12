
function eventFormatter(value) {
    
    var text;
    if (value == 83) {
        text = "Speed";
    } else if (value == 76) {
        text = "LDW";
    } else if (value == 73) {
        text = "Interval";
    } else if (value == 72) {
        text = "HW";
    } else if (value == 70) {
        text = "FCW";
    }

    else {
        text = value;
    }

    return '<div>' + text + '</div>';
}


function valueFormatter(value, row) {

    var text;
    
    if (row.event == 83 && value == 00) {
        text = "Speed restore";
    } else if (row.event == 83 && value == 01) {
        text = "Speed exceed 0-5 kmh";
    } else if (row.event == 83 && value == 02) {
        text = "Speed exceed 5-10 kmh";
    } else if (row.event == 83 && value == 03) {
        text = "Speed exceed 10-15 kmh";
    } else if (row.event == 83 && value == 04) {
        text = "Speed exceed 15-20 kmh";
    } else if (row.event == 83 && value == 05) {
        text = "Speed exceed 20-25 kmh";
    } else if (row.event == 83 && value == 06) {
        text = "Speed exceed 25-30 kmh";
    } else if (row.event == 83 && value == 07) {
        text = "Speed exceed > 30 kmh";
    } 



    else {
        text = value;
    }

    return '<div>' + text + '</div>';
}

function hwFormatter(value) {

    var text;

    if (value == 255) {
        text = "0";
    } else if (value == 0) {
        text = "0";
    } else if (value == 25) {
        text = "0";
    } else if (value == "FF") {
        text = "0";
    }
    else {
        text = parseFloat(value / 10).toFixed(1);
    }

    return '<div>' + text + '</div>';
}


function speedFormatter(value) {

    return '<div>' + value + ' km/h' +  '</div>';
}


function BkFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-exclamation-circle fa-lg icon-move"><i>' + '</center></div>';
    } else
    {
        return '<div><center>' + '--' + '</center></div>';
    }

}

function LSLFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-arrow-circle-left fa-lg icon-move"><i>' + '</center></div>';
    } else {
        return '<div><center>' + '--' + '</center></div>';
    }

}


function RSLFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-arrow-circle-right fa-lg icon-move"><i>' + '</center></div>';
    } else {
        return '<div><center>' + '--' + '</center></div>';
    }

}


function WifiFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-wifi fa-lg icon-move"><i>' + '</center></div>';
    } else {
        return '<div><center>' + '--' + '</center></div>';
    }

}


function LBFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-explanation fa-lg icon-move"><i>' + '</center></div>';
    } else {
        return '<div><center>' + '--' + '</center></div>';
    }

}



function HBFormatter(value) {

    var text;
    if (value == "Y") {
        return '<div><center>' + '<i class="fa fa-explanation-triangle fa-lg icon-move"><i>' + '</center></div>';
    } else {
        return '<div><center>' + '--' + '</center></div>';
    }

}


// Format for Order Date Column.
// =================================================================
function dateFormatter(value, row) {


    //Convert Timezone

    var Asia = moment.tz.add('Asia/Singapore|SMT MALT MALST MALT MALT JST SGT SGT|-6T.p -70 -7k -7k -7u -90 -7u -80|012345467|-2Bg6T.p 17anT.p 7hXE dM00 17bO 8Fyu Mspu DTA0');

    var Singapore = moment.tz(value, Asia);

    //Format UTC
    var timestamp = moment(Singapore.format()).format("D-MMM-YYYY, hh:mm:ss A");


    return '<div>' + '<span><i class="fa fa-clock-o hidden-xs hidden-md"></i>&nbsp;' + timestamp + '</span>' + '</div>';

}

function statusFormatter(value, row) {


    return '<div>' + '<span>' + value + '</span>' + '</div>';

}


function brakeFormatter(value) {

    return '<div><center>' + '<i class="fa fa-exclamation-circle fa-lg icon-move"><i>' + '</center></div>';
 
}

function directionFormatter(value) {

    return '<div><center>' + '<i class="fa fa-retweet fa-lg icon-move"><i>' + '</center></div>';

}


function remarkFormatter(value) {

    if (value == "Good") {

        return '<div><center>' + '<i class="fa fa-thumbs-up fa-lg icon-move">&nbsp;' + value + ' <i>' + '</center></div>';
    } else if (value == "Bad") {

        return '<div><center>' + '<i class="fa fa-thumbs-down fa-lg icon-stop">&nbsp;' + value + ' <i>' + '</center></div>';
    }

}



$(function () {

    var selectedVehicle = "";
    $('.SelectVehicleFilter').on('change', function () {
        selectedVehicle = $(this).find("option:selected").val();

    });

    var selectedDriver = "";
    $('.SelectDriverFilter').on('change', function () {
        selectedDriver = $(this).find("option:selected").val();

    });


    $('#submitReport').click(function () {

        var getDriver = $('#driverlog').val();
        var getVehicle = $('#eventlog').val();

         if (selectedVehicle == "SBS3114L") {
            window.location.href = 'SBS3114L.html';

        } else if (selectedVehicle == "SBS3276C") {

            window.location.href = 'SBS3276C.html';
        } else if (selectedVehicle == "SBS6048A") {

            window.location.href = 'SBS6048A.html';
        }  else {

            window.location.href = 'reports-vehicle.html';
        }

 

    });

    $('#eventlog').selectpicker('refresh');



});


$(function () {

    var selectedDriver = "";
    $('.SelectDriverFilter').on('change', function () {
        selectedDriver = $(this).find("option:selected").val();

    });


    $('#submitDriver').click(function () {
        if (selectedDriver == "72722") {
            window.location.href = '72722.html';

        } else if (selectedDriver == "74043") {

            window.location.href = '74043.html';
        } else if (selectedDriver == "74015") {

            window.location.href = '74015.html';
        } else if (selectedDriver == "76375") {

            window.location.href = '76375.html';
        } else if (selectedDriver == "16127") {

            window.location.href = '16127.html';
        } else if (selectedDriver == "75058") {

            window.location.href = '75058.html';
        } else if (selectedDriver == "71391") {

            window.location.href = '71391.html';
        } else if (selectedDriver == "71970") {

            window.location.href = '71970.html';
        } else if (selectedDriver == "72868") {

            window.location.href = '72868.html';
        } else if (selectedDriver == "72840") {

            window.location.href = '72840.html';
        } else if (selectedDriver == "75239") {

            window.location.href = '75239.html';
        } else if (selectedDriver == "53148") {

            window.location.href = '53148.html';
        } else if (selectedDriver == "23233") {

            window.location.href = '23233.html';
        } else if (selectedDriver == "75227") {

            window.location.href = '75227.html';
        } else if (selectedDriver == "61653") {

            window.location.href = '61653.html';
        } else if (selectedDriver == "16855") {

            window.location.href = '16855.html';
        }
        else {

            window.location.href = 'reports-driver.html';
        }



    });

    $('#driverlog').selectpicker('refresh');



});


$(function () {

    var selectedVehicleFilter = "";
    $('.SelectVehicleFilter').on('change', function () {
        selectedVehicleFilter = $(this).find("option:selected").val();

        $('#driverlog').empty();
        $('#svcLog').empty();

        $('.SelectDriverFilter').selectpicker('refresh');
        $('.SelectSvcFilter').selectpicker('refresh');

        if (selectedVehicleFilter == "SBS3114L") {

            $('#driverlog').append(
                 $('<option></option>').val("72722").html("72722")
                , $('<option></option>').val("74043").html("74043")
                , $('<option></option>').val("74015").html("74015")
             );

            $('#svcLog').append(
                     $('<option></option>').val("243W").html("243W")
                );


        } else if (selectedVehicleFilter == "SBS3276C") {

            $('#driverlog').append(
                $('<option></option>').val("75239").html("75239")
               , $('<option></option>').val("53148").html("53148")
               , $('<option></option>').val("23233").html("23233")
               , $('<option></option>').val("75227").html("75227")
               , $('<option></option>').val("61653").html("61653")
               , $('<option></option>').val("16855").html("16855")

            );

            $('#svcLog').append(
                     $('<option></option>').val("192").html("192")
                );



        } else if (selectedVehicleFilter == "SBS6048A") {

            $('#driverlog').append(
                $('<option></option>').val("76375").html("76375")
               , $('<option></option>').val("16127").html("16127")
               , $('<option></option>').val("75058").html("75058")
               , $('<option></option>').val("71391").html("71391")
               , $('<option></option>').val("71970").html("71970")
               , $('<option></option>').val("72868").html("72868")
               , $('<option></option>').val("72840").html("72840")
            );

            $('#svcLog').append(
                     $('<option></option>').val("192").html("192")
                );



        } else if (selectedVehicleFilter == "") {

            $('#driverlog').append(
               $('<option></option>').val("72722").html("72722")
              , $('<option></option>').val("74073").html("74073")
              , $('<option></option>').val("74015").html("74015")
              , $('<option></option>').val("76375").html("76375")
              , $('<option></option>').val("16127").html("16127")
              , $('<option></option>').val("75058").html("75058")
              , $('<option></option>').val("71391").html("71391")
              , $('<option></option>').val("71970").html("71970")
              , $('<option></option>').val("72868").html("72868")
              , $('<option></option>').val("72840").html("72840")
              , $('<option></option>').val("75239").html("75239")
              , $('<option></option>').val("53148").html("53148")
              , $('<option></option>').val("23233").html("23233")
              , $('<option></option>').val("75227").html("75227")
              , $('<option></option>').val("61653").html("61653")
              , $('<option></option>').val("16855").html("16855")
           );

            $('#svcLog').append(
                    $('<option></option>').val("").html("Choose one of the following...")
                   , $('<option></option>').val("243W").html("243W")
                  , $('<option></option>').val("192").html("192")
                  , $('<option></option>').val("175").html("175")
               );

        }

        $('.SelectDriverFilter').selectpicker('refresh');
        $('.SelectSvcFilter').selectpicker('refresh');

    });


});




    $(function () {

        var selectedDriverFilter = "";
        $('.SelectDriverFilter').on('change', function () {
            selectedDriverFilter = $(this).find("option:selected").val(); 

            $('#svcLog').empty();

            $('.SelectSvcFilter').selectpicker('refresh');

            if (selectedDriverFilter == "72722") {

                $('#svcLog').append(
                     $('<option></option>').val("243W").html("243W")
                );

            } else if (selectedDriverFilter == "74043") {

                $('#svcLog').append(
                    $('<option></option>').val("243W").html("243W")
                );


            } else if (selectedDriverFilter == "74015") {

                $('#svcLog').append(
                    $('<option></option>').val("243W").html("243W")
                );

            } else if (selectedDriverFilter == "75239") {

                $('#svcLog').append(
                    $('<option></option>').val("192").html("192")
                );

            } else if (selectedDriverFilter == "53148") {

                $('#svcLog').append(
                    $('<option></option>').val("192").html("192")
                );

            }
            else if (selectedDriverFilter == "23233") {

                $('#svcLog').append(
                    $('<option></option>').val("192").html("192")
                );

            }
            else if (selectedDriverFilter == "75227") {

                $('#svcLog').append(
                    $('<option></option>').val("192").html("192")
                );

            }
            else if (selectedDriverFilter == "61653") {

                $('#svcLog').append(
                    $('<option></option>').val("192").html("192")
                );

            }
            else if (selectedDriverFilter == "16855") {

                $('#svcLog').append(
                    $('<option></option>').val("192").html("192")
                );

            } else if (selectedDriverFilter == "76375") {

                $('#svcLog').append(
                    $('<option></option>').val("175").html("175")
                );

            }
            else if (selectedDriverFilter == "16127") {

                $('#svcLog').append(
                    $('<option></option>').val("175").html("175")
                );

            }
            else if (selectedDriverFilter == "75058") {

                $('#svcLog').append(
                    $('<option></option>').val("175").html("175")
                );

            }
            else if (selectedDriverFilter == "71391") {

                $('#svcLog').append(
                    $('<option></option>').val("175").html("175")
                );

            }
            else if (selectedDriverFilter == "71970") {

                $('#svcLog').append(
                    $('<option></option>').val("175").html("175")
                );

            }
            else if (selectedDriverFilter == "72868") {

                $('#svcLog').append(
                    $('<option></option>').val("175").html("175")
                );

            }
            else if (selectedDriverFilter == undefined) {

                $('#svcLog').append(
                    $('<option></option>').val("").html("Choose one of the following...")
                   ,$('<option></option>').val("243W").html("243W")
                  , $('<option></option>').val("192").html("192")
                  , $('<option></option>').val("175").html("175")
               );
            }

            $('.SelectSvcFilter').selectpicker('refresh');

        });

    });


    $(function () {

        var selectedSvcFilter = "";
        $('.SelectSvcFilter').on('change', function () {
            selectedSvcFilter = $(this).find("option:selected").val();

            $('#eventlog').empty();
            $('#driverlog').empty();

            $('.SelectVehicleFilter').selectpicker('refresh');
            $('.SelectDriverFilter').selectpicker('refresh');

            if (selectedSvcFilter == "243W") {

                $('#eventlog').append(
                   $('<option></option>').val("SBS3114L").html("SBS3114L")
               );

                $('#driverlog').append(
                    $('<option></option>').val("72722").html("72722")
                   , $('<option></option>').val("74043").html("74043")
                   , $('<option></option>').val("74015").html("74015")
                );

            } else if (selectedSvcFilter == "192") {

                $('#eventlog').append(
                  $('<option></option>').val("SBS3276C").html("SBS3276C")
              );

                $('#driverlog').append(
                    $('<option></option>').val("75239").html("75239")
                   , $('<option></option>').val("53148").html("53148")
                   , $('<option></option>').val("23233").html("23233")
                   , $('<option></option>').val("75227").html("75227")
                   , $('<option></option>').val("61653").html("61653")
                   , $('<option></option>').val("16855").html("16855")

                );


            } else if (selectedSvcFilter == "175") {

                $('#eventlog').append(
                  $('<option></option>').val("SBS6048A").html("SBS6048A")
              );

                $('#driverlog').append(
                   $('<option></option>').val("76375").html("76375")
                  , $('<option></option>').val("16127").html("16127")
                  , $('<option></option>').val("75058").html("75058")
                  , $('<option></option>').val("71391").html("71391")
                  , $('<option></option>').val("71970").html("71970")
                  , $('<option></option>').val("72868").html("72868")
                  , $('<option></option>').val("72840").html("72840")
               );


            } else if (selectedSvcFilter == "") {

                $('#eventlog').append(
                     $('<option></option>').val("").html("All")
                    ,$('<option></option>').val("SBS3114L").html("SBS3114L")
                   , $('<option></option>').val("SBS3276C").html("SBS3276C")
                , $('<option></option>').val("SBS6048A").html("SBS6048A")
              );

                $('#driverlog').append(
                  $('<option></option>').val("72722").html("72722")
                 , $('<option></option>').val("74043").html("74043")
                 , $('<option></option>').val("74015").html("74015")
                 , $('<option></option>').val("76375").html("76375")
                 , $('<option></option>').val("16127").html("16127")
                 , $('<option></option>').val("75058").html("75058")
                 , $('<option></option>').val("71391").html("71391")
                 , $('<option></option>').val("71970").html("71970")
                 , $('<option></option>').val("72868").html("72868")
                 , $('<option></option>').val("72840").html("72840")
                 , $('<option></option>').val("75239").html("75239")
                 , $('<option></option>').val("53148").html("53148")
                 , $('<option></option>').val("23233").html("23233")
                 , $('<option></option>').val("75227").html("75227")
                 , $('<option></option>').val("61653").html("61653")
                 , $('<option></option>').val("16855").html("16855")
              );
            }

            $('.SelectVehicleFilter').selectpicker('refresh');
            $('.SelectDriverFilter').selectpicker('refresh');

        });

    });

