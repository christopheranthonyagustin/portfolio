<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntityAdd.aspx.cs" Inherits="iWMS.Web.Adm.Entity.EntityAdd" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>EntityAdd</title>
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
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
                <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />

                <%--telerik:RadButton ID="AddBtn" runat="server"  Skin="WebBlue" CssClass="formbtn" Text="Add"
        OnClick="AddBtn_Click"></telerik:RadButton>--%>
                <br />
                <br>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                &nbsp;
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailbutton"
                    OnClick="UpdateBtn_Click"></asp:Button>&nbsp;
                <asp:Button Style="z-index: 0" ID="AddDetailBtn" runat="server" CssClass="detailbutton"
                Text="+ More Functions" Visible="False" OnClick="AddDetailBtn_Click"></asp:Button>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
