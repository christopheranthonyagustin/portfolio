<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="InvoiceForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.Invoice.InvoiceForm" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceForm</title>
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
    <table id="table1" width="100%" border="0" runat="server" cellspacing="3" cellpadding="3">
        <tr>
            <td>
                &nbsp;
                <input id="tab1" class="TabTitle" value="Main" style="width: 50px; cursor: pointer"
                    onclick='clickRow(1, "table1");' runat="server">
                <input id="tab2" class="TabTitle" value="STR" style="width: 40px; cursor: pointer"
                    onclick='clickRow(2, "table1");' runat="server">
                <input id="tab3" class="TabTitle" value="HDL" style="width: 40px; cursor: pointer"
                    onclick='clickRow(3, "table1");' runat="server">
                <input id="tab4" class="TabTitle" value="Doc" style='width: 40px; cursor: pointer'
                    onclick='clickRow(4, "table1");' runat="server">
                <input id="tab5" class="TabTitle" value="FCL" style="width: 40px; cursor: pointer"
                    onclick='clickRow(5, "table1");' runat="server">
                <input id="tab6" class="TabTitle" value="LCL" style="width: 40px; cursor: pointer"
                    onclick='clickRow(6, "table1");' runat="server">
                <input id="tab7" class="TabTitle" value="Fin" style="width: 40px; cursor: pointer"
                    onclick='clickRow(7, "table1");' runat="server">
                <input id="tab8" class="TabTitle" value="Oth" style="width: 40px; cursor: pointer"
                    onclick='clickRow(8, "table1");' runat="server">
                <input id="tab9" class="TabTitle" value="Sum" style="width: 40px; cursor: pointer"
                    onclick='clickRow(9, "table1");' runat="server">
            </td>
            <td align="right">
                &nbsp;
                <asp:Button ID="BackButton" CausesValidation="False" runat="server" CssClass="detailButton"
                    Visible="True" Text="< Search Results" Width="140px" OnClick="BackButton_Click">
                </asp:Button>&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" style="border-top: #c0c0c0 1px solid">
                <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                &nbsp;<asp:Button Style="z-index: 0" ID="UpdateBtn" runat="server" Text="Update"
                    Visible="False" CssClass="detailButton" OnClick="UpdateBtn_Click"></asp:Button><br>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr style="display: none">
            <td height="480" colspan="2" style="border-top: #c0c0c0 1px solid">
                <iframe style="width: 100%; height: 100%" marginheight="0" frameborder="no" marginwidth="0"
                    id="strFrame" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td height="480" colspan="2" style="border-top: #c0c0c0 1px solid">
                <iframe style="width: 100%; height: 100%" marginheight="0" frameborder="no" marginwidth="0"
                    id="hdlFrame" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td height="480" colspan="2" style="border-top: #c0c0c0 1px solid">
                <iframe style="width: 100%; height: 100%" marginheight="0" frameborder="no" marginwidth="0"
                    id="docFrame" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td height="480" colspan="2" style="border-top: #c0c0c0 1px solid">
                <iframe style="width: 100%; height: 100%" marginheight="0" frameborder="no" marginwidth="0"
                    id="fclFrame" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td height="480" colspan="2" style="border-top: #c0c0c0 1px solid">
                <iframe style="width: 100%; height: 100%" marginheight="0" frameborder="no" marginwidth="0"
                    id="lclFrame" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td height="480" colspan="2" style="border-top: #c0c0c0 1px solid">
                <iframe style="width: 100%; height: 100%" marginheight="0" frameborder="no" marginwidth="0"
                    id="finFrame" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td height="480" colspan="2" style="border-top: #c0c0c0 1px solid">
                <iframe style="width: 100%; height: 100%" marginheight="0" frameborder="no" marginwidth="0"
                    id="othFrame" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td height="480" colspan="2" style="border-top: #c0c0c0 1px solid">
                <iframe style="width: 100%; height: 100%" marginheight="0" frameborder="no" marginwidth="0"
                    id="sumFrame" runat="server"></iframe>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:"
        DisplayMode="BulletList" EnableClientScript="true" runat="server" ID="valSummary"
        CssClass="RedText" />
    </form>
</body>
</html>
