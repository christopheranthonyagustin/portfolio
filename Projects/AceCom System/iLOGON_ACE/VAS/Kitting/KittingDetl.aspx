<%@ Page language="c#" Codebehind="KittingDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.VAS.Kitting.KittingDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
	<head runat="server">
		<title>KittingDetl</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
		    <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />

			<table cellSpacing="0" cellPadding="0" border="0" width="100%">
				<tr>
					<td>
						<div class="pagetitle">
							<asp:label id="KtIdLbl" runat="server" Visible="false"></asp:label></div>
					</td>
				</tr>
			</table>
			<br>
			<div id="div-datagrid">
			
			 <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
         OnPageIndexChanged="ResultDG_PageIndexChanged">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
            
                <telerik:GridTemplateColumn AllowFiltering="false" >
							<HeaderTemplate>
								No
							</HeaderTemplate>
							<ItemTemplate>
								<%#Container.ItemIndex+1%>
							</ItemTemplate>
                </telerik:GridTemplateColumn>
                
                <telerik:GridBoundColumn DataField="srcno" SortExpression="srcno" HeaderText="SrcNo">
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="srcstatusdescr" SortExpression="srcstatusdescr" HeaderText="SrcStatus">
                </telerik:GridBoundColumn>
						
				<telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                </telerik:GridBoundColumn>		
						
		    	<telerik:GridBoundColumn Display="false" DataField="status"> </telerik:GridBoundColumn>
						
			    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                </telerik:GridBoundColumn>		
						
				<telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>	
						
				<telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                </telerik:GridBoundColumn>			
						
				<telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>			
						
						<telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                </telerik:GridBoundColumn>	
				
						
					</Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
	</body>
</html>
