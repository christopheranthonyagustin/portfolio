<%@ Page language="c#" Codebehind="ListDetlResult.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.ListDetl.ListDetlResult" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>ListDetl</title>
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
					<td>Report</td>
					<td>:</td>
					<td><asp:label id="ListLbl" runat="server"></asp:label></td>
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
			<telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" 
            OnNeedDataSource="ResultDG_NeedDataSource">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="200" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                
			 <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
			                <HeaderTemplate>
								No
							</HeaderTemplate>
							<ItemTemplate>
								<%#Container.ItemIndex+1%>
							</ItemTemplate>
			 </telerik:GridTemplateColumn>
			  <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="code" SortExpression="code" HeaderText="Code"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="acid" SortExpression="acid" HeaderText="Account ID"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="item" SortExpression="item" HeaderText="Item"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Description"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="usrdef01" SortExpression="usrdef01" HeaderText="User Def.01"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="usrdef02" SortExpression="usrdef02" HeaderText="User Def.02"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="usrdef03" SortExpression="usrdef03" HeaderText="User Def.03"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="usrdef04" SortExpression="usrdef04" HeaderText="User Def.04"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="usrdef05" SortExpression="usrdef05" HeaderText="User Def.05"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="status" Display="false">
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" 
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" 
                        ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
					    <ItemStyle Wrap="False"></ItemStyle>
               </telerik:GridBoundColumn>
               </Columns>
            </MasterTableView>
        </telerik:RadGrid>
	</div>
		</form>
	</body>
</html>
