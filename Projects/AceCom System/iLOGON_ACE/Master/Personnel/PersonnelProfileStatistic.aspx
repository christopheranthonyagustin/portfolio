<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelProfileStatistic.aspx.cs"
    Inherits="iWMS.Web.Master.Personnel.PersonnelProfileStatistic" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PersonnelProfileandStatistic</title>
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
                        <tr id="triprow">
                            <td>
                                <div align="center" id="div2">
                                    <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header">
                                        <asp:Label ID="lblText" Text=" Trip Count Per Month " runat="server" />
                                    </asp:Panel>
                                </div>
                                <div id="div3" runat="server">
                                    <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" BorderStyle="None"
                                        Width="100%" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true" OnItemDataBound="ResultDG_ItemDataBound">
                                        <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                        <ItemStyle CssClass="DGItem"></ItemStyle>
                                    </asp:DataGrid>
                                </div>
                            </td>
                        </tr>
                        <tr id="svcchitrow">
                            <td>
                                <div align="center" id="div1">
                                    <asp:Panel ID="SvcChitPanel" runat="server" CssClass="show_hide_Header">
                                        <asp:Label ID="Label1" Text=" Void Service Chit Count Per Month " runat="server" />
                                    </asp:Panel>
                                </div>
                                <div id="div4" runat="server" cssclass="show_hide_Detail">
                                    <asp:DataGrid ID="SvcChitResultDG" runat="server" AutoGenerateColumns="true" BorderStyle="None"
                                        Width="100%" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true" OnItemDataBound="SvcChitResultDG_ItemDataBound">
                                        <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                        <ItemStyle CssClass="DGItem"></ItemStyle>
                                    </asp:DataGrid>
                                </div>
                            </td>
                        </tr>
                        <tr id="incidentrow">
                            <td>
                                <div align="center" id="div5">
                                    <asp:Panel ID="IncPanel" runat="server" CssClass="show_hide_Header">
                                        <asp:Label ID="Label2" Text=" Incident Count Per Vehicle Per Month " runat="server" />
                                    </asp:Panel>
                                </div>
                                <div id="div6" runat="server" cssclass="show_hide_Detail">
                                    <asp:DataGrid ID="IncResultDG" runat="server" AutoGenerateColumns="true" BorderStyle="None"
                                        Width="100%" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true" OnItemDataBound="IncResultDG_ItemDataBound">
                                        <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                        <ItemStyle CssClass="DGItem"></ItemStyle>
                                    </asp:DataGrid>
                                </div>
                            </td>
                        </tr>
                        <tr id="vehupkeeprow">
                            <td>
                                <div align="center" id="div7">
                                    <asp:Panel ID="VehUpKeepPanel" runat="server" CssClass="show_hide_Header">
                                        <asp:Label ID="Label3" Text=" Veh Upkeep Count Per Vehicle Per Month " runat="server" />
                                    </asp:Panel>
                                </div>
                                <div id="div8" runat="server" cssclass="show_hide_Detail">
                                    <asp:DataGrid ID="UpKeepResultDG" runat="server" AutoGenerateColumns="true" BorderStyle="None"
                                        Width="100%" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true" OnItemDataBound="UpKeepResultDG_ItemDataBound">
                                        <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                        <ItemStyle CssClass="DGItem"></ItemStyle>
                                    </asp:DataGrid>
                                </div>
                            </td>
                        </tr>
                        <tr id="vehpumprow">
                            <td>
                                <div align="center" id="div9">
                                    <asp:Panel ID="VehPumpPanel" runat="server" CssClass="show_hide_Header">
                                        <asp:Label ID="Label4" Text=" Veh Pump Count Per Vehicle Per Month " runat="server" />
                                    </asp:Panel>
                                </div>
                                <div id="div10" runat="server" cssclass="show_hide_Detail">
                                    <asp:DataGrid ID="VehPumpResultDG" runat="server" AutoGenerateColumns="true" BorderStyle="None"
                                        Width="100%" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true" OnItemDataBound="VehPumpResultDG_ItemDataBound">
                                        <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                        <ItemStyle CssClass="DGItem"></ItemStyle>
                                    </asp:DataGrid>
                                </div>
                            </td>
                        </tr>
                        <tr id="vehoffrow">
                            <td>
                                <div align="center" id="div11">
                                    <asp:Panel ID="VehOffPanel" runat="server" CssClass="show_hide_Header">
                                        <asp:Label ID="Label5" Text=" Vehicle Off Per Month " runat="server" />
                                    </asp:Panel>
                                </div>
                                <div id="div12" runat="server" cssclass="show_hide_Detail">
                                    <asp:DataGrid ID="VehOffResultDG" runat="server" AutoGenerateColumns="true" BorderStyle="None"
                                        Width="100%" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true" OnItemDataBound="VehOffResultDG_ItemDataBound">
                                        <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                        <ItemStyle CssClass="DGItem"></ItemStyle>
                                    </asp:DataGrid>
                                </div>
                            </td>
                        </tr>
                        <tr id="perabsentrow">
                            <td>
                                <div align="center" id="div13">
                                    <asp:Panel ID="PerAbsentPanel" runat="server" CssClass="show_hide_Header">
                                        <asp:Label ID="Label6" Text=" Personnel Absent Per Month " runat="server" />
                                    </asp:Panel>
                                </div>
                                <div id="div14" runat="server" cssclass="show_hide_Detail">
                                    <asp:DataGrid ID="AbsentResultDG" runat="server" AutoGenerateColumns="true" BorderStyle="None"
                                        Width="100%" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true" OnItemDataBound="AbsentResultDG_ItemDataBound">
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
