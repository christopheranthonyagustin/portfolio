<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillingInstructionSubDetl.aspx.cs" Inherits="iWMS.Web.BillingManagement.BillingInstruction.BillingInstructionSubDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
		<title>DO/Inv</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	</head>
	<body topMargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" border="0" width="100%">
				<tr>
				  <td class="pagetitle">
                <asp:Label ID="IdLbl" runat="server"></asp:Label>
          </td>
          <td align="right">
                <asp:Label id="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                <asp:Button ID="AddDetailBtn" runat="server" Text="+ Detail" Visible="false" CssClass="detailButton"
                    OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;
          </td>
			  </tr>
			</table>
			<div id="div-datagrid">
				<asp:datagrid id="BISDetlDG" runat="server" AutoGenerateColumns="False" OnCancelCommand="BISDetlDG_Cancel" AllowSorting="true"
					OnUpdateCommand="BISDetlDG_Update" OnEditCommand="BISDetlDG_Edit" GridLines="Both" CellPadding="2" OnItemDataBound="BISDetlDG_ItemDataBound"
					DataKeyField="id" UseAccessibleHeader="True" ItemStyle-VerticalAlign="Middle" EditItemStyle-VerticalAlign="Middle">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
					<Columns>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton Runat="server" Visible="True" ImageAlign="AbsMiddle" ID="BISDetEdit" ImageUrl="..\..\image\pencil.gif"
									Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
								<asp:Label id="DetailLbl" runat="server"></asp:Label>
								<a id=InkDelette href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')" onserverclick="BISDetDelete" runat=server>
									<img id="delImg" src="..\..\image\bin.gif" Width="15" Height="15" border="0" alt="Delete DO/Inv"
										align="absmiddle" runat="server"></a>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:ImageButton Runat="server" Visible="True" ID="PackUpdate" ImageUrl="..\..\image\floppy.gif"
									Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
								<asp:ImageButton Runat="server" Visible="True" ID="PackCancel" ImageUrl="..\..\image\arrow6.gif"
									Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent" BorderWidth="0"
									CausesValidation="False"></asp:ImageButton>
							</EditItemTemplate>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:TemplateColumn>
						<asp:BoundColumn Visible="False" DataField="Id" SortExpression="Id" HeaderText="ID"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="biId" SortExpression="biId" HeaderText="BIID"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="bidtId" SortExpression="bidtId" HeaderText="BIDTID"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="acId" SortExpression="acId" HeaderText="ACID"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="divcode" SortExpression="divcode" HeaderText="DIV"></asp:BoundColumn>
						<asp:TemplateColumn HeaderText="HouseNo" SortExpression="houseno">
							<EditItemTemplate>
								<asp:DropDownList ID="house" DataMember="" DataTextField="houseno" DataValueField="id" SelectedIndex='<%# Bind("bidtid")%>' OnSelectedIndexChanged="HouseDDL_SelectedIndexChanged" AutoPostBack="true" DataSource='<%# bidtDS%>' runat="server"/>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "houseno") %>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Customer" SortExpression="accode">
							<EditItemTemplate>
								<asp:DropDownList ID="account" DataMember="" DataTextField="code" DataValueField="id" SelectedIndex='<%#Bind("acid")%>' DataSource='<%# accDS%>' runat="server"/>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "accode")%>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Div" SortExpression="divcode">
							<EditItemTemplate>
								<asp:DropDownList ID="acdiv" DataMember="" DataTextField="divcode" DataValueField="divcode" runat="server"/><asp:RequiredFieldValidator ID="acdivVal" Runat="server" ControlToValidate="acdiv" ErrorMessage="*" Visible="false"/>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "divcode") %>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="DO/Inv" SortExpression="doinvno">
							<EditItemTemplate>
								<asp:TextBox ID="DOInvTxt" Runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "doinvno") %>' BackColor="Yellow"></asp:TextBox>
								<asp:RequiredFieldValidator ID="DoInvVal" Runat="server" ControlToValidate="DOInvTxt" ErrorMessage="*"></asp:RequiredFieldValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "doinvno")%>
							</ItemTemplate>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Qty" SortExpression="qty">
							<EditItemTemplate>
								<asp:TextBox ID="QtyTxt" Runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "qty") %>'></asp:TextBox>
								<asp:CompareValidator ID="QtyVal" Runat="server" ControlToValidate="QtyTxt" EnableClientScript="True"
									ErrorMessage="#" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.000}")%>
							</ItemTemplate>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Vol" SortExpression="vol">
							<EditItemTemplate>
								<asp:TextBox ID="VolTxt" Runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "vol") %>' ></asp:TextBox>
								<asp:CompareValidator ID="VolVal" Runat="server" ControlToValidate="VolTxt" EnableClientScript="true"
									ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "vol", "{0:#,0.000}")%>
							</ItemTemplate>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Wt" SortExpression="wt">
							<EditItemTemplate>
								<asp:TextBox ID="WeightTxt" Runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "wt") %>' ></asp:TextBox>
								<asp:CompareValidator ID="WeightVal" Runat="server" ControlToValidate="WeightTxt" EnableClientScript="True"
									ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "wt", "{0:#,0.000}")%>
							</ItemTemplate>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Area" SortExpression="area">
							<EditItemTemplate>
								<asp:TextBox ID="AreaTxt" Runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "area") %>'></asp:TextBox>
								<asp:CompareValidator ID="AreaVal" Runat="server" ControlToValidate="AreaTxt" EnableClientScript="True"
									ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "area", "{0:#,0.000}")%>
							</ItemTemplate>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="adddate" SortExpression="adddate" ReadOnly="True" HeaderText="Add Date"
							DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="adduser" SortExpression="adduser" ReadOnly="True" HeaderText="Add User">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="editdate" SortExpression="editdate" ReadOnly="True" HeaderText="Edit Date"
							DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="edituser" SortExpression="edituser" ReadOnly="True" HeaderText="Edit User">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="statuscolor" SortExpression="statuscolor" HeaderText="statuscolor"></asp:BoundColumn>
					</Columns>
				</asp:datagrid>
			</div>
    </form>
</body>
</html>
