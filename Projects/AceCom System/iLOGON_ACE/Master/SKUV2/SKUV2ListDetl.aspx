<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SKUV2ListDetl.aspx.cs" Inherits="iWMS.Web.Master.SKUV2.SKUV2ListDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>SkuListDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>

    <style type="text/css">
        .style1 {
            width: 1050px;
        }
    </style>
</head>
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server" PostBack="false">
                </telerik:RadTab>
                <telerik:RadTab Text="Ordering Info" Value="50" runat="server" PostBack="false">
                </telerik:RadTab>
                <telerik:RadTab Text="User Defined" Value="100" runat="server" PostBack="false">
                </telerik:RadTab>
                <telerik:RadTab Text="SKUPack" Value="150" runat="server" PostBack="false">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="200" runat="server" PostBack="false">
                </telerik:RadTab>
                <telerik:RadTab Text="ExtAttributes" Value="250" runat="server" PostBack="false">
                </telerik:RadTab>
                <telerik:RadTab Text="CodeMap" Value="300" runat="server" PostBack="false">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="350" runat="server" PostBack="false">
                </telerik:RadTab>
                <telerik:RadTab Text="Site" Value="400" runat="server" PostBack="false">
                </telerik:RadTab>
                
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr style="height: 3px">
            </tr>
            <tr>
                <td>&nbsp;<asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView" DefaultButton="UpdateBtn">
                <br>
                &nbsp;
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" Visible="False" CausesValidation="false" />
                <br />
                <br />
                <table>
                    <tr>
                        <td valign="top">
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td valign="top" align="center">
                            <asp:Image ID="SKUimg" runat="server" ImageAlign="Top" Width="130px" Height="180" />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="OrderingInfoRadPageView" DefaultButton="UpdateOrderInfoBtn">
                <br />
                &nbsp;
                <asp:Button ID="UpdateOrderInfoBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" Visible="False" CausesValidation="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="UserDefinedRadPageView" DefaultButton="UpdateUserDefBtn">
                <br />
                &nbsp;
                <asp:Button ID="UpdateUserDefBtn" runat="server" CausesValidation="false" CssClass="white"
                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" Text="Update" UseSubmitBehavior="false" Visible="False" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="SKUPackRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="450px" ID="AttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ExtAttributesRadPageView">
                <iWMS:iForm ID="formCtl5" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="CodeMapRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="450px" ID="SiteRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
