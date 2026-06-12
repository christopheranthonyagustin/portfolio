$(document).ready(function () {
        var uri = "http://103.237.168.119/fmswebapi/api/assetinfo";
//        $('<tr><td>' + "Dante" + '</td><td>' + "Device01" + '</td><td>' + "Mileage" + '</td></tr>').appendTo('#tblbodydata');
        //jQuery.support.cors = true;
        $.ajax({
            url: uri,
            type: 'GET',
            cache: false,
            contentType: "application/json",
            success: function (data) {
                if (data.length > 0) {
                    $.each(data, function (key, item) {
                        $('<tr><td>' + item.Name + '</td><td>' + item.Tag + '</td><td>' + item.Mileage + '</td></tr>').appendTo('#tblbodydata');
                    });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                /*alert(xhr.status);
                alert(xhr.resoponseText);
                alert(ajaxOptions);
                alert(thrownError);
                alert("error occured..");*/
            }
        });
      // Send an AJAX request
      /*$.getJSON(uri)
          .done(function (data) {
            // On success, 'data' contains a list of products.
            $.each(data, function (key, item) {
              // Add a list item for the product.
//              $('<li>', { text: formatItem(item) }).appendTo($('#demo-dt-basic'));
                $('<tr><td>' + item.Name + '</td><td>' + item.Tag + '</td><td>' + item.Mileage + '</td></tr>').appendTo('#tblbodydata');
            });
          });*/
    });

       /* <tr>
            <td>Garrett Winters</td>
            <td>Accountant</td>
            <td>Tokyo</td>
            <td>63</td>
            <td>2011/07/25</td>
            <td>$170,750</td>
        </tr>
            */
    function formatItem(item) {
      return item.Name + ': $' + item.Tag;
    }

    function find() {
      var id = $('#prodId').val();
      $.getJSON(uri + '/' + id)
          .done(function (data) {
            $('#product').text(formatItem(data));
          })
          .fail(function (jqXHR, textStatus, err) {
            $('#product').text('Error: ' + err);
          });
    }