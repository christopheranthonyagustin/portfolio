


//BC Performance Table
$(document).ready(function () {



        $('.loading').show();
        $('.loader').show();
	
		var depolist = [];
		var wifiDepoList = [];
		
		//System Info
		$.getJSON("http://172.16.10.110/sbswebapi/api/SystemService", function (data) {
			var value = JSON.stringify(data).replace(/[^a-zA-Z ]/g, "");
			document.getElementById("systemStatus").innerHTML = value;
			if(value == "System Service is Offline"){
				document.getElementById("SystemStatus").style.backgroundColor  = "#dc3545";
			} else if(value == "System Service is Online"){
				document.getElementById("SystemStatus").style.backgroundColor  = "#28a745";
			}
		});
		
		
		$.getJSON("http://172.16.10.110/sbswebapi/api/depotinfo", function (data) {
			$.each(data, function (index, item) {
				$.getJSON("http://172.16.10.110/sbswebapi/api/SystemDepoWifi?param="+item.DepotID, function (value) {
						var value = JSON.stringify(value).replace(/[^a-zA-Z ]/g, "");
						var currentWifiDepoArray = [item.DepotID,item.Name,value]; 
						wifiDepoList.push(currentWifiDepoArray);
				}).complete(function() {
						if(wifiDepoList.length == 6){
						//Data Table
						$("#SystemDiagnostic").DataTable({
							"destroy": true,
							"scrollCollapse": true,
							"searching": true,
							"order": [[0, 'asc']],
							"bPaginate": false,
							"bLengthChange": false,
							"bFilter": true,
							"bInfo": false,
							"dom": '<"floatRight"B><"top"l>rti<"bottom"p><"clear">',
							"language": {
								"lengthMenu": "Display _MENU_ events per page",
								"zeroRecords": "Nothing found - sorry",
								"info": "Showing page _PAGE_ of _PAGES_",
								"infoEmpty": "No events available",
								"infoFiltered": "(filtered from _MAX_ total events)"
							},
							"buttons": [
								  'copy', 'csv', 'excel', 'pdf', 'print', 'colvis'
							],
							"columns": [
								{ title: "Depo ID" },
								{ title: "Depo Name" },
								{ title: "Wifi Diagnostic"}
							],
							"columnDefs": [
								{
									"targets": 0,
									"visible": true,
									"searchable": true
								},
								{
									"targets": 1,
									"visible": true,
									"searchable": true,
									"orderable": false,
								},
								{
									"targets": 2,
									"visible": true,
									"searchable": true
								}
								],
							"data": wifiDepoList,
							"initComplete": function (data, type) {
								if (type != 0) {
									//Set
									$('.tableClass').show();
									$('.loading').hide();
									$('.loader').hide();
								}
								else {
									$('.tableClass').hide();
									$('.loading').hide();
									$('.loader').hide();
								}
							},
							"fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
								if ( aData[2] == "Major Wifi Failure" )
								{
									$('td', nRow).css('background-color', '#dc3545');
									$('td', nRow).css('color', 'white');
								}
								else if ( aData[2] == "Partial Wifi Failure" )
								{
									$('td', nRow).css('background-color', '#ffc107');
									$('td', nRow).css('color', 'white');
								} else if ( aData[2] == "Depo Wifi working " )
								{
									$('td', nRow).css('background-color', '#28a745');
									$('td', nRow).css('color', 'white');
								}
							}
						});
						}
				});	
			});
		});

});

	