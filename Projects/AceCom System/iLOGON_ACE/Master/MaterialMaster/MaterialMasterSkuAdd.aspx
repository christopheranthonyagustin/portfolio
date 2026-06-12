<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialMasterSkuAdd.aspx.cs" Inherits="iWMS.Web.Master.MaterialMaster.MaterialMasterSkuAdd" %>

<!DOCTYPE html>

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
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
               <%-- <telerik:RadTab Text="Attributes" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Ordering Info" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="User Defined" Value="200" runat="server">
                </telerik:RadTab>--%>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadMultiPage">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="FormCtrlUpdatePanel" runat="server">
                                <ContentTemplate><br />
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>

                <table>
                    <tr>
                        <td>&nbsp;
                             <asp:Button ID="SKUUpdateBtn" runat="server" Text="Update" OnClick="SKUUpdateBtn_Click"
                                 OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" Visible="False" />
                            &nbsp;
                            <asp:Button ID="AddDetailBtn" runat="server" Text="+ Functions" OnClick="AddDetailBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="false" Visible="False" />
                        </td>
                    </tr>
                </table>
                <br />
                <iframe id="skuPackFrame" runat="server" frameborder="no" marginheight="0" marginwidth="0" style="width: 95%; height: 50%" visible="false"></iframe>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AttributesRadPageView">
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="OrderingInfoRadPageView">
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="UserDefinedRadPageView">
                <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
