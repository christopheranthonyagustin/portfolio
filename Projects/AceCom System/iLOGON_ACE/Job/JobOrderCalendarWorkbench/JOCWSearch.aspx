<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JOCWSearch.aspx.cs" Inherits="iWMS.Web.Job.JobOrderCalendarWorkbench.JOCWSearch" %>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css" integrity="sha512-liDnOrsa/NzR+4VyWQ3fBzsDBzal338A1VfUpQvAcdt+eL88ePCOd3n9VQpdA0Yxi4yglmLy/AmH+Lrzmn0eMQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }

        #calendar {
            width: 81% !important;
            height: 140% !important;
            margin: 0px 9% !important;
            padding: 20px 120px !important;
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

        @media (max-width: 900px) {
            #calendar {
                height: 100%;
            }
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

                <telerik:RadDropDownList ID="JOCWDDL" CssClass="my-dropdown" runat="server" DataTextField="Descr" DataValueField="Item"
                    AutoPostBack="false" Skin="WebBlue"
                    Style="width: 220px; margin-bottom: 25px; margin-left: 9%; border-radius: 5px; font-size: 15px;" />

                <div id="calendar">
                    <asp:TextBox ID="txtDate" runat="server" Style="display: none;"></asp:TextBox>
                </div>

                <!-- Event Modal -->
                <div id="eventModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Job Order Details</h4>
                            </div>
                            <div class="modal-body">
                                <p id="pjoborderno"><strong>Job Order No:</strong> <span id="joborderno"></span></p>
                                <p id="paccountno"><strong>Account No:</strong> <span id="accountno"></span></p>
                                <p id="paccountname"><strong>Account Name:</strong> <span id="accountname"></span></p>
                                <p id="pcustomerref"><strong>Customer Reference:</strong> <span id="customerref"></span></p>
                                <p id="pprojectno"><strong>Project No:</strong> <span id="projectno"></span></p>
                                <p id="pfromexpecteddate"><strong>From Expected Date:</strong> <span id="fromexpecteddate"></span></p>
                                <p id="ptoexpecteddate"><strong>To Expected Date:</strong> <span id="toexpecteddate"></span></p>
                                <p id="psitesurveryorname"><strong>Site Surveryor Name:</strong> <span id="sitesurveryorname"></span></p>
                                <p id="psitesurveryoraddress"><strong>Site Surveryor Address:</strong> <span id="sitesurveryoraddress"></span></p>
                                <p id="psitesurveydate"><strong>Site Survey Date & Time:</strong> <span id="sitesurveydate"></span></p>
                                <p id="ppaymentterms"><strong>Payment Terms:</strong> <span id="paymentterms"></span></p>
                                <p id="pquotationno"><strong>Quotation No:</strong> <span id="quotationno"></span></p>
                                <p id="porderdate"><strong>Order Date:</strong> <span id="orderdate"></span></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <script type="text/javascript">
            $(document).ready(function () {
                getEventsFromServer('current', 'OverviewByExpDate');

                var JOCWValue = "ExpDate";
                $find("<%= JOCWDDL.ClientID %>").add_selectedIndexChanged(function (sender, eventArgs) {
                    var selectedItem = sender.get_selectedItem();
                    JOCWValue = selectedItem.get_value();
                    if (JOCWValue == "SurveyDate") {
                        getEventsFromServer('changecurrent', 'OverviewBySurveyDate');
                    } else if (JOCWValue == "ExpDate") {
                        getEventsFromServer('changecurrent', 'OverviewByExpDate');
                    }
                    else {
                        alert("Please Select Action!");
                    }
                });

                // Initialize FullCalendar
                $('#calendar').fullCalendar({
                    header: {
                        left: 'customPrevButton,customNextButton customTodayButton',
                        center: 'title',
                        right: 'month,agendaDay'
                    },
                    // Add custom buttons
                    customButtons: {
                        customPrevButton: {
                            text: '<',
                            click: function () {
                                var currentView = $('#calendar').fullCalendar('getView').type;
                                if (JOCWValue == 'SurveyDate') {
                                    if (currentView === 'month') {
                                        var currentDate = moment($('#txtDate').val());
                                        currentDate.subtract(1, 'months');
                                        $('#txtDate').val(currentDate.startOf('month').format('YYYY-MM-DD'));
                                        $('#calendar').fullCalendar('prev');
                                        getEventsFromServer('prev', 'OverviewBySurveyDate');
                                    } else {
                                        var currentDate = moment($('#txtDate').val());
                                        currentDate.subtract(1, 'days');
                                        $('#txtDate').val(currentDate.format('YYYY-MM-DD'));
                                        $('#calendar').fullCalendar('prev');
                                        getEventsFromServer('prev', 'OverviewBySurveyDate');
                                    }
                                } else if (JOCWValue == "ExpDate") {
                                    if (currentView === 'month') {
                                        var currentDate = moment($('#txtDate').val());
                                        currentDate.subtract(1, 'months');
                                        $('#txtDate').val(currentDate.startOf('month').format('YYYY-MM-DD'));
                                        $('#calendar').fullCalendar('prev');
                                        getEventsFromServer('prev', 'OverviewByExpDate');
                                    } else {
                                        var currentDate = moment($('#txtDate').val());
                                        currentDate.subtract(1, 'days');
                                        $('#txtDate').val(currentDate.format('YYYY-MM-DD'));
                                        $('#calendar').fullCalendar('prev');
                                        getEventsFromServer('prev', 'OverviewByExpDate');
                                    }
                                }
                                else {
                                    alert("Please Select Action!");
                                }
                            }
                        },
                        customNextButton: {
                            text: '>',
                            click: function () {
                                var currentView = $('#calendar').fullCalendar('getView').type;
                                if (JOCWValue == 'SurveyDate') {
                                    if (currentView === 'month') {
                                        var currentDate = moment($('#txtDate').val());
                                        currentDate.add(1, 'months');
                                        $('#txtDate').val(currentDate.startOf('month').format('YYYY-MM-DD'));
                                        $('#calendar').fullCalendar('gotoDate', currentDate);
                                        getEventsFromServer('next', 'OverviewBySurveyDate');
                                    } else {
                                        var currentDate = moment($('#txtDate').val());
                                        currentDate.add(1, 'days');
                                        $('#txtDate').val(currentDate.format('YYYY-MM-DD'));
                                        $('#calendar').fullCalendar('gotoDate', currentDate);
                                        getEventsFromServer('next', 'OverviewBySurveyDate');
                                    }
                                } else if (JOCWValue == "ExpDate") {
                                    if (currentView === 'month') {
                                        var currentDate = moment($('#txtDate').val());
                                        currentDate.add(1, 'months');
                                        $('#txtDate').val(currentDate.startOf('month').format('YYYY-MM-DD'));
                                        $('#calendar').fullCalendar('gotoDate', currentDate);
                                        getEventsFromServer('next', 'OverviewByExpDate');
                                    } else {
                                        var currentDate = moment($('#txtDate').val());
                                        currentDate.add(1, 'days');
                                        $('#txtDate').val(currentDate.format('YYYY-MM-DD'));
                                        $('#calendar').fullCalendar('gotoDate', currentDate);
                                        getEventsFromServer('next', 'OverviewByExpDate');
                                    }
                                }
                                else {
                                    alert("Please Select Action!");
                                }
                            }
                        },
                        customTodayButton: {
                            text: 'Today',
                            click: function () {
                                var date = new Date();
                                var year = date.getFullYear();
                                var month = ('0' + (date.getMonth() + 1)).slice(-2); // Adding 1 because months are zero-based
                                var day = ('0' + date.getDate()).slice(-2);
                                var currentDate = year + '-' + month + '-' + day;
                                $('#txtDate').val(currentDate);
                                $('#calendar').fullCalendar('today');
                                if (JOCWValue == 'SurveyDate') {
                                    getEventsFromServer('current', 'OverviewBySurveyDate');
                                }
                                else if (JOCWValue == "ExpDate") {
                                    getEventsFromServer('current', 'OverviewByExpDate');
                                }
                                else {
                                    alert("Please Select Action!");
                                }
                            }
                        },
                    },
                    navLinks: true,
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events,
                    eventDurationEditable: false,
                    eventRender: function (event, element) {
                        var color = event.color;

                        element.css('background-color', color);

                        if ($('#calendar').fullCalendar('getView').type === 'month') {
                            element.find('.fc-title').text(event.title);
                        }
                    },
                    eventClick: function (calEvent, jsEvent, view) {
                        var eventData = calEvent.extendedProps;
                        //console.log(eventData)
                        //console.log(calEvent)
                        
                        // Show event details in a modal popup
                        if (eventData.returnAction == "OverviewByExpDate") {
                            $('#joborderno').text(calEvent.title);
                            $('#accountname').text(eventData.accountName);
                            $('#fromexpecteddate').text(moment(calEvent.start).format('YYYY-MM-DD'));
                            $('#toexpecteddate').text(moment(calEvent.end).subtract(1, 'days').format('YYYY-MM-DD'));
                            $('#projectno').text(eventData.projectNo);
                            $('#orderdate').text(moment(eventData.orderDate).format('YYYY-MM-DD'));
                            $('#customerref').text(eventData.customerReference);
                            $('#paymentterms').text(eventData.paymentTerms);
                            $('#quotationno').text(eventData.quotationNo);
                            $('#ppaymentterms').show();
                            $('#pquotationno').show();
                            $('#paccountname').show();
                            $('#psitesurveydate').hide();
                            $('#psitesurveryorname').hide();
                            $('#psitesurveryoraddress').hide();
                            $('#paccountno').hide();
                            $('#eventModal').modal('show');
                        }
                        else if (eventData.returnAction == "OverviewBySurveyDate") {
                            $('#joborderno').text(calEvent.title);
                            $('#accountno').text(eventData.accountNo);
                            $('#accountname').text(eventData.accountName);
                            $('#sitesurveydate').text(eventData.siteSurveyDate);
                            if (eventData.frDate != null) {
                                $('#fromexpecteddate').text(moment(eventData.frDate).format('YYYY-MM-DD'));
                            } else {
                                $('#fromexpecteddate').text('NULL');
                            }
                            if (eventData.frDate != null) {
                                $('#toexpecteddate').text(moment(eventData.toDate).subtract(1, 'days').format('YYYY-MM-DD'));
                            } else {
                                $('#toexpecteddate').text('NULL');
                            }
                            $('#projectno').text(eventData.projectNo);
                            $('#sitesurveryorname').text(eventData.siteSurveryorName);
                            $('#sitesurveryoraddress').text(eventData.siteSurveryorAddress);
                            $('#orderdate').text(moment(eventData.orderDate).format('YYYY-MM-DD'));
                            $('#customerref').text(eventData.customerReference);
                            $('#eventDescription').text(calEvent.description);
                            $('#pjoborderstatus').show();
                            $('#pprojectno').show();
                            $('#psitesurveryorname').show();
                            $('#psitesurveryoraddress').show();
                            $('#paccountno').show();
                            $('#paccountname').show();
                            $('#pcustomername').show();
                            $('#psitesurveydate').show();
                            $('#ppaymentterms').hide();
                            $('#pquotationno').hide();
                            $('#eventModal').modal('show');
                        }
                        
                    },
                    views: {
                        // customize the day view
                        day: {
                            // Set the duration of each slot to 24 hours (1 day)
                            slotDuration: '24:00:00',
                            // Format the slot labels to show only the date
                            slotLabelFormat: 'MMM D',
                        }
                    }
                });

                // Function to make AJAX request to the server-side code
                function getEventsFromServer(status, action) {
                    var currentDate = $('#txtDate').val();
                    $.ajax({
                        type: 'POST',
                        url: 'JOCWSearch.aspx/GetEvents',
                        data: JSON.stringify({ status: status, action: action, date: currentDate }),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            var events = JSON.parse(data.d).map(function (event) {
                                /*console.log(event)*/
                                var endDate = moment(event.ToExpectedDate).add(1, 'days').format('YYYY-MM-DD');
                                if (event.ReturnAction == "OverviewByExpDate") {
                                    return {
                                        title: event.JobOrderNo,
                                        start: event.FromExpectedDate,
                                        end: endDate,
                                        color: event.JobOrderStatusColor,
                                        extendedProps: {
                                            projectNo: event.ProjectNo,
                                            accountName: event.AccountName,
                                            paymentTerms: event.PaymentTerms,
                                            quotationNo: event.QuotationNo,
                                            orderDate: event.OrderDate,
                                            customerReference: event.CustomerReference,
                                            returnAction: event.ReturnAction
                                        }
                                    };
                                } else {
                                    return {
                                        title: event.JobOrderNo,
                                        start: event.FromExpectedDate,
                                        end: endDate,
                                        description: event.JobOrderDescription,
                                        color: event.JobOrderStatusColor,
                                        extendedProps: {
                                            orderDate: event.OrderDate,
                                            projectNo: event.ProjectNo,
                                            siteSurveryorName: event.SiteSurveryorName,
                                            siteSurveryorAddress: event.SiteSurveryorAddress,
                                            customerReference: event.CustomerReference,
                                            frDate: event.Frdate,
                                            toDate: event.Todate,
                                            accountNo: event.AccountNo,
                                            accountName: event.AccountName,
                                            siteSurveyDate: event.SiteSurveyDate,
                                            returnAction: event.ReturnAction
                                        }
                                    };
                                }
                            });

                            console.log(events)

                            $('#calendar').fullCalendar('removeEvents'); // Remove existing events
                            $('#calendar').fullCalendar('addEventSource', events); // Add new events
                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });
                }
            });

        </script>

    </form>
</body>
</html>
