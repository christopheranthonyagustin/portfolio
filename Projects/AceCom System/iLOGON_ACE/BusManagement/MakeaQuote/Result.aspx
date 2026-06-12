<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.BusManagement.MakeaQuote.Result" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<!DOCTYPE html>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Terms and Conditions</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
    <style type="text/css">
        .graytitle {
            font-weight: bold;
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table width="100%">
                <tr class="graytitle">
                    <td>
                        <asp:Label ID="HearderLbl" runat="server" CssClass="Graytitle" Text="Terms and Conditions"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <telerik:RadTextBox ID="Reasontxt" runat="server" Height="520px" Width="1320px"
                            TextMode="MultiLine" BackColor="Transparent" BorderColor="LightSteelBlue">
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
