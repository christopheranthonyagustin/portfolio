<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTransportPlanningQueue.aspx.cs" Inherits="iWMS.Web.Job.DailyTransportPlanning.DailyTransportPlanningQueue" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DailyTransportPlanningQueue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
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
    <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
    </telerik:RadCodeBlock>
    <style type="text/css">
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

        .BigCheckBox input {
            width: 30px;
            height: 20px;
            float: right;
        }

        .AttachImgCSS {
            float: right !important;
        }
    </style>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock3" runat="server">
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }
            function OnClientClose_ForEditAndAdd(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>
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
        <table>
            <tr>
                <td>
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <div style="background-color: White; width: 20px; height: 20px;"></div>
                                </td>
                                <td>New</td>
                                <td style="padding-left: 5px"></td>

                                <td>
                                    <div style="background-color: Cyan; width: 20px; height: 20px;"></div>
                                </td>
                                <td>Assigned</td>
                                <td style="padding-left: 5px"></td>

                                <td>
                                    <div style="background-color: Gold; width: 20px; height: 20px;"></div>
                                </td>
                                <td>Accepted</td>
                                <td style="padding-left: 5px"></td>

                                <td>
                                    <div style="background-color: Crimson; width: 20px; height: 20px;"></div>
                                </td>
                                <td>Cancelled Pickup</td>
                                <td style="padding-left: 5px"></td>

                                <td>
                                    <div style="background-color: Pink; width: 20px; height: 20px;"></div>
                                </td>
                                <td>Arrived Pickup</td>
                                <td style="padding-left: 5px"></td>

                                <td>
                                    <div style="background-color: Crimson; width: 20px; height: 20px;"></div>
                                </td>
                                <td>Failed Pickup</td>
                                <td style="padding-left: 5px"></td>

                                <td>
                                    <div style="background-color: LightBlue; width: 20px; height: 20px;"></div>
                                </td>
                                <td>Completed Pickup</td>
                                <td style="padding-left: 5px"></td>

                                <td>
                                    <div style="background-color: Khaki; width: 20px; height: 20px;"></div>
                                </td>
                                <td>Arrived Dropoff</td>
                                <td style="padding-left: 5px"></td>

                                <td>
                                    <div style="background-color: Crimson; width: 20px; height: 20px;"></div>
                                </td>
                                <td>Failed Dropoff</td>
                                <td style="padding-left: 5px"></td>

                                <td>
                                    <div style="background-color: LightGreen; width: 20px; height: 20px;"></div>
                                </td>
                                <td>Completed Dropoff</td>
                                <td style="padding-left: 5px"></td>

                                <td>
                                    <div style="background-color: Tomato; width: 20px; height: 20px;"></div>
                                </td>
                                <td>Cancelled</td>
                                <td style="padding-left: 5px"></td>

                                <td>
                                    <div style="background-color: Tomato; width: 20px; height: 20px;"></div>
                                </td>
                                <td>Deleted</td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <div>
            <table border="0" cellpadding="2" cellspacing="2" runat="server">
                <tr>
                    <td>
                        <br />
                        <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                    </td>
                    <td>
                        <asp:Label ID="frdatelbl" runat="server" Text="Date"> 
                        </asp:Label>
                        <br />
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
                        <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                        &nbsp;
                        <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                            Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                    <td>
                        <br />
                        <asp:Button ID="Button3" runat="server" CssClass="LongLabelWhite" Text="Run Casting" OnClick="CastingBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="Button4" runat="server" CssClass="LongLabelWhite" Text="Configure Algorithm" OnClick="ConfigureAlgBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:CheckBox ID="LesserInfoChk" runat="server" CssClass="BigCheckBox" Style="vertical-align: middle" OnCheckedChanged="LesserInfoChk_CheckedChanged" AutoPostBack="true" />
                        <asp:Label ID="LesserInfoChkLbl" runat="server" Font-Bold="true" Text="LessInfo" ForeColor="Black"></asp:Label>
                    </td>
                </tr>
            </table>

            <table>
                <tr>
                    <td>
                        <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                            Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                            Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                            Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="PODBtn" runat="server" CssClass="white" OnClick="PODBtn_Click"
                            Text="POD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click"
                            Text="Cancel" OnClientClick="disableBtn(this.id); if ( !confirm('Confirm to cancel job?')) return false;" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="excelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
                            UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>

            <table border="0" cellpadding="2" cellspacing="2" runat="server" width="100%">
                <tr>
                    <td>
                        <asp:Button ID="CreateNewBtn" runat="server" CssClass="LongLabelWhite" Text="New Booking" OnClick="CreateNewBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="EditBtn" class="LongLabelWhite" runat="server" OnClick="EditBtn_Click"
                            Text="Edit Booking" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="DeleteBookingBtn" CssClass="LongLabelWhite" runat="server" OnClick="DeleteBookingBtn_Click" Enabled="false"
                            Text="Delete Booking" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="AllRidesBtn" runat="server" CssClass="LongLabelWhite" Text="All Bookings" OnClick="AllRidesBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="CopyBookingBtn" CssClass="LongLabelWhite" runat="server" OnClick="CopyBookingBtn_Click"
                            Text="Copy Booking" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="UnpairBtn" runat="server" CssClass="LongLabelWhite" Text="Unpair Booking" OnClick="UnpairBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="PairBtn" runat="server" CssClass="LongLabelWhite" Text="Pair Booking" OnClick="PairBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="MassUpdateBookingsBtn" CssClass="LongLabelWhite" runat="server" OnClick="MassUpdateBookingsBtn_Click"
                            Text="Mass Booking Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="CheckpointBtn" CssClass="longlabelwhite" runat="server" OnClick="CheckpointBtn_Click"
                            Text="Review Checkpoint" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>

            <table>
                <tr>
                    <td>
                        <asp:Button ID="MapPointsBtn" runat="server" CssClass="LongLabelWhite" Text="Map Points" OnClick="MapPointsBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="DOBtn" CssClass="Blue" runat="server" OnClick="DOBtn_Click"
                            Text="DO" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="TransferBtn" runat="server" CssClass="LongLabelWhite" Text="Transfer Vehicle" OnClick="TransferBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro"
                    OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top" EnableViewState="false"
                    AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
                    ItemStyle-Wrap="true" OnGridExporting="ResultDG_GridExporting" GridLines="None" Width="100%" Height="90%">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" />
                    </ClientSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Width="100%" Height="90%" TableLayout="Fixed">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                HeaderStyle-Width="40px" ItemStyle-Width="40px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
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
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1000px" Height="600px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>

        <telerik:RadWindow ID="RadWindow1" runat="server" VisibleOnPageLoad="true" Width="1000px" Height="600px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose_ForEditAndAdd" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
