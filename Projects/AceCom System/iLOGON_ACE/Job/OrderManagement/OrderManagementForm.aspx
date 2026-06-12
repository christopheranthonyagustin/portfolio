<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderManagementForm.aspx.cs" Inherits="iWMS.Web.Job.OrderManagement.OrderManagementForm" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>OrderManagementForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick" 
            RenderMode="Lightweight" SelectedIndex="0" Skin="Windows7" CausesValidation="false"
            AutoPostBack="true">
            <Tabs>
                <%--***** when we will change the tab values, we need to check and change in code side too*****--%>
                <telerik:RadTab ID="MainRadTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Import" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Export" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Transport" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Inbound" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Outbound" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="400" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>&nbsp;<asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="500px" ID="MainRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" ToolTip="Save"
                                Text="Update" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td><br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="400px" ID="ImportRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="400px" ID="ExportRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="800px" ID="TransportRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="400px" ID="InboundRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="400px" ID="OutboundRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="400px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>