<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportCtnrTripAddRemarks.aspx.cs"
    Inherits="iWMS.Web.Job.TransporterCTNR.TransportCtnrTripAddRemarks" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TransportCtnrTripAddRemarks</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body onload="javascript:window.focus();">

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

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td>
                <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                <br />
                <telerik:RadButton ID="UpdateBtn" runat="server" Visible="True" Text="Update" OnClick="UpdateBtn_Click"
                    ButtonType="LinkButton">
                </telerik:RadButton>
                &nbsp;
                <telerik:RadButton ID="DischargeBtn" runat="server" OnClick="DischargeBtn_Click"
                    Text="Discharged" ButtonType="LinkButton">
                </telerik:RadButton>
                <telerik:RadButton ID="EmptiedBtn" runat="server" OnClick="EmptiedBtn_Click" Text="Emptied"
                    ToolTip="Emptied" ButtonType="LinkButton">
                </telerik:RadButton>
                <telerik:RadButton ID="RExportBtn" runat="server" OnClick="RExportBtn_Click" Text="R-Export"
                    ToolTip="R-Export" ButtonType="LinkButton">
                </telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
