<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3AddAlien.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3AddAlien"%>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Add Alien</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <script src="../../js/Script.js" type="text/javascript"></script>    
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function Close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="RadPageView1">
                <table cellspacing="2" cellpadding="2" width="100%" id="table1" border="0" runat="server">
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="IdLbl" runat="server"></asp:Label>
                            <asp:Label ID="ModeLbl" runat="server"></asp:Label>&nbsp;<br />
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
                                                        OnTextChanged="TEXT_SkuCode_TextChanged" Width="155">
                                                    </telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="SkuDescrLbl" runat="server">SKU Description</asp:Label>
                                                    <asp:RequiredFieldValidator Style="z-index: 0" ID="SkuDescrReq" runat="server" ControlToValidate="TEXT_SkuDescr"
                                                        ErrorMessage="*" ForeColor=" " CssClass="errorLabelBig"></asp:RequiredFieldValidator>
                                                    <br>
                                                    <telerik:RadTextBox ID="TEXT_SkuDescr" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155"></telerik:RadTextBox>
                                                </td>
                                                <td style="height: 35px">
                                                    <asp:Label ID="QtyLbl" runat="server">CountedQty</asp:Label>
                                                    <asp:RequiredFieldValidator ID="QtyReq" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="*"
                                                        ControlToValidate="INTEGER_Qty"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="QtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                        ControlToValidate="INTEGER_Qty" Operator="DataTypeCheck" Type="Integer">
                                                    </asp:CompareValidator>
                                                    <asp:CompareValidator ID="QtyValueVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                        ControlToValidate="INTEGER_Qty" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator><br>
                                                    <telerik:RadTextBox ID="INTEGER_Qty" Skin="Sunset" BackColor="#ded7c6" runat="server" Width="155"></telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LocLbl" runat="server">Location</asp:Label>
                                                    <asp:RequiredFieldValidator ID="LocReq" runat="server" ControlToValidate="TEXT_LocCode"
                                                        ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                                    <telerik:RadComboBox ID="TEXT_LocCode" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155"
                                                        RenderMode="Lightweight" Filter="Contains" CausesValidation="false" AllowCustomText="false">
                                                    </telerik:RadComboBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
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
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                        <asp:Panel ID="LotPnl" runat="server">
                                                            <tr>
                                                                <td>
                                                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                                                </td>
                                                            </tr>
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
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button Style="z-index: 0" ID="SaveNextBtn" runat="server" CssClass="white"
                                Text="Save &amp; Next" OnClick="SaveNextBtn_Click"></asp:Button>&nbsp;&nbsp;<asp:Button ID="SaveBtn" runat="server" Text="Save &amp; Close"
                                    CssClass="white" OnClick="SaveBtn_Click"></asp:Button>&nbsp;
                        <asp:Button ID="CloseBtn" runat="server" Text="Close" CssClass="white" OnClick="CloseBtn_Click"></asp:Button>&nbsp;                        
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
