<%@ Control Language="c#" AutoEventWireup="True" CodeBehind="iInputCtl3.ascx.cs"
    Inherits="iWMS.Web.Control.iInputCtl3" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="iFormCtl.ascx" %>
<meta content="no-cache" http-equiv="Pragma">
<link rel="stylesheet" type="text/css" href="../css/iWMS.css">
<table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr align="center">
        <td>
            <asp:ImageButton ID="AlertImgBtn" BorderWidth="0" BackColor="Transparent" Visible="False"
                ImageUrl="../image/alert.gif" runat="server"></asp:ImageButton><asp:Label ID="DescrLbl"
                    runat="server" Font-Bold="True"></asp:Label><input id="HIDDEN_SkuId" type="hidden"
                        runat="server">
        </td>
    </tr>
    <tr>
        <td>
            <table cellspacing="2" cellpadding="2">
                <tr>
                    <td style="height: 35px">
                        <asp:Label ID="SkuUpcLbl" runat="server">SKU/UPC</asp:Label><asp:RequiredFieldValidator
                            ID="SkuReq" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="*"
                            ControlToValidate="TEXT_SkuCode"></asp:RequiredFieldValidator><br>
                        <asp:TextBox ID="TEXT_SkuCode" BackColor="Yellow" runat="server" AutoPostBack="True"
                            OnTextChanged="TEXT_SkuCode_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="SkuDescrLbl" runat="server">SKU Descr.</asp:Label>
                        <asp:RequiredFieldValidator Style="z-index: 0" ID="SkuDescrReq" runat="server" ControlToValidate="TEXT_SkuDescr"
                            ErrorMessage="*" ForeColor=" " CssClass="errorLabelBig"></asp:RequiredFieldValidator><br>
                        <asp:TextBox ID="TEXT_SkuDescr" runat="server" BackColor="Yellow"></asp:TextBox>
                    </td>
                    <td style="height: 35px">
                        <asp:Label ID="QtyLbl" runat="server">Exp. Qty</asp:Label><asp:RequiredFieldValidator
                            ID="QtyReq" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="*"
                            ControlToValidate="INTEGER_Qty"></asp:RequiredFieldValidator><asp:CompareValidator
                                ID="QtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                ControlToValidate="INTEGER_Qty" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><asp:CompareValidator
                                    ID="QtyValueVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                    ControlToValidate="INTEGER_Qty" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator><br>
                        <asp:TextBox ID="INTEGER_Qty" BackColor="Yellow" runat="server" Width="60px"></asp:TextBox>
                    </td>
                    <td style="height: 35px">
                        <asp:Label ID="RecQtyLbl" runat="server">Rec. Qty</asp:Label><asp:CompareValidator
                            ID="RecQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                            ControlToValidate="INTEGER_RecQty" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br>
                        <asp:TextBox ID="INTEGER_RecQty" runat="server" Width="60px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="UomLbl" runat="server">UOM</asp:Label>&nbsp;<input id="HIDDEN_Uom"
                            type="hidden" name="HIDDEN_Uom" runat="server">
                        <asp:RequiredFieldValidator
                            ID="UomReq" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="*"
                            ControlToValidate="TEXT_Uom"></asp:RequiredFieldValidator><br>
                        <asp:DropDownList ID="TEXT_Uom" runat="server" OnSelectedIndexChanged="TEXT_Uom_SelectedIndexChanged" BackColor="Yellow">
                        </asp:DropDownList>
                        <asp:TextBox ID="UomTxt" runat="server" Width="60px" ReadOnly="True">Each</asp:TextBox>
                    </td>
                    <td>
                        &nbsp;<asp:Label Style="z-index: 0" ID="Tu1Lbl" runat="server">TU#1</asp:Label><br>
                        &nbsp;<asp:TextBox Style="z-index: 0" ID="TEXT_tuno1" runat="server" Width="60px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table cellspacing="1" cellpadding="1">
                <tr>
                    <td>
                        <asp:Panel ID="ShelfLifePanel" runat="server">
                            <asp:Label ID="ShelfLifeLbl" runat="server">Shelf Life</asp:Label>
                            <asp:CompareValidator ID="ShelfLifeVal" runat="server" ControlToValidate="INTEGER_ShelfLife"
                                ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator>
                            <br>
                            <asp:TextBox ID="INTEGER_ShelfLife" runat="server" Width="80px"></asp:TextBox>
                        </asp:Panel>
                    </td>
                    <asp:Panel ID="BomPanel" runat="server">
                        <td>
                            <asp:Label ID="BomQtyLbl" runat="server">BOM Qty</asp:Label>
                            <asp:CompareValidator ID="BomQtyVal" runat="server" ControlToValidate="INTEGER_Qty"
                                ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator><br>
                            <asp:TextBox ID="DOUBLE_BomQty" Width="80px" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 92px">
                            <asp:Label ID="BomUomLbl" runat="server">BOM UOM</asp:Label><br>
                            <asp:DropDownList ID="TEXT_BomUom" runat="server">
                            </asp:DropDownList>
                        </td>
                    </asp:Panel>
                    <td>
                        <asp:Panel ID="AvailQtyPanel" runat="server">
                            <asp:Label ID="AvailQtyLbl" runat="server">Available Qty</asp:Label>
                            <asp:Label ID="colon1" runat="server">:&nbsp;</asp:Label>
                            <asp:Label ID="lblAvailQty" runat="server"></asp:Label>
                            <br>
                            <asp:Label ID="AvailLHULbl" runat="server">LHU</asp:Label>
                            <asp:Label ID="colon2" runat="server">:&nbsp;</asp:Label>
                            <asp:Label ID="lblAvailLHU" runat="server"></asp:Label>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
    </tr>
    <tr>
        <td>
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </td>
    </tr>
    <asp:Panel ID="LTTLPanel" runat="server">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <asp:Panel ID="LTTPanel" runat="server">
                                <table cellspacing="2" cellpadding="2">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Tu2Lbl" runat="server">TU#</asp:Label>2<br>
                                            <asp:TextBox ID="TEXT_tuno2" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="LocLbl" runat="server">Location</asp:Label>
                                            <asp:RequiredFieldValidator ID="LocReq" runat="server" ControlToValidate="TEXT_LocCode"
                                                ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                            <asp:TextBox ID="TEXT_LocCode" runat="server" BackColor="Yellow"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table cellspacing="2" cellpadding="2">
                                    <tr>
                                        <td>
                                            <asp:Label ID="LengthLbl" runat="server">Length</asp:Label>
                                            <asp:CompareValidator Style="z-index: 0" ID="LengthVal" runat="server" ControlToValidate="DOUBLE_Length"
                                                ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                            <asp:TextBox ID="DOUBLE_Length" runat="server" Width="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="WidthLbl" runat="server">Width</asp:Label>
                                            <asp:CompareValidator Style="z-index: 0" ID="WidthVal" runat="server" ControlToValidate="DOUBLE_Width"
                                                ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                            <asp:TextBox ID="DOUBLE_Width" runat="server" Width="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="HeightLbl" runat="server">Height</asp:Label>
                                            <asp:CompareValidator Style="z-index: 0" ID="HeightVal" runat="server" ControlToValidate="DOUBLE_Height"
                                                ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                            <asp:TextBox ID="DOUBLE_Height" runat="server" Width="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <br />
                                            <asp:Label ID="prefixUOMLbl" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="VolLbl" runat="server">Vol.</asp:Label>
                                            <asp:CompareValidator Style="z-index: 0" ID="VolVal" runat="server" ControlToValidate="DOUBLE_Vol"
                                                ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                            <asp:TextBox ID="DOUBLE_Vol" runat="server" Width="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <br />
                                            <asp:Label ID="suffixUOMLbl" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="WtLbl" runat="server">Wt.</asp:Label>
                                            <asp:CompareValidator Style="z-index: 0" ID="WtVal" runat="server" ControlToValidate="DOUBLE_Wt"
                                                ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                            <asp:TextBox ID="DOUBLE_Wt" runat="server" Width="60"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="NetWtLbl" runat="server">Net Wt.</asp:Label>
                                            <asp:CompareValidator Style="z-index: 0" ID="NetWtVal" runat="server" ControlToValidate="DOUBLE_NetWt"
                                                ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                            <asp:TextBox ID="DOUBLE_NetWt" runat="server" Width="60"></asp:TextBox>
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
                                            <asp:Label ID="LotLbl" runat="server">Lot#</asp:Label>
                                            <asp:RequiredFieldValidator ID="LotReq" runat="server" ControlToValidate="INTEGER_LotId"
                                                ErrorMessage="*" ForeColor=" " CssClass="errorLabelBig"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="LotIdVal" runat="server" ControlToValidate="INTEGER_LotId"
                                                ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                            <asp:TextBox ID="INTEGER_LotId" runat="server" BackColor="Yellow"></asp:TextBox>
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
    <%--<tr>
        <td>
            <table cellspacing="2" cellpadding="2">
                <tr>
                    <td class="style1">
                        <asp:Label ID="EqpNoLbl" runat="server">EquipmentNo</asp:Label><br>
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
                    </td>
                </tr>
            </table>
        </td>
    </tr>--%>
</table>
