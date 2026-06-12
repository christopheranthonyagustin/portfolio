<%@ Page Language="c#" CodeBehind="PersonnelDetail.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.PersonnelPlanning.PersonnelDetail" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PersonnelDetail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td style="height: 20px">
                <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                <br />
                <asp:Button Style="z-index: 0" ID="UpdateBtn" runat="server" CssClass="detailButton"
                    Visible="True" Text="Update" OnClick="UpdateBtn_Click"></asp:Button>
            </td>
            <td>
                <asp:Button ID="OpenBtn" runat="server" Text="Open" Visible="true" CssClass="detailButton"
                    OnClick="OpenBtn_Click" Width="100px"></asp:Button>
                &nbsp;<asp:Button ID="AssignBtn" runat="server" Text="Assign" Visible="true" CssClass="detailButton"
                    OnClick="AssignBtn_Click" Width="100px"></asp:Button>
                &nbsp;<asp:Button ID="CompletedBtn" runat="server" Text="Completed" Visible="true"
                    CssClass="detailButton" OnClick="CompletedBtn_Click" Width="100px"></asp:Button>
                &nbsp;<asp:Button ID="VoidBtn" runat="server" Text="Void" Visible="true" CssClass="detailButton"
                    OnClick="VoidBtn_Click" Width="100px"></asp:Button>
                &nbsp;<asp:Button ID="CancelledBtn" runat="server" Text="Cancelled" Visible="true"
                    CssClass="detailButton" OnClick="CancelledBtn_Click" Width="100px"></asp:Button>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" HeaderText="The following field(s) need to be entered correctly:"
        DisplayMode="BulletList" EnableClientScript="true"></asp:ValidationSummary>
    </form>
</body>
</html>
