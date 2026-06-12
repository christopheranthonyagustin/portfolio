<%@ Register TagPrefix="iWMS" TagName="iCalOnDate" Src="../../Control/iCalOnDateCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="InvMoveSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Report.InvMovementDetl.InvMoveSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvMoveSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellpadding="2" cellspacing="2" border="0">
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
                <asp:RequiredFieldValidator ID="FromDateReqVal" runat="server" ErrorMessage="*" ControlToValidate="FromDateCal:ReturnTxt"></asp:RequiredFieldValidator><asp:CustomValidator
                    ID="FromDateDateVal" runat="server" ErrorMessage="#" ControlToValidate="FromDateCal:ReturnTxt"
                    OnServerValidate="DateValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="ToDateLbl" runat="server">To Date</asp:Label>
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
                <asp:CustomValidator ID="DateCusVal" runat="server" ErrorMessage="To Date must be greater than or equal to From Date"
                    OnServerValidate="DateCusVal_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td nowrap>
            </td>
            <td>
                &nbsp;
                <asp:Button ID="CompileBtn" runat="server" Text="Compile" CssClass="formbtn" OnClick="CompileBtn_Click">
                </asp:Button>&nbsp;<input type="reset" value="Reset" class="formbtn">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
