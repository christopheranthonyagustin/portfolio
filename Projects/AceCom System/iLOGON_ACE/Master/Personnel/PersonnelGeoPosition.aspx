<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelGeoPosition.aspx.cs"
    Inherits="iWMS.Web.Master.Personnel.PersonnelGeoPosition" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>PersonnelGeoPosition</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <style type="text/css">
        .style1 
        {
            width: 1050px;
        }

        .style2 
        {
            width: 1050px;
            height: 26px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td class="style1">
                    <br />
                    <asp:Button ID="SearchImgBtn" class="white" runat="server" OnClick="SearchBtn_Click" Visible="true"
                        Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Search" />
                    &nbsp;
                <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="ExportExcel" Visible="true"
                    Text="Excel" UseSubmitBehavior="false" ToolTip="Export To Excel" />
                </td>
            </tr>
        </table>
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" AllowFilteringByColumn="true" TableLayout="Auto">
                <Columns>
                    <telerik:GridBoundColumn DataField="datetimestamp" SortExpression="datetimestamp" HeaderText="GeoPositionDateTime"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="address" DataField="address" HeaderText="Address" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="drivername" DataField="drivername" HeaderText="Personnel" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="vehno" DataField="vehno" HeaderText="VehNo" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="deviceId" DataField="deviceId" HeaderText="DeviceId" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn UniqueName="MobileNo" DataField="MobileNo" HeaderText="MobileNo" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="longitude" DataField="longitude" HeaderText="Longitude" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="latitude" DataField="latitude" HeaderText="Latitude" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="adduser" DataField="adduser" HeaderText="AddUser" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="edituser" DataField="edituser" HeaderText="EditUser" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="Id"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="PerId"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
