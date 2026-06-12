<%@ Register TagPrefix="iWMS" TagName="iForm" Src="iFormCtl.ascx" %>
<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="iInputCtl.ascx.cs" Inherits="iWMS.Web.Control.iInputCtl"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<style type="text/css">
    .style1
    {
        height: 47px;
    }
</style>
<table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td align="center">
            &nbsp;<asp:ImageButton ID="AlertImgBtn" runat="server" ImageUrl="../image/alert.gif"
                Visible="False" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle">
            </asp:ImageButton>
            <asp:Label ID="DescrLbl" runat="server" Font-Bold="True"></asp:Label><br />
            <asp:Label ID="PackingLbl" runat="server">Packing :</asp:Label>
            <input id="HIDDEN_SkuId" type="hidden" runat="server"></LABEL>
        </td>
    </tr>
    <tr>
        <td>
            <table cellspacing="2" cellpadding="2">
                <tr>
                    <td>
                        <asp:Label ID="SkuUpcLbl" runat="server">SKU/UPC</asp:Label>:
                        <asp:RequiredFieldValidator ID="SkuReq" runat="server" ControlToValidate="TEXT_SkuCode"
                            ErrorMessage="*"></asp:RequiredFieldValidator><br>
                        <asp:TextBox ID="TEXT_SkuCode" runat="server" BackColor="Yellow" AutoPostBack="True"
                            Width="150px" OnTextChanged="TEXT_SkuCode_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="QtyLbl" runat="server">Qty</asp:Label>:
                        <asp:RequiredFieldValidator ID="QtyReq" runat="server" ControlToValidate="INTEGER_Qty"
                            ErrorMessage="*"></asp:RequiredFieldValidator><asp:CompareValidator ID="QtyVal" runat="server"
                                ControlToValidate="INTEGER_Qty" ErrorMessage="#" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator><asp:CompareValidator
                                    ID="QtyValueVal" runat="server" ControlToValidate="INTEGER_Qty" ErrorMessage="#"
                                    Type="Integer" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator><br>
                        <asp:TextBox ID="INTEGER_Qty" runat="server" BackColor="Yellow" Width="80px" OnTextChanged="INTEGER_Qty_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="UomLbl" runat="server">UOM</asp:Label>:<input id="HIDDEN_Uom" type="hidden"
                            runat="server" /><br>
                        <asp:DropDownList ID="TEXT_Uom" runat="server" OnSelectedIndexChanged="TEXT_Uom_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:TextBox ID="UomTxt" runat="server" Width="60px" ReadOnly="True">Each</asp:TextBox>
                    </td>
                    <td>
                        <asp:Panel ID="CartonPanel" runat="server">
                            <asp:Label ID="Ctn_Cnt_Lbl" runat="server">CartonCount</asp:Label>:<input id="HIDDEN_Cartoncnt" type="hidden"
                                runat="server" />
                            <asp:CompareValidator ID="CartoncntVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_cartoncnt"
                                    Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br>
                            <asp:TextBox ID="INTEGER_cartoncnt" runat="server" Width="60px"></asp:TextBox>
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="ShelfLifePanel" runat="server">
                            <asp:Label ID="ShelfLifeLbl" runat="server">Shelf Life</asp:Label>:
                            <asp:CompareValidator ID="ShelfLifeVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_ShelfLife"
                                Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br>
                            <asp:TextBox ID="INTEGER_ShelfLife" runat="server" Width="80px"></asp:TextBox></asp:Panel>
                    </td>
                    <asp:Panel ID="BomPanel" runat="server">
                        <td>
                            <asp:Label ID="BomQtyLbl" runat="server">BOM Qty</asp:Label>:
                            <asp:CompareValidator ID="BomQtyVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_Qty"
                                Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br>
                            <asp:TextBox ID="DOUBLE_BomQty" Width="80px" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="BomUomLbl" runat="server">BOM UOM</asp:Label>:<br>
                            <asp:DropDownList ID="TEXT_BomUom" runat="server">
                            </asp:DropDownList>
                        </td>
                    </asp:Panel>
                    <td>
                        &nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:Panel ID="AvailQtyPanel" Visible="False" runat="server">
                            <table cellspacing="1" cellpadding="1">
                                <tr align="center">
                                    <td colspan="2">
                                        <asp:Label Style="z-index: 0" ID="SoftAllocationLbl" runat="server" CssClass="linkLabelBig">Soft Allocation Info</asp:Label>
                                    </td>
                                </tr>
                                <tr align="right">
                                    <td>
                                        <asp:Label ID="AvailQtyLbl" runat="server">Available Qty :</asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblAvailQty" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr align="right">
                                    <td>
                                        <asp:Label ID="AvailLHULbl" runat="server">LHU :</asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblAvailLHU" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td colspan="2">
                                        <asp:Label ID="lblAllocationStatus" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </td>
    </tr>
    <asp:Panel ID="Loc_Vas_Rem1_Panel" runat="server" Visible="true">
        <tr>
            <td>
                <table cellspacing="2" cellpadding="2">
                    <tr>
                        <td>
                            <asp:Label ID="LocLbl2" runat="server">Location</asp:Label>:
                            <br>
                            <asp:TextBox ID="Issue_TEXT_LocCode" runat="server" Width="150px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="VasCodeLbl" runat="server">VAS Code</asp:Label><br>
                            <asp:DropDownList ID="TEXT_VasCode" runat="server" Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Rem1Lbl" runat="server">Remarks</asp:Label><br>
                            <asp:TextBox ID="TEXT_Rem1" runat="server" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
          <td>
              <table cellspacing="2" cellpadding="2">
                  <tr>
                      <td>
                          <asp:Label ID="TU1_Lbl" runat="server">Tu1</asp:Label>:
                          <br>
                          <asp:TextBox ID="TEXT_tuno1" runat="server" Width="150px"></asp:TextBox>
                      </td>
                      <td>
                          <asp:Label ID="TU2_Lbl" runat="server">Tu2</asp:Label>:
                          <br>
                          <asp:TextBox ID="TEXT_tuno2" runat="server" Width="150px"></asp:TextBox>
                      </td>
                  </tr>
              </table>
          </td>             
        </tr>
    </asp:Panel>
    <tr>
        <td>
            <table cellspacing="2" cellpadding="2">
                <tr>
                    <td class="style1">
                        <asp:Label ID="EqpNoLbl" runat="server">EQP No</asp:Label><br>
                        <asp:DropDownList ID="TEXT_EqpNo" runat="server" DataTextField="Descr" DataValueField="item"
                            AutoPostBack="True" OnSelectedIndexChanged="TEXT_EpqNo_SelectedIndexChanged"
                            Width="150px">
                        </asp:DropDownList>
                    </td>
                    <td class="style1">
                        <asp:Label ID="PerIdLbl" runat="server">Personnel</asp:Label><br>
                        <asp:DropDownList ID="INTEGER_PerId" runat="server" DataTextField="Descr" DataValueField="item"
                            Width="150px">
                        </asp:DropDownList>
                    </td>
                    <td colspan="5" class="style1">
						<asp:CheckBox style="Z-INDEX: 0" id="IssueAllCB" runat="server" Text="IssueAll"
							Checked="True" Visible="false"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <asp:Panel ID="LTTLPanel" runat="server">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <asp:Panel ID="LTTPanel" runat="server">
                                <table cellspacing="1" cellpadding="1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="LocLbl" runat="server">Location</asp:Label>:
                                            <asp:RequiredFieldValidator ID="LocReq" runat="server" ErrorMessage="*" ControlToValidate="TEXT_LocCode"></asp:RequiredFieldValidator><br>
                                            <asp:TextBox ID="TEXT_LocCode" BackColor="Yellow" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Tu1Lbl" runat="server">TU#</asp:Label>1<br>
                                            <asp:TextBox ID="TEXT_Tu1" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Tu2Lbl" runat="server">TU#</asp:Label>2<br>
                                            <asp:TextBox ID="TEXT_Tu2" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Panel ID="LotIdPanel" runat="server">
                                <table cellspacing="1" cellpadding="1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="LotLbl" runat="server">Lot#</asp:Label>:
                                            <asp:RequiredFieldValidator ID="LotReq" runat="server" ErrorMessage="*" ControlToValidate="INTEGER_LotId"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="LotIdVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_LotId"
                                                Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br>
                                            <asp:TextBox ID="INTEGER_LotId" BackColor="Yellow" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </asp:Panel>
    <asp:Panel ID="UDPanel" Visible="False" runat="server">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <asp:Label ID="UD01Lbl" runat="server">User Define 01</asp:Label>:<br>
                            <asp:TextBox ID="TEXT_usrdef01" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="UD02Lbl" runat="server">User Define 02</asp:Label>:<br>
                            <asp:TextBox ID="TEXT_usrdef02" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </asp:Panel>
</table>
