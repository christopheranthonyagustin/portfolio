<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerAccountScoreCardWHSE.aspx.cs" Inherits="iWMS.Web.Master.CustomerAccount.CustomerAccountScoreCardWHSE" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CustomerAccountScoreCardWHSE</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table border="0" cellpadding="2" cellspacing="2" align="center" width="100%">
                <tr>
                    <td valign="top">
                        <table border="0" cellpadding="2" cellspacing="2">
                            <tr>
                                <td width="40%">
                                    <asp:Image ID="AccountImg" runat="server" ImageAlign="Top" />
                                </td>
                                <td valign="middle">
                                    <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="nameLbl" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="2" cellspacing="2">
                            <tr id="timesheetrow">
                                <td>
                                    <div align="center" id="div15">
                                        <asp:Panel ID="TimeShtPanel" runat="server" CssClass="show_hide_Header">
                                            <asp:Label ID="Label7" Text=" Man-Days Clocked Per Month " runat="server" />
                                        </asp:Panel>
                                    </div>
                                    <div id="div16" runat="server">
                                        <asp:DataGrid ID="TimeShtResultDG" runat="server" AutoGenerateColumns="true" BorderStyle="None"
                                            Width="100%" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true" OnItemDataBound="TimeShtResultDG_ItemDataBound">
                                            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                            <ItemStyle CssClass="DGItem"></ItemStyle>
                                        </asp:DataGrid>
                                    </div>
                                </td>
                            </tr>
                            <tr id="receiptrow">
                                <td>
                                    <div align="center" id="div1">
                                        <asp:Panel ID="SvcChitPanel" runat="server" CssClass="show_hide_Header">
                                            <asp:Label ID="Label1" Text=" Receipt Lines Per Month " runat="server" />
                                        </asp:Panel>
                                    </div>
                                    <div id="div4" runat="server" cssclass="show_hide_Detail">
                                        <asp:DataGrid ID="RCLineResultDG" runat="server" AutoGenerateColumns="true" BorderStyle="None"
                                            Width="100%" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true" OnItemDataBound="RCLineResultDG_ItemDataBound">
                                            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                            <ItemStyle CssClass="DGItem"></ItemStyle>
                                        </asp:DataGrid>
                                    </div>
                                </td>
                            </tr>
                            <tr id="issuerow">
                                <td>
                                    <div align="center" id="div5">
                                        <asp:Panel ID="IncPanel" runat="server" CssClass="show_hide_Header">
                                            <asp:Label ID="Label2" Text=" Issue Lines Per Month " runat="server" />
                                        </asp:Panel>
                                    </div>
                                    <div id="div6" runat="server" cssclass="show_hide_Detail">
                                        <asp:DataGrid ID="ISLinesResultDG" runat="server" AutoGenerateColumns="true" BorderStyle="None"
                                            Width="100%" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true" OnItemDataBound="ISLinesResultDG_ItemDataBound">
                                            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                            <ItemStyle CssClass="DGItem"></ItemStyle>
                                        </asp:DataGrid>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
