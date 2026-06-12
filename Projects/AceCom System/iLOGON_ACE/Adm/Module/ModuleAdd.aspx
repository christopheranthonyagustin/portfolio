<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="ModuleAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.Module.ModuleAdd" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ModuleCreateNew</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="AddBtn">
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
                <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                <%--<asp:button id="AddBtn" runat="server" Text="   Add   " CssClass="formbtn" onclick="AddBtn_Click"></asp:button>--%><br />
                <br>
                <iWMS:iForm id="formCtl" runat="server"></iWMS:iForm>
                &nbsp;
            <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id,true)"
                Visible="false" UseSubmitBehavior="false" />&nbsp;
             <table>
                 <tr>
                     <td>&nbsp;<asp:Label ID="Label2" Text="Guidelines" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
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
