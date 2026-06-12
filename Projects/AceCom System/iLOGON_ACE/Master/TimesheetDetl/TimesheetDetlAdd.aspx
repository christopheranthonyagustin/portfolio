<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="TimesheetDetlAdd.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.TimesheetDetl.TimesheetDetlAdd" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TimeSheetRegister</title>
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
        <br />
        &nbsp<telerik:RadButton ID="AddBtn" runat="server" CssClass="detailButton" Text="   Add   "
            OnClick="AddBtn_Click"></telerik:RadButton><br>
        <br />
        <%--<table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td>
                    <input id="tab1" style="cursor: pointer" class="TabTitle" onclick='clickRow(1, "table1");'
                        value="Main" runat="server">&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr style="display: none">
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>--%>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
                <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </telerik:RadPageView>
        </telerik:RadMultiPage>
        &nbsp;<br>
        <br>
        <iframe id="pumpDetlPackFrame" runat="server" style="width: 95%; height: 45%" marginheight="0" frameborder="0" marginwidth="0" visible="false"></iframe>
    </form>
</body>
</html>
