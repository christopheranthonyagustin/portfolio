<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSRPWSearch.aspx.cs" Inherits="iWMS.Web.Job.TMSResourcePlanningWorkbench.TMSRPWSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>JOCWSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css" integrity="sha512-Z/def5z5u2aR89OuzYcxmDJ0Bnd5V1cKqBEbvLOiUNWdg9PQeXVvXLI90SE4QOHGlfLqUnDNVAYyZi8UwUTmWQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.11.5/main.min.css" rel="stylesheet" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.min.js" integrity="sha512-fHY2UiQlipUq0dEabSM4s+phmn+bcxSYzXP4vAXItBvBHU7zAM/mkhCZjtBEIJexhOMzZbgFlPLuErlJF2b+0g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.11.5/main.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.8/index.global.min.js"></script>

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }

        #calendar {
            width: 90% !important;
            height: 100% !important;
            margin: 0px 6% !important;
            padding: 20px 50px !important;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
            border: 1px solid #ccc;
        }

        .fc-header {
            background-color: #337ab7;
            color: #fff;
            padding: 15px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

            .fc-header h2 {
                font-size: 24px;
                margin: 0;
            }

        .fc-prev-button,
        .fc-next-button {
            background-color: transparent;
            color: #fff;
            border: none;
            font-size: 18px;
            cursor: pointer;
        }

            .fc-prev-button:hover,
            .fc-next-button:hover {
                background-color: #0876c4;
            }

        .fc-prev-button {
            background: rgb(5,83,140);
        }

        .fc-next-button {
            background: rgb(5,83,140);
        }

        .fc-button-primary {
            background-color: #337ab7;
            color: #fff;
            border: none;
            border-radius: 3px;
            padding: 6px 12px;
            font-size: 14px;
            cursor: pointer;
        }

            .fc-button-primary:hover {
                background-color: #286090;
            }

        .fc-button-group {
            margin-right: 10px;
        }

        .fc-day-grid-event {
            background-color: #9E9306;
            border: none;
            color: #fff;
            padding: 5px;
            font-size: 12px;
            border-radius: 3px;
            cursor: pointer;
        }

            .fc-day-grid-event:hover {
                background-color: #5AB007;
            }

        .fc-resource-cell {
            background-color: #337ab7;
            color: #fff;
            padding: 10px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            font-size: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex: 1; /* Allow the cell to grow or shrink based on content */
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .fc-daygrid-day-events {
            border: 1px solid #ccc; /* Add borders around the event showing place for each day */
            border-top: none;
            background-color: #f9f9f9;
            padding: 2px;
            border-left: 1px solid #ccc; /* Add a left border to separate days */
        }

        .fc-event {
            background-color: #9E9306;
            border: none;
            color: #fff;
            padding: 5px;
            font-size: 12px;
            border-radius: 3px;
            cursor: pointer;
            margin: 2px 0;
        }

        .fc-event-title {
            font-weight: bold;
        }

        .fc-widget-header.fc-day-header {
            padding: 15px;
            background-color: #05538C;
        }

        .fc-popover .fc-header {
            background: #029922 !important;
        }

        .fc-unthemed .fc-popover .fc-header .fc-close {
            color: #fff;
        }

        .fc-toolbar {
            margin: 5px 0px;
        }

        .fc-unthemed .fc-content, .fc-unthemed .fc-divider, .fc-unthemed .fc-list-heading td, .fc-unthemed .fc-list-view, .fc-unthemed .fc-row, .fc-unthemed tbody, .fc-unthemed td, .fc-unthemed th, .fc-unthemed thead {
            border-color: #a6a6a6;
        }

        .fc-more {
            background-color: #0CB095;
            color: #fff;
            padding: 3px 5px;
            border-radius: 4px;
            text-decoration: none !important;
        }

            .fc-more:hover {
                color: white;
                background: #0275C7;
            }

        .fc-more-popover {
            background-color: #fff;
            color: #333;
            border: 1px solid #ccc;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

            .fc-more-popover .fc-header {
                background-color: #337ab7;
                color: #fff;
                padding: 10px;
            }

            .fc-more-popover .fc-body {
                padding: 10px;
            }

            .fc-more-popover .fc-event {
                margin-bottom: 5px;
            }

            .fc-more-popover .fc-event-title {
                font-weight: bold;
            }

            .fc-more-popover .fc-event-time {
                font-style: italic;
            }

        .fc-slats {
            display: none;
        }

        hr.fc-divider.fc-widget-header {
            display: none !important;
        }

        .fc-timegrid .fc-daygrid-day-number {
            display: none; /* Hide the day number */
        }

        .fc-timegrid .fc-daygrid-day-top {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .fc-timegrid .fc-daygrid-day-person {
            font-weight: bold; /* Optionally style the person's name */
        }

        .fc-timegrid .fc-event {
            border-radius: 0; /* Optionally adjust the event style */
        }

        div#HeaderRadPageView {
            height: 100% !important;
        }

        .fc-license-message {
            display: none;
        }

        .modal-content,
        .modal-title,
        .modal-body {
            font-size: 16px;
        }

        /* Adjust modal popup size */
        .modal-dialog {
            max-width: 700px; /* Set the desired max-width for the modal popup */
        }

        a.fc-timeline-slot-cushion.fc-scrollgrid-sync-inner {
            text-decoration: none;
            color: white;
        }

        .fc-direction-ltr .fc-timeline-event.fc-event-end {
            margin: 3px 8px;
        }
    </style>
</head>
<body onload=' displayRow("table1");' bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Job Calendar View" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />

                <div id="calendar"></div>

                <div class="modal" id="eventDetailsModal" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header px-4">
                                <h5 class="modal-title">Event Details</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body px-4" id="eventDetails">
                                <!-- Event details will be dynamically inserted here -->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-lg btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <script type="text/javascript">
            function initializeCalendar() {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    headerToolbar: {
                        start: 'prev,next',
                        center: 'title',
                        end: 'today',
                    },
                    initialView: 'resourceTimelineWeek', // Set the default view to resourceTimelineWeek
                    // Set the slotDuration to 24 hours (1 day) to show all events for each day
                    slotDuration: '24:00:00',
                    // Set slotLabelInterval to 1 (1 day, a multiple of slotDuration)
                    slotLabelInterval: { days: 1 },
                    // Adjust the visibleRange to show events for the entire week
                    visibleRange: {
                        start: moment().startOf('week').format('YYYY-MM-DD'),
                        end: moment().endOf('week').format('YYYY-MM-DD')
                    },
                    events: function (fetchInfo, successCallback, failureCallback) {
                        // Fetch the event data using AJAX
                        $.ajax({
                            type: 'POST',
                            url: 'TMSRPWSearch.aspx/GetEventData',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            success: function (response) {
                                // Parse the JSON response and pass the events data to FullCalendar
                                var eventData = JSON.parse(response.d);
                                var resources = eventData.Resources;
                                var events = eventData.Events;
                                successCallback(events);
                                // Set the resources (person names)
                                calendar.setOption('resources', resources);
                                // Update the resource area to show person names
                                calendar.refetchResources();
                            },
                            error: function (error) {
                                failureCallback(error);
                            }
                        });
                    },
                    eventTimeFormat: {
                        hour: 'numeric',
                        minute: '2-digit',
                        omitZeroMinute: false,
                        meridiem: 'short'
                    },
                    slotLabelFormat: {
                        weekday: 'long',
                        day: 'numeric',
                        omitCommas: true
                    },
                    resourcesInitiallyExpanded: false,
                    resourceAreaWidth: '120',
                    viewDidMount: function (arg) {
                        // Check if the view is resourceTimelineWeek (change this based on your desired view)
                        if (arg.view.type === 'resourceTimelineWeek') {
                            var resourceColumnHeader = calendar.el.querySelector('.fc-datagrid-cell-main');
                            if (resourceColumnHeader) {
                                resourceColumnHeader.innerText = 'Person '; // Replace 'Resources' with 'Persons'
                            }
                        }
                    },
                });

                var eventDetailsModal = new bootstrap.Modal(document.getElementById("eventDetailsModal"));
                var eventDetails = document.getElementById("eventDetails");

                calendar.setOption('eventClick', function (info) {
                    // When an event is clicked, show the modal and display event details
                    var event = info.event;
                    var title = event.title;
                    var start = event.start;
                    var end = event.end;
                    var description = event.extendedProps.description;
                    var todo = event.extendedProps.todo;

                    // You can add more event-related data as needed

                    var eventDetailsHTML = `
                        <h3 class="mb-3 text-danger"><strong>${title}</strong></h3>
                        <p><strong>Start:</strong> ${start}</p>
                        <p><strong>End:</strong> ${end}</p>
                        <p><strong>Description:</strong> ${description}</p>
                        <p><strong>To-Do:</strong> ${todo}</p>
                        <!-- Add more event-related data here as needed -->
                    `;

                    eventDetails.innerHTML = eventDetailsHTML;
                    eventDetailsModal.show();
                });

                calendar.render();
            }

            document.addEventListener('DOMContentLoaded', initializeCalendar);
        </script>
    </form>
</body>
</html>

