<%@ Page Language="c#" CodeBehind="AccountParmStorage.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.AccountRate.AccountParmStorage" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>AccountParmStorage</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="table1" border="0" width="100%" runat="server">
        <tr>
            <td>
                &nbsp;
                <input id="tab1" style="cursor: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
                    value="Storage Rate Info" runat="server">
                <input id="tab2" style="cursor: pointer" class="TabTitle" onclick='clickRow(2, "table1");'
                    value="Variable Charges" runat="server">
                <input id="tab3" style="cursor: pointer" class="TabTitle" onclick='clickRow(3, "table1");'
                    value="Fixed Charges" runat="server">
            </td>
            <td align="right">
                <asp:Button Style="z-index: 0" ID="AddBtn" runat="server" CssClass="detailButton"
                    Text=" Add " Visible="False" OnClick="AddBtn_Click"></asp:Button><asp:Button Style="z-index: 0"
                        ID="UpdateBtn" runat="server" CssClass="detailButton" Text="Update" Visible="False"
                        OnClick="UpdateBtn_Click"></asp:Button>&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
