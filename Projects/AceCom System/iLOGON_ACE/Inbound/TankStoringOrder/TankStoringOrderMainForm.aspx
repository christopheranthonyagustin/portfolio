<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankStoringOrderMainForm.aspx.cs"
    Inherits="iWMS.Web.Inbound.TankStoringOrder.TankStoringOrderMainForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>TankStoringOrderMainForm</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    &nbsp;   
        <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Visible="true"  
            Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
    &nbsp;  
        <asp:Button ID="PrintBtn" CssClass="blue" runat="server" OnClick="PrintBtn_Click" Visible="true"  
            Text="Print" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
    <br />
    <br />
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    </form>
</body>
</html>
