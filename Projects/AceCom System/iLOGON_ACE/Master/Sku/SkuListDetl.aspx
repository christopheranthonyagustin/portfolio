<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="SkuListDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Sku.SkuListDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>SkuListDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">

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
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attributes" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Ordering Info" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="User Defined" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="SKU Pack" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="ExtAttributes" Value="320" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="CodeMap" Value="330" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Site" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="350" runat="server">
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
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView" DefaultButton="UpdateBtn">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="true"
                                Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" Visible="False" CausesValidation="false" />
                            &nbsp;
                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="true"
                                Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" />
                            <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
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
            <telerik:RadPageView runat="server" Height="700px" ID="AttributesRadPageView" DefaultButton="UpdateAttributesBtn">
                <br />
                <asp:Button ID="UpdateAttributesBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" Visible="False" CausesValidation="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="OrderingInfoRadPageView" DefaultButton="UpdateOrderInfoBtn">
                <br />
                <asp:Button ID="UpdateOrderInfoBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" Visible="False" CausesValidation="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="UserDefinedRadPageView" DefaultButton="UpdateUserDefBtn">
                <br />
                <asp:Button ID="UpdateUserDefBtn" runat="server" CausesValidation="false" CssClass="white"
                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" Text="Update" UseSubmitBehavior="false" Visible="False" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
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
