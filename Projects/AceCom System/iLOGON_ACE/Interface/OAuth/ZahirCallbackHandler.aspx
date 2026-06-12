<%@ Page Language="c#" CodeBehind="ZahirCallbackHandler.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Interface.OAuth.ZahirCallbackHandler"%>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ConsigneeHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <style type="text/css">
        #messageText{
            padding:3px;
            text-align:center;
            width : 100vw;
        }

        .centered {
          position: fixed;
          top: 50%;
          left: 50%;
          /* bring your own prefixes */
          transform: translate(-50%, -50%);
        }
    </style>
</head>


<body>
    <h1 runat="server" id="messageText" class="centered"> </h1>
    <%--<form id="Form2" method="post" runat="server">
    
    <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
    <!-- added -->
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False" meta:resourcekey="MessageLblResource1"></asp:Label>
        <div id="div1" style="height: 92%">
        </div>
    </form>
    </body>--%>
</html>
