<%@ Register TagPrefix="iWMS" TagName="iCalOnDate" Src="../../Control/iCalOnDateCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="InvMoveSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Report.InvMovementSum.InvMoveSearch" %>

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
            <td>
                :
                <asp:DropDownList ID="AccountList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="AccountList_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="FromDateLbl" runat="server">From Date</asp:Label>
            </td>
            <td>
                :<iWMS:iCalOnDate ID="FromDateCal" runat="server"></iWMS:iCalOnDate>
                <asp:RequiredFieldValidator ID="FromDateReqVal" ControlToValidate="FromDateCal:ReturnTxt"
                    ErrorMessage="*" runat="server"></asp:RequiredFieldValidator><asp:CustomValidator
                        ID="FromDateDateVal" ControlToValidate="FromDateCal:ReturnTxt" ErrorMessage="#"
                        runat="server" OnServerValidate="DateValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="ToDateLbl" runat="server">To Date</asp:Label>
            </td>
            <td>
                :<iWMS:iCalOnDate ID="ToDateCal" runat="server"></iWMS:iCalOnDate>
                <asp:RequiredFieldValidator ID="ToDateReqVal" ControlToValidate="ToDateCal:ReturnTxt"
                    ErrorMessage="*" runat="server"></asp:RequiredFieldValidator><asp:CustomValidator
                        ID="ToDateDateVal" ControlToValidate="ToDateCal:ReturnTxt" ErrorMessage="#" runat="server"
                        OnServerValidate="DateValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="SkuGrpLbl" runat="server">SKU Group</asp:Label>
            </td>
            <td>
                :
                <asp:DropDownList ID="SkuGrpList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="SkuTypeLbl" runat="server">SKU Type</asp:Label>
            </td>
            <td>
                :
                <asp:DropDownList ID="SkuTypeList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="SkuClassLbl" runat="server">SKU Class</asp:Label>
            </td>
            <td>
                :
                <asp:DropDownList ID="SkuClassList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="FromAccountingCodeLbl" runat="server">From Accounting Code</asp:Label>
            </td>
            <td>
                :
                <asp:TextBox ID="FromAccountingCodeTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="ToAccountingCodeLbl" runat="server">To Accounting Code</asp:Label>
            </td>
            <td>
                :
                <asp:TextBox ID="ToAccountingCodeTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="DateCusVal" ErrorMessage="To Date must be greater than or equal to From Date"
                    runat="server" OnServerValidate="DateCusVal_ServerValidate"></asp:CustomValidator>
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
