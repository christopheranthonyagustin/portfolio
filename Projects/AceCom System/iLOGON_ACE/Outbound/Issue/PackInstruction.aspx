<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackInstruction.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.PackInstruction" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>TransportLogDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
        <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />  
       <%-- <telerik:RadButton Style="z-index: 0" ID="UpdateFormBtn" runat="server" CssClass="detailButton" Text="Update" 
        OnClick="UpdateBtn_Click" OnClientClick="if (!Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Processing...';"
            UseSubmitBehavior="False"></telerik:RadButton>
        <telerik:RadButton Style="z-index: 0" ID="DeleteBtn" runat="server" CssClass="detailButton" Text="Delete" 
        OnClick="DeleteBtn_Click" OnClientClick="if (!Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Processing...';"
            UseSubmitBehavior="False"></telerik:RadButton>--%><br />
        <asp:Button ID="UpdateFormBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" ToolTip="Update" UseSubmitBehavior="false" CssClass="white" />
        <asp:Button ID="DeleteBtn" runat="server" Text="Delete" OnClick="DeleteBtn_Click"
                    OnClientClick="disableBtn(this.id,false)" ToolTip="Delete" UseSubmitBehavior="false" CssClass="white" />
        <br>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    </form>
</body>
</html>
