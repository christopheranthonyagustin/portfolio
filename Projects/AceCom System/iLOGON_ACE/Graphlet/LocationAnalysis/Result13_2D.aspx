<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result13_2D.aspx.cs" Inherits="iWMS.Web.Graphlet.LocationAnalysis.Result13_2D" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LocOccupancy2D</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
<style type="text/css">
        .style1 {
            width: 5%;
        }
        a:link {
            color: white;
        }

        a:visited {
            color: white;
        }

        .errorLabel {
            font-family: Arial,Verdana,sans-serif;
            font-weight: bold;
            font-size: 8pt;
            color: Red;
        }

        .aisleLabel {
            font-family: Arial,Verdana,sans-serif;
            font-weight: bold;
            font-size: 20pt;
            color: DarkBlue;
        }

        .remarksLabel {
            font-family: Arial,Verdana,sans-serif;
            font-weight: bold;
            font-size: 12pt;
            color: DarkBlue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="padding25" style="border-bottom: 1px solid #ccc;">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            <br />
        </div>
        <tr>
            <td>
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </div>
    </form>
</body>
</html>
