<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportOrderTrip.aspx.cs" Inherits="iWMS.Web.Job.TransportOrder.TransportOrderTrip" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookingOrderTrip</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
    </style>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
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
        /*Main menu*/
        .mainMenu {
            text-transform: uppercase;
        }

            .mainMenu .rmRootGroup .rmRootLink {
                padding: 4px 20px;
                line-height: 20px;
                height: 20px;
                border-bottom: solid 1px #b7b7b7;
                border-right: solid 1px #b7b7b7;
            }

                .mainMenu .rmRootGroup .rmRootLink .rmToggle {
                    height: 30px;
                }

        .WrappingItem {
            white-space: normal;
        }

            .WrappingItem:hover {
                color: black !important;
                background-color: white !important;
                font-weight: bold !important;
            }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td>
                    <br />
                    <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <span>Date</span>
                    <br />
                    <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="155"
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
                    <asp:Panel ID="NewTripPanel" runat="server">
                        <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                            Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        &nbsp;    
                            <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                                Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        &nbsp;                                                       
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click"
                                Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        &nbsp;
                            <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                                Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        &nbsp; 
                            <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                                Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                        &nbsp;
                                 <asp:CheckBox ID="Cluchk" ToolTip="SMS" runat="server" />
                        <asp:Label ID="CluchkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="IncluCompleted" ForeColor="Black"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:CheckBox ID="IncludeCancelChk" ToolTip="SMS" runat="server" />
                        <asp:Label ID="IncludeCanceLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="IncluCancelled" ForeColor="Black"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBTripId" Name="MainGrid" AllowFilteringByColumn="false">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>&nbsp;
                            <asp:ImageButton runat="server" Visible="True" ID="Add" ImageUrl="../../image/add.png"
                                Width="15" Height="15" AlternateText="Add" BackColor="Transparent" OnClick="AddIcon_Click"
                                BorderWidth="0"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="AcJobRef" UniqueName="AcJobRef" SortExpression="AcJobRef" HeaderText="Account <br /><br /> JobNo <br/><br /> CustReference">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shtype" UniqueName="shtype" SortExpression="shtype" HeaderText="Shipment Type">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TripFrTime" UniqueName="TripFrTime" SortExpression="TripFrTime" HeaderText="FromTime">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="triptotime" UniqueName="triptotime" SortExpression="triptotime" HeaderText="ToTime">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="VehDriverJobType" UniqueName="VehDriverJobType" SortExpression="VehDriverJobType" HeaderText="Vehicle <br/><br /> Driver <br/><br /> PrimaryJobType">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="Pallet" HeaderText="Pallet <br> Volume <br/> Weight <br/> Package" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:0}",Eval("ActPLT")) %>
                            <br />
                            <br />
                            <%# string.Format("{0:0.0000}",Eval("ActVol")) %>
                            <br />
                            <br />
                            <%# string.Format("{0:0.0000}",Eval("ActWT")) %>
                            <br />
                            <br />
                            <%# string.Format("{0:0.0000}",Eval("ActPKG")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="JobTypeBSTBO1" UniqueName="JobTypeBSTBO1" SortExpression="JobTypeBSTBO1" HeaderText="JobType <br/><br /> BillSizeType <br/><br /> BillOption1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FrServicePt" UniqueName="FrServicePt" SortExpression="FrServicePt" HeaderText="PickUp">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ToServicePt" UniqueName="ToServicePt" SortExpression="ToServicePt" HeaderText="DropOff">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TripOption" UniqueName="TripOption" SortExpression="TripOption" HeaderText="TripOption">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TripDescr" UniqueName="TripDescr" SortExpression="TripDescr" HeaderText="TripDescription">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EqpSpecialInstruction" UniqueName="EqpSpecialInstruction" SortExpression="EqpSpecialInstruction" HeaderText="SpecialInstruction">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false" />
                    <telerik:GridBoundColumn DataField="jbid" UniqueName="jbid" Display="false" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
