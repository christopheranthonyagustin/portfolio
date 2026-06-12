<%@ Register TagPrefix="iWMS" TagName="iInput" Src="../../Control/iInputCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="QuickMove.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.InvMove.QuickMove" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>QuickMove</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td class="pagetitle">
                &nbsp;
                <asp:Label ID="QuickMoveLbl" runat="server">Quick Move</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellspacing="2" cellpadding="2">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="AccountLbl" runat="server">Account</asp:Label>
                                    </td>
                                    <td colspan="2">
                                        :
                                        <asp:DropDownList ID="AccountList" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="FromLbl" runat="server">From</asp:Label>:
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iInput ID="iInput" runat="server"></iWMS:iInput>
                        </td>
                    </tr>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="ToLbl" runat="server">To</asp:Label>:
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="LocLbl" runat="server">Location</asp:Label>:
                                        <asp:RequiredFieldValidator ID="ToLocReqVal" ErrorMessage="*" ControlToValidate="ToLocTxt"
                                            runat="server"></asp:RequiredFieldValidator><br>
                                        <asp:TextBox ID="ToLocTxt" runat="server" BackColor="Yellow"></asp:TextBox>
                                    </td>
                                    <td valign="top">
                                        <asp:Label ID="Tu1Lbl" runat="server">TU#1</asp:Label>:<br>
                                        <asp:TextBox ID="ToTuNo1Txt" runat="server"></asp:TextBox>
                                    </td>
                                    <td valign="top">
                                        <asp:Label ID="Tu2Lbl" runat="server">TU#2</asp:Label>:<br>
                                        <asp:TextBox ID="ToTuNo2Txt" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Label ID="remarkLbl" runat="server">Remarks</asp:Label>:<br>
                                        <asp:TextBox ID="remarkTxt" TextMode="MultiLine" Width="100%" Height="80" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                            <asp:Button ID="MoveBtn" runat="server" CssClass="formbtn" Text="Move" OnClick="MoveBtn_Click">
                            </asp:Button>&nbsp;<input class="formbtn" value="Reset" type="reset">&nbsp;
                            <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
