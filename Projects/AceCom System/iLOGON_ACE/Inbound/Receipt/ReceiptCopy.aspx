<%@ Page Language="c#" CodeBehind="ReceiptCopy.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.ReceiptCopy" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Copy @ GoodsReceive</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="receiptCopyLbl" runat="server">Copy From GRNo</asp:Label>
                    <br />
                    <asp:TextBox ID="rcTxt" runat="server" AutoPostBack="True" BackColor="Yellow" OnTextChanged="rcTxt_TextChanged" Width="140px" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="noOfTimesLbl" runat="server"> Number of Copies</asp:Label>
                    <br />
                    <asp:DropDownList ID="rcDDL" runat="server" Width="140px" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:CheckBox ID="JobNoChkBox" runat="server" Enabled="False" Text="Copy JobNo" Checked="True"></asp:CheckBox>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:CheckBox ID="DetailChkBox" runat="server" Text="Include SKU Lines" Enabled="False"></asp:CheckBox>
                    <br />
                    <asp:Label Style="z-index: 0" ID="errorLbl" runat="server" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="CopyBtn" runat="server" Text=" Copy " CssClass="White" Enabled="False" OnClick="CopyBtn_Click" OnClientClick="return confirm('Confirm Copy Receipt?');" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
