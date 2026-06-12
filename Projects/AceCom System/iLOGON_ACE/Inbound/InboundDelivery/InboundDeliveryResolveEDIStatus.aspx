<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InboundDeliveryResolveEDIStatus.aspx.cs" Inherits="iWMS.Web.Inbound.InboundDelivery.InboundDeliveryResolveEDIStatus" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cancel @ InboundDelivery</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />      
             <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
            <asp:Button ID="ConfirmBtn" runat="server" Text="Submit" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"
                            OnClick="SubmitBtn_Click" CssClass="white" Width="150"></asp:Button>
    </form>
</body>
</html>
