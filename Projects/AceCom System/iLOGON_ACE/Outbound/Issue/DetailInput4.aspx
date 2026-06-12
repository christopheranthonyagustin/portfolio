<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailInput4.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.DetailInput4" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>DetailInput</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
        <%--<META content="no-cache" http-equiv="Pragma">--%>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" Width="200px">
            </telerik:RadTab>
            <telerik:RadTab Text="Extra Lots" Value="1" Width="200px">
            </telerik:RadTab>
            <telerik:RadTab Text="Remarks1" Value="2" Width="200px">
            </telerik:RadTab>
            <telerik:RadTab Text="Remarks2" Value="2" Width="200px">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" ID="RadPageView1">
            <table cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="pagetitle">
                        &nbsp;
                        <asp:Label ID="IdLbl" runat="server"></asp:Label>
                        <asp:Label ID="ModeLbl" runat="server"></asp:Label>
                        <asp:Label ID="DetailLbl" Text="SKU Line" runat="server"></asp:Label>&nbsp;<br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td align="center">
                                    &nbsp;<asp:ImageButton ID="AlertImgBtn" runat="server" ImageUrl="../../Image/alert.gif"
                                        Visible="False" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle">
                                    </asp:ImageButton>
                                    <asp:Label ID="DescrLbl" runat="server" Font-Bold="True"></asp:Label><br />
                                    <asp:Label ID="PackingLbl" runat="server">Packing :</asp:Label>
                                    <input id="HIDDEN_SkuId" type="hidden" runat="server" />
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
                                                    Width="155" OnTextChanged="TEXT_SkuCode_TextChanged"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="QtyLbl" runat="server">Qty</asp:Label>:
                                                <asp:RequiredFieldValidator ID="QtyReq" runat="server" ControlToValidate="INTEGER_Qty"
                                                    ErrorMessage="*"></asp:RequiredFieldValidator><asp:CompareValidator ID="QtyVal" runat="server"
                                                        ControlToValidate="INTEGER_Qty" ErrorMessage="#" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator><asp:CompareValidator
                                                            ID="QtyValueVal" runat="server" ControlToValidate="INTEGER_Qty" ErrorMessage="#"
                                                            Type="Integer" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator><br>
                                                <asp:TextBox ID="INTEGER_Qty" runat="server" BackColor="Yellow" Width="155" OnTextChanged="INTEGER_Qty_TextChanged"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="UomLbl" runat="server">UOM</asp:Label>:<input id="HIDDEN_Uom" type="hidden"
                                                    runat="server" /><br>
                                                <asp:DropDownList ID="TEXT_Uom" runat="server" Width="155" OnSelectedIndexChanged="TEXT_Uom_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:TextBox ID="UomTxt" runat="server" Width="155" ReadOnly="True">Each</asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Panel ID="CartonPanel" runat="server">
                                                    <asp:Label ID="Ctn_Cnt_Lbl" runat="server">CartonCount</asp:Label>:<input id="HIDDEN_Cartoncnt"
                                                        type="hidden" runat="server" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CompareValidator
                                                        ID="CartoncntVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_cartoncnt"
                                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br>
                                                    <asp:TextBox ID="INTEGER_cartoncnt" runat="server" Width="155"></asp:TextBox>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                                <asp:Panel ID="ShelfLifePanel" runat="server">
                                                    <asp:Label ID="ShelfLifeLbl" runat="server">Shelf Life</asp:Label>:
                                                    <asp:CompareValidator ID="ShelfLifeVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_ShelfLife"
                                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br>
                                                    <asp:TextBox ID="INTEGER_ShelfLife" runat="server" Width="155"></asp:TextBox>
                                                </asp:Panel>
                                            </td>
                                            <asp:Panel ID="BomPanel" runat="server">
                                                <td>
                                                    <asp:Label ID="BomQtyLbl" runat="server">BOM Qty</asp:Label>:
                                                    <asp:CompareValidator ID="BomQtyVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_Qty"
                                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br>
                                                    <asp:TextBox ID="DOUBLE_BomQty" Width="155" runat="server"></asp:TextBox>
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
                                            <td align="right">
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
                                                        <tr align="right">
                                                            <td>
                                                                <asp:Label ID="NoOfLocLbl" runat="server">Location :</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblNoOfLoc" runat="server"></asp:Label>
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
                                                    <asp:Label ID="RcDataLbl" runat="server">ReceivedDate</asp:Label><br />
                                                    <asp:TextBox runat="server" ID="DATE_rcvdate" Width="155"></asp:TextBox>
                                                    <asp:CalendarExtender ID="RcDate_CalendarExtender" runat="server" Enabled="True"
                                                        TargetControlID="DATE_rcvdate" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                                        Format="dd/MMM/yyyy">
                                                    </asp:CalendarExtender>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LocLbl2" runat="server">Location</asp:Label>:
                                                    <br>
                                                    <asp:TextBox ID="Issue_TEXT_LocCode" runat="server" Width="155"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="TU1_Lbl" runat="server">Tu1</asp:Label>:
                                                    <br>
                                                    <asp:TextBox ID="TEXT_tuno1" runat="server" Width="155"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="TU2_Lbl" runat="server">Tu2</asp:Label>:
                                                    <br>
                                                    <asp:TextBox ID="TEXT_tuno2" runat="server" Width="155"></asp:TextBox>
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
                                            <td>
                                                <asp:Label ID="Rem1Lbl" runat="server">Remarks</asp:Label><br>
                                                <asp:TextBox ID="TEXT_Rem1" runat="server" Width="155" ReadOnly="true"></asp:TextBox>
                                            </td>
                                            <td class="style1">
                                                <asp:Label ID="EqpNoLbl" runat="server">EQP No</asp:Label><br>
                                                <asp:DropDownList ID="TEXT_EqpNo" runat="server" DataTextField="Descr" DataValueField="item"
                                                    AutoPostBack="True" OnSelectedIndexChanged="TEXT_EpqNo_SelectedIndexChanged"
                                                    Width="155">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="style1">
                                                <asp:Label ID="PerIdLbl" runat="server">Personnel</asp:Label><br>
                                                <asp:DropDownList ID="INTEGER_PerId" runat="server" DataTextField="Descr" DataValueField="item"
                                                    Width="155">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label ID="VasCodeLbl" runat="server">VAS Code</asp:Label><br>
                                                <asp:DropDownList ID="TEXT_VasCode" runat="server" Width="155">
                                                </asp:DropDownList>
                                            </td>
                                            <td colspan="3" class="style1">
                                                <asp:CheckBox Style="z-index: 0" ID="IssueAllCB" runat="server" Text="IssueAll" Checked="True"
                                                    Visible="false"></asp:CheckBox>
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
                                                    <table cellspacing="1" cellpadding="1">
                                                    </table>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LocLbl" runat="server">Location</asp:Label>:
                                                    <asp:RequiredFieldValidator ID="LocReq" runat="server" ErrorMessage="*" ControlToValidate="TEXT_LocCode"></asp:RequiredFieldValidator><br />
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
                                    </td>
                                </tr>
                                <tr>
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
                            </asp:Panel>
                        </table>
                    </td>
                </tr>
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
                <tr>
                    <td valign="top" align="center">
                        <asp:Button ID="ChooseLotBtn" runat="server" Text="Choose Lot" CssClass="detailbutton"
                            Visible="False" Enabled="false"></asp:Button>&nbsp;
                        <asp:Button ID="SaveNextBtn" runat="server" Text="Save &amp; Next" CssClass="detailbutton"
                            Enabled="False" OnClick="SaveNextBtn_Click"></asp:Button>&nbsp;<asp:Button ID="SaveBtn"
                                runat="server" Text="Save &amp; Close" CssClass="detailbutton" Enabled="False"
                                OnClick="SaveBtn_Click"></asp:Button>&nbsp;
                        <asp:Button ID="CloseBtn" runat="server" Text="Close" CssClass="detailbutton" OnClick="CloseBtn_Click">
                        </asp:Button>
                        <br />
                        <asp:TextBox ID="slltidTxt" runat="server" AutoPostBack="true" OnTextChanged="slltidTxt_TextChanged"
                            Height="1px" Width="1px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView2">
            <table border="0" cellpadding="0" cellspacing="0">
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
                        <asp:Button ID="Button1" runat="server" Text="Choose Lot" CssClass="detailbutton"
                            Visible="False" Enabled="false"></asp:Button>&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="Save &amp; Next" CssClass="detailbutton"
                            Enabled="False" OnClick="SaveNextBtn_Click"></asp:Button>&nbsp;<asp:Button ID="Button3"
                                runat="server" Text="Save &amp; Close" CssClass="detailbutton" Enabled="False"
                                OnClick="SaveBtn_Click"></asp:Button>&nbsp;
                        <asp:Button ID="Button4" runat="server" Text="Close" CssClass="detailbutton" OnClick="CloseBtn_Click">
                        </asp:Button>
                        <%--<br />
					                    <asp:TextBox ID="TextBox1" runat="server"  
                                              ontextchanged="slltidTxt_TextChanged" height = "1px" width = "1px"></asp:TextBox>--%>
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
                        <asp:Button ID="Button5" runat="server" Text="Choose Lot" CssClass="detailbutton"
                            Visible="False" Enabled="false"></asp:Button>&nbsp;
                        <asp:Button ID="Button6" runat="server" Text="Save &amp; Next" CssClass="detailbutton"
                            Enabled="False" OnClick="SaveNextBtn_Click"></asp:Button>&nbsp;<asp:Button ID="Button7"
                                runat="server" Text="Save &amp; Close" CssClass="detailbutton" Enabled="False"
                                OnClick="SaveBtn_Click"></asp:Button>&nbsp;
                        <asp:Button ID="Button8" runat="server" Text="Close" CssClass="detailbutton" OnClick="CloseBtn_Click">
                        </asp:Button>
                        <%--<br />
                    <asp:TextBox ID="TextBox2" runat="server"  
                                ontextchanged="slltidTxt_TextChanged" height = "1px" width = "1px"></asp:TextBox>--%>
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
                        <asp:Button ID="Button9" runat="server" Text="Choose Lot" CssClass="detailbutton"
                            Visible="False" Enabled="false"></asp:Button>&nbsp;
                        <asp:Button ID="Button10" runat="server" Text="Save &amp; Next" CssClass="detailbutton"
                            Enabled="False" OnClick="SaveNextBtn_Click"></asp:Button>&nbsp;<asp:Button ID="Button11"
                                runat="server" Text="Save &amp; Close" CssClass="detailbutton" Enabled="False"
                                OnClick="SaveBtn_Click"></asp:Button>&nbsp;
                        <asp:Button ID="Button12" runat="server" Text="Close" CssClass="detailbutton" OnClick="CloseBtn_Click">
                        </asp:Button>
                        <%-- <br />
                    <asp:TextBox ID="TextBox3" runat="server"  
                                ontextchanged="slltidTxt_TextChanged" height = "1px" width = "1px"></asp:TextBox>--%>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    </form>
</body>
</html>
