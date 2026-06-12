<%@ Page Language="c#" CodeBehind="Menu.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.NCCPARBreakDown.Menu" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>NCCPARBreakDown</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            width: 160px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="15" style="border-bottom: #d5d5d5 1px solid">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <%--<td class="style1">&nbsp;</td>
            <td class="ModuleTitle" align="right">--%>		
				<td>
                <div class="NewModuleTitle">
                        <asp:Label ID="ReportNameLbl" runat="server" style="color:Black; font-size:medium; font-weight: bold">&nbsp;NCPAR BreakDown</asp:Label><%--</div>--%>
                </div>
                </td>
            <%--</td>--%>
        </tr>
    </table>
    </form>
</body>
</html>
