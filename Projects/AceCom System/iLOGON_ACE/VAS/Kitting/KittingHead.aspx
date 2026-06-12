<%@ Page language="c#" Codebehind="KittingHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.VAS.Kitting.KittingHead" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>KittingHead</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
		    <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />

		<p>
            <asp:Label style="Z-INDEX: 0" id="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
        </p>
			   <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
        OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
        <GroupingSettings CaseSensitive="false" />
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
							<ItemTemplate>
								<a id="lnkGenerate" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm Generate Kitting Documents?')" onserverclick="KTHead_BuildDoc" runat=server>
									<img id="generateImg" src="..\..\image\generate.png" Width="15" Height="15" border="0"
										alt="Generate Kitting Documents" runat="server"></a>
								<a id="lnkFinalize" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm Finalize Kitting Documents?')" onserverclick="KTHead_FinalizeDoc" runat=server>
									<img id="finalizeImg" src="..\..\image\finalize.gif" Width="15" Height="15" border="0"
										alt="Finalize Kitting Documents" runat="server"></a>
								<asp:Label id="DetailLbl" runat="server"></asp:Label>
								<a id=lnkDelete href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete Kitting?')" onserverclick="KTHead_Delete" runat=server>
									<img id="delImg" src="..\..\image\bin.gif" Width="15" Height="15" border="0" alt="Delete Kitting Header"
										runat="server"></a>
							</ItemTemplate>
							<ItemStyle Wrap="False"></ItemStyle>
						</telerik:GridTemplateColumn>
						
						<telerik:GridBoundColumn DataField="acid"  Display="false" ></telerik:GridBoundColumn>
                
					<telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                      </telerik:GridBoundColumn>
						
						<telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site">
                      </telerik:GridBoundColumn>
						
						<telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="KittingNo">
                      </telerik:GridBoundColumn>
						
						<telerik:GridBoundColumn DataField="status"  Display="false"></telerik:GridBoundColumn>
						
						<telerik:GridBoundColumn DataField="prioritydescr" SortExpression="prioritydescr" HeaderText="Priority">
                      </telerik:GridBoundColumn>
						
						<telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                      </telerik:GridBoundColumn>
						
						<telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKUCode">
                      </telerik:GridBoundColumn>
						
					   <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
                      </telerik:GridBoundColumn>
						
					<telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="Qty">
                      </telerik:GridBoundColumn>	
						
						<telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="ExpectedDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                      </telerik:GridBoundColumn>
						
						<telerik:GridBoundColumn DataField="ref1" SortExpression="ref1" HeaderText="CustomerReference">
                      </telerik:GridBoundColumn>	
						
						<telerik:GridBoundColumn DataField="ref2" SortExpression="ref2" HeaderText="ExternalReference">
                      </telerik:GridBoundColumn>
						
						<telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark 1">
                      </telerik:GridBoundColumn>
						
						<telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark 2">
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
