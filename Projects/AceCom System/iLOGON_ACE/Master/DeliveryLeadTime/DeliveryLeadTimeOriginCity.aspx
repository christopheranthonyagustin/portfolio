<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryLeadTimeOriginCity.aspx.cs" Inherits="iWMS.Web.Master.DeliveryLeadTime.DeliveryLeadTimeOriginCity" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head runat="server">
    <title>DeliveryLeadTimeOriginCity</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <base target="_self" />

    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
    <style type="text/css">
        .style1 {
            padding-left: 90px;
        }

        .style2 {
            padding-left: 220px;
        }
    </style>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td style="padding-left: 25%">
                    <iWMS:iForm ID="formCtl" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="padding-left: 33%">
                    <asp:Button ID="SMSBtn" runat="server" CssClass="white" OnClick="AddBtn_Click"
                        Text="Add" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Width="78px" Height="30px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

