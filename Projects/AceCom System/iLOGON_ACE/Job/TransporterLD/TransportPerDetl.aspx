<%@ Page Language="c#" CodeBehind="TransportPerDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TransporterLD.TransportPerDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportManpowerDetl</title>
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
            <td style="height: 20px">
                </asp:label>
                <br />
                <asp:Button Style="z-index: 0" ID="UpdateBtn" runat="server" CssClass="detailButton"
                    Visible="False" Text="Update" OnClick="UpdateBtn_Click"></asp:Button>
                <asp:Button Style="z-index: 0" ID="SaveBtn" runat="server" CssClass="detailButton"
                    Visible="False" Text="Save" OnClick="SaveBtn_Click"></asp:Button>
            </td>
            <td style="height: 20px" align="right">
                &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
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
