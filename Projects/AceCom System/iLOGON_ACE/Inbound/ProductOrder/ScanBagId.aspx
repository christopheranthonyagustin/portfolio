<%@ Page Language="c#" CodeBehind="ScanBagId.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.ProductOrder.ScanBagId" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ScanBagId</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <bgsound id="sound" />

    <script type="text/javascript">
    function PlaySound(url) {
        document.all.sound.src = url;
    }
    </script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </td>
            <td valign="top">
                <br />
                <asp:Button ID="CompleteBtn" runat="server" Text="" CssClass="detailButton" CausesValidation="False"
                    Width="100" Height="100" OnClick="CompleteBtn_Click"></asp:Button>
                <br />
                <br />
                <asp:Button ID="CheckBtn" runat="server" Text="Check" CssClass="detailButton" CausesValidation="False"
                    Width="100" Height="100" OnClick="CheckBtn_Click"></asp:Button>
                <br />
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    &nbsp;<br />
    <br />
    &nbsp;
    <br />
    </form>
</body>
</html>
