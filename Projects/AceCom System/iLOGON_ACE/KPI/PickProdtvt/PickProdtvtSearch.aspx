<%@ Page Language="c#" CodeBehind="PickProdtvtSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.KPI.PickProdtvt.PickProdtvtSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iCalOnDate" Src="../../Control/iCalOnDateCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Picking Productivity Search</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <br />
    <table border="0" cellspacing="2" cellpadding="2">
        
        <tr>
            <td nowrap>
                         &nbsp;
                <asp:Label ID="AccountLbl" runat="server">Account</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                         &nbsp;
                <%--<asp:dropdownlist id="AccountList" runat="server"></asp:dropdownlist>--%>
                <telerik:RadComboBox ID="AccountList" runat="server" Skin="WebBlue" Filter="Contains">
                </telerik:RadComboBox>
            </td>
        </tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="PickerLbl" runat="server">Picker Code</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                         &nbsp;
                <%--<asp:TextBox Style="z-index: 0" ID="PickerTxt" runat="server"></asp:TextBox>--%>
                <telerik:RadTextBox ID="PickerTxt" runat="server">
                </telerik:RadTextBox>
            </td>
        </tr>
        <%-- <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="FromLbl" runat="server">From</asp:Label>
            </td>
            <td>
                <%--<asp:TextBox ID="FrmDateTxt" runat="server" CssClass="common"></asp:TextBox>--%>
        <%--<telerik:RadTextBox ID="FrmDateTxt" runat="server" CssClass="common"></telerik:RadTextBox>
            </td>--%>
        <%--   <asp:CalendarExtender ID="calExtender1" TargetControlID="FrmDateTxt" runat="server"
                Format="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy" />--%>
        <%--</tr>
        <tr>
            <td nowrap>
                &nbsp;
                <asp:Label ID="ToLbl" runat="server">To</asp:Label>
            </td>
            <td style="z-index: 0">
                <asp:TextBox ID="ToDateTxt" runat="server" CssClass="common"></asp:TextBox>
            </td>
            <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="ToDateTxt" runat="server"
                Format="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy" />
            </td>
        </tr>--%>
        <tr>
            <td style="width: 20%">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
        <td></td>
        </tr>
        <tr>
            <td align="left">
                <%-- <asp:Button ID="CompileBtn" runat="server" CssClass="detailbutton" Text="Compile"
                    OnClick="CompileBtn_Click"></asp:Button>&nbsp;<input class="detailbutton" value="Reset"
                        type="reset">--%>
               &nbsp; <telerik:RadButton ID="CompileBtn" runat="server" CssClass="detailbutton" Text="Compile"
                    OnClick="CompileBtn_Click" Skin="WebBlue">
                </telerik:RadButton>
                <telerik:RadButton ID="ResetBtn" runat="server" CssClass="detailbutton" Text="Reset"
                    OnClick="ResetBtn_Click" Skin="WebBlue">
                </telerik:RadButton>
                &nbsp;&nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>