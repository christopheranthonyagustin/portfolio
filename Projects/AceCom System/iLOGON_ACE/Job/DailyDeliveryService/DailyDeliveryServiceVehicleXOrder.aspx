<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliveryServiceVehicleXOrder.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveryService.DailyDeliveryServiceVehicleXOrder" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Vehicle x Order @ Daily Delivery Service</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
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

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <%--Changed the <asp:ScriptManager> to <telerik:RadScriptManager> because Cancel Changes button in Batch Grid is not working well--%>
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadWindowManager ID="RadWindowManager" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>
        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel1" Skin="Silk" Modal="true" EnableSkinTransparency="true" EnableEmbeddedSkins="true" MinDisplayTime="500">
        </telerik:RadAjaxLoadingPanel>
        <br />
        &nbsp;&nbsp;    
        <asp:Label ID="MessageLbl" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <br />
        <br />
        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td>&nbsp;
                        <asp:Button ID="TransferVehicle" runat="server" CssClass="LongLabelWhite" Text="Transfer Vehicle" OnClick="TransferVehicle_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>&nbsp;
                        <asp:Button ID="UnassignBtn" runat="server" CssClass="LongLabelWhite" Text="Unassign" OnClick="UnassignBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>&nbsp;
                        <asp:Button ID="BypassTakeoverBtn" runat="server" CssClass="LongLabelWhite" Text="Bypass Takeover" OnClick="BypassTakeoverBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="ConfirmBypassTakeoverBtn" Text="" Style="display: none;" OnClick="ConfirmBypassTakeoverBtn_Click" runat="server" />
                </td>
                <td>&nbsp;
                        <asp:Button ID="BypassDriverBtn" runat="server" CssClass="LongLabelWhite" Text="Bypass Driver" OnClick="BypassDriverBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="ConfirmBypassDriverBtn" Text="" Style="display: none;" OnClick="ConfirmBypassDriverBtnBtn_Click" runat="server" />
                </td>
                <td>&nbsp;
                        <asp:Button ID="CloseWindowBtn" runat="server" CssClass="LongLabelWhite" Text="Close Window" OnClick="CloseWindowBtn_Click"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>

        </table>
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro"
                    OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="TripId" Name="VehicleXOrderGrid" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#05538c" HeaderStyle-Font-Bold="true">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#05538c" HeaderStyle-Font-Bold="true" HeaderStyle-Width="70px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>
                                    <asp:Label ID="PostalCodeNotesDetectedLbl" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="Account" HeaderText="Account" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderNo" HeaderText="Order No" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="OrderStatus" HeaderText="Order Status" HeaderStyle-Wrap="true" ItemStyle-Wrap="true" AllowFiltering="false">
                                <ItemTemplate>
                                    <div id="OrderStatusDiv" runat="server" class="StatusBox">
                                        <%# string.Format("{0:}",Eval("OrderStatus")) %>
                                    </div>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="JobType" HeaderText="Job Type" Display="true" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DeliveryWindow" HeaderText="Delivery Window" Display="true" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Pick Up" HeaderText="Pick Up" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Drop Off" HeaderText="Drop Off" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PostalCode" HeaderText="Postal Code" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RouteCode" HeaderText="Route" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PODTimeStamp" HeaderText="PODTimeStamp" Display="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="OrderStatusColourCode" UniqueName="OrderStatusColourCode" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TripId" HeaderText="TripId" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PostalCodeNotesDetected" UniqueName="PostalCodeNotesDetected" Display="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
