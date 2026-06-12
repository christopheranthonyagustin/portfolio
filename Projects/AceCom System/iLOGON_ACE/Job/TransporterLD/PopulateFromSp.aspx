<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopulateFromSp.aspx.cs"
    Inherits="iWMS.Web.Job.TransporterLD.PopulateFromSp" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PopulateFromShipPlan</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <base target="_self">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <style type="text/css">
        .style1
        {
            width: 200px;
        }
    </style>
</head>
<body>
    <form id="form1"  method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="style1">
                <div class="pagetitle">
                    <asp:Label ID="DescrLbl" runat="server"></asp:Label></div>
            </td>
            <td align="right">
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label" runat="server" Text="IssueNo/ShipPlanNo"></asp:Label><br />
                <asp:TextBox ID="SpNoTxt" runat="server" Width="149px"></asp:TextBox>
            </td>
            <td>
                &nbsp;<asp:Button ID="AddBtn" runat="server" Text="Populate" OnClick="AddBtn_Click">
                </asp:Button>&nbsp;&nbsp;<asp:Button ID="CloseBtn" runat="server" Text="Close" OnClick="CloseBtn_Click">
                </asp:Button>
                <br />                
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
