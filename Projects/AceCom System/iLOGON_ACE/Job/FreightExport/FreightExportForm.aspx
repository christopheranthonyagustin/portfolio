<%@ Page Language="c#" CodeBehind="FreightExportForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.FreightExport.FreightExportForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FreightExportRegister</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" CausesValidation="false" Skin="Windows7">
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
                    <telerik:RadMenu ID="RadMenu1" runat="server" ExpandAnimation-Type="None" ClickToOpen="true"
                        OnItemClick="PrintRadMenu_ItemClick">
                        <Items>
                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Text="Print" PostBack="false"
                                Value="Print" GroupSettings-Width="120px">
                                <Items>
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="Charge" Text="Charge"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="AWB" Text="AWB"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="AWB(Draft)" Text="AWB(Draft)"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="BL" Text="BL"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="BL(Draft)" Text="BL(Draft)"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="TI" Text="TI"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="CTI" Text="CTI"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="FCL" Text="FCL"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="LCL" Text="LCL"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ShpOrder" Text="ShpOrder"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DO" Text="DO"
                                        ImageUrl="../../image/copy.png" Visible="True" />

                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="JobSheet" Text="JobSheet"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="Despatch" Text="Despatch"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="SubmitPermitFF" Text="SubmitPermitFF"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="SubmitPermitSL" Text="SubmitPermitSL"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="PnL(Draft)" Text="P&L(Draft)"
                                        ImageUrl="../../image/copy.png" Visible="false" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="PnL" Text="P&L"
                                        ImageUrl="../../image/copy.png" Visible="false" />
                                    <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="MM" Text="MM"
                                        ImageUrl="../../image/copy.png" Visible="True" />
                                </Items>
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
                <td width="25%" align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                    &nbsp;
                <asp:Label Style="z-index: 0" ID="Label1" runat="server" CssClass="errorLabelBig"></asp:Label>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView" DefaultButton="UpdateFormBtn">
                <br />
                <asp:Button ID="UpdateFormBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="PartyRadPageView" DefaultButton="UpdatePartyBtn">
                <br />
                &nbsp;
                <asp:Button ID="UpdatePartyBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" Visible="False"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
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
