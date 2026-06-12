<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewContent.aspx.cs" Inherits="iWMS.Web.Inbound.PurchaseOrder.ViewContent" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTextBox runat="server" ID="ContentTxt" Width="100%" 
        Skin="Office2007" TextMode="MultiLine" Rows="35">
    </telerik:RadTextBox>
    </form>
</body>
</html>
