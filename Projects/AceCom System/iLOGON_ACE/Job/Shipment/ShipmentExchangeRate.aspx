<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipmentExchangeRate.aspx.cs" Inherits="iWMS.Web.Job.Shipment.ShipmentExchangeRate" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ShipmentExchangeRate</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" 
            AllowSorting="true" AllowFilteringByColumn="true" OnNeedDataSource="ResultDG_NeedDataSource" Skin="Metro" Height="460px" AllowMultiRowSelection="true">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" EnablePostBackOnRowClick="false" >
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" AllowFilteringByColumn="true">

                <Columns>
                    <telerik:GridBoundColumn UniqueName="currcode" DataField="currcode" HeaderText="CurrencyCode" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="fromdate" DataField="fromdate" HeaderText="FromDate" DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="todate" DataField="todate" HeaderText="ToDate" DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="rateunit" DataField="rateunit" HeaderText="RateUnit" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="rate" DataField="rate" HeaderText="Rate" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="remarks" DataField="remarks" HeaderText="Remarks" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <%--<telerik:GridBoundColumn UniqueName="status" DataField="status" HeaderText="Status" AllowFiltering="true">
                    </telerik:GridBoundColumn>--%>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="adduser" DataField="adduser" HeaderText="AddUser" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="edituser" DataField="edituser" HeaderText="EditUser" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="statusdescr" DataField="statusdescr" HeaderText="StatusDescr" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="id"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>

</body>
</html>
