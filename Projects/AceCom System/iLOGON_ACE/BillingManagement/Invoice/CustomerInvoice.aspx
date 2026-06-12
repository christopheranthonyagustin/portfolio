<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerInvoice.aspx.cs" Inherits="iWMS.Web.BillingManagement.Invoice.CustomerInvoice" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>CustomerInvoice</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function() {
                $(".show_hide_Detail").slideToggle();
            });
          });
          function CheckAllDataGridCheckBoxes(aspCheckBoxID, checkVal) {
            re = new RegExp(':' + aspCheckBoxID + '$')  //generated control name starts with a colon
            for (i = 0; i < Form1.elements.length; i++) {
              elm = document.forms[0].elements[i]
              if (elm.type == 'checkbox') {
                if (re.test(elm.name))
                  elm.checked = checkVal
              }
            }
          }
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <div align="center" id="div2">
        <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header">
            <asp:Label ID="lblText" Text=" Hide / Show Search Filters" runat="server" />
            <asp:Label ID="lblProcessID" runat="server" Visible="False" />
        </asp:Panel>
    </div>
    <div id="div3" runat="server">
      <table id="tbl2" border="0" cellspacing="1" cellpadding="1" width="100%">
        <tr>
          <td>
            <table border="0" cellpadding="2" cellspacing="2">
              <tr>
                <td> Customer <br />
                  <asp:DropDownList ID="AccountList" runat="server" Enabled="True" DataTextField="code" DataValueField="id" Width="155px" AutoPostBack="true" OnSelectedIndexChanged="AccountList_SelectedIndexChanged"/>
                </td>
                <td> Division <br />
                  <asp:DropDownList ID="DivisionList" runat="server" Enabled="True" DataTextField="divcode" DataValueField="divcode" Width="155px"/>
                </td>
                <td> BINo <br />
                  <asp:TextBox ID="BINoTbox" runat="server" Width="155px"/>
                </td>
                <td> MasterNo <br />
                  <asp:TextBox ID="MstNoTbox" runat="server" Width="155px"/>
                </td>
              </tr>
            </table>           
          </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>
            <iwms:iform id="formCtl" runat="server"></iwms:iform>
          </td>
          <td colspan="2" align="right" valign="bottom">
            <asp:Button ID="GenMultiInvoiceBtn" runat="server" Text="GenMultiInvoice" Visible="true" CssClass="detailButton" ToolTip="Generate Multiple Invoice for same Customer" OnClick="GenMultiInvoiceBtn_Click"></asp:Button>&nbsp;&nbsp;
            <asp:Button ID="GenInvoiceBtn" runat="server" Text="GenInvoice" Visible="true" CssClass="detailButton" OnClick="GenInvoiceBtn_Click"></asp:Button>&nbsp;&nbsp;
            <asp:Button ID="MassChangeBtn" runat="server" Text="MassChange" Visible="false" CssClass="detailButton" OnClick="MassChangeBtn_Click"></asp:Button>&nbsp;
            <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" Visible="true" CssClass="detailButton" OnClick="RefreshBtn_Click"></asp:Button>&nbsp;
            <br /><asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
          </td>
        </tr>
      </table>
    </div>
    <div id="div-datagrid" style="height: 90%">
      <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None" AllowSorting="true"
          GridLines="Both" CellPadding="2" UseAccessibleHeader="True" HorizontalAlign="Center">
          <AlternatingItemStyle CssClass="DGItem"></AlternatingItemStyle>
          <ItemStyle CssClass="DGAlternateItem"></ItemStyle>
          <Columns>
            <asp:TemplateColumn>
              <HeaderTemplate>
                <label id="completelbl"></label>
                &nbsp;<input id="SelectALLCB" type="checkbox" onclick="CheckAllDataGridCheckBoxes('Chkbx',this.checked)">
              </HeaderTemplate>
              <ItemStyle Wrap="False"></ItemStyle>
              <ItemTemplate>
                <asp:CheckBox ID="Chkbx" runat="server" />
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
						<asp:BoundColumn DataField="divcode" SortExpression="divcode" HeaderText="DivCode" Visible="false"></asp:BoundColumn>
						<asp:BoundColumn DataField="acccode" SortExpression="acccode" HeaderText="Customer">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
						<asp:BoundColumn DataField="divcode" SortExpression="divcode" HeaderText="Div">
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
            <asp:BoundColumn DataField="chargecode" SortExpression="chargecode" HeaderText="ChargeCode">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="ChargeDescr">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="qty" SortExpression="qty" HeaderText="Unit" DataFormatString="{0:#,0.0000}" ItemStyle-HorizontalAlign="Right">
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
            <asp:BoundColumn DataField="unitrate" SortExpression="unitrate" HeaderText="UnitRate" DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="fcamt" SortExpression="fcamt" HeaderText="Amt" DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="exchrate" SortExpression="exchrate" HeaderText="ExchRate" DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="lcamt" SortExpression="lcamt" HeaderText="LocalAmt" DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="taxtypedescr" SortExpression="taxtypedescr" HeaderText="TaxType">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="taxlcamt" SortExpression="taxlcamt" HeaderText="TaxLocalAmt" DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                <HeaderStyle Wrap="False"></HeaderStyle>
                <ItemStyle Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="binumber" SortExpression="binumber" HeaderText="BI#">
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
            <asp:BoundColumn DataField="statuscolor" SortExpression="statuscolor" HeaderText="statuscolor" Visible="false" />
          </Columns>
      </asp:DataGrid>
    </div>    
    </form>
</body>
</html>
