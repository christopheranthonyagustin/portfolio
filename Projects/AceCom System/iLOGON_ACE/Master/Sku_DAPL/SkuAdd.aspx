<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="SkuAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Sku_DAPL.SkuAdd" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
     <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    &nbsp<asp:Button ID="AddBtn" runat="server" CssClass="detailButton" Text="   Add   "
        OnClick="AddBtn_Click"></asp:Button><br>
    <br />
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td>
                <input id="tab1" style="cursor: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
                    value="Main Info" runat="server">
                <input id="tab2" style="cursor: pointer" class="TabTitle" onclick='clickRow(2, "table1");'
                    value="Attributes" runat="server">
                <input id="tab3" style="cursor: pointer" class="TabTitle" onclick='clickRow(3, "table1");'
                    value="Ordering Info" runat="server">
                <input id="tab4" style="cursor: pointer" class="TabTitle" onclick='clickRow(4, "table1");'
                    value="User Defined" runat="server">
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr style="display: none">
            <td>
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr style="display: none">
            <td>
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr style="display: none">
            <td>
                <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    <asp:Button ID="UpdateBtn" runat="server" CssClass="detailButton" Text="Update" Visible="False"
        OnClick="UpdateBtn_Click"></asp:Button>&nbsp;
    <asp:Button Style="z-index: 0" ID="AddDetailBtn" runat="server" CssClass="detailButton"
        Text="+ More Functions" Visible="False" OnClick="AddDetailBtn_Click"></asp:Button><br>
    <br>
    <iframe id="skuPackFrame" style="width: 95%; height: 45%" marginheight="0" frameborder="no"
        marginwidth="0" runat="server" visible="false"></iframe>
    </form>
</body>
</html>
