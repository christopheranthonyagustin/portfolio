<%@ Page Language="c#" CodeBehind="SYSDetail_17.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.DebitNote.SYSDetail_17" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>System Detail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

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
    <%--	<table width="100%" id="report" runat="server">					
				<tr class="graytitle">
				<td colspan="3">
				</td>
				</tr>
				<td class="style1">
				    &nbsp;</tr>
				<td>
				    &nbsp;</tr>
				<tr class="graytitle">
				<td width = "10%"><asp:label ID="LicenseLbl" Runat="server">CompanyName</asp:label></td>
					<td>:</td>
					<td><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>

					<td class="style1">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="graytitle">
					<td><asp:label ID="TelLbl" Runat="server">Tel</asp:label></td>
					<td>:</td>
					<td>
						<asp:Label id="TelTextLbl" runat="server"></asp:Label></td>
					<td class="style1">
						&nbsp;</td>
					<td>
						&nbsp;</td>
				</tr>
				<tr class="graytitle">
					<td></td>
					<td></td>
					<td>
						</td>
					<td class="style1">
						&nbsp;</td>
					<td>
						&nbsp;</td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="BillingNameLbl" runat="server">BillingName</asp:label></td>
					<td>:</td>
					<td>
						<asp:Label id="BillingNameTextLbl" runat="server"></asp:Label></td>
					<td class="style1" align="right">
						<asp:label id="InvoiceNoLbl" runat="server">InvoiceNo.:</asp:label></td>
					<td>
						<asp:label id="InvoiceNoTextLbl" runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="AddressLbl" runat="server">Address</asp:label></td>
					<td>:</td>
					<td>
						<asp:Label id="AddressTextLbl" runat="server"></asp:Label></td>
					<td class="style1" align="right">
						<asp:label id="InvoiceDateLbl" runat="server">Date:</asp:label></td>
					<td>
						<asp:label id="InvoiceDateTextLbl" runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="PostcodeLbl" runat="server">PostalCode</asp:label></td>
					<td>:</td>
					<td>
						<asp:Label id="PostcodeTextLbl" runat="server"></asp:Label></td>
					<td class="style1" align="right">
						<asp:label id="InvoiceTermLbl" runat="server">Term:</asp:label></td>
					<td>
						<asp:label id="InvoiceTermTextLbl" runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label ID="BillTelLbl" Runat="server">Tel</asp:label></td>
					<td>:</td>
					<td>
						<asp:Label id="BillTelTextLbl" runat="server"></asp:Label></td>
					<td class="style1">
						&nbsp;</td>
					<td>
						&nbsp;</td>
				</tr>
				<tr class="graytitle">
					<td><asp:label ID="BillcontactLbl" Runat="server">Attn</asp:label></td>
					<td>:</td>
					<td>
						<asp:Label id="BillcontactTextLbl" runat="server"></asp:Label></td>
					<td class="style1">
						&nbsp;</td>
					<td>
						&nbsp;</td>
				</tr>
				</table>--%>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False"
        AllowPaging="True" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
        OnItemDataBound="ResultDG_ItemDataBound" OnGridExporting="RadGrid1_GridExporting" OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting"
        ExportSettings-UseItemStyles="true">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="True" />
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
                <telerik:GridBoundColumn HeaderText="MR" DataField="exref2" AllowFiltering="true"
                    SortExpression="exref2" UniqueName="exref2" Reorderable="true" Display="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Vessel" DataField="vslvoy" AllowFiltering="true"
                    SortExpression="vslvoy" UniqueName="vslvoy" Reorderable="true" Display="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Mode" DataField="typedescr" AllowFiltering="true"
                    SortExpression="typedescr" UniqueName="typedescr" Reorderable="true" Display="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ChargeDescr" DataField="ChargeDescr" AllowFiltering="true"
                    SortExpression="ChargeDescr" UniqueName="ChargeDescr" Reorderable="true" Display="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Ltr" DataField="qty" AllowFiltering="true" SortExpression="qty"
                    UniqueName="qty" Reorderable="true" Display="true" DataFormatString="{0:#,0.000}">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="UrgentType1" DataField="ishprioritydescr" AllowFiltering="true"
                    SortExpression="ishprioritydescr" UniqueName="ishprioritydescr" Reorderable="true"
                    Display="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="OrderDateTime" DataField="exdate1" AllowFiltering="true"
                    SortExpression="exdate1" UniqueName="exdate1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}"
                    Display="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ReadyBy/DateTime" DataField="expdate" AllowFiltering="true"
                    SortExpression="expdate" UniqueName="expdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}"
                    Display="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ApprovedBy" DataField="exref3" AllowFiltering="true"
                    SortExpression="exref3" UniqueName="exref3" Reorderable="true" Display="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Department" DataField="exref4" AllowFiltering="true"
                    SortExpression="exref4" UniqueName="exref4" Reorderable="true" Display="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Finance" DataField="billingamt" AllowFiltering="true"
                    SortExpression="billingamt" UniqueName="billingamt" Reorderable="true" Display="true"
                    DataFormatString="{0:#,0.000}">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
