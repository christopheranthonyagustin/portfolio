<%@ Page Language="c#" CodeBehind="InvCountSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.InvCount.InvCountSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvCountSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <%--       <asp:ImageButton ID="SearchImgBtn" runat="server" ImageUrl="../../Image/Search.png" 
                Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                ImageAlign="AbsMiddle" OnClick="SearchBtn_Click" />--%>
        <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search"
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        <br />
        <span class="pagetitle">&nbsp;</span>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        &nbsp;
			
    </form>
</body>
</html>
