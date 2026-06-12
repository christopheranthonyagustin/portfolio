<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VISScheduleInspection.aspx.cs" Inherits="iWMS.Web.Job.VehicleInspectionSchedule.VISScheduleInspection" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Schedule Inspection @ Vehicle Inspection Schedule</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
     <link rel="stylesheet" type="text/css" href="../../css/style.css"/>
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    <meta http-equiv="Pragma" content="no-cache" />
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
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:Label ID="MsgLbl" runat="server" />

                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td align="left">&nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:Button ID="CancelBtn" runat="server" Text=" Close Window " CssClass="LongLabelWhite"  OnClick="CancelBtn_Click"
                     OnClientClick="disableBtn(this.id, false)" CausesValidation="false" UseSubmitBehavior="false"/>
                    &nbsp;
                <asp:Button ID="SubmitBtn" runat="server" Text=" Submit " CssClass="white" Enabled="true" OnClick="SubmitBtn_Click"
                    OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>