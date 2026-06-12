<%@ Page Language="c#" CodeBehind="DetailInput5.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.DetailInput5" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Receipt Detail Input</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0">
            </telerik:RadTab>
            <telerik:RadTab Text="Extra Lots" Value="1">
            </telerik:RadTab>
            <telerik:RadTab Text="Remarks" Value="2">
            </telerik:RadTab>
            <telerik:RadTab Text="Invoice" Value="3">
            </telerik:RadTab>
            <telerik:RadTab Text="Attc" Value="4">
            </telerik:RadTab>
            
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" ID="RadPageView1">
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
                                    <table cellspacing="2" cellpadding="2">
                                        <tr>
                                            <td style="height: 35px">
                                                <asp:Label ID="SkuUpcLbl" runat="server">SKU/UPC</asp:Label>
                                                <asp:RequiredFieldValidator ID="SkuReq" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="*"
                                                    ControlToValidate="TEXT_SkuCode"></asp:RequiredFieldValidator>
                                                <br>
                                                <telerik:RadTextBox ID="TEXT_SkuCode" Skin="Sunset" BackColor="#ded7c6" runat="server" AutoPostBack="True"
                                                    OnTextChanged="TEXT_SkuCode_TextChanged" Width="155"></telerik:RadTextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="SkuDescrLbl" runat="server">SKU Description</asp:Label>
                                                <asp:RequiredFieldValidator Style="z-index: 0" ID="SkuDescrReq" runat="server" ControlToValidate="TEXT_SkuDescr"
                                                    ErrorMessage="*" ForeColor=" " CssClass="errorLabelBig"></asp:RequiredFieldValidator>
                                                <br>
                                                <telerik:RadTextBox ID="TEXT_SkuDescr" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155" ></telerik:RadTextBox>
                                            </td>
                                            <td style="height: 35px">
                                                <asp:Label ID="QtyLbl" runat="server">Expected Quantity</asp:Label>
                                                <asp:RequiredFieldValidator ID="QtyReq" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="*"
                                                    ControlToValidate="INTEGER_Qty"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="QtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                    ControlToValidate="INTEGER_Qty" Operator="DataTypeCheck" Type="Integer">
                                                </asp:CompareValidator>
                                                <asp:CompareValidator ID="QtyValueVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                    ControlToValidate="INTEGER_Qty" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator><br>
                                                <telerik:RadTextBox ID="INTEGER_Qty" Skin="Sunset" BackColor="#ded7c6" runat="server" Width="155"></telerik:RadTextBox>
                                            </td>
                                            <td style="height: 35px">
                                                <asp:Label ID="RecQtyLbl" runat="server">Received Quantity</asp:Label>
                                                <asp:CompareValidator ID="RecQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                    ControlToValidate="INTEGER_RecQty" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                                <br>
                                                <telerik:RadTextBox ID="INTEGER_RecQty" runat="server" Skin="WebBlue" Width="155"></telerik:RadTextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="UomLbl" runat="server">UOM</asp:Label>
                                                <input id="HIDDEN_Uom" type="hidden" name="HIDDEN_Uom" runat="server">
                                                <asp:RequiredFieldValidator ID="UomReq" runat="server" CssClass="errorLabelBig" ForeColor=" "
                                                    ErrorMessage="*" ControlToValidate="TEXT_Uom"></asp:RequiredFieldValidator>
                                                <br>
                                                <telerik:RadDropDownList ID="TEXT_Uom" runat="server" Skin="Sunset" BackColor="#ded7c6" OnSelectedIndexChanged="TEXT_Uom_SelectedIndexChanged"
                                                    Width="155">
                                                </telerik:RadDropDownList>
                                                <asp:TextBox ID="UomTxt" runat="server" Skin="WebBlue" ReadOnly="True" Width="155">Each</asp:TextBox>
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
                                                    <telerik:RadTextBox ID="INTEGER_ShelfLife" runat="server" Skin="WebBlue" Width="80px"></telerik:RadTextBox>
                                                </asp:Panel>
                                            </td>
                                            <asp:Panel ID="BomPanel" runat="server">
                                                <td>
                                                    <asp:Label ID="BomQtyLbl" runat="server">BOM Qty</asp:Label>
                                                    <asp:CompareValidator ID="BomQtyVal" runat="server" ControlToValidate="INTEGER_Qty"
                                                        ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                    <telerik:RadTextBox ID="DOUBLE_BomQty" Skin="WebBlue" Width="80px" runat="server"></telerik:RadTextBox>
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
                                                                    <telerik:RadTextBox Style="z-index: 0" ID="TEXT_tuno1" runat="server" Skin="WebBlue" Width="155"></telerik:RadTextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Tu2Lbl" runat="server">TU#2</asp:Label><br>
                                                                    <telerik:RadTextBox ID="TEXT_tuno2" runat="server" Skin="WebBlue" Width="155"></telerik:RadTextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LocLbl" runat="server">Location</asp:Label>
                                                                    <asp:RequiredFieldValidator ID="LocReq" runat="server" ControlToValidate="TEXT_LocCode"
                                                                        ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                                                    <telerik:RadTextBox ID="TEXT_LocCode" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155"></telerik:RadTextBox>
                                                                    <%--<telerik:RadComboBox ID="TEXT_LocCode" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155"
                                                                        RenderMode="Lightweight" Filter="Contains" CausesValidation="false" AllowCustomText="false" >
                                                                    </telerik:RadComboBox>--%>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="exlineLbl" runat="server">POLineNo</asp:Label>
                                                                    <telerik:RadTextBox ID="TEXT_ExLine" runat="server" ReadOnly="true" Skin="WebBlue" Width="155"></telerik:RadTextBox>
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
                                                                    <asp:Label ID="paloc" runat="server" Visible="false" Text="Putaway Location"></asp:Label>  
                                                                    <br>
                                                                        <%--<telerik:RadTextBox ID="TEXT_PaLocCode" runat="server" Skin="WebBlue" Width="155"></telerik:RadTextBox>--%>
                                                                        <telerik:RadComboBox ID="TEXT_PaLocCode" runat="server" Skin="WebBlue" Width="155" Visible="false"
                                                                            RenderMode="Lightweight" Filter="Contains" CausesValidation="false" AllowCustomText="false" >
                                                                        </telerik:RadComboBox>
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
                                                                    <telerik:RadTextBox ID="DOUBLE_Length" runat="server" Skin="WebBlue" Width="65"></telerik:RadTextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="WidthLbl" runat="server">Width</asp:Label>
                                                                    <asp:CompareValidator Style="z-index: 0" ID="WidthVal" runat="server" ControlToValidate="DOUBLE_Width"
                                                                        ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                    <telerik:RadTextBox ID="DOUBLE_Width" runat="server" Skin="WebBlue" Width="65"></telerik:RadTextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="HeightLbl" runat="server">Height</asp:Label>
                                                                    <asp:CompareValidator Style="z-index: 0" ID="HeightVal" runat="server" ControlToValidate="DOUBLE_Height"
                                                                        ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                    <telerik:RadTextBox ID="DOUBLE_Height" runat="server" Skin="WebBlue" Width="65"></telerik:RadTextBox>
                                                                </td>
                                                                <td>
                                                                    <br />
                                                                    <asp:Label ID="prefixUOMLbl" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="VolLbl" runat="server">Vol.</asp:Label>
                                                                    <asp:CompareValidator Style="z-index: 0" ID="VolVal" runat="server" ControlToValidate="DOUBLE_Vol"
                                                                        ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                    <telerik:RadTextBox ID="DOUBLE_Vol" runat="server" Skin="WebBlue" Width="65"></telerik:RadTextBox>
                                                                </td>
                                                                <td>
                                                                    <br />
                                                                    <asp:Label ID="suffixUOMLbl" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="WtLbl" runat="server">Wt.</asp:Label>
                                                                    <asp:CompareValidator Style="z-index: 0" ID="WtVal" runat="server" ControlToValidate="DOUBLE_Wt"
                                                                        ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                    <telerik:RadTextBox ID="DOUBLE_Wt" runat="server" Skin="WebBlue" Width="65"></telerik:RadTextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="NetWtLbl" runat="server">Net Wt.</asp:Label>
                                                                    <asp:CompareValidator Style="z-index: 0" ID="NetWtVal" runat="server" ControlToValidate="DOUBLE_NetWt"
                                                                        ErrorMessage="#" ForeColor=" " CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                    <telerik:RadTextBox ID="DOUBLE_NetWt" runat="server" Skin="WebBlue" Width="65"></telerik:RadTextBox>
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
                                                                                <telerik:RadTextBox ID="DOUBLE_AreaLength" runat="server" Skin="WebBlue" Width="65"></telerik:RadTextBox>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="AreaWidth" runat="server">Area(W)</asp:Label>
                                                                                <asp:CompareValidator Style="z-index: 0" ID="AreaWidthCompVal" runat="server" ControlToValidate="DOUBLE_AreaWidth"
                                                                                    ErrorMessage="#" CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                                <telerik:RadTextBox ID="DOUBLE_AreaWidth" runat="server" Skin="WebBlue" Width="65"></telerik:RadTextBox>
                                                                            </td>
                                                                            <td align="left">
                                                                                <br />
                                                                                <asp:Label ID="areaLWPrefixUOM" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="Area" runat="server">Area</asp:Label>
                                                                                <asp:CompareValidator Style="z-index: 0" ID="AreaCompVal" runat="server" ControlToValidate="DOUBLE_Area"
                                                                                    ErrorMessage="#" CssClass="errorLabelBig" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator><br>
                                                                                <telerik:RadTextBox ID="DOUBLE_Area" runat="server" Skin="WebBlue" Width="65"></telerik:RadTextBox>
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
                                                                <td>
                                                                    <table cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td class="style1">
                                                                                <asp:Label ID="EqpNoLbl" runat="server">EquipmentNo</asp:Label><br>
                                                                                <telerik:RadDropDownList ID="TEXT_EqpNo" runat="server" DataTextField="Descr" DataValueField="item"
                                                                                    AutoPostBack="True" OnSelectedIndexChanged="TEXT_EpqNo_SelectedIndexChanged"
                                                                                    Width="150px" Skin="WebBlue" >
                                                                                </telerik:RadDropDownList>
                                                                            </td>
                                                                            <td class="style1">
                                                                                &nbsp
                                                                                <asp:Label ID="PerIdLbl" runat="server">Personnel</asp:Label><br>
                                                                                &nbsp
                                                                                <telerik:RadDropDownList ID="INTEGER_PerId" runat="server" DataTextField="Descr" DataValueField="item"
                                                                                    Width="150px" Skin="WebBlue" >
                                                                                </telerik:RadDropDownList>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
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
                                                                    <telerik:RadTextBox ID="INTEGER_LotId" runat="server" Skin="WebBlue"></telerik:RadTextBox>
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
                        <asp:Button ID="ChoosePOBtn" runat="server" CssClass="detailbutton" Text="Choose PO"
                            Visible="False" CausesValidation="False" />
                        <asp:Button Style="z-index: 0" ID="SaveNextBtn" runat="server" CssClass="detailbutton"
                            Text="Save &amp; Next" OnClick="SaveNextBtn_Click" OnClientClick="return CheckEmptyBox();">
                        </asp:Button>&nbsp;&nbsp;<asp:Button ID="SaveBtn" runat="server" Text="Save &amp; Close"
                            CssClass="detailbutton" OnClick="SaveBtn_Click" OnClientClick="return CheckEmptyBox();">
                        </asp:Button>&nbsp;
                        <asp:Button ID="CloseBtn" runat="server" Text="Close" CssClass="detailbutton" OnClick="CloseBtn_Click">
                        </asp:Button>&nbsp;
                        <asp:CheckBox Style="z-index: 0" ID="RefreshChkBox" runat="server" Text="Clear Fields On Save"
                            Checked="True"></asp:CheckBox>
                        <asp:TextBox ID="podtidTxt" runat="server" OnTextChanged="podtidTxt_TextChanged"
                            Height="1px" Width="1px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView2">
            <table>
                <tr>
                    <td class="pagetitle">
                        <asp:Label ID="titleLbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="center">
                        <asp:Button Style="z-index: 0" ID="Button1" runat="server" CssClass="detailbutton"
                            Text="Save &amp; Next" OnClick="SaveNextBtn_Click" OnClientClick="return CheckEmptyBox();">
                        </asp:Button>&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="Save &amp; Close"
                            CssClass="detailbutton" OnClick="SaveBtn_Click" OnClientClick="return CheckEmptyBox();">
                        </asp:Button>&nbsp;
                        <asp:Button ID="Button3" runat="server" Text="Close" CssClass="detailbutton" OnClick="CloseBtn_Click">
                        </asp:Button>&nbsp;
                        <asp:CheckBox Style="z-index: 0" ID="CheckBox1" runat="server" Text="Clear Fields On Save"
                            Checked="True"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView3">
            <table>
                <tr>
                    <td class="pagetitle">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="center">
                        <asp:Button Style="z-index: 0" ID="Button4" runat="server" CssClass="detailbutton"
                            Text="Save &amp; Next" OnClick="SaveNextBtn_Click" OnClientClick="return CheckEmptyBox();">
                        </asp:Button>&nbsp;&nbsp;<asp:Button ID="Button5" runat="server" Text="Save &amp; Close"
                            CssClass="detailbutton" OnClick="SaveBtn_Click" OnClientClick="return CheckEmptyBox();">
                        </asp:Button>&nbsp;
                        <asp:Button ID="Button6" runat="server" Text="Close" CssClass="detailbutton" OnClick="CloseBtn_Click">
                        </asp:Button>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView4">
            <table>
                <tr>
                    <td class="pagetitle">
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="center">
                        <asp:Button Style="z-index: 0" ID="Button7" runat="server" CssClass="detailbutton"
                            Text="Save &amp; Next" OnClick="SaveNextBtn_Click" OnClientClick="return CheckEmptyBox();">
                        </asp:Button>&nbsp;&nbsp;<asp:Button ID="Button8" runat="server" Text="Save &amp; Close"
                            CssClass="detailbutton" OnClick="SaveBtn_Click" OnClientClick="return CheckEmptyBox();">
                        </asp:Button>&nbsp;
                        <asp:Button ID="Button9" runat="server" Text="Close" CssClass="detailbutton" OnClick="CloseBtn_Click">
                        </asp:Button>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="ImageUploadRadPageView" />

    </telerik:RadMultiPage>
    </form>
</body>
</html>