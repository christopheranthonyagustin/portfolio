<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayableDetlMassUpdate.aspx.cs" Inherits="iWMS.Web.Job.TransporterLD.PayableDetlMassUpdate" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TripMassChange</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
    <style type="text/css">
        body {
            overflow: hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div>
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td>
                     &nbsp;&nbsp;&nbsp;
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                     <br /> &nbsp;&nbsp;
                     <asp:Label ID="Countlbl" runat="server" Style="color: black; font-size: small; font-weight: bold"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <br />&nbsp;
                    <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="true" CssClass="white"
                        OnClick="MassUpdateBtn_Click"></asp:Button>&nbsp;
                    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" Visible="true" CssClass="white"
                        OnClick="CancelBtn_Click"></asp:Button>
                </td>
            </tr>
        </table>
        &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
            CssClass="errorLabel"></asp:Label>
    </div>
    </form>
</body>
</html>