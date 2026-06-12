<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderConfirmCopy.aspx.cs" Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderConfirmCopy" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Confirm Copy</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
    <meta name="vs_defaultClientScript" content="JavaScript"/>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"/>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css"/>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <meta http-equiv="Pragma" content="no-cache"/>
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
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="MsgLbl" runat="server" />
               
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;&nbsp;&nbsp;&nbsp;
               <asp:Button ID="ASPCancelBtn" CssClass="white" runat="server" OnClick="ASPCancelBtn_Click" Text="Cancel"  OnClientClick="disableBtn(this.id,true)" />                
                &nbsp;
                  <asp:Button ID="ASPOkayBtn" CssClass="white" runat="server" OnClick="ASPOkayBtn_Click" Text="Okay" OnClientClick="disableBtn(this.id,true)"  />                
                 <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>