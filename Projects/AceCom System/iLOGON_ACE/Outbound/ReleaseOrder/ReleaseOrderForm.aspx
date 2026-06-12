<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReleaseOrderForm.aspx.cs"
    Inherits="iWMS.Web.Outbound.ReleaseOrder.ReleaseOrderForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReleaseOrderForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />

    <script src="../../js/row.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="table1" width="100%" border="0" runat="server">
        <tr>
            <td>
                &nbsp;
                <input id="tab1" class="TabTitle" value="Main Info" onclick='clickRow(1, "table1");'
                    style='width: 100px; cursor: pointer' runat="server" readonly="true" />
                <input id="tab2" class="TabTitle" value="Order Info" onclick='clickRow(2, "table1");'
                    style='width: 100px; cursor: pointer' runat="server" readonly="true" />
                <input id="tab3" class="TabTitle" value="Party" onclick='clickRow(3, "table1");'
                    style='width: 100px; cursor: pointer' runat="server" readonly="true" />
                <input id="tab4" class="TabTitle" value="Order Details" onclick='clickRow(4, "table1");'
                    style='width: 100px; cursor: pointer' runat="server" readonly="true" />
                <br />
                <br />
                <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                &nbsp;
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailButton"
                    Style="z-index: 0" OnClick="UpdateBtn_Click" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                &nbsp;
                <asp:Button ID="UpdateBtn2" runat="server" Text="Update" Visible="False" CssClass="detailButton"
                    Style="z-index: 0" OnClick="UpdateBtn_Click" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                &nbsp;
                <asp:Button ID="UpdateBtn3" runat="server" Text="Update" Visible="False" CssClass="detailButton"
                    Style="z-index: 0" OnClick="UpdateBtn_Click" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="skuLineFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
