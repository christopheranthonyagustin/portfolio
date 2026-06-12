<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="TransportForm.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TransporterCT.TransportForm" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">

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
                    value="Header" runat="server" readonly="readonly">
                <input id="tab2" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(2, "table1");'
                    value="Equipment" runat="server" readonly="readonly">
                <input id="tab3" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(3, "table1");'
                    value="Trip" runat="server" readonly="readonly">
                <input id="tab4" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(4, "table1");'
                    value="Attc" runat="server" readonly="readonly">
                <input id="tab5" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(5, "table1");'
                    value="Task" runat="server" readonly="readonly">
                <input id="tab6" style="width: 80px; cursor: pointer" class="TabTitle" onclick='clickRow(6, "table1");'    
                    value="Log" runat="server" readonly="readonly">
 
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadMenu ID="RadMenu1" runat="server" ClickToOpen="true" ExpandAnimation-Type="None">
                                <Items>
                                    <telerik:RadMenuItem Text="Print">
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid">
                <asp:Button Style="z-index: 0" ID="UpdateFormBtn" runat="server" CssClass="detailButton"
                    Visible="False" Text="Update" OnClick="UpdateBtn_Click" OnClientClick="if (!Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Processing...';"
                    UseSubmitBehavior="False"></asp:Button><br />
                <br>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <iWMS:iForm ID="formCtl4" runat="server" />
            </td>
        </tr>
     
        <tr>
            <td style="border-top: #c0c0c0 1px solid" height="480">
                <iframe style="width: 100%; height: 100%" id="jobCtnrFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480">
                <iframe style="width: 100%; height: 100%" id="jobCtnrTripFrame" marginheight="0"
                    frameborder="no" marginwidth="0" runat="server"></iframe>
            </td>
        </tr>

        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480">
                <iframe style="width: 100%; height: 100%" id="jobImageFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" height="480">
                <iframe style="width: 100%; height: 100%" id="jobTaskFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>

        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480">
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
