<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SKUV2Add.aspx.cs" Inherits="iWMS.Web.Master.SKUV2.SKUV2Add" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>SkuAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Ordering Info" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="User Defined" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadMultiPage">
                <br>
                <table>
                    <tr>
                        <td>&nbsp;<asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click"
                            OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td><br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="SKUUpdateBtn" runat="server" Text="Update" OnClick="SKUUpdateBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" Visible="False" />
                            &nbsp;
                            <asp:Button ID="AddDetailBtn" runat="server" Text="+ Functions" OnClick="AddDetailBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" Visible="False" />
                        </td>
                    </tr>
                </table>
                <asp:Panel runat="server" ID="SKUPackPanel">
                    <br />
                    <iframe id="skuPackFrame" runat="server" frameborder="no" marginheight="0" marginwidth="0"
                                style="width: 95%; height: 90%" visible="false"></iframe>
                </asp:Panel>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="OrderingInfoRadPageView">
                <br />
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="UserDefinedRadPageView">
                <br />
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
