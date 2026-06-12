<%@ Page Language="c#" CodeBehind="AssignCount.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.InvCount.AssignCount" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>AssignCount</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <table cellspacing="2" cellpadding="2" width="100%" border="0">
            <tr>
                <br />
                &nbsp;<asp:Button ID="AssignBtn" runat="server" Text="Assign" CssClass="white" OnClick="AssignBtn_Click"></asp:Button><br />
            </tr>
            <tr>
                <td width="15%">Inv.Count List#</td>
                <td>:<asp:TextBox ID="IcIdTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="IcIdReq" runat="server" ErrorMessage="*" ControlToValidate="IcIdTxt"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Reprint#</td>
                <td>:<asp:TextBox ID="ReprintTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReprintReq" runat="server" ControlToValidate="ReprintTxt" ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>From Line#</td>
                <td>:<asp:TextBox ID="FromLineTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="FromLineReq" runat="server" ErrorMessage="*" ControlToValidate="FromLineTxt"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>To Line#</td>
                <td>:<asp:TextBox ID="ToLineTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ToLineReq" runat="server" ErrorMessage="*" ControlToValidate="ToLineTxt"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Person In Charge</td>
                <td>:<asp:TextBox ID="PicTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PicReq" runat="server" ErrorMessage="*" ControlToValidate="PicTxt"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;<input type="button" value="Cancel" class="white">&nbsp;
						<asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>
