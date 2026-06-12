<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="Specs.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.ListDetl.Specs" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ListHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:radtabstrip runat="server" id="RadTabStrip1" multipageid="RadMultiPage1" causesvalidation="false"
            autopostback="true" selectedindex="0" skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Specs" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:radtabstrip>
        <telerik:radmultipage runat="server" id="RadMultiPage1" selectedindex="0" cssclass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <br />
			<asp:Label id="SearchLbl" runat="server" CssClass="pagetitle" Text="Search list detail:"></asp:Label>
            <br />
			<iwms:iForm id="formCtl" runat="server"></iwms:iForm>
			<asp:Button id="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailButton" onclick="UpdateBtn_Click"></asp:Button>&nbsp;	
                            </telerik:RadPageView>
        </telerik:radmultipage>
    </form>
</body>
</html>
