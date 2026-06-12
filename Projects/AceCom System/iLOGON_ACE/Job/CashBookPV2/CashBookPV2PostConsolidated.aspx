<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookPV2PostConsolidated.aspx.cs" Inherits="iWMS.Web.Job.CashBookPV2.CashBookPV2PostConsolidated" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post Consolidated @ Payment Register V2</title>
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
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <br />
        <br />
        <asp:Label ID="TotalAmountLbl" runat="server"/><br />
        <br />
        <br />
        <asp:Button ID="ConfirmBtn" runat="server" OnClick="ConfirmBtn_Click"
            Text="Confirm" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
    </form>
</body>
</html>
