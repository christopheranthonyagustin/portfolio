<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutgoingShipmentSplitPick.aspx.cs" Inherits="iWMS.Web.Outbound.OutgoingShipment.OutgoingShipmentSplitPick" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Split Pick @ Goods Issue</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
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
        <asp:Button ID="SubmitBtn" runat="server" CssClass="white" Text="Submit"
                            OnClick="SubmitBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
         &nbsp;
       <asp:Button ID="CloseWindowBtn" runat="server" CssClass="LongLabelWhite" Text="Close Window"
                            OnClick="CloseWindowBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
    </form>
</body>
</html>
