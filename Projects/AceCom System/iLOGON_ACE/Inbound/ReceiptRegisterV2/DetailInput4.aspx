<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailInput4.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptRegisterV2.DetailInput4" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Receipt RegisterV2 Detail Input</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    </telerik:RadScriptBlock>
    <base target="_self">
    <%--    <meta http-equiv="Pragma" content="no-cache">--%>

    <script type="text/javascript">
        function CheckEmptyBox() {
            var TextBox1 = document.getElementById('INTEGER_RecQty');
            var TextBox2 = document.getElementById('INTEGER_Qty');
            var num1 = parseInt(TextBox1.getAttribute('value'));
            var num2 = parseInt(TextBox2.getAttribute('value'));
            if (num1 > num2) {
                return confirm('Proceed to Over-Receive this SKU Line?');
            }
            else {
                return true;
            }
        }
    </script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%" id="table1" border="0" runat="server">
            <tr>
                <td class="pagetitle">
                    <asp:Label ID="IdLbl" runat="server"></asp:Label>
                    <asp:Label ID="ModeLbl" runat="server"></asp:Label>
                    <asp:Label ID="DetailLbl" Text="SKU Line" runat="server"></asp:Label>&nbsp;<br />
                </td>
            </tr>
            <tr>
                <td>
                    <table border="0" cellspacing="0" cellpadding="0" align="center" width="100%">
                        <tr align="center">
                            <td>
                                <asp:ImageButton ID="AlertImgBtn" BorderWidth="0" BackColor="Transparent" Visible="False"
                                    ImageUrl="~/Image/alert.gif" runat="server"></asp:ImageButton>
                                <asp:Label ID="DescrLbl" runat="server" Font-Bold="True"></asp:Label>
                                <input id="HIDDEN_SkuId" type="hidden" runat="server">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellpadding="1" cellspacing = "1">
                                    <tr>
                                        <td>
                                            <iWMS:iForm ID="formCtlHead" runat="server"></iWMS:iForm>
                                        </td>
                                    </tr>
                                </table>
                                <table cellspacing="2" cellpadding="2">
                                    <tr>
                                        <td style="height: 35px">
                                            <asp:Label ID="SkuUpcLbl" runat="server">SKU/UPC</asp:Label><asp:RequiredFieldValidator
                                                ID="SkuReq" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="*"
                                                ControlToValidate="TEXT_SkuCode"></asp:RequiredFieldValidator><br>
                                            <telerik:RadTextBox ID="TEXT_SkuCode" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155"
                                                OnTextChanged="TEXT_SkuCode_TextChanged" AutoPostBack="True"></telerik:RadTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="SkuDescrLbl" runat="server">SKU Description</asp:Label>
                                            <asp:RequiredFieldValidator Style="z-index: 0" ID="SkuDescrReq" runat="server" ControlToValidate="TEXT_SkuDescr"
                                                ErrorMessage="*" ForeColor=" " CssClass="errorLabelBig"></asp:RequiredFieldValidator><br>
                                            <telerik:RadTextBox ID="TEXT_SkuDescr" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td style="height: 35px">
                                            <asp:Label ID="QtyLbl" runat="server">Expected Quantity</asp:Label>
                                            <asp:RequiredFieldValidator ID="QtyReq" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="*"
                                                ControlToValidate="INTEGER_Qty"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="QtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                ControlToValidate="INTEGER_Qty" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                            <asp:CompareValidator ID="QtyValueVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                    ControlToValidate="INTEGER_Qty" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator><br>
                                            <telerik:RadTextBox ID="INTEGER_Qty" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td style="height: 35px">
                                            <asp:Label ID="RecQtyLbl" runat="server">Received Quantity</asp:Label><asp:CompareValidator
                                                ID="RecQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                ControlToValidate="INTEGER_RecQty" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                    ControlToValidate="INTEGER_RecQty" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator><br>
                                            <telerik:RadTextBox ID="INTEGER_RecQty" runat="server" Skin="WebBlue" Width="155">
                                            </telerik:RadTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="UomLbl" runat="server">UOM</asp:Label><input id="HIDDEN_Uom" type="hidden"
                                                name="HIDDEN_Uom" runat="server">
                                            <asp:RequiredFieldValidator ID="UomReq" runat="server" CssClass="errorLabelBig" ForeColor=" "
                                                ErrorMessage="*" ControlToValidate="TEXT_Uom"></asp:RequiredFieldValidator>
                                            <br>
                                            <telerik:RadDropDownList ID="TEXT_Uom" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155"
                                                OnSelectedIndexChanged="TEXT_Uom_SelectedIndexChanged"></telerik:RadDropDownList>
                                            <telerik:RadTextBox ID="UomTxt" runat="server" ReadOnly="True" Skin="WebBlue" Width="155">
                                            </telerik:RadTextBox>
                                            <asp:Label ID="UomTxtLbl" runat="server">Each</asp:Label>
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
                                                <telerik:RadTextBox ID="INTEGER_ShelfLife" runat="server" Skin="WebBlue" Width="80px">
                                                </telerik:RadTextBox>
                                            </asp:Panel>
                                        </td>
                                        <asp:Panel ID="BomPanel" runat="server">
                                            <td>
                                                <asp:Label ID="BomQtyLbl" runat="server">BOM Qty</asp:Label>
                                                <asp:CompareValidator ID="BomQtyVal" runat="server" ControlToValidate="INTEGER_Qty"
                                                    ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                <telerik:RadTextBox ID="DOUBLE_BomQty" runat="server" Skin="WebBlue" Width="80px">
                                                </telerik:RadTextBox>
                                            </td>
                                            <td style="width: 92px">
                                                <asp:Label ID="BomUomLbl" runat="server">BOM UOM</asp:Label><br>
                                                <telerik:RadDropDownList ID="TEXT_BomUom" runat="server" Skin="WebBlue" Width="80px">
                                                </telerik:RadDropDownList>
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
                                                                <asp:Label ID="RcDataLbl" runat="server">ReceivedDate</asp:Label><br>
                                                                <telerik:RadDatePicker ID="RcDate_Txt" runat="server" Enabled="true" DateInput-DateFormat="dd/MMM/yyyy"
                                                                    DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="WebBlue" Width="155">
                                                                    <Calendar>
                                                                        <SpecialDays>
                                                                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                        </SpecialDays>
                                                                    </Calendar>
                                                                </telerik:RadDatePicker>
                                                            </td>
                                                            <td>
                                                                <asp:Label Style="z-index: 0" ID="Tu1Lbl" runat="server">TU#1</asp:Label><br>
                                                                <telerik:RadTextBox ID="TEXT_tuno1" runat="server" Skin="WebBlue" Width="155">
                                                                </telerik:RadTextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Tu2Lbl" runat="server">TU#2</asp:Label><br>
                                                                <telerik:RadTextBox ID="TEXT_tuno2" runat="server" Skin="WebBlue" Width="155">
                                                                </telerik:RadTextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="LocLbl" runat="server">Location</asp:Label>
                                                                <asp:RequiredFieldValidator ID="LocReq" runat="server" ControlToValidate="TEXT_LocCode"
                                                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                                                <telerik:RadTextBox ID="TEXT_LocCode" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155">
                                                                </telerik:RadTextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="exlineLbl" runat="server">POLineNo</asp:Label>
                                                                <telerik:RadTextBox ID="TEXT_ExLine" ReadOnly="true" runat="server" Skin="WebBlue" Width="155">
                                                                </telerik:RadTextBox>
                                                                <br>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="paloc" runat="server">Putaway Location</asp:Label>  
                                                                <br>
                                                                    <telerik:RadTextBox ID="TEXT_PaLocCode" runat="server" Skin="WebBlue" Width="155">
                                                                    </telerik:RadTextBox>
                                                                </br>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table cellspacing="2" cellpadding="2">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LengthLbl" runat="server">Length</asp:Label>
                                                                <asp:CompareValidator Style="z-index: 0" ID="LengthVal" runat="server" ControlToValidate="DOUBLE_Length"
                                                                    ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                <telerik:RadTextBox ID="DOUBLE_Length" runat="server" Skin="WebBlue" Width="60">
                                                                </telerik:RadTextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="WidthLbl" runat="server">Width</asp:Label>
                                                                <asp:CompareValidator Style="z-index: 0" ID="WidthVal" runat="server" ControlToValidate="DOUBLE_Width"
                                                                    ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                <telerik:RadTextBox ID="DOUBLE_Width" runat="server" Skin="WebBlue" Width="60">
                                                                </telerik:RadTextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="HeightLbl" runat="server">Height</asp:Label>
                                                                <asp:CompareValidator Style="z-index: 0" ID="HeightVal" runat="server" ControlToValidate="DOUBLE_Height"
                                                                    ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                <telerik:RadTextBox ID="DOUBLE_Height" runat="server" Skin="WebBlue" Width="60">
                                                                </telerik:RadTextBox>
                                                            </td>
                                                            <td>
                                                                <br />
                                                                <asp:Label ID="prefixUOMLbl" runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="VolLbl" runat="server">Vol.</asp:Label>
                                                                <asp:CompareValidator Style="z-index: 0" ID="VolVal" runat="server" ControlToValidate="DOUBLE_Vol"
                                                                    ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                <telerik:RadTextBox ID="DOUBLE_Vol" runat="server" Skin="WebBlue" Width="60">
                                                                </telerik:RadTextBox>
                                                            </td>
                                                            <td>
                                                                <br />
                                                                <asp:Label ID="suffixUOMLbl" runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="WtLbl" runat="server">Wt.</asp:Label>
                                                                <asp:CompareValidator Style="z-index: 0" ID="WtVal" runat="server" ControlToValidate="DOUBLE_Wt"
                                                                    ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                <telerik:RadTextBox ID="DOUBLE_Wt" runat="server" Skin="WebBlue" Width="60">
                                                                </telerik:RadTextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="NetWtLbl" runat="server">Net Wt.</asp:Label>
                                                                <asp:CompareValidator Style="z-index: 0" ID="NetWtVal" runat="server" ControlToValidate="DOUBLE_NetWt"
                                                                    ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                <telerik:RadTextBox ID="DOUBLE_NetWt" runat="server" Skin="WebBlue" Width="60">
                                                                </telerik:RadTextBox>
                                                            </td>
                                                            <td>
                                                                <br />
                                                                <asp:Label ID="wtprefixUOMLbl" runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <table id="areaTable" runat="server">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="AreaLength" runat="server">Area(L)</asp:Label>
                                                                            <asp:CompareValidator Style="z-index: 0" ID="AreaLenCompVal" runat="server" ControlToValidate="DOUBLE_AreaLength"
                                                                                ErrorMessage="#" CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                            <telerik:RadTextBox ID="DOUBLE_AreaLength" runat="server" Skin="WebBlue" Width="60">
                                                                            </telerik:RadTextBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="AreaWidth" runat="server">Area(W)</asp:Label>
                                                                            <asp:CompareValidator Style="z-index: 0" ID="AreaWidthCompVal" runat="server" ControlToValidate="DOUBLE_AreaWidth"
                                                                                ErrorMessage="#" CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                            <telerik:RadTextBox ID="DOUBLE_AreaWidth" runat="server" Skin="WebBlue" Width="60">
                                                                            </telerik:RadTextBox>
                                                                        </td>
                                                                        <td align="left">
                                                                            <br />
                                                                            <asp:Label ID="areaLWPrefixUOM" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Area" runat="server">Area</asp:Label>
                                                                            <asp:CompareValidator Style="z-index: 0" ID="AreaCompVal" runat="server" ControlToValidate="DOUBLE_Area"
                                                                                ErrorMessage="#" CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                            <telerik:RadTextBox ID="DOUBLE_Area" runat="server" Skin="WebBlue" Width="60">
                                                                            </telerik:RadTextBox>
                                                                        </td>
                                                                        <td align="left">
                                                                            <br />
                                                                            <asp:Label ID="areaSuffixUOM" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="9">
                                                                &nbsp;
                                                                <asp:Label ID="lblDimensionWt" runat="server" Text="Note : "></asp:Label><br />
                                                                <br />
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
                                                                <telerik:RadTextBox ID="INTEGER_LotId" runat="server" Skin="WebBlue" Width="60">
                                                                </telerik:RadTextBox>
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
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <telerik:RadButton ID="ChoosePOBtn" runat="server" Text="Choose PO" Skin="WebBlue"
                        Visible="False" CausesValidation="False">
                    </telerik:RadButton>
                    &nbsp;&nbsp;
                    <telerik:RadButton ID="SaveNextBtn" runat="server" Text="Save &amp; Next" Skin="WebBlue"
                        OnClick="SaveNextBtn_Click" SingleClick="true" SingleClickText="Processing..." OnClientClicked="DisableSubmitBtn">
                    </telerik:RadButton>
                    &nbsp;&nbsp;
                    <telerik:RadButton ID="SaveBtn" runat="server" Text="Save &amp; Close" Skin="WebBlue"
                        OnClick="SaveBtn_Click" SingleClick="true" SingleClickText="Processing..." OnClientClicked="DisableSubmitBtn">
                    </telerik:RadButton>
                    &nbsp;&nbsp;
                    <telerik:RadButton ID="CloseBtn" runat="server" Text="Close" Skin="WebBlue" CausesValidation="false"
                        OnClick="CloseBtn_Click">
                    </telerik:RadButton>
                    &nbsp;
                    <asp:CheckBox Style="z-index: 0" ID="RefreshChkBox" runat="server" Text="Clear Fields On Save"
                        Checked="True"></asp:CheckBox>
                    <asp:TextBox ID="podtidTxt" runat="server" OnTextChanged="podtidTxt_TextChanged"
                        Height="1px" Width="1px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
