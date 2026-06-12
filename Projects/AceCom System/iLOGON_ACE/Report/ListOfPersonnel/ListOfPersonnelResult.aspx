<%@ Page language="c#" Codebehind="ListOfPersonnelResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.ListOfPersonnel.ListOfPersonnelResult" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html>
	<head runat="server">
		<title>ListOfPersonnel</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../../css/iWMS.css">
		<script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>
	</head>
	<body bottomMargin="0" leftMargin="0" rightMargin="0" topMargin="0">
		<form id="Form1" method="post" runat="server">
		<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table width="100%">
				<tr class="graytitle">
					<td colspan="3"><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td>Report</td>
					<td>:</td>
					<td>List Of Personnel</td>
					<td width="80%" align="right">
						<A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
				<tr class="graytitle">
				    <td><asp:label id="Status" runat="server">Status</asp:label></td>
					<td>:</td>
					<td colspan="3"><asp:label ID="StatusLbl" Runat="server"></asp:label></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="DateLbl" runat="server">Date</asp:label></td>
					<td>:</td>
					<td colSpan="2"><asp:label id="NowLbl" runat="server"></asp:label></td>
				</tr>
			</table>
			<div style="HEIGHT: 90%" id="div-datagrid">
			<telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False"
                        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
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
                                <telerik:GridBoundColumn HeaderText="Status Descr" DataField="StatusDescr" >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Dept Descr" DataField="DeptDescr" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="Vocation Descr" DataField="VocationDescr" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="Name" DataField="Name" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="Id No" DataField="IdNo" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="Date Birth DMY" DataField="DateBirthDMY" DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>	
                                <telerik:GridBoundColumn HeaderText="Date Join DMY" DataField="DateJoinDMY" DataFormatString="{0:dd/MMM/yyyy}">
                                </telerik:GridBoundColumn>			
				                <telerik:GridBoundColumn HeaderText="Code" DataField="code" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="Alias" DataField="alias" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="idtype" DataField="idtype" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="gender" DataField="gender" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="Address" DataField="Address" >
                                </telerik:GridBoundColumn>                                
                                <telerik:GridBoundColumn HeaderText="date resign" DataField="dateresign" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="Date Rejoin" DataField="DateRejoin" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="nationality" DataField="nationality" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="dept" DataField="dept" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="grade" DataField="pergradedescr" >
                                </telerik:GridBoundColumn>                                
                                <telerik:GridBoundColumn HeaderText="cat" DataField="cat" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="team" DataField="team" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="role" DataField="role" >
                                </telerik:GridBoundColumn>                                
                                <telerik:GridBoundColumn HeaderText="commsno" DataField="commsno" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="telno" DataField="telno" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="app device id" DataField="AppDeviceId" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="remarks1" DataField="remarks1" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="remarks2" DataField="remarks2" >
                                </telerik:GridBoundColumn>                                
                                <telerik:GridBoundColumn HeaderText="descr" DataField="descr" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="descr2" DataField="descr2" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="biometrictype" DataField="biometrictype" >
                                </telerik:GridBoundColumn>                                
                                <telerik:GridBoundColumn HeaderText="agency" DataField="agency" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="passportno" DataField="passportno" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="bankaccountno" DataField="bankaccountno" >
                                </telerik:GridBoundColumn>                                
                                <telerik:GridBoundColumn HeaderText="nokname" DataField="nokname" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="nokcontactno" DataField="nokcontactno" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="nokaddress" DataField="nokaddress" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="nokrelationship" DataField="nokrelationship" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="race" DataField="race" >
                                </telerik:GridBoundColumn>                                
                                <telerik:GridBoundColumn HeaderText="maritalstatus" DataField="maritalstatus" >
                                </telerik:GridBoundColumn>                                
                                <telerik:GridBoundColumn HeaderText="banktype" DataField="banktype" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="is MP" DataField="isMP" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="last Job" DataField="lastJob" >
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="photoavailable" DataField="photoavailable" >
                                </telerik:GridBoundColumn>	
                                <telerik:GridBoundColumn HeaderText="adddate" DataField="adddate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="adduser" DataField="adduser">
                                </telerik:GridBoundColumn>	
                                <telerik:GridBoundColumn HeaderText="editdate" DataField="editdate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
				                <telerik:GridBoundColumn HeaderText="edituser" DataField="edituser">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
               </telerik:RadGrid>
            </div>
		</form>
	</body>
</html>
