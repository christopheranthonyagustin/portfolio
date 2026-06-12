<%@ Page Language="c#" CodeBehind="TransportCopy.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.Transport.TransportCopy" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportCopy</title>
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
    <table id="table1" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
        <tr>
            <td>
                <span class="pagetitle">&nbsp;Copy Job
            </td>
            <td width="45%" align="right">
                <asp:Button ID="BackButton" runat="server" CssClass="detailButton" Visible="True"
                    Text="Search Results" Width="120px" CausesValidation="False" OnClick="BackButton_Click">
                </asp:Button>&nbsp;
            </td>
        </tr>
    </table>
    </span>
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
            <td valign="top" align="right">
                <p>
                </p>
                <br>
                <br>
                <asp:Button ID="CopyBtn" runat="server" Text=" Copy " Enabled="False" CssClass="detailbutton"
                    OnClick="CopyBtn_Click"></asp:Button>&nbsp;
            </td>
        </tr>
    </table>
    &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
