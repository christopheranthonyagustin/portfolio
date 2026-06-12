<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV7Detour.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV7.TripPlanningV7Detour" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TripDetour</title>
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
        <div>
            <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                <tr>
                    <td>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="CurrentTripLbl" runat="server" CssClass="pagetitle">Current Trip</asp:Label>
                                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="DetourTripLbl" runat="server" CssClass="pagetitle">Detour Trip</asp:Label>
                                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>

                        <br />
                        &nbsp;&nbsp;<asp:Button ID="DetourBtn" runat="server" Text="Detour" class="white" OnClick="DetourBtn_Click"
                            OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" CausesValidation="false" />
                    </td>
                </tr>
            </table>
            &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
                CssClass="errorLabel"></asp:Label>
        </div>
    </form>
</body>
</html>
