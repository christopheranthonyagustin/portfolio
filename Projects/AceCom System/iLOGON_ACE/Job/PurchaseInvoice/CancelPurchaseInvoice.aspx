<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelPurchaseInvoice.aspx.cs" Inherits="iWMS.Web.Job.PurchaseInvoice.CancelPurchaseInvoice" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Cancel Purchase Invoice</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>

<script type="text/javascript">
    function BusyBox(sender, args) {
        busyBox.Show();
    }
</script>

 <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>

<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Cancel Purchase Invoice</asp:Label>
            </td>
        </tr>
    </table>
    <asp:Panel ID="ScanOutPanel" runat="server">
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="MsgLbl" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="40%">
                    <asp:Label ID="ReasonLbl" runat="server">Reasons</asp:Label>
                </td>
                <td width="60%">
                    <%--<asp:TextBox ID="rejectRemarks" BackColor="Yellow" runat="server" Width="155px"></asp:TextBox>--%>
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
                        <telerik:RadTextBox RenderMode="Lightweight" ID="cancelReasons" BackColor="Yellow"
                            runat="server" Width="155px">
                        </telerik:RadTextBox>
                    </telerik:RadAjaxPanel>
                </td>
            </tr>
            <tr>
                <td width="40%">
                    &nbsp;
                </td>
                <td width="60%" align="left">
                    <%--<asp:Button ID="PostBtn" runat="server" Text="Post" OnClientClick="return busyBox.Show();"
                        OnClick="PostBtn_Click"></asp:Button>--%>
                    <telerik:RadButton ID="PostBtn" runat="server" Text="Confirm" 
                    OnClientClick="BusyBox" OnClick="PostBtn_Click">
                    </telerik:RadButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>
    
    </form>
</body>
</html>

