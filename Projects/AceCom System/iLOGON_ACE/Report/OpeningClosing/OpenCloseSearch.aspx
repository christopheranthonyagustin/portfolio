<%@ Page Language="c#" CodeBehind="OpenCloseSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Report.OpeningClosing.OpenCloseSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iCalOnDate" Src="../../Control/iCalOnDateCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>OpenCloseSearch</title>
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
            <td>
                :
                <asp:DropDownList ID="AccountList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="FromSkuLbl" runat="server">From SKU Code</asp:Label>
            </td>
            <td>
                :
                <asp:TextBox ID="FromSkuTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="ToSkuLbl" runat="server">To SKU Code</asp:Label>
            </td>
            <td>
                :
                <asp:TextBox ID="ToSkuTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="FromLbl" runat="server">From</asp:Label>
            </td>
            <td>
                :<iWMS:iCalOnDate ID="FromDateCal" runat="server"></iWMS:iCalOnDate>
                <asp:RequiredFieldValidator ID="FromDateReqVal" runat="server" ErrorMessage="*" ControlToValidate="FromDateCal:ReturnTxt"></asp:RequiredFieldValidator><asp:CustomValidator
                    ID="FromDateDateVal" runat="server" ErrorMessage="#" ControlToValidate="FromDateCal:ReturnTxt"
                    OnServerValidate="DateValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="ToLbl" runat="server">To</asp:Label>
            </td>
            <td>
                :<iWMS:iCalOnDate ID="ToDateCal" runat="server"></iWMS:iCalOnDate>
                <asp:RequiredFieldValidator ID="ToDateReqVal" runat="server" ErrorMessage="*" ControlToValidate="ToDateCal:ReturnTxt"></asp:RequiredFieldValidator><asp:CustomValidator
                    ID="ToDateDateVal" runat="server" ErrorMessage="#" ControlToValidate="ToDateCal:ReturnTxt"
                    OnServerValidate="DateValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="DateCusVal" runat="server" ErrorMessage="To Date must be greater than or equal to From Date"
                    OnServerValidate="DateCusVal_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td nowrap>
            </td>
            <td>
                &nbsp;
                <asp:Button ID="CompileBtn" runat="server" CssClass="formbtn" Text="Compile" OnClick="CompileBtn_Click">
                </asp:Button>&nbsp;<input class="formbtn" type="reset" value="Reset">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
