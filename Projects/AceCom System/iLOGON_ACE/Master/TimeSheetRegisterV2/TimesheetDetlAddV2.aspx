<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="TimesheetDetlAddV2.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.TimeSheetRegisterV2.TimesheetDetlAddV2" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

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
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server" onkeydown="return (event.keyCode!=13);">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table>
            <td runat="server" id="txttd" visible="false">
                <asp:TextBox ID="txtTicket" runat="server" OnTextChanged="txtTicket_TextChanged" Width="400px" AutoPostBack="true" Height="30px"></asp:TextBox>
            </td>
            <td>
            <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click"
                Text="Add" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                &nbsp;
            <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click"
                Text="Cancel" CausesValidation="false" />
            </td>
        </table>
        <br>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
        &nbsp;<br>
        <br>
        <iframe id="pumpDetlPackFrame" style="width: 95%; height: 45%" marginheight="0" frameborder="no"
            marginwidth="0" runat="server" visible="false"></iframe>
    </form>
</body>
</html>
