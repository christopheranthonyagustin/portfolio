<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuleReseqRoot.aspx.cs" Inherits="iWMS.Web.Adm.Module.ModuleReseqRoot" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>ProfilexModule</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">    
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
     <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
    </script>
    <style>
        html {
            overflow: hidden;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />      
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>               
    
   </form>
</body>
</html>
