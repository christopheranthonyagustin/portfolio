<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueReleaseRequestDetl.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueReleaseRequestDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Release Request Detail @ GIV2</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/radwindow.js" type="text/javascript"></script>
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
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
        </telerik:RadWindowManager>
        <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label><br />
        <br />
        &nbsp;
        <asp:Button ID="AddBtn" runat="server" Text="Add" Visible="True" CssClass="white"
            OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>&nbsp;
        <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="True" CssClass="white"
            OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
        &nbsp;
        <asp:Button ID="CancelBtn" runat="server" Text="Cancel" Visible="True" CssClass="white"
            CausesValidation="false" OnClick="CancelBtn_Click"></asp:Button>
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
    </form>
</body>
</html>