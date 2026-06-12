<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConnectionV2Search.aspx.cs" Inherits="iWMS.Web.Adm.ConnectionV2.ConnectionV2Search" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>AppSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />   
    <asp:ImageButton ID="SearchImgBtn" runat="server" ImageUrl="../../Image/Search.png" 
            Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
            ImageAlign="AbsMiddle" OnClick="SearchBtn_Click" />
        <%--<telerik:RadButton Style="z-index: 0" ID="Button1" runat="server" Skin="WebBlue" CssClass="detailbutton"
        Text="Search" OnClick="SearchBtn_Click"></telerik:RadButton><br>--%>
    <br />
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    &nbsp;
    </form>
</body>
</html>

