<%@ Page Language="c#" CodeBehind="FreightImportForm.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.FreightImport.FreightImportForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FreightImportForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" SelectedIndex="0" CausesValidation="False" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Party" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Container" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Equipment" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Items" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Task" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Charge" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Cost" Value="450" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Payable" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="550" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <br />
                    <telerik:RadMenu ID="RadMenu1" runat="server" ClickToOpen="true" ExpandAnimation-Type="None">
                        <Items>
                            <telerik:RadMenuItem Text="Print">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
                <td width="25%" align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                </td>
            </tr>
        </table>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView" DefaultButton="UpdaeFormBtn">
                <br />
                &nbsp;
                <asp:Button ID="UpdaeFormBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" /><br />
                <br />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="PartyRadPageView" DefaultButton="UpdaePartyBtn">
                <br />
                &nbsp;
                <asp:Button ID="UpdaePartyBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
                &nbsp;
                <br />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="EquipmentRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ItemsRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="TaskRadPageView" />
            <telerik:RadPageView runat="server" Height="360px" ID="ChargeRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="CostRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="PayableRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
