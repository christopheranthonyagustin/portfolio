<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoutePlanningWorkbenchV2Manifest.aspx.cs" Inherits="iWMS.Web.Job.RoutePlanningWorkbenchV2.RoutePlanningWorkbenchV2Manifest" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html>

<html>
<head runat="server">
    <title>RoutePlanningWorkbenchV2Manifest</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td style="width:5px">
            </td>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Manifest</asp:Label>
            </td>
        </tr>
        <tr style="height:5px">

        </tr>
        <tr>
            <td style="width:5px">
            </td>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
                &nbsp;<asp:Button ID="PrintBtn" CssClass="blue" runat="server" OnClick="PrintBtn_Click" Text="Print"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
