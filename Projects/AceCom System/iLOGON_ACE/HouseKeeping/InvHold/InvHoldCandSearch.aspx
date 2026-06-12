<%@ Page Language="c#" CodeBehind="InvHoldCandSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.HouseKeeping.InvHold.InvHoldCandSearch" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvHoldDetlSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    Hold & Release(Step 1 of 3)</div><br />
            </td>
        </tr>
        <tr>
            <td align="Left">
                <asp:Button ID="SearchBtn" runat="server" Text="Search" Visible="True" UseSubmitBehavior="false" CssClass="white" OnClick="SearchBtn_Click"></asp:Button>&nbsp;
                <asp:Button ID="CancelBtn" runat="server" Text="Cancel" Visible="True" UseSubmitBehavior="false" CssClass="white" OnClick="CancelBtn_Click"></asp:Button>&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <br>
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    &nbsp;
    </form>
</body>
</html>
