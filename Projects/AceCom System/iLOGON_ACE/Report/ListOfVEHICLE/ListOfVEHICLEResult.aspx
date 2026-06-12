<%@ Page language="c#" Codebehind="ListOfVEHICLEResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.ListOfVEHICLE.ListOfVEHICLEResult" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<html>
	<head runat="server">
		<title>ListOfEquipment</title>
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
					<td>List Of Equipment</td>
					<td width="80%" align="right">
						<A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								height="20" runat="server"></A></td>
				</tr>
				<tr class="graytitle">
					<td><asp:label id="DateLbl" runat="server">Date</asp:label></td>
					<td>:</td>
					<td colSpan="2"><asp:label id="NowLbl" runat="server"></asp:label></td>
				</tr>
			</table>
			<div style="HEIGHT: 90%" id="div-datagrid">			
		    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" 
		        Skin="Office2007" ExportSettings-UseItemStyles="true" >
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
                        <telerik:GridBoundColumn HeaderText="Veh Status" DataField="VehStatus" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="opsunitcode" DataField="opsunitcode" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="type" DataField="type" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="code" DataField="code" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="code2" DataField="code2" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="vehno" DataField="vehno" >
                        </telerik:GridBoundColumn>	
                        <telerik:GridBoundColumn HeaderText="descr" DataField="descr" >
                        </telerik:GridBoundColumn>			
		                <telerik:GridBoundColumn HeaderText="descr2" DataField="descr2" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="commsno" DataField="commsno" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="iuno" DataField="iuno" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="trailerno" DataField="trailerno" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="trailerdescr" DataField="trailerdescr" >
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="Diesel" DataField="Diesel" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="cat" DataField="cat" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="vehparkcode" DataField="vehparkcode" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="cranetypecode" DataField="cranetypecode" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="cranemake" DataField="cranemake" >
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="cranemodel" DataField="cranemodel" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="craneyearmfg" DataField="craneyearmfg" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="cranechassisno" DataField="cranechassisno" >
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="vehmake" DataField="vehmake" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="vehmodel" DataField="vehmodel" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="vehyearmfg" DataField="vehyearmfg" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="vehchassisno" DataField="vehchassisno" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="vehengineno" DataField="vehengineno" >
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="omvamt" DataField="omvamt" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="registerentity" DataField="registerentity" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="registerdate" DataField="registerdate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="grosswt" DataField="grosswt" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="nettwt" DataField="nettwt" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="grossvol" DataField="grossvol" >
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="nettvol" DataField="nettvol" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="lastgeolat" DataField="lastgeolat" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="lastgeolng" DataField="lastgeolng" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="expirydate" DataField="expirydate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="expiryref" DataField="expiryref" >
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="expiryrem" DataField="expiryrem" >
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="expirystatus" DataField="expirystatus" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="In Active Date" DataField="InActiveDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="insuranceexpirydate" DataField="insuranceexpirydate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="insuranceref" DataField="insuranceref" >
		                </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="insurancerefdate" DataField="insurancerefdate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="insuranceamt" DataField="insuranceamt" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="insuranceremarks" DataField="insuranceremarks" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="insurancestatus" DataField="insurancestatus" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="vpcexpirydate" DataField="vpcexpirydate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="vpcref" DataField="vpcref" >
                        </telerik:GridBoundColumn>	
                        <telerik:GridBoundColumn HeaderText="vpcrefdate" DataField="vpcrefdate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>			
		                <telerik:GridBoundColumn HeaderText="vpcamt" DataField="vpcamt" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="vpcremarks" DataField="vpcremarks" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="vpcstatus" DataField="vpcstatus" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="roadtaxexpirydate" DataField="roadtaxexpirydate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="roadtaxref" DataField="roadtaxref" >
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="roadtaxrefdate" DataField="roadtaxrefdate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="roadtaxamt" DataField="roadtaxamt" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="roadtaxremarks" DataField="roadtaxremarks" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="roadtaxstatus" DataField="roadtaxstatus" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="serviceexpirydate" DataField="serviceexpirydate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="serviceref" DataField="serviceref" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="servicerefdaate" DataField="servicerefdaate" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="serviceamt" DataField="serviceamt" >
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="servicelastdo" DataField="servicelastdo" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="servicenexttodo" DataField="servicenexttodo" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="serviceremarks" DataField="serviceremarks" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="servicestatus" DataField="servicestatus" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="inspectionexpirydate" DataField="inspectionexpirydate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="insepctionref" DataField="insepctionref" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="inspectionrefdate" DataField="inspectionrefdate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="inspectionamt" DataField="inspectionamt" >
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="inspectionremarks" DataField="inspectionremarks" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="inspectionstatus" DataField="inspectionstatus" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="coeexpirydate" DataField="coeexpirydate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="coeref" DataField="coeref" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="coerefdate" DataField="coerefdate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="coeamt" DataField="coeamt" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="coeremarks" DataField="coeremarks" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="coestatus" DataField="coestatus" >
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="datebirth" DataField="datebirth" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="datejoin" DataField="datejoin" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="typedescr" DataField="typedescr" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="drivername" DataField="drivername" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="routedescr" DataField="routedescr" >	
		                </telerik:GridBoundColumn>	                
		                <telerik:GridBoundColumn HeaderText="catdescr" DataField="catdescr" >
                        </telerik:GridBoundColumn>                                
                        <telerik:GridBoundColumn HeaderText="vehparkdescr" DataField="vehparkdescr" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="cranetypedescr" DataField="cranetypedescr" >
                        </telerik:GridBoundColumn>
		                <telerik:GridBoundColumn HeaderText="opsunitcodedescr" DataField="opsunitcodedescr" >
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
