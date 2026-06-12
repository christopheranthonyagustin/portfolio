<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewOrderTripRouteEdit.aspx.cs"
    Inherits="iWMS.Web.Job.NewOrderReg.NewOrderTripRouteEdit" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>NewOrderCtnrTrip</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />

</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="table1" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="true" CssClass="detailButton"
                    OnClick="UpdateBtn_Click"></asp:Button>
                <asp:Button ID="OpenBtn" runat="server" Text="Open" Visible="true" CssClass="detailButton"
                    OnClick="OpenBtn_Click" Width="100px"></asp:Button>
                &nbsp;<asp:Button ID="WIPBtn" runat="server" Text="WIP" Visible="true" CssClass="detailButton"
                    OnClick="WIPBtn_Click" Width="100px"></asp:Button>
                &nbsp;<asp:Button ID="CompletedBtn" runat="server" Text="Completed" Visible="true"
                    CssClass="detailButton" OnClick="CompletedBtn_Click" Width="100px"></asp:Button><br />
                &nbsp;<asp:Button ID="VoidBtn" runat="server" Text="Void" Visible="true" CssClass="detailButton"
                    OnClick="VoidBtn_Click" Width="100px"></asp:Button>
                &nbsp;<asp:Button ID="CancelledBtn" runat="server" Text="Cancelled" Visible="true"
                    CssClass="detailButton" OnClick="CancelledBtn_Click" Width="100px"></asp:Button>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
