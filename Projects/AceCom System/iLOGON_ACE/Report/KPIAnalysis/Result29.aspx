<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result29.aspx.cs" Inherits="iWMS.Web.Report.KPIAnalysis.Result29" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>On Time Scheduled Delivery</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <style type="text/css">
        .TargetKPILblCSS {
            padding-left: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <table>
            <tr class="graytitle">
                <td colspan="5">
                    <asp:Label ID="LicenseNameLbl" runat="server" CssClass="Graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label runat="server">Format : </asp:Label>
                </td>
                <td>
                    <asp:Label ID="FormatLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label runat="server">Account : </asp:Label>
                </td>
                <td>
                    <asp:Label ID="AccountLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label runat="server">From : </asp:Label>
                </td>
                <td>
                    <asp:Label ID="DateLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:Button ID="ExportImageBtn" runat="server" Text="Export Image" CausesValidation="false" CssClass="white" UseSubmitBehavior="false" OnClientClick="ExportImage()" />
                </td>
            </tr>
        </table>

        <br />
        <asp:Panel runat="server" Width="100%">
            <%--<div style="float: left; width: 40%; margin-left: 20px;">
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="On Time Scheduled Delivery" Font-Size="Medium" CssClass="TitleLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="Target KPI : > 99.5%" Font-Size="Small" ForeColor="LightGreen" Font-Bold="true" CssClass="TargetKPILabel"></asp:Label>
                        </td>
                    </tr>
                </table>

                <br />
                <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Width="600" Height="500">
                    <PlotArea>
                    </PlotArea>
                    <Legend>
                        <Appearance Position="Bottom" />
                    </Legend>
                </telerik:RadHtmlChart>
            </div>--%>
            <div style="float: left; width: 49%; margin-left: 20px; background-color: white" id="MainDiv">
                <table>
                    <tr>
                        <td style="text-align: center; padding-top: 20px;">
                            <asp:Label runat="server" Text="On Time Scheduled Delivery" Font-Size="Large" Font-Bold="true"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:Label id="PriorityLable" runat="server"  Font-Size="Small" ForeColor="LightGreen" Font-Bold="true" CssClass="TargetKPILblCSS"></asp:Label>
                            <asp:Label id="KPILable" runat="server"  Font-Size="Small" ForeColor="LightGreen" Font-Bold="true" CssClass="TargetKPILblCSS"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <telerik:RadClientExportManager runat="server" ID="RadClientExportManager">
                                        </telerik:RadClientExportManager>
                                        <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" Width="600" Height="500" BackColor="White">
                                            <PlotArea>
                                            </PlotArea>
                                            <Legend>
                                                <Appearance Position="Bottom" />
                                            </Legend>
                                        </telerik:RadHtmlChart>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>

            <div style="float: right; width: 40%">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="ExcelBtn" runat="server" Text="Excel" CausesValidation="false" CssClass="green" UseSubmitBehavior="false" OnClick="ExcelBtn_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" Width="90%"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </asp:Panel>
        <telerik:RadCodeBlock runat="server">
            <script type="text/javascript">
                function ExportImage() {
                    var $ = $telerik.$;
                    var mainDiv = $("#MainDiv");  // Select the div element with ID "Main"
                    $find('<%=RadClientExportManager.ClientID%>').exportImage(mainDiv);  // Export the mainDiv
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
