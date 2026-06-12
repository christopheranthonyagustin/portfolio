<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMSeaConsoleRegisterForm.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsoleRegister.FMSeaConsoleRegisterForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMSeaConsoleRegisterForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Schedule" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Container" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Job" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="800" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="900" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
         <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="DetailsRadPageView">
                <table>
                    <tr>
                        <td>
                            <br />
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <br />
                            <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td rowspan="9" colspan="9" valign="top">
                                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                            </td>

                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td colspan="9" rowspan="9" valign="top">
                                                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
             <telerik:RadPageView runat="server" Height="100%" ID="RadPageView1" />
             <telerik:RadPageView runat="server" Height="100%" ID="ContainerRadPageView" />
             <telerik:RadPageView runat="server" Height="100%" ID="JobRadPageView" />
             <telerik:RadPageView runat="server" Height="100%" ID="AttcRadPageView" />
             <telerik:RadPageView runat="server" Height="100%" ID="LogRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
