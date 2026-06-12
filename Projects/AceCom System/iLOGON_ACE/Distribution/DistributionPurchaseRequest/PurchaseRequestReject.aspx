<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseRequestReject.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionPurchaseRequest.PurchaseRequestReject" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Reject @ Purchase Request</title>
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
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Purchase Request Reject</asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="MsgLbl" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="40%">
                    <asp:Label ID="ReasonLbl" runat="server">Reason</asp:Label>
                </td>
            </tr>
            <tr>
                <td width="60%">
                    <asp:TextBox ID="ReasonTxt" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="60%" align="left">
                    <asp:Button ID="ConfirmBtn" runat="server" Text="Confirm" CssClass="White" OnClick="RejectBtn_Click"
                        OnClientClick="return confirm('Purchase Request Reject?');" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
