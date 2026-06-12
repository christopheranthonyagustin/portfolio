<%@ Page Language="c#" CodeBehind="VesselBerthingSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.VesselBerthingSchedule.VesselBerthingSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>VesselBerthingSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1">
                <br />
                <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search"
                    OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br />
                <br />
                <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        <br />
                        <telerik:RadLabel ID="UploadLbl" Text="Last Uploaded On:" Font-Size="Small" runat="server" CssClass="align">
                        </telerik:RadLabel>
                        <telerik:RadTextBox ID="UploadTxt" runat="server" Width="155px" TextMode="SingleLine" Enabled="false"
                            Font-Size="Small" Skin="WebBlue">
                        </telerik:RadTextBox>

                        <telerik:RadLabel ID="UploadUserLbl" Text="Last Add User : " Font-Size="Small" runat="server" CssClass="align">
                        </telerik:RadLabel>
                        <telerik:RadTextBox ID="UploadUserTxt" runat="server" Width="155px" TextMode="SingleLine" Enabled="false"
                            Font-Size="Small" Skin="WebBlue">
                        </telerik:RadTextBox>
                        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
