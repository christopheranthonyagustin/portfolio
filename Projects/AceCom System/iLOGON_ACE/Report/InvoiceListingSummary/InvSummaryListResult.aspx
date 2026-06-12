<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvSummaryListResult.aspx.cs"
    Inherits="iWMS.Web.Report.InvoiceListingSummary.InvSummaryListResult" EnableEventValidation="false" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Invoice Summary Listing By Account</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">

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
    <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
    <table width="100%" id="report" runat="server">
        <tr class="graytitle">
            <td>
                &nbsp;<asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="11">
                <table>
                    <tr class="graytitle">
                        <td>
                            <asp:Label ID="DateLbl" runat="server">Generate on</asp:Label>
                            :
                            <asp:Label ID="NowLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="11">
                <table>
                    <tr class="graytitle">
                        <td>
                            Module :
                            <asp:Label ID="moduleLbl" runat="server" Text="All"></asp:Label>
                        </td>
                        <td>
                            , Account :
                            <asp:Label ID="AccountLbl" runat="server" Text="All"></asp:Label>
                        </td>
                        <td>
                            , Sales Man :
                            <asp:Label ID="SalesManLbl" runat="server" Text="All"></asp:Label>
                        </td>
                        <td>
                            , Type :
                            <asp:Label ID="TypeLbl" runat="server" Text="All"></asp:Label>
                        </td>
                        <td>
                            , Status :
                            <asp:Label ID="StatusLbl" runat="server" Text="All"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr class="graytitle">
            <td class="style1">
                <asp:Label ID="ReportLbl" runat="server">&nbsp;Report</asp:Label>&nbsp;:Invoice
                Summary Listing By Account - From
                <asp:Label ID="fromDateLbl" runat="server"></asp:Label>
                &nbsp;to
                <asp:Label ID="toDateLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
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
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td colspan="11">
                            <div id="div-datagrid" style="height: 92%">
                                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                    OnGridExporting="RadGrid1_GridExporting" OnNeedDataSource="ResultDG_NeedDataSource"
                                    AllowPaging="true" AllowSorting="true" AllowFilteringByColumn="true" Skin="Office2007"
                                    OnItemDataBound="ResultDG_ItemDataBound">
                                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                        <Selecting AllowRowSelect="true"></Selecting>
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <HeaderStyle Wrap="false"></HeaderStyle>
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="jobmodule" SortExpression="jobmodule" HeaderText="Job Module">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="invdate" SortExpression="invdate" HeaderText="Invoice Date"
                                                DataFormatString="{0:dd/MMM/yyyy}">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="Invoice">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="invtype" SortExpression="invno" HeaderText="Type">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account Code">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="acname" SortExpression="acname" HeaderText="Name">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="salesman" SortExpression="salesman" HeaderText="Sales Man">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="taxableamt" SortExpression="taxableamt" HeaderText="Taxable Amt"
                                                DataFormatString="{0:C2}" ItemStyle-HorizontalAlign="Right">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="nontaxableamt" SortExpression="nontaxableamt"
                                                HeaderText="Non Taxable Amt" DataFormatString="{0:C2}" ItemStyle-HorizontalAlign="Right">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="discountamt" SortExpression="discountamt" HeaderText="Discount Amt"
                                                DataFormatString="{0:C2}" ItemStyle-HorizontalAlign="Right">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="taxamt" SortExpression="taxamt" HeaderText="Tax Amt"
                                                DataFormatString="{0:C2}" ItemStyle-HorizontalAlign="Right">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="totalamt" SortExpression="totalamt" HeaderText="Total Amt"
                                                DataFormatString="{0:C2}" ItemStyle-HorizontalAlign="Right">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
