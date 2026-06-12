<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="NewOrderForm.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.NewOrderReg.NewOrderForm" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>OrderRegisterForm</title>
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
                <input id="tab1" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
                    value="Main" runat="server" readonly="readonly">
                <input id="tab2" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(2, "table1");'
                    value="Party" runat="server" readonly="readonly">
                <input id="tab3" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(3, "table1");'
                    value="Equipment" runat="server" readonly="readonly">
                <input id="tab4" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(4, "table1");'
                    value="Route" runat="server" readonly="readonly">
                <input id="tab5" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(5, "table1");'
                    value="Charge" runat="server" readonly="readonly">
                <input id="tab6" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(6, "table1");'
                    value="Payable" runat="server" readonly="readonly">
                <input id="tab7" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(7, "table1");'
                    value="Attc" runat="server" readonly="readonly">
                <input id="tab8" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(8, "table1");'
                    value="Log" runat="server" readonly="readonly">
                <%--
                <input id="tab7" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(7, "table1");'
                    value="Attc" runat="server" readonly="readonly">
                <input id="tab8" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(8, "table1");'
                    value="Task" runat="server" readonly="readonly">
                <input id="tab9" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(9, "table1");'
                    value="Charge" runat="server" readonly="readonly">
                <input id="tab10" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(10, "table1");'
                    value="Cost" runat="server" readonly="readonly">
                <input id="tab11" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(11, "table1");'
                    value="Resource" runat="server" readonly="readonly">
                <input id="tab12" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(13, "table1");'
                    value="TimeSheet" runat="server" readonly="readonly">
                <input id="tab13" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(14, "table1");'
                    value="Payable" runat="server" readonly="readonly">
                <input id="tab14" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(15, "table1");'
                    value="Log" runat="server" readonly="readonly">
                <input id="tab15" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(16, "table1");'
                    value="Upload" runat="server" readonly="readonly">--%>
                <br />
                <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
            <td width="20%" align="right">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>&nbsp;
                &nbsp;
                <asp:Button ID="BackButton" runat="server" CssClass="detailButton" Visible="false"
                    Text="Search Results" Width="120px" CausesValidation="False" OnClick="BackButton_Click">
                </asp:Button>&nbsp;
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" colspan="2">
                <asp:Button Style="z-index: 0" ID="UpdateFormBtn" runat="server" CssClass="detailButton"
                    Visible="False" Text="Update" OnClick="UpdateBtn_Click" OnClientClick="if (!Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Processing...';"
                    UseSubmitBehavior="False"></asp:Button><br />
                <br>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" colspan="2">
                <asp:Button Style="z-index: 0" ID="UpdatePartyBtn" runat="server" CssClass="detailButton"
                    Visible="False" Text="Update" OnClick="UpdateBtn_Click" OnClientClick="if (!Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Processing...';"
                    UseSubmitBehavior="False"></asp:Button><br>
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="jobCtnrFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" height="580" colspan="2">
                <iframe style="width: 100%; height: 100%" id="jobCtnrTripFrame" marginheight="0"
                    frameborder="no" marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" height="680" colspan="2">
                <iframe style="width: 100%; height: 100%" id="chargeFrame2" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="PayableFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="jobImageFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="logFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" EnableClientScript="true"
        DisplayMode="BulletList" HeaderText="The following field(s) need to be entered correctly:">
    </asp:ValidationSummary>
    </form>
</body>
</html>
