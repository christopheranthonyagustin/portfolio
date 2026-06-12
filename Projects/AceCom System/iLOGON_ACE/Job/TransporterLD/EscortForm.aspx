<%@ Page Language="c#" CodeBehind="EscortForm.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TransporterLD.EscortForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EscortForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td style="height: 20px">
                <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                <br />
                <asp:Button Style="z-index: 0" ID="UpdateBtn" runat="server" CssClass="detailButton"
                    Visible="True" Text="Update" OnClick="UpdateBtn_Click"></asp:Button>
            </td>
           
        </tr>
        <tr>
            <td colspan="2">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
            
        <tr>
            <td colspan="2">
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </td>
            
        </tr>
            <%--<tr>
            <td colspan="2">
            
            &nbsp<asp:Label ID="RouteLbl" runat="server" Text=" Police Escort Route"></asp:Label>
            
            <telerik:RadEditor runat="server" height="200px"  ID="RouteEditor">
            <Tools>
            <telerik:EditorToolGroup>
                <telerik:EditorTool Name="Bold" />
                <telerik:EditorTool Name="Italic" />
                <telerik:EditorTool Name="Underline" />
            </telerik:EditorToolGroup>
            </Tools>
            </telerik:RadEditor>
            </td>
          
        </tr>--%>
    </table>
    </form>
</body>
</html>
