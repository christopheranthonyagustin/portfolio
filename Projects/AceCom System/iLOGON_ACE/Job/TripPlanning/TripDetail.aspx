<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripDetail.aspx.cs" Inherits="iWMS.Web.Job.TripPlanning.TripDetail" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TripDetail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div>
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td>
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                    <br />
                    <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="true" CssClass="detailButton"
                        OnClick="UpdateBtn_Click"></asp:Button>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
        &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
            CssClass="errorLabel"></asp:Label></div>
    </div>
    </form>
    </form>
</body>
</html>
