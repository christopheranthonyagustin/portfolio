<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Page Language="c#" CodeBehind="PumpDetlAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.PumpDetl.PumpDetlAdd" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PumpDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />

                <asp:Button ID="AddBtn" CssClass="white" runat="server" OnClick="AddBtn_Click" Visible="true"
                    Text="Add" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" ToolTip="Add" />
                <br>
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>

                &nbsp;<br>
                <br>
                <iframe id="pumpDetlPackFrame" style="width: 95%; height: 45%" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server" visible="false"></iframe>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
