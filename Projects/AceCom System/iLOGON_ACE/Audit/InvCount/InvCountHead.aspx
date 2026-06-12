<%@ Page language="c#" Codebehind="InvCountHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.InvCount.InvCountHead" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
	<head runat="server">
		<title>InvCountHead</title>
		<LINK href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
		<SCRIPT src="../../js/sub_global.js" type="text/javascript"></SCRIPT>
		<SCRIPT src="../../js/sub_menu.js" type="text/javascript"></SCRIPT>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
		    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                EnableLinqExpressions="false" AllowPaging ="true"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnPageIndexChanged="ResultDG_PageIndexChanged"
                OnItemDataBound="ResultDG_ItemDataBound" >
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50"  
                DataKeyNames="id" >
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemTemplate>
                               <asp:ImageButton runat="server" Visible="True" ID="InvCountEdit" ImageUrl="../../image/pencil.gif"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Goods Issue"
                            OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
						        <iwms:iSubMenu id="subMenuCtl" runat="server"></iwms:iSubMenu>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn Display="False" DataField="id"></telerik:GridBoundColumn>
				        <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="InvCountNo" AllowFiltering="false">
					        <HeaderStyle Wrap="False"></HeaderStyle>
					        <ItemStyle Wrap="False"></ItemStyle>
				        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="acid"></telerik:GridBoundColumn>                        
					    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="sitecode" Display="False"></telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="officer" SortExpression="officer" HeaderText="Officer">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="type" Display="False"></telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="cat" Display="False"></telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="catdescr" SortExpression="catdescr" HeaderText="Cat">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="grp" Display="False"></telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="grpdescr" SortExpression="grpdescr" HeaderText="Group">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="scheduledate" SortExpression="scheduledate" HeaderText="Schedule" DataFormatString="{0:dd/MMM/yyyy}">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="actualfrdate" SortExpression="actualfrdate" HeaderText="From" DataFormatString="{0:dd/MMM/yyyy}">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="actualtodate" SortExpression="actualtodate" HeaderText="To" DataFormatString="{0:dd/MMM/yyyy}">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="status" Display="False"></telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark 1">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>
					    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </telerik:GridBoundColumn>                        
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
		</form>
	</body>
</html>
