<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BIInvoiceDetl.aspx.cs"
  Inherits="iWMS.Web.BillingManagement.Invoice.BIInvoiceDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
  <title>BIInvoiceDetl</title>
  <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
  <meta name="CODE_LANGUAGE" content="C#">
  <meta name="vs_defaultClientScript" content="JavaScript">
  <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
  <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
  <form id="form1" runat="server">
  <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td class="pagetitle">
        <asp:Label ID="IdLbl" runat="server"></asp:Label>
      </td>
      <td align="right">
        <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
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
              <td align="right">
                <asp:Button ID="SaveNextBtn" runat="server" CssClass="detailButton" OnClick="SaveNextBtn_Click"
                  Text="Save &amp; Next" />
                &nbsp;<asp:Button ID="SaveBtn" runat="server" CssClass="detailButton" OnClick="SaveBtn_Click"
                  Text=" Save " />
                <asp:Button ID="ClosePanelBtn" runat="server" CausesValidation="False" CssClass="detailButton"
                  OnClick="ClosePanelBtn_Click" Text="- Hide" />
              </td>
            </tr>
            <tr>
              <td colspan="3">
                <table cellpadding="0" cellspacing="0">
                  <tr>
                    <td>
                      <asp:Label ID="ChargeLbl" runat="server" Text="ChargeCode" /><br />
                      <asp:DropDownList ID="ChargeCodeList" runat="server" DataTextField="chargecode" DataValueField="chargeid"
                        Width="160px" AutoPostBack="true" OnSelectedIndexChanged="chargecodeDDL_SelectedIndexChanged"
                        BackColor="Yellow" />
                      <asp:RequiredFieldValidator ID="RFV_ChargeCodeList" runat="server" ControlToValidate="ChargeCodeList"
                        EnableClientScript="true" ErrorMessage="*" SetFocusOnError="true" />
                    </td>
                    <td>
                      <asp:Label ID="ProfitCtrLbl" runat="server" Text="ProfitCentre" /><br />
                      <asp:DropDownList ID="ProfitCtrList" runat="server" DataTextField="item" DataValueField="descr"
                        Width="160px" BackColor="Yellow" />
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ProfitCtrList"
                        EnableClientScript="true" ErrorMessage="*" SetFocusOnError="true" />                      
                    </td>
                  </tr>
                </table>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
              </td>
            </tr>
          </table>
        </asp:Panel>
      </td>
    </tr>
  </table>
  <br>
  <div id="div-datagrid" style="height: 90%">
    <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None"
      AllowSorting="true" GridLines="Both" CellPadding="2" OnItemCommand="Detail_Edit"
      UseAccessibleHeader="True" HorizontalAlign="Center">
      <AlternatingItemStyle CssClass="DGItem"></AlternatingItemStyle>
      <ItemStyle CssClass="DGAlternateItem"></ItemStyle>
      <Columns>
        <asp:TemplateColumn>
          <ItemStyle Wrap="False"></ItemStyle>
          <ItemTemplate>
            <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="..\..\image\pencil.gif"
              Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
              CommandName="Edit" CausesValidation="False"></asp:ImageButton>
            <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
              onserverclick="ChargeDelete" runat="server">
              <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Charge"
                runat="server"></a>
          </ItemTemplate>
          <%--<EditItemTemplate>
								<asp:ImageButton Runat="server" Visible="True" ID="PackUpdate" ImageUrl="..\..\image\floppy.gif"
									Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
								<asp:ImageButton Runat="server" Visible="True" ID="PackCancel" ImageUrl="..\..\image\arrow6.gif"
									Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent" BorderWidth="0"
									CausesValidation="False"></asp:ImageButton>
							</EditItemTemplate>--%>
        </asp:TemplateColumn>
        <asp:TemplateColumn ItemStyle-HorizontalAlign="Center">
          <HeaderTemplate>
            #
          </HeaderTemplate>
          <ItemTemplate>
            <%#Container.ItemIndex+1%>
          </ItemTemplate>
        </asp:TemplateColumn>
        <asp:BoundColumn DataField="id" SortExpression="id" HeaderText="ID" Visible="false">
        </asp:BoundColumn>
        <asp:BoundColumn DataField="acid" SortExpression="acid" HeaderText="ACID" Visible="false">
        </asp:BoundColumn>
        <asp:BoundColumn DataField="divcode" SortExpression="divcode" HeaderText="DivCode"
          Visible="false"></asp:BoundColumn>
        <asp:BoundColumn DataField="binumber" SortExpression="binumber" HeaderText="BINo#">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="doinvno" SortExpression="doinvno" HeaderText="DO/Inv">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="qunumber" SortExpression="qunumber" HeaderText="QuotationNo">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="qutype" SortExpression="qutype" HeaderText="QuotationType">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="chargeid" SortExpression="chargeid" HeaderText="ChargeId"
          Visible="false"></asp:BoundColumn>
        <asp:BoundColumn DataField="chargecode" SortExpression="chargecode" HeaderText="ChargeCode">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="ChargeDescr">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="qty" SortExpression="qty" HeaderText="Qty" DataFormatString="{0:#,0.0000}"
          ItemStyle-HorizontalAlign="Right">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="uom" SortExpression="uom" HeaderText="UOM">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Cur">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="unitrate" SortExpression="unitrate" HeaderText="UnitRate"
          DataFormatString="{0:#,0.0000}" ItemStyle-HorizontalAlign="Right">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="fcamt" SortExpression="fcamt" HeaderText="Amount" DataFormatString="{0:#,0.00}"
          ItemStyle-HorizontalAlign="Right">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="exchrate" SortExpression="exchrate" HeaderText="ExchRate"
          DataFormatString="{0:#,0.000000}" ItemStyle-HorizontalAlign="Right">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="lcamt" SortExpression="lcamt" HeaderText="LocalAmt" DataFormatString="{0:#,0.00}"
          ItemStyle-HorizontalAlign="Right">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="taxtype" SortExpression="taxtype" HeaderText="TaxType"
          Visible="false"></asp:BoundColumn>
        <asp:BoundColumn DataField="taxtypedescr" SortExpression="taxtypedescr" HeaderText="TaxType">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="taxfcamt" SortExpression="taxfcamt" HeaderText="TaxAmt"
          DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="taxlcamt" SortExpression="taxlcamt" HeaderText="TaxLocalAmt"
          DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right">
          <HeaderStyle Wrap="False"></HeaderStyle>
          <ItemStyle Wrap="False"></ItemStyle>
        </asp:BoundColumn>
        <asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
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
        <asp:BoundColumn DataField="profitctrcode" SortExpression="profitctrcode" HeaderText="profitctrcode" Visible="false" />
        <asp:BoundColumn DataField="statuscolor" SortExpression="statuscolor" HeaderText="statuscolor" Visible="false" />
        
      </Columns>
    </asp:DataGrid>
  </div>
  </form>
</body>
</html>
