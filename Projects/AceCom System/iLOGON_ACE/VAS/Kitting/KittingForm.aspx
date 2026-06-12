<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="KittingForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.VAS.Kitting.KittingForm" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>KittingForm</title>
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
    <table id="table1" runat="server" cellspacing="0" cellpadding="0" width="60%" border="0">
        <tr>
            <td>
                <input id="tab1" class="TabTitle" value="Main" onclick='clickRow(1, "table1");' style="width: 100px;
                    cursor: pointer" runat="server" readonly="true" />
                <input id="tab2" class="TabTitle" value="Documents" onclick='clickRow(2, "table1");'
                    style="width: 150px; cursor: pointer" runat="server" readonly="true" />
                <br />
                <br />
                <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" OnClick="UpdateBtn_Click"
                    CssClass="detailButton"></asp:Button>
                &nbsp;
                <asp:Button ID="FinaliseBtn" runat="server" Text="Finalized" Visible="False" OnClick="KTHead_BuildDoc"
                    CssClass="detailButton"></asp:Button>
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="docFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
