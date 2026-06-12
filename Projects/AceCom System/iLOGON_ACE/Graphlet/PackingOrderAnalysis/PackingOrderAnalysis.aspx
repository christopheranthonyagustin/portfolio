<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackingOrderAnalysis.aspx.cs" Inherits="iWMS.Web.Graphlet.PackingOrderAnalysis.PackingOrderAnalysis" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>APAnalysis</title>
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Format" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Criteria" Value="50" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <br />
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <table border="0" style="border-spacing: 0px;">
            <tr>
                <td>
                    <br />
                    &nbsp;
                             <asp:Button ID="CompileBtn" runat="server" Text="Run" CssClass="white" CausesValidation="false" ToolTip="Run"
                                 OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    &nbsp;
                <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>

        <asp:Panel ID="Format17Panel" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                <tr id="trformCtl" runat="server">
                    <td>
                        <iWMS:iForm ID="formCtl17" runat="server"></iWMS:iForm>
                    </td>
                     
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td class="style1">&nbsp;<asp:Label ID="Label5" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                        <br />
                        &nbsp;<asp:Label ID="Label7" Text="1. If there are more than [ " Font-Size="15px" runat="server"></asp:Label>
                        <asp:Label ID="MaxRecordLbl" Font-Size="15px" runat="server"></asp:Label>
                        &nbsp;<asp:Label ID="Label12" Text="] rows in your query, the results will be automatically exported to Excel " Font-Size="15px" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
