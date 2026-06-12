<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobTripRegisterV4ChangeSchedule.aspx.cs" Inherits="iWMS.Web.Job.JobTripRegisterV4.JobTripRegisterV4ChangeSchedule" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JobTripRegisterV4ChangeSchedule</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
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
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        <br />
                        <telerik:RadButton ID="ChangeBtn" runat="server" Text="ProceedToChange" Visible="true" CssClass="detailButton"
                            OnClick="ChangeBtn_Click">
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>
            &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
                CssClass="errorLabel"></asp:Label>
        </div>
    </form>
</body>
</html>
