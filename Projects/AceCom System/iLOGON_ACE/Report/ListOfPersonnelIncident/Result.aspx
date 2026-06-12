<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.ListOfPersonnelIncident.Result" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
    <head id="Head1" runat="server">
		<title>List Of Personnel Incident Report</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
		<meta name="CODE_LANGUAGE" content="C#" />
		<meta name="vs_defaultClientScript" content="JavaScript" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
		<script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>
		<style type="text/css">
        body
        {
            overflow: hidden;
        }
    </style>
	</head>
    <body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="form1" method="post" runat="server">
			<table width="100%">
				<tr class="graytitle">
					<td colspan="3"><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td>Report</td>
					<td>:</td>
					<td>List Of Personnel Incident</td>
					<td width="50%" align="right">
						<a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></a></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="DateLbl" runat="server">Date</asp:label></td>
					<td>:</td>
					<td colspan="2"><asp:label id="NowLbl" runat="server"></asp:label></td>
				</tr>
			</table>
			<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<div style="HEIGHT: 90%" id="div-datagrid">
				 <telerik:RadGrid ID="ResultDG" runat="server" GridLines="Both" AutoGenerateColumns="false"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="true" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid"  
         Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
        OnItemDataBound="ResultDG_ItemDataBound">
        <clientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" enablepostbackonrowclick="false">                 
            <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
        </clientSettings>
        <alternatingitemstyle wrap="true"></alternatingitemstyle>
        <itemstyle wrap="true"></itemstyle>
        <headerstyle wrap="true"></headerstyle>
        <footerstyle font-bold="true" wrap="true"></footerstyle>
        <mastertableview allowmulticolumnsorting="false" name="Master"
            width="100%">
            <Columns>
                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" 
                    HeaderStyle-Width="100px" FilterControlWidth="80px" ColumnGroupName="statusdescr"
                    SortExpression="statusdescr" UniqueName="statusdescr"
                    ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="IncidentType" DataField="typedescr" 
                    HeaderStyle-Width="100px" FilterControlWidth="80px" ColumnGroupName="typedescr"
                    SortExpression="typedescr" UniqueName="typedescr" 
                    ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="IncidentDate" DataField="incidentdate" DataFormatString="{0:dd/MMM/yyyy}"
                    HeaderStyle-Width="70px" ColumnGroupName="incidentdate" SortExpression="incidentdate" UniqueName="incidentdate">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ExternalRef" DataField="extrefno" AllowFiltering="true"
                    FilterControlWidth="80px" ColumnGroupName="extrefno" SortExpression="extrefno"
                    UniqueName="extrefno" 
                    ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridDateTimeColumn DataField="extrefdate" HeaderText="ExternalDate" UniqueName="extrefdate"
                    FilterControlWidth="100px" SortExpression="extrefdate" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridDateTimeColumn>
                <telerik:GridBoundColumn HeaderText="Personnel" DataField="pername" AllowFiltering="true"
                    FilterControlWidth="70px" HeaderStyle-Width="80px" ColumnGroupName="srcno"
                    SortExpression="pername" 
                    ShowFilterIcon="false" UniqueName="pername">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="VehNo" DataField="vehno" 
                    HeaderStyle-Width="70px" ColumnGroupName="vehno" SortExpression="vehno"
                    UniqueName="vehno">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Remarks1" DataField="rem1" 
                    ColumnGroupName="rem1" SortExpression="rem1" UniqueName="rem1" Display="false">
                </telerik:GridBoundColumn>
		<telerik:GridBoundColumn HeaderText="Remarks2" DataField="rem2" 
                    HeaderStyle-Width="70px" ColumnGroupName="rem2" SortExpression="rem2"
                    UniqueName="rem2">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Findings" DataField="findings" 
                    ColumnGroupName="findings" SortExpression="findings" UniqueName="findings">
                </telerik:GridBoundColumn>
		<telerik:GridBoundColumn HeaderText="Resolution" DataField="resolution" 
                    HeaderStyle-Width="70px" ColumnGroupName="resolution" SortExpression="resolution"
                    UniqueName="resolution">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="CloseDate" DataField="closedate" DataFormatString="{0:dd/MMM/yyyy}"
                    ColumnGroupName="closedate" SortExpression="closedate" UniqueName="closedate" Display="false">
                </telerik:GridBoundColumn>
		<telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" 
                    HeaderStyle-Width="70px" ColumnGroupName="statuscolor" SortExpression="statuscolor" 
                    UniqueName="statuscolor" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Summary" DataField="summary" ColumnGroupName="summary"
                    SortExpression="summary" UniqueName="summary">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="RootCause" DataField="rootcause" ColumnGroupName="rootcause"
                    SortExpression="rootcause" UniqueName="rootcause">
                </telerik:GridBoundColumn>
            </Columns>
        </mastertableview>
    </telerik:RadGrid>
			</div>
		</form>
	</body>
</html>
