<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailInput4.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptShipment.DetailInput4" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>SKU Line @ Goods Receive</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <%--    <meta http-equiv="Pragma" content="no-cache">--%>

    <script type="text/javascript">
        function CheckEmptyBox(recQty, Qty) {
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
        }

        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
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
                <telerik:RadTab Text="Attachment" Value="4">
                </telerik:RadTab>
                <telerik:RadTab Text="SAPInfo" Value="5">
                </telerik:RadTab>
                <telerik:RadTab Text="JobOrderItemAttc" Value="6">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="MainRadPageView">
                <br />
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="IdLbl" runat="server"></asp:Label>
                        </td>
                        <td align="left" style="width: 140px">&nbsp;&nbsp;
                            <asp:CheckBox ID="ChkAdd" ToolTip="ContinuousAdd" runat="server" />
                            <asp:Label ID="ChkAddLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="ContinuousAdd" ForeColor="Black"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="ChkClear" ToolTip="Clear Fields for Next Entry" runat="server" Checked="true" />
                            <asp:Label ID="ChkClearLbl" runat="server" Font-Bold="true" Width="250px" Font-Size="Small" Text="Clear Fields for Next Entry" ForeColor="Black"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                            &nbsp;
                            <asp:CheckBox ID="ChkSaveOnPan" ToolTip="SaveOnPan" runat="server" />
                            <asp:Label ID="ChkSaveOnPanLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Panel ID="AddPanel" runat="server">
                    &nbsp;
                <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add" OnClick="SaveBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="ChoosePOBtn" CssClass="white" runat="server" Text="Choose PO" CausesValidation="False" />
                </asp:Panel>
                <asp:Panel ID="UpdatePanel" runat="server">
                    &nbsp;
                <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev"
                    CausesValidation="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update" OnClick="SaveBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next"
                    CausesValidation="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                </asp:Panel>
                <br />
                <table cellspacing="2" cellpadding="2" width="100%" id="table1" border="0" runat="server">
                    <tr>
                        <td>
                            <table border="0" cellspacing="0" cellpadding="0" align="center" width="100%">
                                <tr align="center">
                                    <td>
                                        <asp:Label ID="DescrLbl" runat="server" Font-Bold="True"></asp:Label>
                                        <input id="HIDDEN_SkuId" type="hidden" runat="server">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl_Lots" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                        &nbsp;
                                                <asp:Label ID="NotesLbl" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="center">
                            <asp:TextBox ID="podtidTxt" runat="server" OnTextChanged="podtidTxt_TextChanged"
                                Height="1px" Width="1px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="ExtraLotsRadPageView">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <br />
                            <asp:Label ID="ExtraLotsTitleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="ExtraLotsSaveBtn" runat="server" CssClass="white" Text="Add" OnClick="SaveBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_ExtraLots" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="RemarksRadPageView">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <br />
                            <asp:Label ID="RemTitleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="RemSaveBtn" runat="server" CssClass="white" Text="Add" OnClick="SaveBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_Remarks" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="InvoiceRadPageView">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <br />
                            <asp:Label ID="InvTitleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="InvSaveBtn" runat="server" CssClass="white" Text="Add" OnClick="SaveBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_Invoice" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="ImageUploadRadPageView" />
                        <telerik:RadPageView runat="server" ID="SAPInfoRadPageView">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="SAPInfoTitleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="SAPInfoSaveBtn" runat="server" CssClass="white" Text="Add" OnClick="SAPSaveBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_SAPInfo" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="JobOrderItemAttcRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
