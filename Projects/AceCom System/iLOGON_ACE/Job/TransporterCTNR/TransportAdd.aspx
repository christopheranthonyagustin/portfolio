<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportAdd.aspx.cs" Inherits="iWMS.Web.Job.TransporterCTNR.TransportAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TransportAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

    <script src="../../js/telerikScrip.js" type="text/javascript"></script>

    </telerik:RadScriptBlock>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
        <table>
            <tr>
                <td>
                    &nbsp;
                    <asp:Button ID="AddBtn" runat="server" Text="Add" class="white" OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                </td>
                <td>
                <asp:UpdatePanel ID="SCPanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                        &nbsp;
                        <asp:Button ID="InputPopup" class="white" runat="server" Text="Instruction" OnClientClick="window.open('TransportStandingOrder.aspx','popUpWindow', 'height=341,width=542,left=100,top=30,resizable=No,scrollbars=No,toolbar=no,menubar=no,location=no,directories=no, status=No');" Visible="false" />
                        <asp:Button ID="InputPopupNo" class="white" runat="server" Text="Instruction" disabled="true" OnClientClick="window.open('TransportStandingOrder.aspx','popUpWindow', 'height=341,width=542,left=100,top=30,resizable=No,scrollbars=No,toolbar=no,menubar=no,location=no,directories=no, status=No');" Visible="false" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    <br />
    <br />
 <%--   &nbsp;<iWMS:iPopup style="z-index: 0" ID="InputPopup" runat="server" ButtonText="StandingOrder"
        InputBoxWidth="540" InputBoxHeight="340" PageUrl="TransportStandingOrder.aspx"
        Mode="ADD" Type="BTN" Visible="false"></iWMS:iPopup>
    <iWMS:iPopup style="z-index: 0" ID="InputPopupNo" runat="server" ButtonText="NoStandingOrder"
        InputBoxWidth="540" InputBoxHeight="340" PageUrl="TransportStandingOrder.aspx"
        Mode="ADD" Type="BTN" Visible="false"></iWMS:iPopup>
    <br />
    <br />--%>
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        CausesValidation="false" RenderMode="Lightweight" SelectedIndex="0" Skin="Office2007"
        AutoPostBack="true">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="EXIM" Value="1" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Party" Value="2" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
        RenderSelectedPageOnly="true">
        <telerik:RadPageView runat="server" Height="550px" ID="RadPageView1">
            <asp:UpdatePanel ID="SCPanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <iWMS:iForm ID="formCtl" runat="server" />
                <iWMS:iForm ID="formCtl6" runat="server" />
                <iWMS:iForm ID="formCtl5" runat="server" />
                <iWMS:iForm ID="formCtl4" runat="server" />
            </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server"  ID="RadPageView2">
            <iWMS:iForm ID="formCtl2" runat="server" />
        </telerik:RadPageView>
        <telerik:RadPageView runat="server"  ID="RadPageView3">
            <iWMS:iForm ID="formCtl3" runat="server" />
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <table>
        <tr>
            <td>
                <asp:Button ID="RadAddBtn" runat="server" Text="Add" class="white" OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />               
            </td>
        </tr>
    </table>
    &nbsp;<asp:Button ID="CopyBtn" runat="server" Text="Copy" Visible="False" CssClass="detailbutton"
        OnClick="CopyBtn_Click" />
    <asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:"
        DisplayMode="BulletList" EnableClientScript="true" runat="server" ID="valSummary"
        CssClass="RedText" />
    </form>
</body>
</html>
