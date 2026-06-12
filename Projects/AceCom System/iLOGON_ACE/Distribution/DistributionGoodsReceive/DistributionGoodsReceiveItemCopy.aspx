<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionGoodsReceiveItemCopy.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionGoodsReceive.DistributionGoodsReceiveItemCopy" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Copy @ DistributionGoodsReceiveItem</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="GRItemCopyLbl" runat="server">Copy From Distribution Goods Receive Item</asp:Label>
                    <br />
                    <asp:TextBox ID="GRItemTxt" runat="server" AutoPostBack="True" BackColor="Yellow" OnTextChanged="GRItemTxt_TextChanged" Width="140px" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="noOfTimesLbl" runat="server"> Number of Copies</asp:Label>
                    <br />
                    <%--<asp:DropDownList ID="GRItemDDL" runat="server" Width="140px" />--%>
                    <telerik:RadDropDownList ID="GRCopyItemDDL" runat="server" Skin="WebBlue" Width="140px" DropDownWidth="140px" OnLoad="GRCopyItemDDL_Load"></telerik:RadDropDownList>
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
                    <asp:Button ID="CopyBtn" runat="server" Text=" Copy " CssClass="White" Enabled="False" OnClick="CopyBtn_Click" OnClientClick="return confirm('Confirm Copy Goods Receive Item?');" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
