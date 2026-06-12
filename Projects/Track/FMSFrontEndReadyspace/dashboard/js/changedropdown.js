 $("select").change(function () {
     // hide all optional elements
     $('.optional').css('display', 'none');

     $("select option:selected").each(function () {
         if ($(this).val() == "mileage") {
             $('.mileage').css('display', 'block');
         }

         else if ($(this).val() == "limits") {
             $('.limits').css('display', 'block');
         }

         else if ($(this).val() == "zones") {
             $('.zones').css('display', 'block');
         }

     });
 });