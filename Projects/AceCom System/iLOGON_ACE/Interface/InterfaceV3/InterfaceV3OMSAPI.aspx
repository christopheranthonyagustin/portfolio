<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterfaceV3OMSAPI.aspx.cs" Inherits="iWMS.Web.Interface.InterfaceV3.InterfaceV3OMSAPI" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GM @ Interface</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="SearchBtn" CssClass="white" runat="server" Text="Search"
                        OnClick="SearchBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <br />
                </td>
            </tr>
        </table>

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="420" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>

                    <telerik:GridBoundColumn DataField="Account" HeaderText="Account" SortExpression="Account"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="APIType" HeaderText="APIType" SortExpression="APIType"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DocumentNo" HeaderText="DocumentNo" SortExpression="DocumentNo"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MessageType" HeaderText="MessageType" SortExpression="MessageType"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="InterfaceStatus" HeaderText="InterfaceStatus" SortExpression="InterfaceStatus"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="InterfaceMessage" HeaderText="InterfaceMessage" SortExpression="InterfaceMessage"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AddDate" HeaderText="AddDate" SortExpression="AddDate" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
