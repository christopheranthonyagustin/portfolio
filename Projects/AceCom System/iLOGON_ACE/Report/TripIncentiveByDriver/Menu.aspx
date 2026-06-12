<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="iWMS.Web.Report.TripIncentiveByDriver.Menu" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script> 
    <style type="text/css">
        .style1
        {
            width: 160px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="15" style="border-bottom: #D5D5D5 1px solid;">
 <%--   <form id="Form1" method="post" runat="server">
    <table width="100%">
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="ModuleTitle" align="right">
                <div class="rounded-box1" style="width: 30%; background-color: #660000;">
                    <div class="top-right-corner1">
                        <div class="top-right-inside1" style="background-color: #ffffff; color: #660000">
                            •</div>
                    </div>
                    <div class="top-left-corner1">
                        <div class="top-left-inside1" style="background-color: #ffffff; color: #660000">
                            •</div>
                    </div>
                    <div class="box-contents1" style="font-size: 10pt; font-weight: bold; left: 2px;
                        padding: 3px 5px 5px 3px;">
                        &nbsp;<asp:Label ID="ReportLbl" runat="server">Trip Incentive By Driver</asp:Label></div>
                </div>
            </td>
        </tr>
    </table>
    </form>--%>
    
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td align="right">
                <div class="NewModuleTitle">
                    <asp:Label ID="ReportNameLbl" runat="server"></asp:Label>
                </div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
