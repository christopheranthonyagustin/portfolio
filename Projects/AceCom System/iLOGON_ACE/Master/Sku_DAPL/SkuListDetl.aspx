<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="SkuListDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Sku_DAPL.SkuListDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuListDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script src="../../js/row.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 1050px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="table1" width="100%" border="0" runat="server">
        <tr>
            <td class="style1">
                &nbsp;
                <input id="tab1" class="TabTitle" value="Main Info" onclick='clickRow(1, "table1");'
                    style='cursor: pointer' runat="server">
                <input id="tab2" class="TabTitle" value="Attributes" onclick='clickRow(2, "table1");'
                    style='cursor: pointer' runat="server">
                <input id="tab3" class="TabTitle" value="Ordering Info" onclick='clickRow(3, "table1");'
                    style='cursor: pointer' runat="server">
                <input id="tab4" class="TabTitle" value="User Defined" onclick='clickRow(4, "table1");'
                    style='cursor: pointer' runat="server">
                <input id="tab5" class="TabTitle" value="SKU Pack" onclick='clickRow(5, "table1");'
                    style='cursor: pointer' runat="server">
                <input id="tab6" class="TabTitle" value="Attc" onclick='clickRow(6, "table1");' style='cursor: pointer'
                    runat="server">
            </td>
            <%--<td align="right">&nbsp						
					    <asp:button id="BackButton" runat="server" CssClass="detailButton" Visible="True" Text="Search Results"
							Width="120px" CausesValidation="False" onclick="BackButton_Click"></asp:button></td>--%>
        </tr>
        <tr>
            <td colspan="2" class="style1">
                <br />
                &nbsp<asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailButton"
                    Style="z-index: 0" OnClick="UpdateBtn_Click"></asp:Button>&nbsp<asp:Label ID="IdLbl"
                        runat="server" CssClass="pagetitle"></asp:Label>
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr style="display: none">
            <td colspan="2" class="style1">
                <br />
                &nbsp<asp:Button ID="UpdateAttributesBtn" runat="server" Text="Update" Visible="False"
                    CssClass="detailButton" Style="z-index: 0" OnClick="UpdateBtn_Click"></asp:Button>&nbsp<asp:Label
                        ID="IdLbl2" runat="server" CssClass="pagetitle"></asp:Label>
                <br />
                <br />
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr style="display: none">
            <td colspan="2" class="style1">
                <br />
                &nbsp<asp:Button ID="UpdateOrderInfoBtn" runat="server" Text="Update" Visible="False"
                    CssClass="detailButton" Style="z-index: 0" OnClick="UpdateBtn_Click"></asp:Button>&nbsp<asp:Label
                        ID="IdLbl3" runat="server" CssClass="pagetitle"></asp:Label>
                <br />
                <br />
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr style="display: none">
            <td colspan="2" class="style1">
                <br />
                &nbsp<asp:Button ID="UpdateUserDefBtn" runat="server" Text="Update" Visible="False"
                    CssClass="detailButton" Style="z-index: 0" OnClick="UpdateBtn_Click"></asp:Button>&nbsp<asp:Label
                        ID="IdLbl4" runat="server" CssClass="pagetitle"></asp:Label>
                <br />
                <br />
                <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2" class="style1">
                <iframe style="width: 100%; height: 100%" id="skuPackFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2" class="style1">
                <iframe style="width: 100%; height: 100%" id="attcFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
