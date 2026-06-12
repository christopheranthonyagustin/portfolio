<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryJobRegisterMonitor.aspx.cs" Inherits="iWMS.Web.Job.DeliveryJobRegister.DeliveryJobRegisterMonitor" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>DeliveryJobRegisterMonitor</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
    <style type="text/css">
        .PrevNext {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .PrevNext:hover {
                background: #6885ca;
            }
    </style>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

</head>
<body>
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadWindowManager ID="RadWindowManager" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>
        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="FromDateLbl" runat="server" Text="FromDate"> </asp:Label>
                    <br />
                    <asp:Button ID="FromDatePrevBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="-" OnClick="FromDatePrevBtn_Click" UseSubmitBehavior="false" />
                    <telerik:RadDatePicker ID="FromDatePicker" runat="server" Width="155"
                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                        OnSelectedDateChanged="FromDatePicker_SelectedDateChanged" AutoPostBack="true">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                    <asp:Button ID="FromDateNextBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="+" OnClick="FromDateNextBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="ToDateLbl" runat="server" Text="ToDate"> </asp:Label>
                    <br />
                    <asp:Button ID="ToDatePrevBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="-" OnClick="ToDatePrevBtn_Click" UseSubmitBehavior="false" />
                    <telerik:RadDatePicker ID="ToDatePicker" runat="server" Width="155" Height="25"
                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                        OnSelectedDateChanged="ToDatePicker_SelectedDateChanged" AutoPostBack="true">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                    <asp:Button ID="ToDateNextBtn" runat="server" CssClass="PrevNext" Font-Bold="true" Font-Size="Large" Text="+" OnClick="ToDateNextBtn_Click" UseSubmitBehavior="false" />
                </td>
                <td>
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td>
                    <br />
                    <br />
                    <asp:Button ID="SearchBtn" runat="server" CssClass="white" OnClick="SearchBtn_Click" ToolTip="Search"
                        Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <br />
                    <br />
                    <asp:Button ID="ExcelBtn" runat="server" CssClass="green" OnClick="ExcelBtn_Click" ToolTip="Export To Excel"
                        Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" AllowPaging="true"
                    AllowSorting="true" AllowFilteringByColumn="true" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound" GridLines="None"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false">
                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" />
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="MonitorGrid"
                        PageSize="50" HeaderStyle-HorizontalAlign="Left">
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Left"
                                ItemStyle-Width="50px" HeaderStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="Attc" ImageUrl="../../image/attached.jpg" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" OnClick="Attc_Click"></asp:ImageButton>

                                    <asp:ImageButton runat="server" ID="TSQ_HistoryList" ImageUrl="../../image/HistoryList.png"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="History Trip Status Query"
                                        OnClick="HistoryList_Click"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="No" HeaderText="No" ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="statusdescr" HeaderText="Status<br/>JobType"
                                AutoPostBackOnFilter="false" SortExpression="shtype" ItemStyle-Width="110px" HeaderStyle-Width="110px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("statusdescr")) %>
                                    <%# string.Format("{0:}",Eval("jobtype")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="CustRefOfferBy" HeaderText="CustRef <br/> CustRefDate" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1:dd/MMM/yyyy HH:mm}", Eval("CustReference"), Eval("CustRefDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="AccountJobNo" HeaderText="Account <br/> JobNo" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("accode"), Eval("JobNo")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="FrExpDate/FrActDate" HeaderText="ETD <br/> ATD" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm} <br> {1:dd/MMM/yyyy HH:mm}", Eval("FrExpDate"), Eval("FrActDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="ToExpDate/ToActDate" HeaderText="ETA <br/> ATA" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm} <br> {1:dd/MMM/yyyy HH:mm}", Eval("ToExpDate"), Eval("ToActDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Loading/Unloading" HeaderText="Loading <br/> Unloading" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm} <br> {1:dd/MMM/yyyy HH:mm}", Eval("CtnrReadyDate"), Eval("OffloadDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="PartnerVehicleDriver" HeaderText="Partner <br/> Vehicle <br/> Driver" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1} <br/> {2}", Eval("Partner"), Eval("vehno"), Eval("driver")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="FromrouteToroute" HeaderText="FromRoute <br/> ToRoute" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("frroute"), Eval("toroute ")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="PickUpDropOff" HeaderText="PickUp <br/> Drop Off" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1}", Eval("FrServicePtDescr"), Eval("ToServicePtDescr")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderText="OnTimePickUp">
                                <ItemTemplate>
                                    <asp:Label ID="PickUpChecklistLbl" runat="server" />
                                    <asp:Label ID="PickUpCrossLbl" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderText="OnTimeDelivery">
                                <ItemTemplate>
                                    <asp:Label ID="DeliveryChecklistLbl" runat="server" />
                                    <asp:Label ID="DeliveryCrossLbl" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Type" HeaderText="Infull" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("Type")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Recipient/Remarks/TripSpecialInstruction" HeaderText="Recipient<br/>Remarks <br/> SpecialInstructions" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%# string.Format("{0} <br/> {1} <br/> {2}", Eval("RecipientName"), Eval("Remarks1"), Eval("TripSpecialInstruction")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="Status" UniqueName="Status" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FrActDate" UniqueName="FrActDate" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FrExpDate" UniqueName="FrExpDate" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ToActDate" UniqueName="ToActDate" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LeadTimeBetweenCitiesInDays" UniqueName="LeadTimeBetweenCitiesInDays" Display="false"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
