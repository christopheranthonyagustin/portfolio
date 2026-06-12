<%@ Page Language="c#" CodeBehind="InvCountByLocCandSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.InvCount.InvCountByLocCandSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvCountByLocCandSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <table cellspacing="0" cellpadding="0" border="0" width="60%">
            <tr>
                <td>
                    <div class="pagetitle">
                        Inventory Count&nbsp;(Step 1 of 2)
                    </div>
                </td>
                <td align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
					<%--	<asp:Button ID="SearchBtn" runat="server" Text="Search Inventory" CssClass="detailButton" OnClick="SearchBtn_Click"></asp:Button>&nbsp;
						<asp:Button ID="CancelBtn" runat="server" Text="Cancel" CssClass="detailButton" OnClick="CancelBtn_Click"></asp:Button>&nbsp;&nbsp;</td>--%>
           <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" Visible="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                         <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Hide" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
                      </tr>
        </table>
        <br>
        <table cellspacing="5" cellpadding="5" border="0">
            <tr>
                <td>Account</td>
                <td>:
						<asp:Label ID="AcCodeLbl" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Site</td>
                <td>:
						<asp:Label ID="SiteLbl" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Zone</td>
                <td>:
						<asp:DropDownList ID="ZoneList" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Location Code LIKE</td>
                <td>:
						<asp:TextBox ID="LocTxt" runat="server"></asp:TextBox></td>
            </tr>
        </table>
    </form>
</body>
</html>
