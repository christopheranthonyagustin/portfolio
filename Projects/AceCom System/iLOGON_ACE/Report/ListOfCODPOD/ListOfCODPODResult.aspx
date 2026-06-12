<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListOfCODPODResult.aspx.cs" Inherits="iWMS.Web.Report.ListOfCODPOD.ListOfCODPODResult" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>ListOfOutstandingCODPOD</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
		<script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>
    <style type="text/css">
        .style1
        {
            height: 19px;
        }
        .style2
        {
           width :auto;
        }
    </style>
</head>
    
    <body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
		 <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<div style="HEIGHT: 33%; top: 0px; left: 0px;" id="div-datagrid">
			<table width="100%">
				<tr class="graytitle">
					<td colspan="3"><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td>Report</td>
					<td>:</td>
					<td width="80%" colspan="2"><asp:label id="lblTitle" runat="server" Width ="80%"></asp:label></td>
					<td width="80%" align="right">
						&nbsp;</td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="Label1" runat="server">VehNo</asp:label></td>
					<td>:</td>
					<td colSpan="2"><asp:label id="vehnolbl" runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td class="style1"><asp:label id="Label3" runat="server">Driver</asp:label></td>
					<td class="style1">:</td>
					<td colSpan="2" class="style1"><asp:label id="driverlbl" runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="Label4" runat="server">ShpType</asp:label></td>
					<td>:</td>
					<td class="style2" colSpan="3"><asp:label id="eqptypelbl" runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="Label5" runat="server">TptType</asp:label></td>
					<td>:</td>
					<td class="style2" colSpan="3"><asp:label id="tpttypelbl" runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="Label2" runat="server">JbStatus</asp:label></td>
					<td>:</td>
					<td colSpan="2"><asp:label id="jbstatuslbl" runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="DateLbl" runat="server">Date</asp:label></td>
					<td>:</td>
					<td colSpan="2"><asp:label id="NowLbl" runat="server"></asp:label></td>
				</tr>
			</table>
						<A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif"
								height="20" runat="server"></A></div>
   
			 <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="Both"
        EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true"
        AllowFilteringByColumn="true"   OnNeedDataSource="ResultDG_NeedDataSource" OnGridExporting="ResultDG_GridExporting">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
         <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
              <telerik:GridBoundColumn DataField="frexpdate" SortExpression="frexpdate" DataFormatString="{0:dd/MMM/yyyy}" HeaderText="ExpectDate" AllowFiltering = "false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="VehNo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="assignpername" SortExpression="invno" HeaderText="InvoiceNo" AllowFiltering ="false" AllowSorting="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbno" SortExpression="jbno" HeaderText="JobNo" 
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="eqptypedescr" SortExpression="eqptype" HeaderText="ShipmentType"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tptDescr" SortExpression="tpttype" HeaderText="TptType"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="BillSizeTypeDescr" SortExpression="ctnrtype" HeaderText="BillSizeType"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="acname" SortExpression="acname" HeaderText="Account"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="codamt" SortExpression="codamt" HeaderText="CODAmount" DataFormatString="{0:0.00}" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="CollectFrom"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="toaddr" SortExpression="toaddr" HeaderText="DeliverTo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbstatusdescr" SortExpression="jbstatus" HeaderText="JobStatus"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         </Columns>
                </MasterTableView>
            </telerik:RadGrid>
   
    </form> 
</body>
</html>
