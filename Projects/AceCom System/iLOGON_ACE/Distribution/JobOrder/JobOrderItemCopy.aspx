<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobOrderItemCopy.aspx.cs" Inherits="iWMS.Web.Distribution.JobOrder.JobOrderItemCopy" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Copy @ GoodsReceive</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Style="z-index: 0" ID="errorLbl" runat="server" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="CopyBtn" runat="server" Text=" Copy " CssClass="White" Enabled="False" OnClick="CopyBtn_Click" OnClientClick="return confirm('Confirm Copy job order line?');" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
