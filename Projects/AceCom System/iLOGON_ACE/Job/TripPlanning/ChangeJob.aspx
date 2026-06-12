<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeJob.aspx.cs" Inherits="iWMS.Web.Job.TripPlanning.ChangeJob" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ChangeJob</title>
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
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="AccountLbl" runat="server" CssClass="pagetitle"></asp:Label><br />
                <br />
                <asp:Label ID="JobNolbl" runat="server">JobNo</asp:Label>
                <asp:RequiredFieldValidator ID="JobNoValidator" runat="server" ControlToValidate="JobNoTxt"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="JobNoTxt" runat="server" BackColor="Yellow" OnTextChanged="JobNoTxt_TextChanged"
                    AutoPostBack="True" Width="155px">
                </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="ChangeBtn" runat="server" Text="Change" OnClick="ChangeBtn_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
