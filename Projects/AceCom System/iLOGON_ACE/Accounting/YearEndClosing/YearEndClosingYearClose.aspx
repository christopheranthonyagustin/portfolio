<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YearEndClosingYearClose.aspx.cs" Inherits="iWMS.Web.Accounting.YearEndClosing.YearEndClosingYearClose" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Close Period @ Year-End Closing</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self">
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
        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <ContentTemplate>
                <table cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td style="width: 5px"></td>
                        <td>
                            <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 5px">
                    </tr>
                    <tr>
                        <td style="width: 5px"></td>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            &nbsp;<asp:Button ID="SubmitBtn" CssClass="white" runat="server" OnClick="CloseYearBtn_Click" Text="Close Year"
                                OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>