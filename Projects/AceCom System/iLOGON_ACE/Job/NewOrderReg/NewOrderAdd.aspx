<%@ Page Language="c#" CodeBehind="NewOrderAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.NewOrderReg.NewOrderAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>NewOrderAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/row.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <asp:Button ID="AddBtn" runat="server" Text="  Add  " CssClass="detailbutton" OnClick="AddBtn_Click"
        OnClientClick="if (!Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Processing...';"
        UseSubmitBehavior="False"></asp:Button>
    <br />
    <br />
    <table id="table1" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
        <tbody>
            <tr>
                <td style="height: 20px">
                    <input id="tab1" style="cursor: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
                        value="Header" runat="server" readonly="true" />&nbsp;
                    <input id="tab2" style="cursor: pointer" class="TabTitle" onclick='clickRow(2, "table1");'
                        value="Party" runat="server" readonly="true" />
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl3" runat="server" />
                </td>
            </tr>
        </tbody>
    </table>
    &nbsp;<asp:Button ID="CopyBtn" runat="server" Text="Copy" Visible="False" CssClass="detailbutton"
        OnClick="CopyBtn_Click" />
    <asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:"
        DisplayMode="BulletList" EnableClientScript="true" runat="server" ID="valSummary"
        CssClass="RedText" />
    </form>
</body>
</html>
