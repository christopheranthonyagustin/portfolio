<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RouteChargeDetl.aspx.cs"
    Inherits="iWMS.Web.Master.Route.RouteChargeDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RouteCharge</title>
    <base target="_self" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body>
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td align="center">
                <br />
                <asp:Button ID="SaveNextBtn" runat="server" Text="Save & Next" CssClass="detailButton"
                    OnClick="SaveNextBtn_Click"></asp:Button>&nbsp;&nbsp;
                <asp:Button ID="SaveCloseBtn" runat="server" Text="Save & Close" CssClass="detailButton"
                    OnClick="SaveCloseBtn_Click"></asp:Button>&nbsp;&nbsp;
                <asp:Button ID="CloseBtn" runat="server" Text="Close" CssClass="detailButton" OnClick="CloseBtn_Click">
                </asp:Button>&nbsp;&nbsp;
                <br />
                <br />
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
