<%@ Page Language="c#" CodeBehind="ProductOrderForm.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.ProductOrder.ProductOrderForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>RegisterLotNo</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="table1" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
        <tr>
            <td align="left">
                <input id="tab1" style="width: 70px; cursor: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
                    value="LotNo" runat="server">
                <input id="tab2" style="width: 70px; cursor: pointer" class="TabTitle" onclick='clickRow(2, "table1");'
                    value="Pallet" runat="server">
                <input id="tab3" style="width: 70px; cursor: pointer" class="TabTitle" onclick='clickRow(3, "table1");'
                    value="Bag" runat="server">
                <input id="tab4" style="width: 70px; cursor: pointer" class="TabTitle" onclick='clickRow(4, "table1");'
                    value="Log" runat="server">
                <%--<asp:button style="Z-INDEX: 0" id="RegisterNewPalletBtn" runat="server" 
                            Text="RegisterNewPallet" CssClass="detailButton" Height="20px"  onclick="RegisterNewPalletBtn_Click"></asp:button>
            &nbsp;<asp:button style="Z-INDEX: 0" id="SendBtn" runat="server"
                    Text="SendToMatcon" CssClass="detailButton" Height="20px"  onclick="SendBtn_Click"></asp:button>--%>
                <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" CssClass="detailButton"
                    OnClick="RefreshBtn_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td>
                <hr />
                <br />
                &nbsp;
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailButton"
                    OnClick="UpdateBtn_Click"></asp:Button>&nbsp;<br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel2"
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="PalletFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="BagFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="LogFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
