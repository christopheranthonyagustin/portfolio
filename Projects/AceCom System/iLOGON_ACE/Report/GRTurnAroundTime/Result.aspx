<%@ Page Language="c#" CodeBehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.GRTurnAroundTime.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>GRTurnAroundTime</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">

    <script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>

    <style type="text/css">
        .style1
        {
            height: 19px;
        }
    </style>

    </head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td width="80%" align="right">
                
        </tr>
    </table>
    <table width="100%" id="report" runat="server">
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td width="5%">
                <asp:Label ID="ReportLbl" runat="server">Report</asp:Label>
            </td>
            <td width="1%">
                :
            </td>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">Goods Receive Turn Around Time</asp:Label>
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
                <asp:Label ID="customerLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="RcTypeLbl" runat="server">ReceiptType</asp:Label>
            </td>
            <td>
                :</td>
            <td>
                <asp:Label ID="RcTypeContentLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="GateInDateLbl" runat="server">GateInDate</asp:Label>
            </td>
            <td>
                :</td>
            <td>
                <asp:Label ID="GateInDateContentLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="ComDateLbl" runat="server">CompleteDate</asp:Label>
            </td>
            <td>
                :</td>
            <td>
                <asp:Label ID="ComDateContentLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
            </td>
            <td>
                :
            </td>
            <td>
                <asp:Label ID="NowLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" src="../../Image/excel.gif"
                        height="20" runat="server"></a></td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
        <table width="100%" id="Table1" runat="server">
        <tr>
            <td colspan="3">
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                    OnGridExporting="ResultDG_GridExporting" 
                    OnItemDataBound="ResultDG_ItemDataBound" ExportSettings-UseItemStyles="true"
                    GroupPanelPosition="Top">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                </telerik:RadGrid>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
