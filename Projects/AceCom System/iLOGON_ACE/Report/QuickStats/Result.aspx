<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.QuickStats.Result" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>QuickStats</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <%--<link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />--%>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <style type="text/css">
        .blackBoldText
        {
            color: #000000;
            font-size: 18px;
            font-family: Arial,Verdana,Helvetica;
            font-weight: bold;
        }
        .style1
        {
            height: 18px;
        }
        .style2
        {
            height: 20px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="a1" runat="server" onserverclick="ExportExcel">
                    <img id="img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server" />
                </a>
            </td>
        </tr>
        </table>
        <table width="100%">
        <tr class="graytitle">
            <td class="style2">
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td class="style2">
                :
            </td>
            <td class="style2">
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Quick Statistics</asp:Label><asp:Label
                    ID="FromDateLbl" runat="server"></asp:Label><asp:Label ID="ToDateLbl" runat="server"></asp:Label>
            </td>
            <td class="style2">
                <asp:Label ID="Status2Lbl" runat="server" Text="Status2 = Lot15" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="AccLbl" runat="server">Account</asp:Label>
            </td>
            <td class="style1">
                :
            </td>
            <td class="style1">
                <asp:Label ID="AccountLbl" runat="server"></asp:Label>
            </td>
            <td class="style1">
                <asp:Label ID="ShippedLbl" runat="server" Text="Shipped = Average of Past 12 months shipped Qty" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="SiteLbl" runat="server">Site</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="SiteDescrLbl" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Label ID="BalanceLbl" runat="server" Text="Balance = Inventory Balance" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="InvTurnLbl" runat="server" Text="InvTurn = Shipped/Balance" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="InvDayLbl" runat="server" Text="InvDay = 365/InvTurn" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="InvTurnStatusGoodLbl" runat="server" Visible="false" Text="InvTurn(Status Good) = Average Past 12 mths shipped Qty (Last month of Date Range)/ Status2 Good Balance"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="InvDayStatusGoodLbl" runat="server" Text="InvDay(Status Good) = 365/InvTurn(Status Good)" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:PlaceHolder ID="PH1" runat="server" />
    </form>
</body>
</html>
