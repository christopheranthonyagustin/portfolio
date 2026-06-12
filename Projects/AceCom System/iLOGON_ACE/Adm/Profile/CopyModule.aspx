<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CopyModule.aspx.cs" Inherits="iWMS.Web.Adm.Profile.CopyModule" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>Copy PROFILExMODULE</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
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
        <div>
            <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td>
                        <asp:Label ID="msgLbl" runat="server" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br /><br />                       
			      CopyFromProfile <br /><br />
                        <telerik:RadDropDownList ID="ProfileList" runat="server"></telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <br />
                        <asp:Button ID="btn" runat="server" CssClass="white" Text="Copy" OnClick="copyBtn_Click" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
