<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderServicePt.aspx.cs"
    Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderServicePt" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Service Point</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadButton ID="UpdateBtn" runat="server" OnClick="UpdateBtn_Click" Text="Update" Skin="WebBlue"
        SingleClick="true" SingleClickText="Processing...">
    </telerik:RadButton>
    <br />
    <br />
    <iWMS:iForm ID="formCtl" runat="server" />
    </form>
</body>
</html>
