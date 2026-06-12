<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result47.aspx.cs" Inherits="iWMS.Web.Graphlet.WareHouseAnalysis.Result47" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Mainland WH operation report</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr class="graytitle">
                <td>
                    <asp:Label ID="LicenseNameLbl" runat="server" CssClass="Graytitle" Font-Bold="true"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr class="graytitle">
                <td>
                    <asp:Label runat="server">Report:</asp:Label>
                </td>
                <td>:
                </td>
                <td>
                    <asp:Label ID="ReportLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label runat="server">Format</asp:Label>
                </td>
                <td>:
                </td>
                <td>
                    <asp:Label ID="FormatLbl" runat="server"></asp:Label>
                </td>
            </tr> 
            <tr class="graytitle">
                <td>
                    <asp:Label runat="server">Account</asp:Label>
                </td>
                <td>:
                </td>
                <td>
                    <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="ExportExcelBtn" CssClass="LongLabelGreen" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id, false)" runat="server" OnClick="ExportExcelBtn_Click" Text="Export Excel" />
                </td>
            </tr>
        </table>
        <br />
        <br />

        <asp:Label ID="HeaderLbl" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
            AllowFilteringByColumn="false" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
