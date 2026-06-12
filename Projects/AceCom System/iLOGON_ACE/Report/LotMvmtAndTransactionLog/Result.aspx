<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.LotMvmtAndTransactionLog.Result" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <title>Lot Movement and Transaction Log</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <style type="text/css">
        .blackBoldText
        {
            color: #000000; 
            FONT-SIZE: 18px; 
            FONT-FAMILY: Arial,Verdana,Helvetica;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
		    <tr class="graytitle">
				<td colspan="3"><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>
				<td width="70%" align="right">
				    <a id="a1" runat="server" onserverclick="ExportExcel">
				        <img id="img1" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif" height="20" runat="server" />
				    </a>
				</td>
			</tr>
			<tr class="graytitle">
				<td><asp:label ID="ReportLbl" Runat="server">Report</asp:label></td>
				<td>:</td>
				<td colSpan="2">
					<asp:label id="TitleLbl" runat="server" CssClass="Graytitle">Lot Movement and Transaction Log</asp:label><asp:Label id="FromDateLbl" runat="server"></asp:Label><asp:Label id="ToDateLbl" runat="server"></asp:Label>
				</td>
			</tr>	
			<tr class="graytitle">
				<td><asp:label ID="AccLbl" Runat="server">Account</asp:label></td>
				<td>:</td>
				<td colSpan="2">
					<asp:Label id="AccountLbl" runat="server"></asp:Label>
				</td>
			</tr>				
		</table>
		<br />
        <div id="div-datagrid">
            <asp:DataGrid ID="ResultDG" runat="server" UseAccessibleHeader="True" CellPadding="2"
                GridLines="Both" BorderStyle="None" AutoGenerateColumns="false">
                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem"></ItemStyle>
                <Columns>
                    <asp:BoundColumn DataField="Account" HeaderText="Account" />
                    <asp:BoundColumn DataField="SKU" HeaderText="SKU" />
                    <asp:BoundColumn DataField="Code2" HeaderText="Code2" />
                    <asp:BoundColumn DataField="Description" HeaderText="Description" />
                    <asp:BoundColumn DataField="SysDate" HeaderText="SysDate" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}" />
                    <asp:BoundColumn DataField="TransDate" HeaderText="TransDate" DataFormatString="{0:dd/MMM/yyyy}" />
                    <asp:BoundColumn DataField="TransUser" HeaderText="TransUser" />
                    <asp:BoundColumn DataField="TransNo" HeaderText="TransNo" />
                    <asp:BoundColumn DataField="TransType" HeaderText="TransType" />
                    <asp:BoundColumn DataField="SRC" HeaderText="SRC" visible="false" />
                    <asp:BoundColumn DataField="SysRem" HeaderText="SysRem" />
                    <asp:BoundColumn DataField="UserRem1" HeaderText="UserRem1" />
                    <asp:BoundColumn DataField="UserRem2" HeaderText="UserRem2" />
                    <asp:BoundColumn DataField="Qty" HeaderText="Qty" />
                    <asp:BoundColumn DataField="LocCode" HeaderText="LocCode" />
                    <asp:BoundColumn DataField="TuNo1" HeaderText="TuNo1" />
                    <asp:BoundColumn DataField="TuNo2" HeaderText="TuNo2" />
                    <asp:BoundColumn DataField="lot1" HeaderText="Lot1" DataFormatString="{0:dd/MMM/yyyy}" />
                    <asp:BoundColumn DataField="lot2" HeaderText="Lot2" DataFormatString="{0:dd/MMM/yyyy}" />
                    <asp:BoundColumn DataField="lot3" HeaderText="Lot3" DataFormatString="{0:dd/MMM/yyyy}" />
                    <asp:BoundColumn DataField="lot4" HeaderText="Lot4" />
                    <asp:BoundColumn DataField="lot5" HeaderText="Lot5" />
                    <asp:BoundColumn DataField="lot6" HeaderText="Lot6" />
                    <asp:BoundColumn DataField="lot7" HeaderText="Lot7" />
                    <asp:BoundColumn DataField="lot8" HeaderText="Lot8" />
                    <asp:BoundColumn DataField="lot9" HeaderText="Lot9" />
                    <asp:BoundColumn DataField="lot10" HeaderText="Lot10" />
                    <asp:BoundColumn DataField="lot11" HeaderText="Lot11" />
                    <asp:BoundColumn DataField="lot12" HeaderText="Lot12" />
                    <asp:BoundColumn DataField="lot13" HeaderText="Lot13" />
                    <asp:BoundColumn DataField="lot14" HeaderText="Lot14" />
                    <asp:BoundColumn DataField="lot15" HeaderText="Lot15" />
                    <asp:BoundColumn DataField="lot16" HeaderText="Lot16" />
                    <asp:BoundColumn DataField="lot17" HeaderText="Lot17" />
                    <asp:BoundColumn DataField="lot18" HeaderText="Lot18" />
                    <asp:BoundColumn DataField="lot19" HeaderText="Lot19" />
                    <asp:BoundColumn DataField="lot20" HeaderText="Lot20" />
                    <asp:BoundColumn DataField="lot21" HeaderText="Lot21" />
                    <asp:BoundColumn DataField="lot22" HeaderText="Lot22" />
                    <asp:BoundColumn DataField="lot23" HeaderText="Lot23" />
                    <asp:BoundColumn DataField="lot24" HeaderText="Lot24" />
                    <asp:BoundColumn DataField="lot25" HeaderText="Lot25" />
                    <asp:BoundColumn DataField="lot26" HeaderText="Lot26" />
                    <asp:BoundColumn DataField="lot27" HeaderText="Lot27" />
                    <asp:BoundColumn DataField="lot28" HeaderText="Lot28" />
                    <asp:BoundColumn DataField="lot29" HeaderText="Lot29" />
                    <asp:BoundColumn DataField="lot30" HeaderText="Lot30" />
                    <asp:BoundColumn DataField="lot31" HeaderText="Lot31" />
                    <asp:BoundColumn DataField="lot32" HeaderText="Lot32" />
                    <asp:BoundColumn DataField="lot33" HeaderText="Lot33" />
                    <asp:BoundColumn DataField="lot34" HeaderText="Lot34" />
                    <asp:BoundColumn DataField="lot35" HeaderText="Lot35" />
                    <asp:BoundColumn DataField="lot36" HeaderText="Lot36" />
                    <asp:BoundColumn DataField="lot37" HeaderText="Lot37" />
                    <asp:BoundColumn DataField="lot38" HeaderText="Lot38" />
                    <asp:BoundColumn DataField="lot39" HeaderText="Lot39" />
                    <asp:BoundColumn DataField="lot40" HeaderText="Lot40" />
                    <asp:BoundColumn DataField="lot41" HeaderText="Lot41" />
                    <asp:BoundColumn DataField="lot42" HeaderText="Lot42" />
                    <asp:BoundColumn DataField="lot43" HeaderText="Lot43" />
                    <asp:BoundColumn DataField="lot44" HeaderText="Lot44" />
                    <asp:BoundColumn DataField="lot45" HeaderText="Lot45" />
                    <asp:BoundColumn DataField="lot46" HeaderText="Lot46" />
                    <asp:BoundColumn DataField="lot47" HeaderText="Lot47" />
                    <asp:BoundColumn DataField="lot48" HeaderText="Lot48" />
                    <asp:BoundColumn DataField="lot49" HeaderText="Lot49" />
                    <asp:BoundColumn DataField="lot50" HeaderText="Lot50" />
                    <asp:BoundColumn DataField="lot51" HeaderText="Lot51" />
                    <asp:BoundColumn DataField="lot52" HeaderText="Lot52" />
                    <asp:BoundColumn DataField="lot53" HeaderText="Lot53" />
                    <asp:BoundColumn DataField="lot54" HeaderText="Lot54" />
                    <asp:BoundColumn DataField="lot55" HeaderText="Lot55" />
                    <asp:BoundColumn DataField="lot56" HeaderText="Lot56" />
                    <asp:BoundColumn DataField="lot57" HeaderText="Lot57" />
                    <asp:BoundColumn DataField="lot58" HeaderText="Lot58" />
                    <asp:BoundColumn DataField="lot59" HeaderText="Lot59" />
                    <asp:BoundColumn DataField="lot60" HeaderText="Lot60" />
                </Columns>
            </asp:DataGrid>
        </div>
    </form>
</body>
</html>
