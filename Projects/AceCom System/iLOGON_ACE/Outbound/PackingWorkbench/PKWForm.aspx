<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PKWForm.aspx.cs" Inherits="iWMS.Web.Outbound.PackingWorkbench.PKWForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Edit @ Packing Workbench</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip_Click">
            <Tabs>
                <telerik:RadTab ID="MainTab" Text="Main" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab ID="CartonTab" Text="Carton" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="PalletSummaryTab" Text="Pallet" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="PackingInstructionTab" Text="Packing instruction" Value="300" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
                <br />
                <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="CartonRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="PalletSummaryRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="PackingInstructionRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
