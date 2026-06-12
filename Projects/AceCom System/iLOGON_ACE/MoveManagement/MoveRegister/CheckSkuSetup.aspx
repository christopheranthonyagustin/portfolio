<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckSkuSetup.aspx.cs" Inherits="iWMS.Web.MoveManagement.MoveRegister.CheckSkuSetup" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Check Sku Setup</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
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
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }

        .StatusBackground {
            background-color: black;
            opacity: 0.001;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <br />
        <br />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td width="80%" align="center">
                    <asp:Label ID="ReasonLbl" runat="server">Job Number</asp:Label>
                    &nbsp;:
                &nbsp;<asp:Label ID="JobNumberLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                 <td width="80%">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="SiteLbl" runat="server">Site</asp:Label> <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;               
                    <telerik:RadDropDownList ID="SiteDDL" runat="server" CausesValidation="false"
                        DataTextField="descr" DataValueField="code" Enabled="True" Width="155px" Skin="Sunset" >
                    </telerik:RadDropDownList>                   
                </td>
            </tr>
            <tr>
                <td width="80%" align="center">
                    <br />
                    <br />
                    <asp:Button ID="CancelBtn0" runat="server" CssClass="white" OnClick="CancelBtn_Click" Text="Cancel" />
                    &nbsp;
                    <asp:Button ID="OkayBtn" runat="server" CssClass="white" OnClick="OkayBtn_Click" Text="OK" 
                        UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)"/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
