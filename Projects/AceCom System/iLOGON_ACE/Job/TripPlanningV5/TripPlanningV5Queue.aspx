<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV5Queue.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV5.TripPlanningV5Queue" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TripPlanningV5Queue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }

        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .btn1:hover {
                background: #6885ca;
            }

        .column {
            float: left;
            width: 63.33%;
        }

        .columns {
            float: left;
            width: 85%;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        .BigCheckBox input {
            width: 30px;
            height: 20px;
            float: right;
        }
    </style>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function CheckAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <div class="row">
            <div class="column">
                <table border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <td>
                            <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Label ID="frdatelbl" runat="server" Text="Date"> 
                            </asp:Label>
                            <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="120"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                OnSelectedDateChanged="FromDateTxt_SelectedDateChanged" AutoPostBack="true">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" />

                        </td>
                        <td>
                            <br />  
                            <asp:Label ID="LicenseNameLbl" runat="server" Visible="false"></asp:Label>
                            &nbsp;&nbsp;
                        <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                            Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        <asp:Button ID="excelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
                            UseSubmitBehavior="false" Width="78px" Height="30px" />
                         <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                             Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                         <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click"
                             Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                            Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                            Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                         <asp:Button ID="PODBtn" runat="server" CssClass="white" OnClick="PODBtn_Click"
                             Text="POD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                            <asp:Button ID="ChargeBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                                OnClick="ChargeBtn_Click" Text="Charge" />
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="AllRidesBtn" runat="server" CssClass="white" Text="AllTrips" OnClick="AllRidesBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        <asp:Button ID="UnpairBtn" runat="server" CssClass="white" Text="Unpair" OnClick="UnpairBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        <asp:Button ID="PairBtn" runat="server" CssClass="white" Text="Pair" OnClick="PairBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        <asp:Button ID="CreateNewBtn" runat="server" CssClass="white" Text="CreateNew" OnClick="CreateNewBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        <asp:Button ID="EditBtn" class="white" runat="server" OnClick="EditBtn_Click"
                            Text="Edit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click"
                            Text="Add" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        </td>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="CastingBtn" runat="server" CssClass="white" Text="Casting" OnClick="CastingBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                            &nbsp;
                        <asp:Button ID="PaymentBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                            OnClick="PaymentBtn_Click" Text="Payment" />
                            &nbsp;  
                        <asp:Button ID="IncentiveBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                            OnClick="IncentiveBtn_Click" Text="Incentive" />
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <table>
                    <tr>
                        <td>ShipmentType</td>
                    </tr>
                    <tr>
                        <td style="width: 700px" valign="top">
                            <telerik:RadListBox runat="server" ID="AvailResourceDashboardList" Height="100px" Width="220px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedResourceDashboard"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="AvailResourceDashboardList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedResourceDashboard" Height="100px" Width="180px"
                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                Skin="WebBlue" AllowDelete="false">
                            </telerik:RadListBox>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <br />
        <br />

        <div class="row">
            <div class="columns">
                <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro"
                            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top" EnableViewState="false"
                            AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
                            ItemStyle-Wrap="true" OnGridExporting="ResultDG_GridExporting" GridLines="Both" Width="100%" Height="90%">
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="true"></HeaderStyle>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                                <Selecting AllowRowSelect="true" />
                                <Scrolling AllowScroll="true" />
                            </ClientSettings>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Width="100%" Height="90%" TableLayout="Fixed" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                        HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="CheckAll(this)" AutoPostBack="false" CssClass="BigCheckBox" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" CssClass="BigCheckBox" />                                           
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div>
                <table>
                    <tr>
                        <td colspan="5">Legend :</td>
                    </tr>
                    <tr>
                        <td>
                            <div style="background-color: white; width: 20px; height: 20px;"></div>
                        </td>
                        <td>Open</td>
                        <td></td>
                        <td>
                            <div style="background-color: lightskyblue; width: 20px; height: 20px;"></div>
                        </td>
                        <td>Assigned</td>
                    </tr>

                    <tr>
                        <td>
                            <div style="background-color: gold; width: 20px; height: 20px;"></div>
                        </td>
                        <td>Driver Accepted</td>
                        <td></td>
                        <td>
                            <div style="background-color: peru; width: 20px; height: 20px;"></div>
                        </td>
                        <td>Driver Collected</td>
                    </tr>

                    <tr>
                        <td>
                            <div style="background-color: lightgreen; width: 20px; height: 20px;"></div>
                        </td>
                        <td>Completed</td>
                        <td></td>
                        <td>
                            <div style="background-color: hotpink; width: 20px; height: 20px;"></div>
                        </td>
                        <td>POD Received </td>
                    </tr>

                    <tr>
                        <td>
                            <div style="background-color: tomato; width: 20px; height: 20px;"></div>
                        </td>
                        <td>Cancelled </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
