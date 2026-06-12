<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMConsoleRegisterHead.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsoleRegister.FMConsoleRegisterHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMJobRegisterHead</title>
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
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007" OnTabClick="RadTabStrip_Click">
            <Tabs>
                <telerik:RadTab Text="Consol" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Jobs(w/o)Consol" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Jobs(w)Consol" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Job(w/o)Charge" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Non-BilledJobs" Value="400" runat="server">
                </telerik:RadTab>                
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true"  AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="Number" UniqueName="Number" SortExpression="Number" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Consol No">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Type" UniqueName="Type" SortExpression="Type" HeaderText="Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FreightMode" UniqueName="FreightMode" SortExpression="FreightMode" HeaderText="Freight Mode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CtnrMode" UniqueName="CtnrMode" HeaderText="Container Mode" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="POL" UniqueName="POL" SortExpression="POL" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Load Port">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="POD" UniqueName="POD" SortExpression="POD" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Discharge Port">
                            </telerik:GridBoundColumn>                        
                            <telerik:GridBoundColumn DataField="Voyage" UniqueName="Voyage" SortExpression="Voyage" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Voyage">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Vessel" UniqueName="Vessel" SortExpression="Vessel" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Vessel">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Flight" UniqueName="Flight" SortExpression="Flight" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Flight">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AircraftRegNo" UniqueName="AircraftRegNo" SortExpression="AircraftRegNo" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Aircraft Reg No">
                            </telerik:GridBoundColumn>                           
                            <telerik:GridBoundColumn DataField="FirstLoad" UniqueName="FirstLoad" HeaderText="First Load" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LastDischarge" UniqueName="LastDischarge" HeaderText="Last Discharge" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ETD" UniqueName="ETD" SortExpression="ETD"
                                HeaderText="ETD" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ETA" UniqueName="ETA" SortExpression="ETA"
                                HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BOL" UniqueName="BOL" SortExpression="BOL" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="BOL">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="MAWB" UniqueName="MAWB" SortExpression="MAWB" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="MAWB">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ServiceLevel" UniqueName="ServiceLevel" SortExpression="ServiceLevel" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Service Level">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Payment" UniqueName="Payment" SortExpression="Payment" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Payment">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SendAgentName" UniqueName="SendAgentName" SortExpression="SendAgentName" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Sending Agent">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ReceiveAgentName" UniqueName="ReceiveAgentName" SortExpression="ReceiveAgentName" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Receive Agent">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CarrierName" UniqueName="CarrierName" SortExpression="CarrierName" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Carrier">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NoofJob" UniqueName="NoofJob" SortExpression="NoofJob" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="NoofShipments">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="WT" UniqueName="WT" SortExpression="WT" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="WT">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="VOL" UniqueName="VOL" SortExpression="VOL" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="VOL">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="cutoffDate" UniqueName="cutoffDate" SortExpression="cutoffDate" HeaderText="Cut off Date" AllowFiltering="false"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" UniqueName="adduser" SortExpression="adduser" ShowFilterIcon="false"  AllowFiltering="false"
                                HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" UniqueName="edituser" SortExpression="UniqueName" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="EditUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false" >
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="JobWithoutConsolRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

