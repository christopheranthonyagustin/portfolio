<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmCopy.aspx.cs" Inherits="iWMS.Web.Job.ServiceRegister.ConfirmCopy" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Confirm Copy</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Pragma" content="no-cache">
    <base target="_self" />
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Confirm to Copy?</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="MsgLbl" runat="server" />
               
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td align="left">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <telerik:RadButton  ID="CancelBtn0" runat="server" OnClick="CancelBtn_Click" Text="Cancel" Skin="WebBlue"></telerik:RadButton>
                &nbsp;
                <telerik:RadButton ID="OkayBtn" runat="server" OnClick="OkayBtn_Click" Text="Okay" Skin="WebBlue"></telerik:RadButton>                
                 <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

