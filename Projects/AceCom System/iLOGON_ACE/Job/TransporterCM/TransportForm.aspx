<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="TransportForm.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TransporterCM.TransportForm" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportForm</title>
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
    <table id="table1" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
        <tr>
            <td>
                <input id="tab1" style="width: 70px; cursor: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
                    value="Header" runat="server">&nbsp;
                <input id="tab2" style="width: 70px; cursor: pointer" class="TabTitle" onclick='clickRow(2, "table1");'
                    value="Party" runat="server">
                <input id="tab3" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(3, "table1");'
                    value="Equipment" runat="server">
                <input id="tab4" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(4, "table1");'
                    value="Trip" runat="server">
                <input id="tab5" style="width: 70px; cursor: pointer" class="TabTitle" onclick='clickRow(5, "table1");'
                    value="Attc" runat="server">
                <input id="tab6" style="width: 70px; cursor: pointer" class="TabTitle" onclick='clickRow(6, "table1");'
                    value="Task" runat="server">
                <input id="tab7" style="width: 70px; cursor: pointer" class="TabTitle" onclick='clickRow(7, "table1");'
                    value="Charge" runat="server">
                <input id="tab8" style="width: 70px; cursor: pointer" class="TabTitle" onclick='clickRow(8, "table1");'
                    value="Charge2" runat="server">
                <input id="tab9" style="width: 70px; cursor: pointer" class="TabTitle" onclick='clickRow(9, "table1");'
                    value="Cost" runat="server">
            </td>
            <td width="25%" align="right">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>&nbsp;
                &nbsp;
                <asp:Button ID="BackButton" runat="server" CssClass="detailButton" Visible="True"
                    Text="Search Results" Width="120px" CausesValidation="False" OnClick="BackButton_Click">
                </asp:Button>&nbsp;
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" colspan="2">
                <asp:Button Style="z-index: 0" ID="UpdateFormBtn" runat="server" CssClass="detailButton"
                    Visible="False" Text="Update" OnClick="UpdateBtn_Click"></asp:Button>&nbsp;<asp:Label
                        ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label><br />
                <br>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" colspan="2">
                <asp:Button Style="z-index: 0" ID="UpdatePartyBtn" runat="server" CssClass="detailButton"
                    Visible="False" Text="Update" OnClick="UpdateBtn_Click"></asp:Button>&nbsp;<asp:Label
                        ID="Id3Lbl" runat="server" CssClass="pagetitle"></asp:Label><br>
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="jobCtnrFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="jobCtnrTripFrame" marginheight="0"
                    frameborder="no" marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="jobImageFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="jobTaskFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="chargeFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="chargeFrame2" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="costFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" colspan="2">
                <p>
                    <asp:Label ID="Id4Lbl" runat="server" CssClass="pagetitle"></asp:Label>&nbsp;<br>
                    <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                </p>
                <p>
                    <asp:Button Style="z-index: 0" ID="RefreshButton" runat="server" CssClass="detailButton"
                        Text="Refresh" Visible="True" CausesValidation="False" Width="120px" OnClick="RefreshButton_Click">
                    </asp:Button></p>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" EnableClientScript="true"
        DisplayMode="BulletList" HeaderText="The following field(s) need to be entered correctly:">
    </asp:ValidationSummary>
    </form>
</body>
</html>
