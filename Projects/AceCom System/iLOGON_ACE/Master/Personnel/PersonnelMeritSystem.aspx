<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelMeritSystem.aspx.cs"
    Inherits="iWMS.Web.Master.Personnel.PersonnelMeritSystem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PersonnelMeritSystem</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
                                <asp:Image ID="Personnelimg" runat="server" ImageAlign="Top" />
                            </td>
                            <td>
                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                    <tr>
                                        <td>
                                            Name
                                        </td>
                                        <td>
                                            <asp:Label ID="nameLbl" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            IDNo
                                        </td>
                                        <td>
                                            <asp:Label ID="IDNoLbl" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Gender
                                        </td>
                                        <td>
                                            <asp:Label ID="genderLbl" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Age
                                        </td>
                                        <td>
                                            <asp:Label ID="ageLbl" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            DateBirth
                                        </td>
                                        <td>
                                            <asp:Label ID="datebirthLbl" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Nationality&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="nationalityLbl" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Mobile
                                        </td>
                                        <td>
                                            <asp:Label ID="mobileLbl" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                    <table border="0" cellpadding="2" cellspacing="2" id="defaultTable" runat="server">
                        <tr>
                            <td>
                                <table border="0" cellpadding="2" cellspacing="2">
                                    <tr>
                                        <td>
                                            Default Vehicle&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="vehLabel" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Default Trailer
                                        </td>
                                        <td>
                                            <asp:Label ID="trailerLabel" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table border="0" cellpadding="2" cellspacing="2">
                        <tr id="timesheetrow">
                            <td>
                                <div align="center" id="div15">
                                    <asp:Panel ID="TimeShtPanel" runat="server" CssClass="show_hide_Header">
                                        <asp:Label ID="Label7" Text=" Merit " runat="server" />
                                    </asp:Panel>
                                </div>
                                <div id="div16" runat="server">
                                    <asp:DataGrid ID="MeritResultDG" runat="server" AutoGenerateColumns="true" BorderStyle="None"
                                        Width="100%" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true" OnItemDataBound="MeritResultDG_ItemDataBound">
                                        <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                        <ItemStyle CssClass="DGItem"></ItemStyle>
                                    </asp:DataGrid>
                                </div>
                            </td>
                        </tr>
                        <tr id="triprow">
                            <td>
                                <div align="center" id="div2">
                                    <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header">
                                        <asp:Label ID="lblText" Text=" Demerit " runat="server" />
                                    </asp:Panel>
                                </div>
                                <div id="div3" runat="server">
                                    <asp:DataGrid ID="DemeritResultDG" runat="server" AutoGenerateColumns="true" BorderStyle="None"
                                        Width="100%" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true" OnItemDataBound="DemeritResultDG_ItemDataBound">
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
