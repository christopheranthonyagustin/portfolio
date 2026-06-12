<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServicePointForm.aspx.cs" Inherits="iWMS.Web.Master.ServicePoint.ServicePointForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ServicePointForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>

                <telerik:RadTab Text="PSA Definition" Value="50" runat="server">
                </telerik:RadTab>

                <telerik:RadTab Text="Timings" Value="100" runat="server">
                    <%-- change name Detail to Timings Ticket #9886 --%>
                </telerik:RadTab>

                <telerik:RadTab Text="Personnel Dependency" Value="150" runat="server">
                </telerik:RadTab>

                <telerik:RadTab Text="PinPoint" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table>
            <tr>
                <td>&nbsp;&nbsp;
                    <asp:Label ID="CodeLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="500px" ID="MainRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" ToolTip="Save"
                                Text="Update" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <br />
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                    <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                                    <iWMS:iForm ID="formCtl5" runat="server"></iWMS:iForm>
                                    <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="400px" ID="PSADefinitionRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="400px" ID="DetailRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="500px" ID="PersonnelDependencyPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="500px" ID="PinPointPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
