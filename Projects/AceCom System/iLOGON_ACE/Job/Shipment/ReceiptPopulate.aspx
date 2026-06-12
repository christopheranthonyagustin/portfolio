<%@ Page Language="c#" CodeBehind="ReceiptPopulate.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.Shipment.ReceiptPopulate" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReceiptPopulate</title>
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
    <span class="pagetitle">&nbsp;Populate to Receipt<br>
    </span>
    <p>
    </p>
    <table cellspacing="2" cellpadding="2">
        <tr>
            <td nowrap align="left">
                <asp:Label ID="jobPopulateLbl" runat="server">Populate from Job#</asp:Label>
            </td>
            <td>
                :
                <asp:TextBox ID="jbTxt" runat="server" AutoPostBack="True" BackColor="Yellow" OnTextChanged="jbTxt_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 16px">
            </td>
            <td style="height: 16px" align="right">
                <asp:Label ID="jobLbl" runat="server"></asp:Label>&nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2" align="right">
                <p>
                    &nbsp;<asp:Button ID="PopulateBtn" runat="server" Text="Populate" Enabled="False"
                        CssClass="detailbutton" OnClick="PopulateBtn_Click"></asp:Button>&nbsp;<br>
                    <br>
                </p>
            </td>
        </tr>
    </table>
    &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
    </form>
</body>
</html>
