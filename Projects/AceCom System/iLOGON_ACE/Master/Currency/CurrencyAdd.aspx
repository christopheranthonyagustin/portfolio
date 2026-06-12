<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrencyAdd.aspx.cs" Inherits="iWMS.Web.Master.Currency.CurrencyAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CurrencyAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:radtabstrip runat="server" id="RadTabStrip1" multipageid="RadMultiPage1" autopostback="true"
            causesvalidation="false" selectedindex="0" skin="Windows7" ontabclick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:radtabstrip>
        <telerik:radmultipage runat="server" id="RadMultiPage1" selectedindex="0" cssclass="outerMultiPage" renderselectedpageonly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />&nbsp;
                       <asp:Button ID="AddBtn" runat="server" class="white" Text="Add" OnClick="AddBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"   />
        <br />
        <br>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        &nbsp;
  <%--  <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailbutton"
        OnClick="UpdateBtn_Click"></asp:Button>--%>
   <%--     <asp:ImageButton ID="UpdateBtn" runat="server" ImageUrl="../../Image/Update.png"
            Visible="false" BackColor="Transparent" BorderWidth="0" Style="z-index: 0"
            ImageAlign="AbsMiddle" ToolTip="Search" OnClick="UpdateBtn_Click" />--%>
        &nbsp;
        <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                     Visible="False" CssClass="white" />
                            </telerik:RadPageView>
        </telerik:radmultipage>
    </form>
</body>
</html>
