<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintPalletLabel.aspx.cs"
    Inherits="iWMS.Web.Inbound.Receipt.PrintPalletLabel" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>PrintPalletLabel</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">
    <style type="text/css">
        .style1
        {
            height: 27px;
        }
    </style>
</head>
<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:Label ID="CopyLbl" runat="server" CssClass="pagetitle">Print Pallet Label :</asp:Label><br>
    <p>
    </p>
    <table cellspacing="2" cellpadding="2">
        <tr>
            <td nowrap>
                &nbsp;
                <asp:CheckBox ID="receiptCb" runat="server" OnCheckedChanged="CheckedChanged" AutoPostBack="True" />&nbsp;
                <asp:MutuallyExclusiveCheckBoxExtender ID="receiptMecb" TargetControlID="receiptCb"
                    runat="server" Key="YesNo" />
                <asp:Label ID="receiptLbl" runat="server">Receipt#</asp:Label>
            </td>
            <td>
                :
                <asp:TextBox ID="receiptNoTxt" runat="server" />&nbsp;
            </td>
        </tr>
        <tr>
            <td nowrap class="style1">
                &nbsp;
                <asp:CheckBox ID="permitCb" runat="server" OnCheckedChanged="CheckedChanged" AutoPostBack="True" />&nbsp;
                <asp:MutuallyExclusiveCheckBoxExtender ID="permitMebcb" TargetControlID="permitCb"
                    runat="server" Key="YesNo" />
                <asp:Label ID="PermitLbl" runat="server">Permit#</asp:Label>
            </td>
            <td class="style1">
                :
                <asp:TextBox ID="permitNoTxt" runat="server" />&nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" align="right" colspan="2">
                <p>
                    &nbsp;</p>
                <p style="z-index: 0">
                    &nbsp; &nbsp;
                    <asp:Button ID="PrintBtn" runat="server" Text=" Print " CssClass="detailbutton" OnClick="PrintBtn_Click" />&nbsp;</p>
                <p>
                    <asp:Label Style="z-index: 0" ID="errorLbl" runat="server" CssClass="errorLabel"></asp:Label>&nbsp;</p>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
