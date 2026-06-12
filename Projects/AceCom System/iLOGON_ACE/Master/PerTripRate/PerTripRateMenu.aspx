<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerTripRateMenu.aspx.cs"
    Inherits="iWMS.Web.Master.PerTripRate.PerTripRateMenu" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>PerVoidServiceChit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="8" style="border-bottom: #d5d5d5 1px solid">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs
                        ID="MenuTabs" runat="server"></iWMS:Tabs></td>
                <td class="ModuleTitle" align="right">
                    <%--<div class="rounded-box1" style="background-color: #660000; width: 30%">--%>
                    <%--<div class="top-right-corner1">
                        <div class="top-right-inside1" style="background-color: #ffffff; color: #660000">
                            •</div>
                    </div>
                    <div class="top-left-corner1">
                        <div class="top-left-inside1" style="background-color: #ffffff; color: #660000">
                            •</div>--%>
                    <%--</div>--%>
                    <%-- <div class="box-contents1" style="padding-bottom: 5px; padding-left: 3px; padding-right: 5px;
                        font-size: 10pt; font-weight: bold; padding-top: 3px; left: 2px">--%>

                    <div class="NewModuleTitle">
                        <asp:Label ID="MenuLbl" labelclass="NewModuleTitle" runat="server"></asp:Label>
                    </div>

                    </div>
                
                </div>
                </td>

            </tr>
        </table>
    </form>
</body>
</html>
