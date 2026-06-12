<%@ Page Language="c#" CodeBehind="TransportTask.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TransporterLD.TransportTask" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransporterTask</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td style="height: 20px" align="left">
                <asp:Button Style="z-index: 0" ID="SaveBtn" runat="server" CssClass="detailButton"
                    Visible="False" Text="Save" OnClick="SaveBtn_Click"></asp:Button>
                <asp:Button Style="z-index: 0" ID="UpdateBtn" runat="server" CssClass="detailButton"
                    Visible="False" Text="Update" OnClick="UpdateBtn_Click"></asp:Button>&nbsp;
                <asp:Button Style="z-index: 0" ID="BackButton" runat="server" CssClass="detailButton"
                    Visible="True" Text="All Item(s)" CausesValidation="False" OnClick="BackButton_Click">
                </asp:Button>&nbsp;
            </td>
        </tr>
        <tr>
            <td style="height:10px;">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" HeaderText="The following field(s) need to be entered correctly:"
        DisplayMode="BulletList" EnableClientScript="true"></asp:ValidationSummary>
    </form>
</body>
</html>
