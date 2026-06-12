<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.InvoiceSummaryListByCharge.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>InvoiceSummaryListingByChargeReport</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%" align="center">
        <table>
            <tr>
                <td bgcolor="#ffffff">
                </td>
                <td>
                    <table cellspacing="1" cellpadding="1" width="100%">
                        <tr bgcolor="#ffffff">
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="AccountLbl" runat="server">Account: </asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="AccountList" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td>
                            </td>
                            <td>
                                From:
                            </td>
                            <td>
                                <asp:DropDownList ID="FromYearList" runat="Server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="FromMonthList" runat="Server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td>
                            </td>
                            <td>
                                To:
                            </td>
                            <td>
                                <asp:DropDownList ID="ToYearList" runat="Server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ToMonthList" runat="Server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                                <asp:Button ID="Submit" runat="server" OnClick="CompileBtn_Click" CausesValidation="false"
                                    runat="server" Text="Compile" CssClass="detailButton" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </table>
    <table>
        <tr bgcolor="#ffffff">
            <td>
                <asp:Label runat="server" ID="MessageLbl" ForeColor="red"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
