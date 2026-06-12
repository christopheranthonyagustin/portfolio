<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookPV2PostConsolidatedAp.aspx.cs" Inherits="iWMS.Web.Job.CashBookPV2.CashBookPV2PostConsolidatedAp" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post Consolidated(AP) @ Payment Register V2</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script type="text/javascript" src="../../js/CastleBusyBox.js" language="javascript"></script>
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
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="SubtotalLbl" runat="server" Text="SubTotal amount" />
                </td>
                <td><asp:Label runat="server" Text=":" /></td>
                <td>
                    <asp:Label ID="SubtotalValue" runat="server" />
                   
                </td>
                
            </tr>
              <tr><td></td></tr>
            <tr>
                <td>
                    <asp:Label ID="GSTLbl" runat="server" Text="GST" />
                </td>
                <td><asp:Label runat="server" Text=":" /></td>
                <td>
                    <asp:Label ID="GSTValue" runat="server" />
                </td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <td>
                    <asp:Label ID="GrandTotalLbl" runat="server" Text="GrandTotal amount" />
                </td>
                <td><asp:Label runat="server" Text=":" /></td>
                <td>
                    <asp:Label ID="GrandTotalValue" runat="server" />
                </td>
            </tr>
        </table>
        <br/><br/>
        <asp:Button ID="ConfirmBtn" runat="server" OnClick="ConfirmBtn_Click"
            Text="Confirm" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
    </form>
</body>
</html>
