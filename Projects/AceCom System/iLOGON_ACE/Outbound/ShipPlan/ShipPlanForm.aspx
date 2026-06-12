<%@ Page Language="c#" CodeBehind="ShipPlanForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.ShipPlan.ShipPlanForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ShipPlanForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <%--<table id="table1" width="100%" border="0" runat="server">
        <tr>
            <td>
                &nbsp;
                <input id="tab1" class="TabTitle" value="Header" onclick='clickRow(1, "table1");'
                    style='cursor: pointer' readonly="true" runat="server" />
                <input id="tab2" class="TabTitle" value="Detail" onclick='clickRow(2, "table1");'
                    style='cursor: pointer' runat="server" readonly="true" />
                <input id="tab3" class="TabTitle" value="LoadSummary" onclick='clickRow(3, "table1");'
                    style='cursor: pointer' runat="server" readonly="true" />
                    <br />--%>
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Order" Value="100" runat="server">
                </telerik:RadTab>
                 <telerik:RadTab Text="Cage" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Load Summary" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Collection" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="250" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="SPIdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="500px" ID="HeaderRadPageView">
                <br />
                <%--<td align="right">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />--%>
                &nbsp<asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="white" UseSubmitBehavior="false"  OnClientClick="disableBtn(this.id,true)"
                    OnClick="UpdateBtn_Click"></asp:Button>&nbsp;
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <%--</td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="detailFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="480" colspan="2">
                <iframe style="width: 100%; height: 100%" id="LoadSummaryFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
    </table>--%>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="500px" ID="detailFrameRadPageView">
            </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="900px" ID="CageRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="500px" ID="LoadSummaryFrameRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="500px" ID="CollectionRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="500px" ID="AttcPageRadView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="500px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
