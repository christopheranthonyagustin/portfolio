<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SwitchIn.aspx.cs" Inherits="iWMS.Web.Job.TransporterCTNR.SwitchIn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SwitchIn</title>
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
                <asp:Label ID="JobAccLbl" runat="server" CssClass="pagetitle"></asp:Label><br />
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table width="100%" border="1">
                    <tr>
                        <td valign="top" style="width: 30%">
                            <asp:Label ID="ctnrnoLbl" runat="server" Text="CtnrNo" CssClass="pagetitle"></asp:Label><br />
                            <asp:RequiredFieldValidator ID="CtnrNoValidator" runat="server" ControlToValidate="CtnrNoTxt"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="CtnrNoTxt" runat="server" BackColor="Yellow" TextMode="MultiLine"
                                Width="100%" Height="300">
                            </asp:TextBox>
                        </td>
                        <td valign="top" style="width: 40%">
                            <asp:Label ID="failLbl" runat="server" Text="Failed CtnrNo" CssClass="pagetitle"></asp:Label><br />
                            <br />
                            <asp:Label ID="failctnrnoLbl" runat="server" CssClass="errorLabel"></asp:Label>
                        </td>
                        <td valign="top" style="width: 30%">
                            <asp:Label ID="passLbl" runat="server" Text="Pass CtnrNo" CssClass="pagetitle"></asp:Label><br />
                            <br />
                            <asp:Label ID="passctnrnoLbl" runat="server"></asp:Label>
                            <asp:Label ID="passctnridLbl" runat="server" Visible="false"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="ValidateBtn" runat="server" Text="Validate" CssClass="detailButton"
                    OnClick="ValidateBtn_Click" />
                <asp:Button ID="GoBtn" runat="server" Text="SwitchIn" OnClick="GoBtn_Click" CssClass="detailButton"
                    Visible="false" OnClientClick="return confirm('Confirm to proceed to SwitchIn only Pass CtnrNo?');" />
                <asp:Button ID="ResetBtn" runat="server" Text="Reset" OnClick="ResetBtn_Click" CssClass="detailButton" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
