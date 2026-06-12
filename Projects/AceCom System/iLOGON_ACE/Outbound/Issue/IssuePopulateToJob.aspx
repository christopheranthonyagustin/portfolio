<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssuePopulateToJob.aspx.cs"
    Inherits="iWMS.Web.Outbound.Issue.IssuePopulateToJob" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>JobPopulate</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta content="no-cache" http-equiv="Pragma">
</head>
<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:Label ID="StepLbl" runat="server" CssClass="pagetitle">Populate to Job (Step 
						3 of 3)</asp:Label><br>
    <p>
    </p>
    <table cellspacing="2" cellpadding="2">
        <tr>
            <td nowrap align="left">
                <asp:Label ID="jobNoLbl" runat="server">Job #</asp:Label>
            </td>
            <td>
                :
                <asp:TextBox ID="jobNoTxt" runat="server" AutoPostBack="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 16px">
            </td>
            <td style="height: 16px" align="right">
                <asp:Label ID="consigneeNameLbl" runat="server"></asp:Label>&nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2" align="right">
                <p>
                    &nbsp;<asp:Button ID="PopulateBtn" runat="server" CssClass="detailbutton" Text="Populate"
                        OnClick="PopulateBtn_Click"></asp:Button>&nbsp;<br>
                    <br>
                </p>
            </td>
        </tr>
    </table>
    &nbsp;
    <asp:Label ID="NoteLbl" runat="server" Text="To populate to a new Job, leave the Job # blank. "></asp:Label>
    <p>
        &nbsp;</p>
    &nbsp
    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
    <asp:LinkButton Style="z-index: 0" ID="LinkLbl" runat="server" CssClass="linkLabelBig"
        OnClick="LinkLbl_Click"></asp:LinkButton>
    </form>
</body>
</html>
