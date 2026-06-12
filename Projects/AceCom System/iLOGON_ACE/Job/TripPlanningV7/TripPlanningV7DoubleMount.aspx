<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV7DoubleMount.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV7.TripPlanningV7DoubleMount" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE>
<html>
<head id="Head1" runat="server">
    <title>TripPlanningV7DoubleMount</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <base target="_self" />
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
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td style="width: 5px"></td>
                <td>
                    <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Trip Planning V5 Double Mount</asp:Label>
                </td>
            </tr>
            <tr style="height: 5px">
            </tr>
            <tr>
                <td style="width: 5px"></td>
                <td>&nbsp;<asp:Button ID="SubmitBtn" CssClass="white" runat="server" OnClick="SubmitBtn_Click" Text="Submit"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                    <asp:Button ID="CancelBtn" CssClass="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <br /><br />
                    <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
