<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="iWMS.Web.Master.GeneralAttached.Menu" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >

<html>
	<head id="Head1" runat="server">
    <title>GeneralAttcMenu</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="8" style="border-bottom: #d5d5d5 1px solid">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr>
            <td>
                <iWMS:Tabs ID="MenuTabs" runat="server"></iWMS:Tabs>
            </td>
            <td class="NewModuleTitle" align="right">
                <%--<div class="rounded-box1" style="width: 40%; background-color: #CC0000;">
                    <div class="top-right-corner1">
                        <div class="top-right-inside1" style="background-color: #ffffff; color: #CC0000">
                            •</div>
                    </div>
                    <div class="top-left-corner1">
                        <div class="top-left-inside1" style="background-color: #ffffff; color: #CC0000">
                            •</div>
                    </div>
                    <div class="box-contents1" style="font-size: 10pt; font-weight: bold; left: 2px;
                        padding: 3px 5px 5px 3px;">--%>
                        <asp:Label ID="GenLbl" runat="server" style="color:Black; font-size:medium; font-weight: bold">General Attached&nbsp;&nbsp;</asp:Label><%--</div>--%>
                <%--</div>--%>
            </td>
        </tr>
    </table>
    </form>
</body>>
</html>
