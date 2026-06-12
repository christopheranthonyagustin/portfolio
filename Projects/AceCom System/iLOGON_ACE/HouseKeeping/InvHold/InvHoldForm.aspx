<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="InvHoldForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.InvHold.InvHoldForm" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>InvHold</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/row.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Item" Value="100" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Log" Value="300" runat="server">
            </telerik:RadTab>
             <telerik:RadTab Text="Attc" Value="300" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <br />&nbsp;
                <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" ID="HeaderRadPageView" Height="1000px">
            <table id="table1" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
                <tr>
                    <td><br />
                        &nbsp;<asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="True" UseSubmitBehavior="false" CssClass="white" OnClick="UpdateBtn_Click"></asp:Button>&nbsp;
                        <br />
                        <br />
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="DetailRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView" />
    </telerik:RadMultiPage>
    </form>
</body>
</html>
