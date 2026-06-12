<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result9.aspx.cs" Inherits="iWMS.Web.Report.iCMSInventoryAsAt.Result9" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>iCMS Inventory Analysis [CtnrDetentionList] Result</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 6%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/Excel.png"
                        runat="server"></a>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Container Detention Listing</asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="deLbl" runat="server">Depot</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="DepotLbl" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="stLbl" runat="server">Size Type</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="sizetypeLbl" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="DateLbl" runat="server">DateRange</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="FromDateLbl" runat="server"></asp:Label>
                <asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <br />
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
        OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
        ExportSettings-UseItemStyles="true" AutoGenerateColumns="true" GroupPanelPosition="Top"
        AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2"
        UseAccessibleHeader="True" ItemStyle-Wrap="False" OnGridExporting="ResultDG_GridExporting"
        GridLines="Both">
        <alternatingitemstyle cssclass="DGAlternateItem" wrap="False"></alternatingitemstyle>
        <itemstyle cssclass="DGItem" wrap="False"></itemstyle>
        <clientsettings>
            <Selecting AllowRowSelect="true" />
        </clientsettings>
        <mastertableview allowmulticolumnsorting="true">
        </mastertableview>
    </telerik:RadGrid>
    </form>
</body>
</html>
