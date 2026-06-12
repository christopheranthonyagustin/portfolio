<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataTransformationServiceClone.aspx.cs" Inherits="iWMS.Web.Interface.DataTransformationService.DataTransformationServiceClone" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>Clone @ DataTransformationMaster</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
       <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <iWMS:iForm ID="formCtl" runat="server" ></iWMS:iForm><br />
        <asp:Button ID="CloneBtn" runat="server" CssClass="white" Text="Add"
            OnClick="CloneBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
    </form>
</body>
</html>
