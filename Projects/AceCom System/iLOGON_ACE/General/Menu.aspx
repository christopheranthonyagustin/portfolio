<%@ Page Language="c#" CodeBehind="Menu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.General.Menu" %>

<%@ Register TagPrefix="iWMS" TagName="menu" Src="../Control/Menu.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>iWMS</title>

    <link href="../css/menu.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery.treeview.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../js/jquery.cookie.js" type="text/javascript"></script>

    <script type="text/javascript">
        function ClientNodeClicked(sender, eventArgs) {
            var node = eventArgs.get_node();
            node.toggle();
        }

        function CheckJQueryVersion() // Check JQuery Version
        {
            if (window.jQuery) {

                console.log(window.jQuery.fn.jquery);
            }
        }
        
    </script>
    <style type="text/css">
        .RadTreeView .rtText {
            margin-left: 4px !important;
        }

        /*color of selected items*/
        .RadTreeView_Silk .rtSelected .rtIn {
            border-color: #b0e2eb !important;
            color: #0308a2 !important;
            background-color: #b0e2eb !important;
        }

        /*Horizontal dotted lines*/
        div.RadTreeView .rtLines .rtOut::before {
            width: 10px;
        }

        /*Padding between vetical dotted lines*/
        div.RadTreeView .rtLI {
            padding-left: 17px !important;
        }

        #form1 {
            overflow: hidden;
        }

        div.RadTreeView {
            line-height: 20px;
            color: #030883;
            background: #f5f6fb;
            overflow: hidden;
            font-size: 12px;
            text-wrap: normal;
        }

        body {
            background: #f5f6fb;
            color: #030883;
        }

        div.RadTreeView .rtLast {
            padding-bottom: 0; /* prevent double-spacing */
            padding-top: 0;
        }

        .RadTreeView .rtLI {
            padding-bottom: 0px;
            padding-top: 0;
            line-height: 12px; /* customize nodes height */
            text-wrap: normal;
        }

        .RadTreeView .rtUL .rtUL {
            margin-top: 0px;
            margin-bottom: 0px;
        }
    </style>
</head>
<body onload="CheckJQueryVersion();">
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <div>
            <telerik:RadTreeView runat="server" ID="RadTreeView1" RenderMode="Lightweight" Skin="Silk" OnClientNodeClicked="ClientNodeClicked" ForeColor="#030883">
            </telerik:RadTreeView>
        </div>
    </form>
</body>
</html>
