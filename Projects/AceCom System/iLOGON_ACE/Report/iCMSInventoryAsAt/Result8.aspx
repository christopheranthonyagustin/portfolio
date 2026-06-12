<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result8.aspx.cs" Inherits="iWMS.Web.Report.iCMSInventoryAsAt.Result8" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>iCMSInventoryAsAt - [RepairCostDetails] Results</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td class="style2" colspan="4">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="A1" runat="server" onserverclick="ExportExcel">
                    <img id="Img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/Excel.png"
                       runat="server" /></a>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Repair Cost Details</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="BankLbl" runat="server">Bank</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;
            <td class="style1">
                <asp:Label ID="BankcodeLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="VendorLbl" runat="server">Vendor</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="VdidLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="SizetypeLbl" runat="server">SizeType</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="sizetypeDescrLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="True" EnableLinqExpressions="False"
        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
        OnGridExporting="ResultDG_GridExporting" ExportSettings-UseItemStyles="true"
        AllowPaging="false" AllowSorting="true">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
        <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <ExportSettings UseItemStyles="True">
        </ExportSettings>
        <MasterTableView AllowMultiColumnSorting="true">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
