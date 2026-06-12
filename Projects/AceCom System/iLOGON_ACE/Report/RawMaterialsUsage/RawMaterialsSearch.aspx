<%@ Register TagPrefix="iWMS" TagName="iCalOnDate" Src="../../Control/iCalOnDateCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="RawMaterialsSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Report.RawMaterialsUsage.RawMaterialsSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>RawMaterialsSearch</title>
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
                <asp:DropDownList ID="AccountList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="FromDateLbl" runat="server">From Date</asp:Label>
            </td>
            <td>
                :&nbsp;<iWMS:iCalOnDate ID="FromDateCal" runat="server"></iWMS:iCalOnDate>
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
                :&nbsp;<iWMS:iCalOnDate ID="ToDateCal" runat="server"></iWMS:iCalOnDate>
                <asp:RequiredFieldValidator ID="ToDateReqVal" ControlToValidate="ToDateCal:ReturnTxt"
                    ErrorMessage="*" runat="server"></asp:RequiredFieldValidator><asp:CustomValidator
                        ID="ToDateDateVal" ControlToValidate="ToDateCal:ReturnTxt" ErrorMessage="#" runat="server"
                        OnServerValidate="DateValidate"></asp:CustomValidator>
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
                <asp:Button ID="CompileBtn" runat="server" Text="Compile" CssClass="formbtn" OnClick="CompileBtn_Click">
                </asp:Button>&nbsp;<input type="reset" value="Reset" class="formbtn">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
