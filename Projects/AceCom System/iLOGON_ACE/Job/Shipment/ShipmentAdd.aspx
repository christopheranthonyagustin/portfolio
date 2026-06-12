<%@ Page Language="c#" CodeBehind="ShipmentAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.Shipment.ShipmentAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Declaration Add</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
   <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    </telerik:RadScriptBlock>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadMenu ID="RadMenu1" runat="server" ExpandAnimation-Type="None" ClickToOpen="true">
    </telerik:RadMenu>
    <br>
    <br>
    <span class="pagetitle">
        <br />
        <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add" 
                    OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
             <%--<telerik:RadButton ID="AddBtn" runat="server" Text="  Add  " CssClass="detailButton" Skin="WebBlue"
        OnClientClicked="DisableSubmitBtn" UseSubmitBehavior="false" OnClick="AddBtn_Click"></telerik:RadButton>--%>
        <br>
    </span>
    <br>
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Transport" Value="100" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Party" Value="150" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
        <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
            <br />
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="TransportRadPageView">
            <br />
            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="PartyRadPageView">
            <br />
            <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailbutton"
        OnClick="UpdateBtn_Click"></asp:Button>&nbsp;
    <asp:Button ID="AddDetailBtn" runat="server" Text="Add Detail" Visible="False" CssClass="detailbutton"
        OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;
    <asp:Button ID="CopyBtn" runat="server" Text="Copy" Visible="False" CssClass="detailbutton"
        OnClick="CopyBtn_Click" />
    <asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:"
        DisplayMode="BulletList" EnableClientScript="true" runat="server" ID="valSummary"
        CssClass="RedText" />
    </form>
</body>
</html>
