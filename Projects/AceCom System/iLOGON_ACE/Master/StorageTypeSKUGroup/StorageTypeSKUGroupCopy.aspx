<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StorageTypeSKUGroupCopy.aspx.cs" Inherits="iWMS.Web.Master.StorageTypeSKUGroup.StorageTypeSKUGroupCopy" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Storage Type Sku Group Copy</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
        <meta http-equiv="Pragma" content="no-cache">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table class="TABLE" id="FormTable" width="100%" runat="server">
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
            <td width="10%">
            </td>
            <td width="40%">
            </td>
            <td>
                <br /><br />
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </td>
        </tr>
         <tr>
            <td width="10%">
            </td>
            <td width="40%">
            </td>
            <td width="10%">
            </td>
            <td width="40%">
                <asp:Button ID="CopyBtn" runat="server" CssClass="formBtn" Visible="False" Text=" Copy "
                    OnClick="CopyBtn_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
