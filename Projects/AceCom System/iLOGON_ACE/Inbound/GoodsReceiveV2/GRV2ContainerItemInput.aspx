<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV2ContainerItemInput.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV2.GRV2ContainerItemInput" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Container Item</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <%--    <meta http-equiv="Pragma" content="no-cache">--%>

    <script type="text/javascript">
        //function CheckEmptyBox(recQty, Qty) {
        //    function CheckEmptyBox() {
        //        var TextBox1 = document.getElementById('INTEGER_RecQty');
        //        var TextBox2 = document.getElementById('INTEGER_Qty');
        //        var num1 = parseInt(TextBox1.getAttribute('value'));
        //        var num2 = parseInt(TextBox2.getAttribute('value'));
        //        if (num1 > num2) {
        //            return confirm('Proceed to Over-Receive this SKU Line?');
        //        }
        //        else {
        //            return true;
        //        }
        //    }
        //}

        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="MainRadPageView">
                <br />
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                        </td>
                        <td align="left" style="width: 140px">&nbsp;&nbsp;
                            <asp:CheckBox ID="ChkAdd" ToolTip="ContinuousAdd" runat="server" />
                            <asp:Label ID="ChkAddLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="ContinuousAdd" ForeColor="Black"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="ChkClear" ToolTip="Clear Fields for Next Entry" runat="server" Checked="true" />
                            <asp:Label ID="ChkClearLbl" runat="server" Font-Bold="true" Width="250px" Font-Size="Small" Text="Clear Fields for Next Entry" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Panel ID="AddPanel" runat="server">
                                &nbsp;
                <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text="Add" OnClick="SaveBtn_Click"
                    OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                                &nbsp;
                            </asp:Panel>
                        </td>
                        <td class="pagetitle">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table cellspacing="2" cellpadding="2" width="100%" id="table1" border="0" runat="server">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

        </telerik:RadMultiPage>
    </form>
</body>
</html>
