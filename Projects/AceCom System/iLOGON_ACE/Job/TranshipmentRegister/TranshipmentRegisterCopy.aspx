<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TranshipmentRegisterCopy.aspx.cs" Inherits="iWMS.Web.Job.TranshipmentRegister.Transhipment_RegisterCopy" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TranshipmentRegisterCopy</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta content="no-cache" http-equiv="Pragma">
</head>
<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%" cellspacing="2" cellpadding="2">
        <tr>
            <td>
                <br />
                &nbsp;<asp:Button ID="CopyBtn" runat="server" Text=" Copy " CssClass="detailbutton"
                    Enabled="False" OnClick="CopyBtn_Click" /><br />
                <br>
            </td>
            <td align="right">
                <asp:Button ID="BackButton" runat="server" CssClass="detailButton" Visible="True"
                    Text="< Search Results" Width="120px" CausesValidation="False" OnClick="BackButton_Click">
                </asp:Button>
            </td>
        </tr>
    </table>
    <p>
    </p>
    <table cellspacing="2" cellpadding="2">
        <tr>
            <td nowrap>
                <asp:Label ID="JobCopyLbl" runat="server">Copy from Job#</asp:Label>
            </td>
            <td align="right">
                :
                <asp:TextBox ID="JobNoTxt" runat="server" AutoPostBack="True" BackColor="Yellow"
                    OnTextChanged="JobNoTxt_TextChanged"></asp:TextBox>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="JobInvChkBox" runat="server" Text="Supplier Invoices" Enabled="False"
                    AutoPostBack="True" OnCheckedChanged="JobInvChkBox_CheckedChanged"></asp:CheckBox>&nbsp;
                <br>
                <asp:CheckBox ID="JobCtnrItemChkBox" runat="server" Text="Supplier Invoices, Container and Items"
                    Enabled="False" AutoPostBack="True" OnCheckedChanged="JobCtnrItemChkBox_CheckedChanged">
                </asp:CheckBox>&nbsp;
            </td>
        </tr>
    </table>
    &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>