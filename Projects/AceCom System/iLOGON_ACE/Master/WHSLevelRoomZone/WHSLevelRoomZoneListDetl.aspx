<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WHSLevelRoomZoneListDetl.aspx.cs" Inherits="iWMS.Web.Master.WHSLevelRoomZone.WHSLevelRoomZoneListDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>WHSLevelRoomZoneListDetl</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table cellspacing="0" cellpadding="0" width="60%" border="0">
            <tr>
                <td align="left">
                    <br />
                    <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iform id="formCtl" runat="server"></iWMS:iform>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
