<%@ Register TagPrefix="iWMS" TagName="iCalOnDate" Src="../../Control/iCalOnDateCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="InvMvmtClassLotSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Report.InvMvmtClassLot.InvMvmtClassLotSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvMoveSearch</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" border="0">
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="AccountLbl" runat="server">Account</asp:Label>
            </td>
            <td colspan="5">
                :
                <asp:DropDownList ID="AccountList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="SkuClassLbl" runat="server">SKU Class</asp:Label>
            </td>
            <td colspan="5">
                :
                <asp:DropDownList ID="SKUClassList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="FromLbl" runat="server">From Date</asp:Label>
            </td>
            <td colspan="5">
                :<iWMS:iCalOnDate ID="FromDateCal" runat="server"></iWMS:iCalOnDate>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="ToLbl" runat="server">To Date</asp:Label>
            </td>
            <td colspan="5">
                :<iWMS:iCalOnDate ID="ToDateCal" runat="server"></iWMS:iCalOnDate>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="LotLbl" runat="server">Lot</asp:Label>
            </td>
            <td>
                :
                <asp:DropDownList ID="LotList" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                From
            </td>
            <td>
                :
                <asp:TextBox ID="FromLotTxt" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="reqvFromLot" runat="server" ErrorMessage="*" ControlToValidate="FromLotTxt"></asp:RequiredFieldValidator>
            </td>
            <td>
                To
            </td>
            <td>
                :
                <asp:TextBox ID="ToLotTxt" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="reqvToLot" runat="server" ErrorMessage="*" ControlToValidate="ToLotTxt"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td nowrap>
            </td>
            <td colspan="5">
                &nbsp;
                <asp:Button ID="CompileBtn" runat="server" CssClass="formbtn" Text="Compile" OnClick="CompileBtn_Click">
                </asp:Button>&nbsp;<input class="formbtn" type="reset" value="Reset">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
