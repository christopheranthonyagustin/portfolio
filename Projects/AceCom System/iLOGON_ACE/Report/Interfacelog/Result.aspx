<%@ Page Language="c#" CodeBehind="Result.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.Interfacelog.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Interface Log</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />

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
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
            <td width="70%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" src="../../Image/excel.gif" height="20"
                        runat="server" /></a>
            </td>
        </tr>
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="TitleLbl" runat="server" CssClass="graytitle">Interface Log Enquiry</asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style2">
                <asp:Label ID="TransDateLbl" runat="server">TransDate</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="lblTransDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style2">
                <asp:Label ID="TypeLbl" runat="server">Type</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="lblType" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style2">
                <asp:Label ID="FileNameLbl" runat="server">FileName</asp:Label>
            </td>
            <td>
                :
            </td>
            &nbsp;&nbsp;<td class="style1">
                <asp:Label ID="lblFileName" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
        OnGridExporting="ResultDG_GridExporting" OnItemDataBound="ResultDG_ItemDataBound"
        OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true"
        AutoGenerateColumns="false" GroupPanelPosition="Top" AllowPaging="false">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true">
            <Columns>
                <telerik:GridBoundColumn DataField="filename" SortExpression="filename" HeaderText="FileName">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="msgtype" SortExpression="msgtype" HeaderText="MessageType">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="TransactionType">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
