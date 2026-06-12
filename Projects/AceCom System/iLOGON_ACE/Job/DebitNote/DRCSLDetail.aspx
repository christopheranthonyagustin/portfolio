<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DRCSLDetail.aspx.cs" Inherits="iWMS.Web.Job.DebitNote.DRCSLDetail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>DRCSLDetail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 98px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td width="80%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif"
                        height="20" runat="server">
                </a>
            </td>
        </tr>
    </table>
    <asp:Panel ID="TitlePanel" runat="server">
        <table width="100%" id="report" runat="server">
        <tr class="graytitle">
            <td width="10%">
                <asp:Label ID="LicenseLbl" runat="server">CompanyName</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="TelLbl" runat="server">Tel</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="TelTextLbl" runat="server"></asp:Label>
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="TitlePanel2" runat="server">
        <table border="0" cellspacing="1" cellpadding="1" width="100%">
        <tr class="graytitle">
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr class="graytitle">
            <td width="10%">
                <asp:Label ID="BillingNameLbl" runat="server">BillingName</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="BillingNameTextLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="AddressLbl" runat="server">Address</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="AddressTextLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="PostcodeLbl" runat="server">PostalCode</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="PostcodeTextLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="BillTelLbl" runat="server">Tel</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="BillTelTextLbl" runat="server"></asp:Label>
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="BillcontactLbl" runat="server">Attn</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="BillcontactTextLbl" runat="server"></asp:Label>
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr class="graytitle">
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="InvoiceNoLbl" runat="server">InvoiceNo.</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="InvoiceNoTextLbl" runat="server"></asp:Label>
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="InvoiceDateLbl" runat="server">Date</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="InvoiceDateTextLbl" runat="server"></asp:Label>
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="InvoiceTermLbl" runat="server">Term</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="InvoiceTermTextLbl" runat="server"></asp:Label>
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        </table>
    </asp:Panel>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False" GridLines="Both" BorderStyle="Solid"
        AllowPaging="True" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" UseAccessibleHeader="True"
        ItemStyle-Wrap="False" OnItemDataBound="ResultDG_ItemDataBound" OnGridExporting="RadGrid1_GridExporting"
        ExportSettings-UseItemStyles="true">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
        <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <ExportSettings UseItemStyles="True">
        </ExportSettings>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
