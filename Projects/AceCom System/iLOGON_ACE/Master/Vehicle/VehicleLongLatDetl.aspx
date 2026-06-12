<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehicleLongLatDetl.aspx.cs" Inherits="iWMS.Web.Master.Vehicle.VehicleLongLatDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>VehicleLongLatDetl</title>
    <%-- <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" /> --%>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <style type="text/css">
        .style1 {
            width: 1050px;
        }

        .style2 {
            width: 1050px;
            height: 26px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="pagetitle"></td>
            </tr>
            <tr>
                <td class="style1"><br />
                    <asp:Button ID="SearchImgBtn" class="white" runat="server" OnClick="SearchBtn_Click" Visible="true"
                        Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Search" />
                    &nbsp;
                <asp:Button ID="excelImgBtn" class="LongLabelGreen" runat="server" OnClick="ExportExcel" Visible="true"
                    Text="Export to Excel" UseSubmitBehavior="false" ToolTip="Export To Excel" />
                </td>
            </tr>
        </table>
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
            AllowFilteringByColumn="true" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="vehno" SortExpression="VehNo" HeaderText="VehNo"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DeviceId" SortExpression="DeviceId" HeaderText="DeviceId"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MobileNo" SortExpression="MobileNo" HeaderText="MobileNo"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Address" SortExpression="Address" HeaderText="Address"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="latitude" SortExpression="latitude" HeaderText="Latitude"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Longitude" SortExpression="Longitude" HeaderText="Longitude"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DateTimeStamp" SortExpression="DateTimeStamp" HeaderText="DateTime"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditDate" SortExpression="EditDate" HeaderText="EditDate"
                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" HeaderText="EditUser"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
