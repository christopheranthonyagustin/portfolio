<%@ Page Language="c#" CodeBehind="JobPopulate.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Issue.JobPopulate" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>JobPopulate</title>
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
    <asp:Label ID="PopulateLbl" runat="server" CssClass="pagetitle">Populate to Job</asp:Label><br>
    <p>
    </p>
    <table cellspacing="2" cellpadding="2">
        <tr>
            <td nowrap align="left">
                <asp:Label ID="jobPopulateLbl" runat="server">Populate from Issue#</asp:Label>
            </td>
            <td>
                :
                <asp:TextBox ID="isTxt" runat="server" AutoPostBack="True" BackColor="Yellow" OnTextChanged="isTxt_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 16px">
            </td>
            <td style="height: 16px" align="right">
                <asp:Label ID="consigneeNameLbl" runat="server"></asp:Label>&nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2" align="right">
                <p>
                    &nbsp;<asp:Button ID="PopulateBtn" runat="server" CssClass="detailbutton" Enabled="False"
                        Text="Populate" OnClick="PopulateBtn_Click"></asp:Button>&nbsp;<br>
                    <br>
                </p>
            </td>
        </tr>
    </table>
    &nbsp;
    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
    <asp:LinkButton Style="z-index: 0" ID="LinkLbl" runat="server" CssClass="linkLabelBig"
        OnClick="LinkLbl_Click"></asp:LinkButton>
    </form>
</body>
</html>
