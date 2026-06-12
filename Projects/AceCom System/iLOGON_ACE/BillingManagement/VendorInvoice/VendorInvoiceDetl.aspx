<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorInvoiceDetl.aspx.cs" Inherits="iWMS.Web.BillingManagement.VendorInvoice.VendorInvoiceDetl" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VendorInvoiceDetl</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
	<style type="text/css">
        .style1
        {
            height: 39px;
        }
        .style2
        {
            width: 258px;
        }
        .style3
        {
            height: 39px;
            width: 258px;
        }
    </style>
</head>
<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
    <form id="form1" runat="server">
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="pagetitle">
              <asp:Label ID="IdLbl" runat="server"></asp:Label>
          </td>
          <td align="right">
              <asp:Label id="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
              <asp:Button ID="AmtSumBtn" runat="server" Text="AmtSum" CssClass="detailButton"
                  OnClick="AmtSumBtn_Click"></asp:Button>&nbsp;
              <asp:Button ID="AddDetailBtn" runat="server" Text="+ Detail" Visible="false" CssClass="detailButton"
                  OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <asp:Panel ID="AddPanel" runat="server" Visible="False">
              <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                <tr>
                  <td>
                      <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                  </td>
                  <td align="right" class="style2">
                  </td>
                  <td align = "right">
                      <asp:Button ID="SaveNextBtn" runat="server" CssClass="detailButton" 
                          OnClick="SaveNextBtn_Click" Text="Save &amp; Next" />
                      &nbsp;<asp:Button ID="SaveBtn" runat="server" CssClass="detailButton" 
                          OnClick="SaveBtn_Click" Text=" Save " />
                      <asp:Button ID="ClosePanelBtn" runat="server" CausesValidation="False" 
                          CssClass="detailButton" OnClick="ClosePanelBtn_Click" Text="- Hide" />
                  </td>
                </tr>
                  <tr>
		                <td colspan="3">
		                  <table cellpadding="0" cellspacing="0">
		                    <tr>
		                      <td>		                        
		                        <asp:Label ID="ChargeLbl" runat="server" Text="ChargeCode" /><br />
                            <asp:DropDownList ID="ChargeCodeList" runat="server" DataTextField="chargecode" DataValueField="chargeid"
                            Width="160px" AutoPostBack="true" OnSelectedIndexChanged="chargecodeDDL_SelectedIndexChanged" BackColor="Yellow"/>
                            <asp:RequiredFieldValidator ID="RFV_ChargeCodeList" runat="server" ControlToValidate="ChargeCodeList" EnableClientScript="true"
		                          ErrorMessage="*" SetFocusOnError="true" />
		                      </td>
		                      <td>		                        
		                        <asp:Label ID="CostCtr" runat="server" Text="CostCentre" /><br />
                            <asp:DropDownList ID="CostCentreList" runat="server" DataTextField="descr" DataValueField="item"
                            Width="160px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CostCentreList" EnableClientScript="true"
		                          ErrorMessage="*" SetFocusOnError="true" />
		                      </td>
		                    </tr>
		                  </table>
		                  <iwms:iform id="formCtl" runat="server"></iwms:iform>
		                </td>
	                </tr>
              </table>
            </asp:Panel>
          </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid" style="height: 90%">
      <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None" AllowSorting="true" GridLines="Both" CellPadding="2" 
          OnItemCommand="Detail_Edit" UseAccessibleHeader="True" HorizontalAlign="Center">
          <AlternatingItemStyle CssClass="DGItem"></AlternatingItemStyle>
          <ItemStyle CssClass="DGAlternateItem"></ItemStyle>
          <Columns>
            <asp:TemplateColumn>
              <ItemStyle Wrap="False"></ItemStyle>
              <ItemTemplate>
                <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                            CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                <asp:Label id="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
								<a id=lnkDelete href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')" onserverclick="ChargeDelete" runat=server>
									<img id="delImg" src="..\..\image\bin.gif" Width="15" Height="15" border="0" alt="Delete Charge"
										runat="server"></a>
              </ItemTemplate>
               </asp:TemplateColumn>
            <asp:TemplateColumn ItemStyle-HorizontalAlign="Center">
              <HeaderTemplate>
                  #
              </HeaderTemplate>
              <ItemTemplate>
                  <%#Container.ItemIndex+1%>
              </ItemTemplate>
            </asp:TemplateColumn>
						<asp:BoundColumn DataField="id" SortExpression="id" HeaderText="ID" Visible="false"></asp:BoundColumn>
						<asp:BoundColumn DataField="acid" SortExpression="acid" HeaderText="ACID" Visible="false"></asp:BoundColumn>
						<asp:BoundColumn DataField="binumber" SortExpression="binumber" HeaderText="BINo">
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
						<asp:BoundColumn DataField="masterno" SortExpression="masterno" HeaderText="MasterNo" >
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
						<asp:BoundColumn DataField="costctrcode" SortExpression="costctrcode" HeaderText="costctrcode" Visible="false"></asp:BoundColumn>
						<asp:BoundColumn DataField="costctrdescr" SortExpression="costctrdescr" HeaderText="CostCtr" >
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
						<asp:BoundColumn DataField="chargeid" SortExpression="chargeid" HeaderText="ChargeId" Visible="false"></asp:BoundColumn>
						<asp:BoundColumn DataField="chargecode" SortExpression="chargecode" HeaderText="ChargeCode" >
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="ChargeDescr" >
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="vendorivqty" SortExpression="vendorivqty" HeaderText="Qty" DataFormatString="{0:#,0.0000}" ItemStyle-HorizontalAlign="Right">
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="vendorivuom" SortExpression="vendorivuom" HeaderText="UOM" >
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="vendorivcurrcode" SortExpression="vendorivcurrcode" HeaderText="Cur" >
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="vendorivunitrate" SortExpression="vendorivunitrate" HeaderText="UnitRate" DataFormatString="{0:#,0.0000}" ItemStyle-HorizontalAlign="Right">
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="vendorivfcamt" SortExpression="vendorivfcamt" HeaderText="Amount" DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right">
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="vendorivexchrate" SortExpression="vendorivexchrate" HeaderText="ExchRate" DataFormatString="{0:#,0.000000}" ItemStyle-HorizontalAlign="Right">
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="vendorivlcamt" SortExpression="vendorivlcamt" HeaderText="LocalAmt" DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right">
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="vendorivtaxtype" SortExpression="vendorivtaxtype" HeaderText="TaxType" Visible="false" ></asp:BoundColumn>
						<asp:BoundColumn DataField="vendortaxtypedescr" SortExpression="vendortaxtypedescr" HeaderText="TaxType">
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="vendorivtaxfcamt" SortExpression="vendorivtaxfcamt" HeaderText="TaxAmt" DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right">
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="vendorivtaxlcamt" SortExpression="vendorivtaxlcamt" HeaderText="TaxLocalAmt" DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right">
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="vendorstatusdescr" SortExpression="vendorstatusdescr" HeaderText="Status" >
              <HeaderStyle Wrap="False"></HeaderStyle>
              <ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>						
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
            <asp:BoundColumn DataField="vendorstatuscolor" SortExpression="vendorstatuscolor" HeaderText="statuscolor" Visible="false" />
          </Columns>
      </asp:DataGrid>
    </div>    
    </form>
</body>
    </div>
    </form>
</body>
</html>
