<%@ Page Language="c#" CodeBehind="ModuleDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Module.ModuleDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ProfileDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="UpdateBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table cellspacing="0" cellpadding="0" width="60%" border="0">
                    <tr>
                        <td align="left">
                            <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                        <td align="right">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;<asp:Label ID="Label2" Text="Guidelines" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label3" Text="1. ParentId=0 denotes the root of the menu structure" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label4" Text="2. Target=99 will make this module invisibe in PROFILEXMODULE" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label5" Text="unless the login PROFILE is setup in LISTDETL.Code='SysControl'" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
