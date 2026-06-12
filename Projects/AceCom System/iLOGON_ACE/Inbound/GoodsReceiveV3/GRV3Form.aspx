<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3Form.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3Form" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Form @ GoodsReceiveV3 </title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../../css/style.css" type="text/css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" RenderMode="Lightweight"
            AutoPostBack="true" SelectedIndex="0" CausesValidation="false" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="GRQuotation" Value="750" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Shipping" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="SKULine" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="TUSumm" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Charge" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Container" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Return" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="InvHistory" Value="450" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Notify" Value="550" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="600" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Upload" Value="650" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="UploadSNo" Value="700" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td><br />
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td><br />
                    <telerik:RadMenu ID="RadMenu1" runat="server" ClickToOpen="true" ExpandAnimation-Type="None">
                        <Items>
                            <telerik:RadMenuItem Text="Print">
                            </telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainRadPageView">
                <br />
            <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
                Text="Update" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" ToolTip="Update" />
                &nbsp;
            <asp:Button ID="GRNBtn" CssClass="blue" runat="server" OnClick="GRNBtn_Click"
                Text="GRN" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="GRN" />
                &nbsp;
            <asp:Button ID="ReleaseToOpsbtn" CssClass="LongLabelWhite" runat="server" OnClick="ReleaseToOps_Click" Visible="False"
                Text="Release To Ops" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                   <asp:Button ID="FinalizeBtn" class="white" runat="server" OnClick="FinalizeBtn_Click"
                       Text="Finalize" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                     <asp:Button ID="TallyHo" CssClass="LongLabelBlue" runat="server" OnClick="TallyBtn_Click" Text="Tally Sheet"
                         OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CausesValidation="false" />
                &nbsp;
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>

                <iframe runat="server" id="MainSKULineRadPageView" src="/pix/milford_sound/milford_sound_t.jpg"
                    width="100%"
                    height="700"
                    scrolling="auto"
                    frameborder="1">
                    <!--This bit is only viewed by browsers that don't support inline frames -->
                    Your browser doesn't support inline frames.
                </iframe>
            </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="700px" ID="GRQuotationRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ShipmentRadPageView">
                <br />
                &nbsp;
            <asp:Button ID="UpdateBtn2" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
                Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Update" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="SKULineRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="TUSummRadPageView" />
            <telerik:RadPageView runat="server" Height="800px" ID="ChargesRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ReturnRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="InvHistoryRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="NotifyRadPageView">
                <br />
                &nbsp;
            <asp:Button ID="UpdateBtn5" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Visible="False"
                Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Update" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl5" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="UploadRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="UploadSNoRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
