$(document).ready(function () {

    // BOOTBOX - ZOOM IN/OUT ANIMATION
    // =================================================================
    // Require Bootbox
    // http://bootboxjs.com/
    //
    // Animate.css
    // http://daneden.github.io/animate.css/
    // =================================================================
    $('#load-version').on('click', function () {


        $.ajax({
            type: "GET",
            url: "data/version.txt",
            async: false,
            dataType: "text",
            success: function (data) {
          
           //Then retrieve
           version = localStorage.getItem('setLocalstorageValueVersion');
      

            },
            error: function () { alert('error'); }
        });


        //Then retrieve
        var version;

        $.ajax({
            url: "version.txt",
            dataType: "text",
            success: function (data) {

                document.getElementById("load-ver").value = data;


            }
        });


        bootbox.dialog({
            title: "เกี่ยวกับ ราง",
            message: '<div class="media"><div class="media-left"><img class="media-object" src="img/logo.png" alt="Version" style="width:150px;"></div><div class="media-body"><h4 class="text-thin"><strong>เส้นศูนย์สูตร</strong> - กองทัพเรือ ระบบการจัดการ</h4>เวอร์ชัน&nbsp;' + version + '</div></div><br />' + '<div><textarea id="load-ver" name="load-ver" rows="7" cols="73" class="text-dark text-thin"></textarea></div>',
            callback: function (result) {
                //Callback function here
            },
            animateIn: 'zoomInDown',
            animateOut: 'zoomOutUp'
        });




    });


    $('#load-versionEN').on('click', function () {

        $.ajax({
            type: "GET",
            url: "data/version.txt",
            async: false,
            dataType: "text",
            success: function (data) {

                
            //Then retrieve
            version = localStorage.getItem('setLocalstorageValueVersion');


            },
            error: function () { alert('error'); }
        });

        //Then retrieve
        var version;

        $.ajax({
            url: "version.txt",
            dataType: "text",
            success: function (data) {
                document.getElementById("load-ver").value = data;

            },
            error: function () { alert('error'); }
        });

        bootbox.dialog({
            title: "About TRACK",
            message: '<div class="media"><div class="media-left"><img class="media-object" src="img/logo.png" alt="Version" style="width:150px;"></div><div class="media-body"><h4 class="text-thin"><strong>TRACK</strong> - Pest Control Management System</h4>version&nbsp;' + version + '</div></div><br />' + '<div><textarea id="load-ver" name="load-ver" rows="7" cols="73" class="text-dark text-thin"></textarea></div>',
            callback: function (result) {
                //Callback function here
            },
            animateIn: 'zoomInDown',
            animateOut: 'zoomOutUp'
        });

    

    });



    // BOOTBOX - CUSTOM HTML CONTENTS
    // =================================================================
    // Require Bootbox
    // http://bootboxjs.com/
    // =================================================================
    $('#load-version2').on('click', function () {
        bootbox.dialog({
            title: "That html",
            message: '<div class="media"><div class="media-left"><img class="media-object img-lg img-circle" src="img/av3.png" alt="Profile picture"></div><div class="media-body"><h4 class="text-thin">You can also use <strong>html</strong></h4>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</div></div>',
            buttons: {
                confirm: {
                    label: "Save"
                }
            }
        });
    });






    // BOOTBOX - BOUNCE IN/OUT ANIMATION
    // =================================================================
    // Require Bootbox
    // http://bootboxjs.com/
    //
    // Animate.css
    // http://daneden.github.io/animate.css/
    // =================================================================
    $('#load-version4').on('click', function () {
        bootbox.confirm({
            message: "<h4 class='text-thin'>Bounce</h4><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>",
            buttons: {
                confirm: {
                    label: "Save"
                }
            },
            callback: function (result) {
                //Callback function here
            },
            animateIn: 'bounceIn',
            animateOut: 'bounceOut'
        });
    });



    // BOOTBOX - RUBBERBAND & WOBBLE ANIMATION
    // =================================================================
    // Require Bootbox
    // http://bootboxjs.com/
    //
    // Animate.css
    // http://daneden.github.io/animate.css/
    // =================================================================
    $('#load-version5').on('click', function () {
        bootbox.confirm({
            message: "<h4 class='text-thin'>RubberBand & Wobble</h4><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>",
            buttons: {
                confirm: {
                    label: "Save"
                }
            },
            callback: function (result) {
                //Callback function here
            },
            animateIn: 'rubberBand',
            animateOut: 'wobble'
        });
    });



    // BOOTBOX - FLIP IN/OUT ANIMATION
    // =================================================================
    // Require Bootbox
    // http://bootboxjs.com/
    //
    // Animate.css
    // http://daneden.github.io/animate.css/
    // =================================================================
    $('#load-version6').on('click', function () {
        bootbox.confirm({
            message: "<h4 class='text-thin'>Flip</h4><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>",
            buttons: {
                confirm: {
                    label: "Save"
                }
            },
            callback: function (result) {
                //Callback function here
            },
            animateIn: 'flipInX',
            animateOut: 'flipOutX'
        });
    });



    // BOOTBOX - LIGHTSPEED IN/OUT ANIMATION
    // =================================================================
    // Require Bootbox
    // http://bootboxjs.com/
    //
    // Animate.css
    // http://daneden.github.io/animate.css/
    // =================================================================
    $('#load-version7').on('click', function () {
        bootbox.confirm({
            message: "<h4 class='text-thin'>Light Speed</h4><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>",
            buttons: {
                confirm: {
                    label: "Save"
                }
            },
            callback: function (result) {
                //Callback function here
            },
            animateIn: 'lightSpeedIn',
            animateOut: 'lightSpeedOut'
        });
    });



    // BOOTBOX - SWING & HINGE IN/OUT ANIMATION
    // =================================================================
    // Require Bootbox
    // http://bootboxjs.com/
    //
    // Animate.css
    // http://daneden.github.io/animate.css/
    // =================================================================
    $('#load-version8').on('click', function () {
        bootbox.confirm({
            message: "<h4 class='text-thin'>Swing & Hinge</h4><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>",
            buttons: {
                confirm: {
                    label: "Save"
                }
            },
            callback: function (result) {
                //Callback function here
            },
            animateIn: 'swing',
            animateOut: 'hinge'
        });
    });


})