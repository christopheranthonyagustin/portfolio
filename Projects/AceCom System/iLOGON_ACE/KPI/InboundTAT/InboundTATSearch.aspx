<%@ Page Language="c#" CodeBehind="InboundTATSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.KPI.InboundTAT.InboundTATSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iCalOnDate" Src="../../Control/iCalOnDateCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReportSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <style type="text/css">
        .style1
        {
            height: 17px;
            width: 92px;
        }
        .style2
        {
            width: 92px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table style="z-index: 0" border="0" cellspacing="2" cellpadding="2">
        <tr>
            <td nowrap class="style1">
                &nbsp;
                <asp:Label ID="AccountLbl" runat="server">Account</asp:Label>
            </td>
            <td style="height: 17px">
                <telerik:RadComboBox ID="AccountList" runat="server" Skin="WebBlue" Filter="Contains">
                </telerik:RadComboBox>
            </td>
        </tr>
        <tr>
            <td nowrap class="style2">
                &nbsp;
                <asp:Label ID="FromLbl" runat="server">From</asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="frDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                    DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="165px" AutoPostBack="true">
                    <Calendar>
                        <SpecialDays>
                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                        </SpecialDays>
                    </Calendar>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td nowrap class="style2">
                &nbsp;
                <asp:Label ID="ToLbl" runat="server">To</asp:Label>
            </td>
            <td style="z-index: 0">
                <telerik:RadDatePicker ID="toDatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                    DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Width="165px"
                    sel>
                    <Calendar>
                        <SpecialDays>
                            <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                        </SpecialDays>
                    </Calendar>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td nowrap class="style2">
                &nbsp;
                <asp:Label ID="TargetDayLbl" runat="server"> Target Days</asp:Label>
            </td>
            <td>
                <telerik:RadTextBox ID="TargetDayTxt" runat="server">
                </telerik:RadTextBox>&nbsp;<asp:CompareValidator ID="TargetDayVal" runat="server" ControlToValidate="TargetDayTxt"
                    Operator="DataTypeCheck" Type="Double" ErrorMessage="* Enter a target day (numbers only)"
                    Display="dynamic"></asp:CompareValidator>&nbsp;
                <asp:RequiredFieldValidator ID="TargetDayReq" runat="server" ControlToValidate="TargetDayTxt"
                    ErrorMessage="*" EnableClientScript="True"></asp:RequiredFieldValidator>
            </td>    
        </tr>
        <tr>
            <td class="style2" colspan="2">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <telerik:RadButton ID="CompileBtn" runat="server" CssClass="detailButton"  Skin="WebBlue" Text="Compile"
                OnClick="CompileBtn_Click"></telerik:RadButton>&nbsp;&nbsp;
             <telerik:RadButton ID="ResetBtn" runat="server" CssClass="detailButton" Skin="WebBlue" Text="Reset" OnClick="ResetBtn_Click" AutoPostBack="true"></telerik:RadButton>
            <br />
            <asp:Label ID="lblError" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
