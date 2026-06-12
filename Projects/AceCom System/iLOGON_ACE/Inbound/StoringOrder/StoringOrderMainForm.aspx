<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoringOrderMainForm.aspx.cs"
    Inherits="iWMS.Web.Inbound.StoringOrder.StoringOrderMainForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>StoringOrderMainForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href=".paif./../css/iWMSTelerik.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    &nbsp;
        <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
    &nbsp;
        <asp:Button ID="PrintBtn" runat="server" CssClass="blue" Text="Print"
                    OnClick="PrintBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
    <br />
    <br />
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    </form>
</body>
</html>
