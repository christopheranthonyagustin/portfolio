<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTransportPlanningCopyBooking.aspx.cs" Inherits="iWMS.Web.Job.DailyTransportPlanning.DailyTransportPlanningCopyBooking" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Copy Booking @ Daily Transport Planning</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<script type="text/javascript">
    function GetRadWindow() {
        var oWindow = null; if (window.radWindow)
            oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
    }

    function close() {
        GetRadWindow().close();
    }
</script>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="CopyBtn" runat="server" Text="Copy" OnClick="CopyBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
                    &nbsp;
                 <asp:Button ID="CloseWindow" runat="server" Text="Close Window" OnClick="CloseWindow_Click" UseSubmitBehavior="false"
                     OnClientClick="disableBtn(this.id)" CssClass="LongLabelWhite" CausesValidation="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
