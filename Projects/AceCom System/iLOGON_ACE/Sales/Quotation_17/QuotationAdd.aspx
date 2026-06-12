<%@ Page Language="c#" CodeBehind="QuotationAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Sales.Quotation_17.QuotationAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>QuotationAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
      <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    </telerik:RadScriptBlock>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        &nbsp;<%--<telerik:RadButton ID="AddBtn" runat="server" Text="  Add  " CssClass="detailbutton" Skin="WebBlue"
        OnClick="AddBtn_Click" OnClientClicked="DisableSubmitBtn" UseSubmitBehavior="false"></telerik:RadButton>--%>
        <%--<asp:ImageButton ID="AddBtn" runat="server" ImageUrl="../../Image/AddButton.png"
            BackColor="Transparent" BorderWidth="0" Style="z-index: 0"
            ImageAlign="AbsMiddle" OnClientClicked="DisableSubmitBtn" UseSubmitBehavior="false" OnClick="AddBtn_Click" />--%>
        <asp:Button ID="AddsBtn" runat="server" Text="Add" OnClick="AddBtn_Click"
            OnClientClick="disableBtn(this.id,true);DisableSubmitBtn;" CssClass="white" ToolTip="Update" UseSubmitBehavior="false" />
        <br />
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <iWMS:iForm ID="formCtl" runat="server" />
                <iWMS:iForm ID="formCtl2" runat="server" />
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <%--<telerik:RadButton ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailbutton"
            OnClick="UpdateBtn_Click">
        </telerik:RadButton>--%>
                
        &nbsp;
    <asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:"
        DisplayMode="BulletList" EnableClientScript="true" runat="server" ID="valSummary"
        CssClass="RedText" />
    </form>
</body>
</html>
