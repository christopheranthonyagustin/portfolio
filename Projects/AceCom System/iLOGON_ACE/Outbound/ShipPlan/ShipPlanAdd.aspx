<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Page Language="c#" CodeBehind="ShipPlanAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.ShipPlan.ShipPlanAdd" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ShipPlanAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
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
          <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click" 
                  OnClientClick="disableBtn(this.id,true)" ToolTip="Add" UseSubmitBehavior="false" CssClass="white" />

        <br>
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        &nbsp;
              <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" Visible="False"
                  OnClientClick="disableBtn(this.id,true)" ToolTip="Update" UseSubmitBehavior="false" CssClass="white" />&nbsp;
              <asp:Button ID="AddDetailBtn" runat="server" Text="+Detail" OnClick="AddDetailBtn_Click" Visible="False"
                  OnClientClick="disableBtn(this.id,true)" ToolTip="Add Detail" UseSubmitBehavior="false" CssClass="white" />
                </telerik:RadPageView>
            </telerik:RadMultiPage>
    </form>
</body>
</html>
