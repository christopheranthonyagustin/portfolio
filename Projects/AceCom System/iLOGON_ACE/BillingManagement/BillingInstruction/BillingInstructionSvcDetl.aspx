<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillingInstructionSvcDetl.aspx.cs" Inherits="iWMS.Web.BillingManagement.BillingInstruction.BillingInstructionSvcDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
		<title>ServiceDetails</title>
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
                <asp:Button ID="CurSumBtn" runat="server" Text="CurSum" CssClass="detailButton" OnClick="CurSumBtn_Click"></asp:Button>&nbsp;
                <asp:Button ID="GenerateDetails" runat="server" Text="Generate Charge" Visible="false" CssClass="detailButton"
                    OnClick="GenDetailBtn_Click"></asp:Button>&nbsp;
                <asp:Button ID="AddDetailBtn" runat="server" Text="+ Detail" Visible="false" CssClass="detailButton"
                    OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;
          </td>
			  </tr>
			</table>
			<div id="div-datagrid">
        	<asp:datagrid id="BISvcDetlDG" runat="server" AutoGenerateColumns="False" OnCancelCommand="BISvcDetlDG_Cancel"
					OnUpdateCommand="BISvcDetlDG_Update" OnEditCommand="BISvcDetlDG_Edit" GridLines="Both" CellPadding="2" OnItemDataBound="BISvcDetlDG_ItemDataBound"
					DataKeyField="id" UseAccessibleHeader="True" AllowSorting="true">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
					<Columns>
					  <asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton Runat="server" Visible="True" ImageAlign="AbsMiddle" ID="BISDetEdit" ImageUrl="..\..\image\pencil.gif"
									Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
								<asp:Label id="DetailLbl" runat="server"></asp:Label>
								<a id=InkDelette href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')" onserverclick="BISvcDetDelete" runat=server>
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
						<asp:BoundColumn Visible="False" DataField="bisdtId" SortExpression="bisdtId" HeaderText="BISDTID"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="bisvcId" SortExpression="bisvcId" HeaderText="BISVCID"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="qudtid" SortExpression="qudtid" HeaderText="QUDTID"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="acId" SortExpression="acId" HeaderText="ACID"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="divcode" SortExpression="divcode" HeaderText="DIV"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="profitctrcode" SortExpression="profitctrcode" HeaderText="profitctrcode"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="vendorivacid" SortExpression="vendorivacid" HeaderText="vendorivacid"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="taxtype" SortExpression="taxtype" HeaderText="taxtype"></asp:BoundColumn>
						<asp:TemplateColumn HeaderText="DO/Inv" SortExpression="doinvno">
							<EditItemTemplate>
								<asp:DropDownList ID="doinv" DataMember="" DataTextField="doinvno" DataValueField="id" SelectedIndex='<%#Bind("bisdtId")%>' DataSource='<%# doinvDS%>' runat="server"
								  OnSelectedIndexChanged="doinvDDL_SelectedIndexChanged" AutoPostBack="true"/>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "doinvno")%>
							</ItemTemplate>
						</asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Customer" SortExpression="acccode">
							<EditItemTemplate>
								<asp:DropDownList ID="account" DataMember="" DataTextField="code" DataValueField="id" SelectedIndex='<%#Bind("acid")%>' DataSource='<%# accDS%>' runat="server" Enabled="false"/>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "acccode")%>
							</ItemTemplate>
					  </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Div" SortExpression="divcode">
							<EditItemTemplate>
								<asp:DropDownList ID="acdiv" DataMember="" DataTextField="divname" DataValueField="divcode" runat="server" Enabled="false"/>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "divcode")%>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="ChargeCode" SortExpression="quchargedescr">
							<EditItemTemplate>
								<asp:DropDownList ID="chargecode" DataMember="" DataTextField="chgshtptiddescr" runat="server" DataValueField="chargeid"
								  OnSelectedIndexChanged="chargecodeDDL_SelectedIndexChanged" AutoPostBack="true"/>
							</EditItemTemplate>
							<ItemTemplate>
									<%# DataBinder.Eval(Container.DataItem, "quchargedescr")%>
							</ItemTemplate>
						</asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Qty" SortExpression="qty">
							<EditItemTemplate>
								<asp:TextBox ID="QtyTxt" Runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "qty") %>' AutoPostBack="true" OnTextChanged="QtyUnitTxt_TextChanged"></asp:TextBox>
								<asp:CompareValidator ID="QtyVal" Runat="server" ControlToValidate="QtyTxt" EnableClientScript="true"
									ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.0000}")%>
							</ItemTemplate>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="UOM" SortExpression="uom">
							<EditItemTemplate>
								<asp:TextBox ID="uomTbox" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "uom") %>' Enabled="False" />
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "uom")%>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Cur" SortExpression="currcode">
							<EditItemTemplate>
								<%--<asp:TextBox ID="currcodeTbox" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "currcode") %>'/>--%>
								<asp:DropDownList ID="currcodeDDL" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "currcode") %>' DataTextField="item" DataValueField="item" DataSource='<%# curcdDS%>' AutoPostBack="true" OnTextChanged="CurrCode_IndexChanged"/>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "currcode")%>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="UnitRate" SortExpression="unitrate" ItemStyle-HorizontalAlign="Right">
							<EditItemTemplate>
								<asp:TextBox ID="UnitRateTxt" Runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>' AutoPostBack="true" OnTextChanged="QtyUnitTxt_TextChanged" ></asp:TextBox>
								<asp:CompareValidator ID="UnitRateVal" Runat="server" ControlToValidate="UnitRateTxt" EnableClientScript="true"
									ErrorMessage="*" Operator="DataTypeCheck"  Type="Double"></asp:CompareValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.0000}")%>
							</ItemTemplate>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Amount" SortExpression="fcamt" ItemStyle-HorizontalAlign="Right">
							<EditItemTemplate>
								<asp:TextBox ID="AmountTxt" Runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "fcamt") %>' AutoPostBack="true" OnTextChanged="AmtXrateTxt_TextChanged"></asp:TextBox>
								<asp:CompareValidator ID="AmountVal" Runat="server" ControlToValidate="AmountTxt" EnableClientScript="true"
									ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "fcamt","{0:#,0.00}")%>
							</ItemTemplate>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="ExchRate" SortExpression="exchrate" ItemStyle-HorizontalAlign="Right">
							<EditItemTemplate>
								<asp:TextBox ID="ExchRateTxt" Runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "exchrate") %>' AutoPostBack="true" OnTextChanged="AmtXrateTxt_TextChanged" /><asp:CompareValidator ID="ExchRateVal" Runat="server" ControlToValidate="ExchRateTxt" EnableClientScript="true" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" />
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "exchrate", "{0:#,0.000000}")%>
							</ItemTemplate>
					  </asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="LocalAmt" SortExpression="lcamt" ItemStyle-HorizontalAlign="Right">
							<EditItemTemplate>
								<asp:TextBox ID="LocalAmtTxt" Runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "lcamt") %>'></asp:TextBox>
								<asp:CompareValidator ID="LocalAmtVal" Runat="server" ControlToValidate="LocalAmtTxt" EnableClientScript="true"
									ErrorMessage="*" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "lcamt", "{0:#,0.00}")%>
							</ItemTemplate>
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="TaxType" SortExpression="taxtypedescr" >
							<EditItemTemplate>
								<asp:DropDownList ID="taxtype" DataMember="" DataTextField="descr" DataValueField="item" DataSource='<%# taxtypeDS%>' runat="server"/>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "taxtypedescr")%>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="ProfitCtr" SortExpression="profitctrcode" >
							<EditItemTemplate>
								<asp:DropDownList ID="ProfitCtr" DataMember="" DataTextField="descr" DataValueField="item" DataSource='<%# profitctrDS%>' runat="server"/>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "profitctrcode")%>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Vendor" SortExpression="vendorname">
							<EditItemTemplate>
								<asp:DropDownList ID="vendor" DataMember="" DataTextField="code" DataValueField="id" DataSource='<%# vendDS%>' runat="server"/>
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "vendorname")%>
							</ItemTemplate>
					  </asp:TemplateColumn>
					  <asp:TemplateColumn HeaderText="InvoiceNo#" SortExpression="invno">
							<EditItemTemplate>
								<asp:Label ID="InvoiceNoLbl" runat="server" />
							</EditItemTemplate>
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "invno")%>
							</ItemTemplate>
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
						<asp:BoundColumn Visible="False" DataField="qty"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="unitrate"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="fcamt"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="exchrate"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="lcamt" ></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="statuscolor" SortExpression="statuscolor" HeaderText="statuscolor" />
					</Columns>
			  </asp:datagrid>
      </div>
    </form>
</body>
</html>
