<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EqpAssignmentAuditListResult.aspx.cs" Inherits="iWMS.Web.Report.EqpAssignmentAuditList.EqpAssignmentAuditListResult" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
		<title>Equipment Assignment Audit List</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
        <style type="text/css">
.RadGrid_Office2007{border:1px solid #688caf;background-color:#fff;color:#333;font:normal 12px "Segoe UI",Arial,Helvetica,sans-serif;line-height:16px}.RadGrid table.rgMasterTable tr .rgExpandCol{padding-left:0;padding-right:0;text-align:center}
            .style1
            {
                border-left: 1px solid #d0d7e5;
                border-right: 0 solid #d0d7e5;
                border-top: 0 solid #d0d7e5;
                border-bottom: 1px solid #d0d7e5;
                padding-left: 7px;
                padding-right: 7px;
                padding-top: 4px;
                padding-bottom: 3px;
                background: #d7e6f7;
            }
        </style>
</head>
<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
			<table width="100%">
				<tr class="graytitle">
					<td>
					  <asp:Label ID="companyName" runat="server" /><br />  
					  <asp:Label ID="reportTitle" runat="server" />
					</td>
					<td align="right"><A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
			</table>
			<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
					 <telerik:RadGrid ID="ResultDG" runat="server" 
                EnableLinqExpressions="False" Skin="Office2007"
        OnItemDataBound="ResultDG_ItemDataBound"
        OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true"
        AutoGenerateColumns="false" GroupPanelPosition="Top" AllowPaging="false" 
                AllowSorting="true" CellPadding="2" UseAccessibleHeader="True" 
                ItemStyle-Wrap="False" ongridexporting="ResultDG_GridExporting" GridLines="Both">
					<AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
					   <MasterTableView AllowMultiColumnSorting="true">
					<Columns>
					  <telerik:GridTemplateColumn>
                <HeaderTemplate>
                    S/No
                </HeaderTemplate>
                <ItemTemplate>
                    <%#Container.ItemIndex + 1%>
                </ItemTemplate>
           </telerik:GridTemplateColumn>
            <telerik:GridBoundColumn  DataField="jobno" SortExpression="jobno" HeaderText="JobNo" />
            <telerik:GridBoundColumn  DataField="acname" SortExpression="acname" HeaderText="Account" />
            <telerik:GridBoundColumn  DataField="type" SortExpression="type" HeaderText="TripType" />
            <telerik:GridBoundColumn  DataField="frexpdate" SortExpression="frexpdate" HeaderText="ExpectedDate" DataFormatString="{0:dd/MMM/yyyy}" />
            <telerik:GridBoundColumn  DataField="vehnodescr" SortExpression="vehnodescr" HeaderText="VehNo" />
            <telerik:GridBoundColumn  DataField="trailernodescr" SortExpression="trailernodescr" HeaderText="TrailerNo" />
            <telerik:GridBoundColumn  DataField="trailerpickdrop" SortExpression="trailerpickdrop" HeaderText="PickDrop" />
            <telerik:GridBoundColumn  DataField="pername" SortExpression="pername" HeaderText="Driver" />
            <telerik:GridBoundColumn  DataField="vehparkcode" SortExpression="vehparkcode" HeaderText="VehPark" />
            <telerik:GridBoundColumn  DataField="remarks" SortExpression="remarks" HeaderText="TripRemarks" />
              <telerik:GridBoundColumn  DataField="fraddr" SortExpression="fraddr" HeaderText="FromAddress" />
                <telerik:GridBoundColumn  DataField="toaddr" SortExpression="toaddr" HeaderText="ToAddress" />
            <telerik:GridBoundColumn  DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" />
            <telerik:GridBoundColumn  DataField="adddate" SortExpression="adddate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"/>
            <telerik:GridBoundColumn  DataField="adduser" SortExpression="adduser" HeaderText="AddUser" />
            <telerik:GridBoundColumn  DataField="editdate" SortExpression="editdate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"/>
            <telerik:GridBoundColumn  DataField="edituser" SortExpression="edituser" HeaderText="edituser" />
            <telerik:GridBoundColumn  DataField="statuscolor" SortExpression="statuscolor" HeaderText="statuscolor" Display="false"/>
					</Columns>
					</MasterTableView>
				</telerik:RadGrid>
    <div id="div-datagrid" style="HEIGHT:90%">
<%--    <telerik:RadGrid id="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None" GridLines="Both"
					CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False" AllowSorting="true">--%>
					 </div>
    </form>
</body>
</html>
