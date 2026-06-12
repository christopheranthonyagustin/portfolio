<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConnectionV2Detl.aspx.cs"
    Inherits="iWMS.Web.Adm.ConnectionV2.ConnectionV2Detl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ConnectionV2Detl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="60%" border="0">
        <tr>
            <br />
            <td align="left">
                &nbsp;
                <telerik:RadButton ID="UpdateBtn" runat="server" Skin="WebBlue" Text="Update" Visible="False"
                    CssClass="detailButton" Style="z-index: 0" OnClick="UpdateBtn_Click">
                </telerik:RadButton>
            </td>
            <td align="right">
                <telerik:RadButton ID="BackButton" runat="server" CssClass="detailButton" Visible="false"
                    Text="Search Results" Width="120px" CausesValidation="False" OnClick="BackButton_Click">
                </telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
